*----------------------------------------------------------------------*
* Title  FM ZEWM_BASE_FM_QRFC_POST_CHNG
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. :Indumotora
* Author : Alberto Magaña
*----------------------------------------------------------------------*
* Program description:
* Adjusments to Posting
*----------------------------------------------------------------------*

FUNCTION zewm_base_fm_qrfc_post_chng.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IV_LGNUM) TYPE  /SCWM/LGNUM
*"     VALUE(IS_RFC_QUEUE) TYPE  /SCWM/S_RFC_QUEUE
*"     VALUE(IT_ORDIM_C) TYPE  /SCWM/TT_ORDIM_C
*"     VALUE(IV_STOCK_TYPE) TYPE  /LIME/STOCK_CATEGORY OPTIONAL
*"     VALUE(IV_PROCTY) TYPE  /SCWM/DE_PROCTY OPTIONAL
*"     VALUE(IV_REASON) TYPE  /SCWM/DE_REASON OPTIONAL
*"     VALUE(IV_OWNER) TYPE  /SCWM/DE_OWNER OPTIONAL
*"     VALUE(IV_ENTITLED) TYPE  /SCWM/DE_ENTITLED OPTIONAL
*"----------------------------------------------------------------------
*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:
    lt_item       TYPE /scwm/tt_spitem,
    lt_posted     TYPE /scwm/tt_spresult,
    lt_ltap_vb    TYPE /scwm/tt_ltap_vb,
    lt_remres     TYPE /scwm/tt_remreq,
    lt_bapiret    TYPE bapiret2_t,
    lt_matnr_r    TYPE /scwm/tt_matnr_r,
    lt_cat_r      TYPE /scwm/tt_cat_r,
    lt_owner_r    TYPE /scwm/tt_owner_r,
    lt_entitled_r	TYPE /scwm/tt_entitled_r,
    lt_lgpla_r    TYPE /scwm/tt_lgpla_r,
    lt_stock_mon  TYPE /scwm/tt_stock_mon,

    ls_header     TYPE /scwm/s_gmheader,
    ls_item       TYPE /scwm/s_spitem,
    ls_log_head   TYPE bal_s_log,
    ls_ordim_c    TYPE /scwm/ordim_c,
    ls_quan       TYPE /scwm/s_quan,
    ls_bapiret    TYPE bapiret2,
    ls_stock_mon  TYPE /scwm/s_stock_mon,
    ls_matnr_r    TYPE /scwm/s_matnr_r,
    ls_cat_r      TYPE /scwm/s_cat_r,
    ls_owner_r    TYPE /scwm/s_owner_r,
    ls_entitled_r	TYPE /scwm/s_entitled_r,
    ls_lgpla_r    TYPE /scwm/s_lgpla_r,

    lv_severity   TYPE bapi_mtype,
    lv_sdlv       TYPE xfeld,
    lv_tanum_gm   TYPE /scwm/tanum,
    lv_lines      TYPE i,
    lv_message    TYPE string,
    lv_loghandle  TYPE balloghndl,
    lv_prot_no    TYPE /scwm/de_tologno,
    lv_error      TYPE xfeld,
    lv_matnr      TYPE /sapapo/matnr,

    lr_log        TYPE REF TO /scwm/cl_log,
    lr_stock      TYPE REF TO /scwm/cl_mon_stock.


  CONSTANTS:
    gc_id_group_2   TYPE /lime/line_item_group VALUE '000002',
    gc_stock_cat_0f TYPE /lime/stock_category  VALUE '0F'.

*=======================================================================
* BUILD Log
*=======================================================================

  CREATE OBJECT lr_log.

  ls_log_head-object     = zif_ewm_base_logobjects_c=>gc_o_log_qrfc.
  ls_log_head-subobject  = zif_ewm_base_logobjects_c=>gc_s_task_confirm.
  ls_log_head-extnumber  = is_rfc_queue-queue.
  ls_log_head-aldate     = sy-datum.
  ls_log_head-altime     = sy-uzeit.
  ls_log_head-aluser     = sy-uname.
  ls_log_head-alprog     = sy-repid.


*=======================================================================
* Prapare Post
*=======================================================================

  DESCRIBE TABLE it_ordim_c LINES lv_lines.

  MESSAGE i031(zewm_base) INTO lv_message WITH lv_lines.
  lr_log->add_message( ).

  LOOP AT it_ordim_c INTO ls_ordim_c.
    CLEAR: ls_header,lv_matnr,lt_matnr_r,lt_cat_r,lt_owner_r,
           lt_entitled_r, lt_lgpla_r,  lt_stock_mon, lv_error,
           ls_item, lt_item.

    MESSAGE i033(zewm_base) INTO lv_message WITH ls_ordim_c-tanum.
    lr_log->add_message( ).

*   Header
    ls_header-lgnum      = iv_lgnum.
    ls_header-created_by = sy-uname.
    GET TIME STAMP FIELD ls_header-created_at.
    ls_header-code       = wmegc_gmcode_post.
    ls_header-post       = abap_true.

**  Read Stock

*   Material
    TRY.
        CALL METHOD zcl_ewm_base_db_product=>get_matnr_by_matid
          EXPORTING
            iv_mdlappl = wmegc_mdl_appl_comp
            iv_matid16 = ls_ordim_c-matid
          RECEIVING
            rv_matnr   = lv_matnr.
      CATCH zcx_ewm_base_db.
    ENDTRY.

    ls_matnr_r-sign   = wmegc_sign_inclusive.
    ls_matnr_r-option = wmegc_option_eq.
    ls_matnr_r-low    = lv_matnr.
    APPEND ls_matnr_r TO lt_matnr_r.

*   Stock Type
    ls_cat_r-sign   = wmegc_sign_inclusive.
    ls_cat_r-option = wmegc_option_eq.
    ls_cat_r-low    = gc_stock_cat_0f.
    APPEND ls_cat_r TO  lt_cat_r.

*   Owner
    ls_owner_r-sign   = wmegc_sign_inclusive.
    ls_owner_r-option = wmegc_option_eq.
    ls_owner_r-low    = ls_ordim_c-owner.
    APPEND ls_owner_r TO lt_owner_r.

*   Entitled
    ls_entitled_r-sign   = wmegc_sign_inclusive.
    ls_entitled_r-option = wmegc_option_eq.
    ls_entitled_r-low    = ls_ordim_c-entitled.
    APPEND ls_entitled_r TO lt_entitled_r.

*   Bin
    ls_lgpla_r-sign   = wmegc_sign_inclusive.
    ls_lgpla_r-option = wmegc_option_eq.
    ls_lgpla_r-low    = ls_ordim_c-nlpla.
    APPEND ls_lgpla_r TO lt_lgpla_r.

    CREATE OBJECT lr_stock
      EXPORTING
        iv_lgnum = iv_lgnum.

    CALL METHOD lr_stock->get_physical_stock
      EXPORTING
        it_matnr_r    = lt_matnr_r
        it_cat_r      = lt_cat_r
        it_owner_r    = lt_owner_r
        it_entitled_r = lt_entitled_r
        it_lgpla_r    = lt_lgpla_r
      IMPORTING
        et_stock_mon  = lt_stock_mon
        ev_error      = lv_error.

    IF lv_error IS NOT INITIAL.
      MESSAGE i032(zewm_base).
      CALL METHOD lr_log->add_message.
*      .Save Log
      TRY.
          lr_log->save_applog(
                    EXPORTING
                      is_log       = ls_log_head
                    IMPORTING
                      ev_loghandle = lv_loghandle ).
          lr_log->save_applog2db( iv_loghandle = lv_loghandle ).
        CATCH /scwm/cx_basics.                          "#EC NO_HANDLER
      ENDTRY.


*       .Restart queue
      PERFORM restart_queue
        USING abap_false
              lv_prot_no
              is_rfc_queue.

    ENDIF.

    CHECK lt_stock_mon IS NOT INITIAL.

    READ TABLE lt_stock_mon INTO ls_stock_mon INDEX 1.

    ls_item-id           = /scwm/cl_qui_inspdoc=>sc_id_group.
    ls_item-id_group     = gc_id_group_2.
    ls_item-direction    = wmegc_lime_post_transfer.

*   Location Item
    ls_item-loc-lgnum    = ls_ordim_c-lgnum.
    ls_item-loc-lgtyp    = ls_ordim_c-nltyp.
    ls_item-loc-lgpla    = ls_ordim_c-nlpla.

*   HU item
    ls_item-guid_hu      = ls_ordim_c-dguid_hu.
    ls_item-huident      = ls_ordim_c-nlenr.

*   Source
    ls_item-source_s-idx_stock     = ls_ordim_c-idx_stock.
    ls_item-source_s-guid_stock    = ls_stock_mon-guid_stock.
    ls_item-source_s-matid         = ls_ordim_c-matid.
    ls_item-source_s-cat           = gc_stock_cat_0f.
    ls_item-source_s-batchid       = ls_ordim_c-batchid.
    ls_item-source_s-owner         = ls_ordim_c-owner.
    ls_item-source_s-owner_role    = ls_ordim_c-owner_role.
    ls_item-source_s-entitled      = ls_ordim_c-entitled.
    ls_item-source_s-entitled_role = ls_ordim_c-entitled_role.
    ls_item-source_s-idplate       = ls_ordim_c-idplate.

*   Dest
    ls_item-dest_s-matid           = ls_ordim_c-matid.
    ls_item-dest_s-batchid         = ls_ordim_c-batchid.
    ls_item-dest_s-cat             = iv_stock_type.
    ls_item-dest_s-owner           = ls_ordim_c-owner.
    ls_item-dest_s-owner_role      = ls_ordim_c-owner_role.
    ls_item-dest_s-entitled        = ls_ordim_c-entitled.
    ls_item-dest_s-entitled_role   = ls_ordim_c-entitled_role.

*   Quan
    ls_quan-unit = ls_ordim_c-meins.
    ls_quan-quan = ls_ordim_c-vsolm.
    APPEND ls_quan TO ls_item-t_quan.
    ls_item-squant_set = abap_true.

**
    IF iv_procty IS NOT INITIAL.
      ls_item-procty = iv_procty.
    ENDIF.

    IF iv_reason IS NOT INITIAL.
      ls_item-reason = iv_reason.
    ENDIF.

    IF iv_owner IS NOT INITIAL.
      ls_item-dest_s-owner = iv_owner.
    ENDIF.

    IF iv_entitled IS NOT INITIAL.
      ls_item-dest_s-entitled = iv_entitled.
    ENDIF.

    APPEND ls_item TO lt_item.

    MESSAGE i034(zewm_base)
       WITH lv_matnr
            ls_ordim_c-owner
            ls_ordim_c-meins
            ls_ordim_c-vsolm.

    CALL METHOD lr_log->add_message.

    MESSAGE i035(zewm_base)
       WITH lv_matnr
            ls_ordim_c-owner
            ls_ordim_c-meins
            ls_ordim_c-vsolm.

    CALL METHOD lr_log->add_message.

    CALL FUNCTION '/SCWM/STOCK_CHANGE'
      EXPORTING
        is_header   = ls_header
        it_item     = lt_item
      IMPORTING
        et_posted   = lt_posted
        et_ltap_vb  = lt_ltap_vb
        et_remres   = lt_remres
        et_bapiret  = lt_bapiret
        ev_severity = lv_severity
        ev_sdlv     = lv_sdlv
        ev_tanum_gm = lv_tanum_gm.

    IF lt_bapiret IS NOT INITIAL.
      READ TABLE lt_bapiret INTO ls_bapiret
        WITH KEY type = 'E'.
      IF sy-subrc = 0.
        CALL METHOD lr_log->add_message(
          EXPORTING
            ip_msgty = ls_bapiret-type
            ip_msgid = ls_bapiret-id
            ip_msgno = ls_bapiret-number
            ip_msgv1 = ls_bapiret-message_v1
            ip_msgv2 = ls_bapiret-message_v2
            ip_msgv3 = ls_bapiret-message_v3
            ip_msgv4 = ls_bapiret-message_v4 ).

*      .Save Log
        TRY.
            lr_log->save_applog(
                      EXPORTING
                        is_log       = ls_log_head
                      IMPORTING
                        ev_loghandle = lv_loghandle ).
            lr_log->save_applog2db( iv_loghandle = lv_loghandle ).
          CATCH /scwm/cx_basics.                        "#EC NO_HANDLER
        ENDTRY.


*       .Restart queue
        PERFORM restart_queue
          USING abap_false
                lv_prot_no
                is_rfc_queue.

      ENDIF.
    ENDIF.

  ENDLOOP.

  IF sy-subrc = 0.
    MESSAGE i036(zewm_base).
    CALL METHOD lr_log->add_message( ).
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

    CATCH /scwm/cx_basics.                              "#EC NO_HANDLER
  ENDTRY.


*=======================================================================
* SAVE POST
*=======================================================================

  CALL FUNCTION '/SCWM/GM_POST'.

ENDFUNCTION.
