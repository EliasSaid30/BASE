*----------------------------------------------------------------------*
* Title  FM ZEWM_BASE_FM_QRFC_TO_CONFIRM
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. :Indumotora
* Author : Alberto Magaña
*----------------------------------------------------------------------*
* Program description:
* Confirm warehouse task(s) in separate qRFC unit
*----------------------------------------------------------------------*

FUNCTION ZEWM_FM_BASE_QRFC_TO_CONFIRM.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IS_RFC_QUEUE) TYPE  /SCWM/S_RFC_QUEUE
*"     VALUE(IV_LGNUM) TYPE  /SCWM/LGNUM
*"     VALUE(IV_SUBST) TYPE  /SCWM/RL03TSUBST DEFAULT SPACE
*"     VALUE(IV_QNAME) TYPE  UNAME DEFAULT SY-UNAME
*"     VALUE(IV_CRETO) TYPE  /SCWM/DE_CRETO DEFAULT SPACE
*"     VALUE(IV_WTCODE) TYPE  /SCWM/DE_WTCODE OPTIONAL
*"     VALUE(IV_UPDATE_TASK) TYPE  /SCWM/RL03AVERBU DEFAULT 'X'
*"     VALUE(IV_COMMIT_WORK) TYPE  /SCWM/RL03ACOMIT DEFAULT 'X'
*"     VALUE(IV_PROCESSOR_DET) TYPE  /SCWM/DE_CONFIRM_RF DEFAULT SPACE
*"     VALUE(IT_CONF) TYPE  /SCWM/TO_CONF_TT
*"     VALUE(IT_CONF_EXC) TYPE  /SCWM/TT_CONF_EXC OPTIONAL
*"     VALUE(IT_CONF_SERID) TYPE  /SCWM/TT_CONF_SERID OPTIONAL
*"----------------------------------------------------------------------
*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lr_log                   TYPE REF TO /scwm/cl_log,

  lt_bapiret               TYPE bapirettab,
  lt_ltap_vp               TYPE /scwm/tt_ltap_vb,
  lt_conf                  TYPE /scwm/to_conf_tt,

  ls_huhdr                 TYPE /scwm/s_huhdr_int,
  ls_huhdr_out             TYPE /scwm/s_huhdr_int,
  ls_ordim_o               TYPE /scwm/ordim_o,
  ls_log_head              TYPE bal_s_log,
  ls_conf                  TYPE /scwm/to_conf,

  lv_lines                 TYPE i,
  lv_prot_no               TYPE /scwm/de_tologno,
  lv_severity              TYPE bapi_mtype,
  lv_ser_err               TYPE xfeld,
  lv_message               TYPE string,
  lv_loghandle             TYPE balloghndl,
  lv_dstgrp                TYPE /scwm/de_dstgrp,
  lv_nlenr                 TYPE /scwm/ltap_nlenr.


  FIELD-SYMBOLS:
  <fs_bapiret>             TYPE bapiret2.


*=======================================================================
* BUILD Log
*=======================================================================
  BREAK-POINT ID zewm_base.

  CREATE OBJECT lr_log.

  ls_log_head-object     = zif_ewm_base_logobjects_c=>gc_o_log_qrfc.
  ls_log_head-subobject  = zif_ewm_base_logobjects_c=>gc_s_task_confirm.
  ls_log_head-extnumber  = is_rfc_queue-queue.
  ls_log_head-aldate     = sy-datum.
  ls_log_head-altime     = sy-uzeit.
  ls_log_head-aluser     = sy-uname.
  ls_log_head-alprog     = sy-repid.


*=======================================================================
*   1. Check if WT is already confirmed
*=======================================================================

  LOOP AT it_conf INTO ls_conf.
    TRY.
        CALL METHOD zcl_ewm_base_db_to=>get
          EXPORTING
            iv_lgnum   = iv_lgnum
            iv_tanum   = ls_conf-tanum
          IMPORTING
            es_ordim_o = ls_ordim_o.
      CATCH zcx_ewm_base_db .

* . Item already confirmed warehouse task is ignored

*     .Message to Log
        MESSAGE s005(zewm_base) WITH ls_conf-tanum
                                INTO lv_message.
        lr_log->add_message( ).

        CONTINUE.
    ENDTRY.

    IF ls_ordim_o IS NOT INITIAL.
      APPEND ls_conf TO lt_conf.
    ENDIF.

  ENDLOOP.



*=======================================================================
*   Performs confirmation of WT
*=======================================================================

* . Confirmation of WT begins
  IF  lines( lt_conf ) GT 0.

    lv_lines = lines( lt_conf ).
*     .Message to Log
    MESSAGE s006(zewm_base) WITH lv_lines
                            INTO lv_message.
    lr_log->add_message( ).

    CALL FUNCTION '/SCWM/TO_CONFIRM'
      EXPORTING
        iv_lgnum         = iv_lgnum
        iv_subst         = iv_subst
        iv_qname         = iv_qname
        iv_creto         = iv_creto
        iv_wtcode        = iv_wtcode
        iv_update_task   = iv_update_task
        iv_commit_work   = abap_false
        iv_processor_det = iv_processor_det
        it_conf          = lt_conf
        it_conf_exc      = it_conf_exc
        it_conf_serid    = it_conf_serid
      IMPORTING
        et_ltap_vb       = lt_ltap_vp
        et_bapiret       = lt_bapiret
        ev_severity      = lv_severity
        ev_ser_err       = lv_ser_err.

    IF sy-subrc NE 0.

      ROLLBACK WORK.

      LOOP AT lt_bapiret ASSIGNING <fs_bapiret>.

        MESSAGE ID <fs_bapiret>-id
           TYPE <fs_bapiret>-type
           NUMBER <fs_bapiret>-number
           WITH <fs_bapiret>-message_v1 <fs_bapiret>-message_v2
                <fs_bapiret>-message_v3 <fs_bapiret>-message_v4
           INTO lv_message.

        lr_log->add_message( ).

      ENDLOOP.

*   .Restart queue
      PERFORM restart
        USING abap_false
              lv_prot_no
              is_rfc_queue
              lr_log
              ls_log_head.
    ELSE.
      LOOP AT lt_bapiret ASSIGNING <fs_bapiret>.

        MESSAGE ID <fs_bapiret>-id
           TYPE <fs_bapiret>-type
           NUMBER <fs_bapiret>-number
           WITH <fs_bapiret>-message_v1 <fs_bapiret>-message_v2
                <fs_bapiret>-message_v3 <fs_bapiret>-message_v4
           INTO lv_message.

        lr_log->add_message( ).

        IF <fs_bapiret>-type CA 'EA'.
*   .Restart queue
          PERFORM restart
            USING abap_false
                  lv_prot_no
                  is_rfc_queue
                  lr_log
                  ls_log_head.

        ENDIF.
      ENDLOOP.
    ENDIF.
  ELSE.
*   .no open WTs to confirm
    "No open WTs to confirm
    MESSAGE s007(zewm_base) INTO lv_message.
    lr_log->add_message( ).
  ENDIF.


  IF ( iv_commit_work = abap_true ).
    COMMIT WORK AND WAIT.
  ENDIF.


*=======================================================================
* SAVE Log
*=======================================================================

  TRY.
      lr_log->save_applog(
                EXPORTING
                  is_log       = ls_log_head
                IMPORTING
                  ev_loghandle = lv_loghandle ).
      lr_log->save_applog2db( iv_loghandle = lv_loghandle ).
      COMMIT WORK.
    CATCH /scwm/cx_basics.                              "#EC NO_HANDLER
  ENDTRY.


ENDFUNCTION.
