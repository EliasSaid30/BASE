*----------------------------------------------------------------------*
* Title  FM zewm_fm_base_qrfc_merge_hu_wo
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. :Indumotora
* Author : Alberto Magaña
*----------------------------------------------------------------------*
* Program description:
* Merge WO from Different HUs into a single WO
*----------------------------------------------------------------------*
FUNCTION zewm_fm_base_qrfc_merge_hu_wo.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IS_RFC_QUEUE) TYPE  /SCWM/S_RFC_QUEUE
*"     VALUE(IV_LGNUM) TYPE  /SCWM/LGNUM
*"     VALUE(IV_WCR) TYPE  /SCWM/DE_WCR
*"     VALUE(IV_LGTYP) TYPE  /SCWM/LGTYP OPTIONAL
*"     VALUE(IT_HU) TYPE  /SCWM/TT_HUHDR_INT
*"----------------------------------------------------------------------

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:
    lt_whohu              TYPE /scwm/tt_whohu,
    lt_who_merge          TYPE /scwm/tt_whoid,
    lt_bapiret            TYPE bapirettab,
    lt_who                TYPE /scwm/tt_who,
    lt_who_stat           TYPE /scwm/tt_whoid,
* LEAR 10.02.2022
    lt_to_changed         TYPE /scwm/tt_changed,
    lt_to_change          TYPE /scwm/tt_to_change_att_int,
    lt_ordim_o            TYPE /scwm/tt_ordim_o,

    ls_who_stat           TYPE /scwm/s_whoid,
    ls_hu                 TYPE /scwm/s_huhdr_int,
    ls_whohu              TYPE /scwm/whohu,
    ls_ordim_o            TYPE /scwm/ordim_o,
    ls_who                TYPE /scwm/who,
    ls_who_log            TYPE /scwm/who,
    ls_log                TYPE bal_s_log,
    ls_to_change          TYPE /scwm/s_to_change_att_int,
    ls_to_changed         TYPE /scwm/s_changed,
    ls_bapiret            TYPE bapiret2,
    ls_who_merge          TYPE /scwm/s_whoid,
    ls_ordim              TYPE /scwm/ordim_o,

    lr_log                TYPE REF TO /scwm/cl_log,

    lv_tzone              TYPE tznzone,
    lv_timestamp          TYPE timestamp,
    lv_tstmp              TYPE tzntstmps,
    lv_date_log           TYPE d,
    lv_time_log           TYPE t,
    lv_prot_no            TYPE /scwm/de_tologno,
    lv_message            TYPE string,
    lv_severity           TYPE bapi_mtype,
    lv_loghandle          TYPE balloghndl,
    lv_who                TYPE /scwm/de_who,
    lv_message_log        TYPE bapi_msg,
    lv_lines              TYPE i.

  CHECK it_hu IS NOT INITIAL.

  SORT it_hu BY huident.
  DELETE ADJACENT DUPLICATES FROM it_hu COMPARING huident.


*=======================================================================
* Create application Log
*=======================================================================

  BREAK-POINT ID zewm_base.


  IF lr_log IS INITIAL.
    /scwm/cl_log=>get_instance( IMPORTING eo_instance = lr_log ).
  ENDIF.

*   Init Application Log
  lr_log->init( ).

* Get time zone of warehouse
  IF iv_lgnum IS NOT INITIAL.
    CALL FUNCTION '/SCWM/LGNUM_TZONE_READ'
      EXPORTING
        iv_lgnum        = iv_lgnum
      IMPORTING
        ev_tzone        = lv_tzone
      EXCEPTIONS
        interface_error = 1
        data_not_found  = 2
        OTHERS          = 3.
    IF sy-subrc <> 0.
      lv_tzone = sy-zonlo.
    ENDIF.
  ELSE.
    lv_tzone = sy-zonlo.
  ENDIF.

  GET TIME STAMP FIELD lv_timestamp.

  CONVERT TIME STAMP lv_timestamp
          TIME ZONE lv_tzone
          INTO DATE lv_date_log
          TIME lv_time_log.

  ls_log-object     = zif_ewm_base_logobjects_c=>gc_o_log_qrfc.
  ls_log-subobject  = zif_ewm_base_logobjects_c=>gc_s_wo_merge.
  ls_log-extnumber  = is_rfc_queue-queue.
  ls_log-aldate = lv_date_log.
  ls_log-altime = lv_time_log.
  ls_log-alprog = sy-cprog.
  ls_log-aluser     = sy-uname.

  CALL METHOD lr_log->create_log
    EXPORTING
      is_log = ls_log.

  " .SUCCESS. WO merge process Begins
  MESSAGE s008(zewm_enha)
     WITH ls_ordim_o-vlenr
          iv_lgtyp
     INTO lv_message.
  lr_log->add_message( ).


*=======================================================================
* Process Begins
*=======================================================================

* Get WO from relevant HUs
  LOOP AT it_hu INTO ls_hu.

    CLEAR ls_ordim_o.

    " Read open WT for HU
    TRY.
        CALL METHOD zcl_ewm_base_db_to=>get_open_hu
          EXPORTING
            iv_lgnum   = iv_lgnum
            iv_huident = ls_hu-huident
          IMPORTING
            es_ordim_o = ls_ordim_o.

      CATCH zcx_ewm_base_db .
    ENDTRY.

    IF ls_ordim_o IS NOT INITIAL.

      " .Check Source StType from WT
      IF iv_lgtyp IS INITIAL.

        APPEND ls_ordim_o-who TO lt_who_merge.

*LEAR 10.02.2022
        APPEND ls_ordim_o TO lt_ordim_o.
      ELSE.

        " .Check source StType
        IF ls_ordim_o-vltyp EQ iv_lgtyp.
          APPEND ls_ordim_o-who TO lt_who_merge.
*LEAR 10.02.2022
          APPEND ls_ordim_o TO lt_ordim_o.
        ELSE.
          " .ERROR. HU &1 not located within StType &2. WO merge not possible.
          MESSAGE e001(zewm_enha)
             WITH ls_ordim_o-vlenr
                  iv_lgtyp
             INTO lv_message.
          lr_log->add_message( ).
          CALL METHOD lr_log->save_applog
            EXPORTING
              is_log = ls_log.
*   .Restart queue
          PERFORM restart
            USING abap_false
                  lv_prot_no
                  is_rfc_queue
                  lr_log
                  ls_log.

        ENDIF.

      ENDIF.

    ENDIF.

  ENDLOOP.

  DELETE ADJACENT DUPLICATES FROM lt_who_merge COMPARING who.

  DESCRIBE TABLE lt_who_merge LINES lv_lines.

  IF lv_lines > 1.
    DO 5 TIMES.
      CALL METHOD zcl_ewm_base_db_who=>wo_merge
        EXPORTING
          iv_lgnum    = iv_lgnum
          iv_wcr      = iv_wcr
          iv_commit   = abap_true
          it_who      = lt_who_merge
        IMPORTING
          ev_severity = lv_severity
          et_bapiret  = lt_bapiret
          et_who      = lt_who.

      IF lv_severity EQ zwmgc_msgty_error.
        ". Merge process unsuccessfull, try again.
        CLEAR lv_severity.
        WAIT UP TO 1 SECONDS.
      ELSE.
        ". Merge process successfull. Exit loop.
        EXIT.
      ENDIF.
    ENDDO.

    READ TABLE lt_who INTO ls_who_log INDEX 1.

    lv_who = ls_who_log-who.

    READ TABLE  lt_bapiret INTO ls_bapiret
       WITH KEY id = zwmgc_msgty_error.

    lv_message  =  ls_bapiret-message.

    LOG-POINT ID zewm_base
           FIELDS is_rfc_queue
                  iv_lgnum
                  iv_wcr
                  iv_lgtyp
                  it_hu
                  lv_severity
                  lv_message_log
                  ls_bapiret
                  lt_bapiret
                  lv_who
                  ls_who_log
                  lt_who.

  ENDIF.

  IF lv_severity EQ zwmgc_msgty_error.

    " .ERROR. Errors found during WO merge.
    MESSAGE e002(zewm_enha)
       INTO lv_message.
    lr_log->add_message( ).
    CALL METHOD lr_log->save_applog
      EXPORTING
        is_log = ls_log.
*   .Restart queue
    PERFORM restart
      USING abap_false
            lv_prot_no
            is_rfc_queue
            lr_log
            ls_log.
  ELSE.

*LEAR 10.02.2022

    LOOP AT lt_ordim_o INTO ls_ordim_o.
      READ TABLE lt_to_change
       TRANSPORTING NO FIELDS
        WITH KEY tanum = ls_ordim_o-tanum.
      CHECK sy-subrc <> 0.
      CLEAR: ls_to_change,
             ls_to_changed.
      ls_to_change-tanum = ls_ordim_o-tanum.
      ls_to_changed-fieldname = zif_ewm_base_c=>gc_fieldname_nlplaconstant.
      INSERT ls_to_changed INTO TABLE ls_to_change-tt_changed.
      INSERT ls_to_change INTO TABLE lt_to_change.


      CALL FUNCTION '/SCWM/TO_READ_SINGLE'
        EXPORTING
          iv_lgnum     = iv_lgnum
          iv_tanum     = ls_ordim_o-tanum
          iv_flglock   = abap_true
        IMPORTING
          es_ordim_o   = ls_ordim
        EXCEPTIONS
          wrong_input  = 1
          not_found    = 2
          foreign_lock = 3
          error        = 4
          OTHERS       = 5.

      IF sy-subrc = 3.
    " .ERROR BLOCKING TASK
        MESSAGE e017(zewm_enha)
           INTO lv_message.

       lr_log->add_message( ).

       PERFORM restart
         USING abap_true
               lv_prot_no
               is_rfc_queue
               lr_log
               ls_log.
      ENDIF.

    ENDLOOP.


    IF lt_to_change IS NOT INITIAL.
*>>>DNA.2022.07.15
      DO 5 TIMES.
        TRY .
*            .Update WT deleting Destination Bin.
*           zcl_ewm_base_db_to=>update_open_wt( iv_lgnum  = iv_lgnum
*                                            it_change = lt_to_change ).

            CALL FUNCTION '/SCWM/TO_CHANGE_ATT_UPD'
              EXPORTING
                iv_tstmp        = lv_tstmp
                iv_lgnum        = iv_lgnum
                it_change       = lt_to_change.
            EXIT.
          CATCH cx_sy_open_sql_db.
            IF sy-tabix = 5.
               " .ERROR. Errors update WT.
              MESSAGE e015(zewm_enha)
                 INTO lv_message.

              lr_log->add_message( ).

              PERFORM restart
                USING abap_true
                      lv_prot_no
                      is_rfc_queue
                      lr_log
                      ls_log.
            ELSE.
*           .Wait 1 second and try again for 5 times.
              WAIT UP TO 1 SECONDS.
            ENDIF.
        ENDTRY.
      ENDDO.
*<<<DNA.2022.07.15
    ENDIF.

*LEAR 10.02.2022
    IF lt_who IS NOT INITIAL.
      LOOP AT lt_who INTO ls_who.
        ls_who_stat-who = ls_who-who.
        APPEND ls_who_stat TO lt_who_stat.
      ENDLOOP.
    ELSE.
      LOOP AT lt_who_merge INTO ls_who_merge.
        ls_who_stat-who = ls_who_merge-who.
        APPEND ls_who_stat TO lt_who_stat.
      ENDLOOP.
    ENDIF.

    " .Set Status to WO
    TRY.
        CALL METHOD zcl_ewm_base_db_who=>set_status_who
          EXPORTING
            iv_lgnum   = iv_lgnum
            iv_whostat = wmegc_wo_open
            it_whoid   = lt_who_stat.
      CATCH zcx_ewm_base_db.
* " .ERROR. Errors Release  WO.

    ENDTRY.

  ENDIF.


*=======================================================================
* Save Log
*=======================================================================

  TRY.
      lr_log->save_applog(
                EXPORTING
                  is_log       = ls_log
                IMPORTING
                  ev_loghandle = lv_loghandle ).
      lr_log->save_applog2db( iv_loghandle = lv_loghandle ).
      COMMIT WORK.
    CATCH /scwm/cx_basics.                              "#EC NO_HANDLER
  ENDTRY.


*=======================================================================
* Output
*=======================================================================


ENDFUNCTION.









*
