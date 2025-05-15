*----------------------------------------------------------------------*
* Title  FM zewm_fm_base_qrfc_to_update
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. :Indumotora
* Author : Alberto Magaña
*----------------------------------------------------------------------*
* Program description:
* Confirm warehouse task(s) in separate qRFC unit
*----------------------------------------------------------------------*
* Program description:
* Update warehouse task(s) in separate qRFC unit
*----------------------------------------------------------------------*
FUNCTION zewm_fm_base_qrfc_to_update.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IS_RFC_QUEUE) TYPE  /SCWM/S_RFC_QUEUE
*"     VALUE(IV_LGNUM) TYPE  /SCWM/LGNUM
*"     VALUE(IT_CHANGE_ATT) TYPE  /SCWM/TT_TO_CHANGE_ATT_INT
*"----------------------------------------------------------------------

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:
    lv_message     TYPE string,
    lv_loghandle   TYPE balloghndl,
    lv_prot_no     TYPE /scwm/de_tologno,
    ls_to_change   TYPE /scwm/s_to_change_att_int,
    ls_log_head    TYPE bal_s_log,
    ls_fld_change  TYPE /scwm/s_changed,
    lr_log         TYPE REF TO /scwm/cl_log,
    lt_to_change   TYPE /scwm/tt_to_change_att_int,
    lt_fld_change  TYPE /scwm/tt_changed,
    ls_ordim_o     TYPE /scwm/ordim_o,
    ls_ordim_o2    TYPE /scwm/ordim_o,
    lv_source      TYPE string,
    lv_destination TYPE string.

  FIELD-SYMBOLS: <fs_change_att> LIKE LINE OF it_change_att,
                 <fs_changed>    LIKE LINE OF lt_fld_change.

*=======================================================================
* Build Log
*=======================================================================
  CREATE OBJECT lr_log.

  ls_log_head-object     = zif_ewm_base_logobjects_c=>gc_o_log_qrfc.
  ls_log_head-subobject  = zif_ewm_base_logobjects_c=>gc_s_task_update.
  ls_log_head-extnumber  = is_rfc_queue-queue.
  ls_log_head-aldate     = sy-datum.
  ls_log_head-altime     = sy-uzeit.
  ls_log_head-aluser     = sy-uname.
  ls_log_head-alprog     = sy-repid.


  LOOP AT it_change_att ASSIGNING <fs_change_att>.
    CLEAR: lv_message, lt_to_change, ls_ordim_o, ls_ordim_o2.

*     .Message to Log
    "021 Update begins for WT &1

    MESSAGE s021(zewm_base) WITH <fs_change_att>-tanum
                            INTO lv_message.
    lr_log->add_message( ).

    LOOP AT <fs_change_att>-tt_changed ASSIGNING <fs_changed>.
      CLEAR: lv_message.
      "024 Fieldname &1 Value &2
      IF <fs_changed>-unit IS NOT INITIAL.
        MESSAGE s024(zewm_base) WITH <fs_changed>-fieldname <fs_changed>-value_q INTO lv_message.
      ELSE.
        MESSAGE s024(zewm_base) WITH <fs_changed>-fieldname <fs_changed>-value_c INTO lv_message.
      ENDIF.

      lr_log->add_message( ).
    ENDLOOP.

    APPEND <fs_change_att> TO lt_to_change.

    TRY.
        CALL METHOD zcl_ewm_base_db_to=>update_open_wt
          EXPORTING
            iv_lgnum  = iv_lgnum
            it_change = lt_to_change.
      CATCH zcx_ewm_base_db.
        ". BADI was unable to update WT &1

        MESSAGE ID sy-msgid
           TYPE sy-msgty
           NUMBER sy-msgno
           WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4
           INTO lv_message.
        lr_log->add_message( ).

        "Error updating WT &
        CLEAR lv_message.
        MESSAGE e023(zewm_base) WITH <fs_change_att>-tanum INTO lv_message.
        lr_log->add_message( ).

        PERFORM restart
          USING abap_false
                lv_prot_no
                is_rfc_queue
                lr_log
                ls_log_head.

    ENDTRY.
    "End of update for WT
    CLEAR lv_message.
    MESSAGE s025(zewm_base) WITH <fs_change_att>-tanum INTO lv_message.
    lr_log->add_message( ).

  ENDLOOP.

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
