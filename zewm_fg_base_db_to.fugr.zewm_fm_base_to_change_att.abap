*----------------------------------------------------------------------*
* Title: 
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author : Alberto Magaña
*----------------------------------------------------------------------*
* Program description:
* 
*----------------------------------------------------------------------*
FUNCTION ZEWM_FM_BASE_TO_CHANGE_ATT.
*"--------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IV_LGNUM) TYPE  /SCWM/LGNUM
*"     REFERENCE(IV_SUBST) TYPE  /SCWM/RL03TSUBST DEFAULT SPACE
*"     REFERENCE(IV_LOG_INIT) TYPE  XFELD DEFAULT 'X'
*"     REFERENCE(IV_QNAME) TYPE  UNAME DEFAULT SY-UNAME
*"     REFERENCE(IV_SIMULATE) TYPE  /SCWM/SIMULATE DEFAULT SPACE
*"     REFERENCE(IV_UPDATE_TASK) TYPE  /SCWM/RL03AVERBU DEFAULT SPACE
*"     REFERENCE(IV_COMMIT_WORK) TYPE  /SCWM/RL03ACOMIT DEFAULT 'X'
*"     REFERENCE(IT_CHANGE_ATT) TYPE  /SCWM/TT_TO_CHANGE_ATT
*"  EXPORTING
*"     REFERENCE(ET_BAPIRET) TYPE  BAPIRETTAB
*"     REFERENCE(EV_SEVERITY) TYPE  BAPI_MTYPE
*"     REFERENCE(EV_LOGNR) TYPE  BALOGNR
*"--------------------------------------------------------------------

  DATA: lv_tanum      TYPE /scwm/tanum,
        lv_tstmp      TYPE tzntstmps,
        lv_verbu      TYPE /scwm/rl03averbu.

  DATA: ls_change     TYPE /scwm/s_to_change_att,
        ls_change_int TYPE /scwm/s_to_change_att_int,
        ls_ordim      TYPE /scwm/ordim_o,
        ls_t340d      TYPE /scwm/t340d,
        ls_t300       TYPE /scwm/s_t300.

  DATA: lt_change     TYPE /scwm/tt_to_change_att_int,
        lt_ordim      TYPE /scwm/tt_ordim_o.

  FIELD-SYMBOLS: <change> TYPE /scwm/s_to_change_att_int.

  CLEAR: et_bapiret, ev_severity, ev_lognr.

  CALL METHOD /scwm/cl_tm=>set_lgnum
    EXPORTING
      iv_lgnum = iv_lgnum.

  IF iv_log_init IS NOT INITIAL.
    PERFORM prot_init USING iv_lgnum go_prot.
  ELSE.
    IF go_prot IS NOT BOUND.
      CREATE OBJECT go_prot
        EXPORTING
          iv_lgnum        = iv_lgnum
          iv_balobj       = wmegc_apl_object_wme
          iv_balsubobj    = wmegc_apl_subob_whs_task.
    ENDIF.
  ENDIF.

* Initialisation
  LOOP AT it_change_att INTO ls_change.
    MOVE-CORRESPONDING ls_change TO ls_change_int.
    ls_change_int-seqno = sy-tabix.
    APPEND ls_change_int TO lt_change.
  ENDLOOP.

  TRY.
*     read Customizing tables
      CALL FUNCTION '/SCWM/T340D_READ_SINGLE'
        EXPORTING
          iv_lgnum  = iv_lgnum
        IMPORTING
          es_t340d  = ls_t340d
          es_t300   = ls_t300
        EXCEPTIONS
          not_found = 1.

      IF sy-subrc <> 0.
        MESSAGE e701(/scwm/l3) WITH iv_lgnum INTO gv_msgtext.
        CALL METHOD go_prot->add_message( ip_field = 'LGNUM' ).
        RAISE EXCEPTION TYPE /scwm/cx_core.
      ENDIF.

      AUTHORITY-CHECK OBJECT '/SCWM/TOCR'
               ID '/SCWM/LGNU' FIELD iv_lgnum
               ID '/SCWM/LGTY' DUMMY
               ID '/SCWM/PRTY' DUMMY
               ID '/SCWM/ENTL' DUMMY.

      IF sy-subrc <> 0.
        MESSAGE e051(/scwm/l3) WITH iv_lgnum INTO gv_msgtext.
        CALL METHOD go_prot->add_message( ip_field = 'LGNUM' ).
        RAISE EXCEPTION TYPE /scwm/cx_core.
      ENDIF.

*     Read & lock TO
      SORT lt_change BY tanum.

      LOOP AT lt_change ASSIGNING <change>.
        IF <change>-tanum = lv_tanum.
*         double entry - maybe error message
          delete lt_change.
          CONTINUE.
        ENDIF.

        lv_tanum = <change>-tanum.

        CALL FUNCTION '/SCWM/TO_READ_SINGLE'
          EXPORTING
            iv_lgnum     = iv_lgnum
            iv_tanum     = <change>-tanum
            iv_flglock   = 'X'
          IMPORTING
            es_ordim_o   = ls_ordim
          EXCEPTIONS
            wrong_input  = 1
            not_found    = 2
            foreign_lock = 3
            error        = 4
            OTHERS       = 5.

        IF sy-subrc <> 0.
          CALL METHOD go_prot->add_message(
            ip_row = <change>-seqno ip_field = 'TANUM' ).
          DELETE lt_change.
          CONTINUE.
        ENDIF.

        APPEND ls_ordim TO lt_ordim.
      ENDLOOP.

*     Check parameter
      PERFORM change_att_check USING    iv_lgnum
                                        iv_subst
                                        lt_ordim
                                        iv_update_task
                                        iv_commit_work
                               CHANGING lt_change.

      IF lt_change IS INITIAL.
        RAISE EXCEPTION TYPE /scwm/cx_core.
      ENDIF.

*     POST
      IF iv_simulate IS INITIAL.

        call function '/SCWM/TO_WRITE_LOG'
          exporting
            is_t340d = ls_t340d
            io_prot  = go_prot.

        lv_verbu = iv_update_task.

        IF iv_update_task IS INITIAL.
          SET UPDATE TASK LOCAL.
          ASSERT ID /scwm/tm_upd_task FIELDS sy-uname sy-subrc cast /scwm/if_tm_global_info( /scwm/cl_tm_factory=>get_service( /scwm/cl_tm_factory=>sc_globals ) )->get_transaction_info( ) CONDITION sy-subrc = 0.
          lv_verbu = 'X'.
        ENDIF.

        GET TIME STAMP FIELD lv_tstmp.

        IF lv_verbu IS NOT INITIAL.
          CALL FUNCTION '/SCWM/TO_CHANGE_ATT_UPD' IN UPDATE TASK
            EXPORTING
              iv_lgnum  = iv_lgnum
              iv_tstmp  = lv_tstmp
              it_change = lt_change.
        ELSE.
          CALL FUNCTION '/SCWM/TO_CHANGE_ATT_UPD'
            EXPORTING
              iv_lgnum  = iv_lgnum
              iv_tstmp  = lv_tstmp
              it_change = lt_change.
        ENDIF.

        IF iv_commit_work = 'X'.
          et_bapiret  = go_prot->get_prot( ).
          ev_severity = go_prot->get_severity( ).

          COMMIT WORK.
*         central cleanup
          /scwm/cl_tm=>cleanup( ).
        ENDIF.

      ENDIF.

    CATCH /scwm/cx_core.                                "#EC NO_HANDLER
      IF iv_commit_work IS NOT INITIAL.
*       only if commit_work is set, a ROLLBACK is allowed
        ev_severity = go_prot->get_severity( ).
        et_bapiret  = go_prot->get_prot( ).

        ROLLBACK WORK.                                 "#EC CI_ROLLBACK
*       central cleanup
        /scwm/cl_tm=>cleanup( EXPORTING iv_lgnum = gv_lgnum ).

        PERFORM write_log USING gv_lgnum ev_severity et_bapiret
                          CHANGING ev_lognr.
        RETURN.
      ENDIF.
  ENDTRY.

  IF ev_severity IS SUPPLIED AND ev_severity IS INITIAL.
    ev_severity = go_prot->get_severity( ).
  ENDIF.

  IF et_bapiret IS SUPPLIED AND et_bapiret IS INITIAL.
    et_bapiret  = go_prot->get_prot( ).
  ENDIF.

ENDFUNCTION.
