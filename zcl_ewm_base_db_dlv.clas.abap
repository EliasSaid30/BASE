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
class ZCL_EWM_BASE_DB_DLV definition
  public
  final
  create public .

public section.

  class-methods DLV_TO_REFDOC_R
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_REFDOCNO type /SCDL/DL_REFDOCNO
      !IV_REFDOCCAT type /SCDL/DL_REFDOCCAT
      !IV_DOCCAT type /SCDL/DL_DOCCAT
      !IV_DYN_DATA type XFELD default ABAP_FALSE
      !IV_LOCK type XFELD default ABAP_FALSE
      !IV_LOCK_MODE type ENQMODE default ZWMGC_ENQMODE_WRITE
      !IS_EXCLUDE_DATA type /SCWM/DLV_QUERY_EXCL_STR optional
      !IS_INCLUDE_DATA type /SCWM/DLV_QUERY_INCL_STR_PRD optional
      !IS_READ_OPTIONS type /SCWM/DLV_QUERY_CONTR_STR optional
      !IT_SELECTION type /SCWM/DLV_SELECTION_TAB optional
    exporting
      !ET_DLV_H type /SCWM/DLV_HEADER_OUT_PRD_TAB
      !ET_DLV_I type /SCWM/DLV_ITEM_OUT_PRD_TAB
    raising
      ZCX_EWM_BASE_DB .
  class-methods HEAD_TO_REFDOC_R
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_REFDOCNO type /SCDL/DL_REFDOCNO
      !IV_REFDOCCAT type /SCDL/DL_REFDOCCAT
      !IV_DOCCAT type /SCDL/DL_DOCCAT
      !IV_DYN_DATA type XFELD default ABAP_FALSE
      !IV_LOCK type XFELD default ABAP_FALSE
      !IV_LOCK_MODE type ENQMODE default ZWMGC_ENQMODE_WRITE
      !IS_EXCLUDE_DATA type /SCWM/DLV_QUERY_EXCL_STR optional
      !IS_INCLUDE_DATA type /SCWM/DLV_QUERY_INCL_STR_PRD optional
      !IS_READ_OPTIONS type /SCWM/DLV_QUERY_CONTR_STR optional
      !IT_SELECTION type /SCWM/DLV_SELECTION_TAB optional
    exporting
      !ET_DLV_H type /SCWM/DLV_HEADER_OUT_PRD_TAB
    raising
      ZCX_EWM_BASE_DB .
  class-methods QUERY_PREP_SEL_EQ
    importing
      !IV_LOGFNAME type /SCDL/DL_LOGFNAME
      !IV_VALUE_C type CLIKE optional
      !IV_GUID type CLIKE optional
    changing
      !CT_SELECTION type /SCWM/DLV_SELECTION_TAB .
  class-methods QUERY_DLV_H
    importing
      !IR_DM type ref to /SCWM/CL_DLV_MANAGEMENT_PRD optional
      !IV_DOCID type /SCDL/DL_DOCID optional
      !IT_DOCID type /SCWM/DLV_DOCID_ITEM_TAB optional
      !IV_DOCNO type /SCDL/DL_DOCNO optional
      !IT_DOCNO type /SCWM/DLV_DOCNO_ITEMNO_TAB optional
      !IV_WHNO type /SCWM/LGNUM optional
      !IT_SELECTION type /SCWM/DLV_SELECTION_TAB optional
      !IV_DOCCAT type /SCDL/DL_DOCCAT optional
      !IV_DYN_DATA type XFELD default ABAP_FALSE
      !IV_LOCK type XFELD default ABAP_FALSE
      !IV_LOCK_MODE type ENQMODE default ZWMGC_ENQMODE_WRITE
      !IS_READ_OPTIONS type /SCWM/DLV_QUERY_CONTR_STR optional
      !IS_EXCLUDE_DATA type /SCWM/DLV_QUERY_EXCL_STR optional
      !IS_INCLUDE_DATA type /SCWM/DLV_QUERY_INCL_STR_PRD optional
    exporting
      !ET_HEADERS type /SCWM/DLV_HEADER_OUT_PRD_TAB
      !EO_MESSAGE type ref to /SCWM/CL_DM_MESSAGE_NO
    raising
      /SCDL/CX_DELIVERY .
  class-methods QUERY_DLV_I
    importing
      !IR_DM type ref to /SCWM/CL_DLV_MANAGEMENT_PRD optional
      !IT_DOCID type /SCWM/DLV_DOCID_ITEM_TAB optional
      !IT_DOCNO type /SCWM/DLV_DOCNO_ITEMNO_TAB optional
      !IV_WHNO type /SCWM/LGNUM optional
      !IV_DOCID type /SCDL/DL_DOCID optional
      !IV_DOCNO type /SCDL/DL_DOCNO optional
      !IV_DOCCAT type /SCDL/DL_DOCCAT optional
      !IV_DYN_DATA type XFELD default ABAP_FALSE
      !IV_LOCK type XFELD default ABAP_FALSE
      !IV_LOCK_MODE type ENQMODE default ZWMGC_ENQMODE_WRITE
      !IT_SELECTION type /SCWM/DLV_SELECTION_TAB optional
      !IS_READ_OPTIONS type /SCWM/DLV_QUERY_CONTR_STR optional
      !IS_EXCLUDE_DATA type /SCWM/DLV_QUERY_EXCL_STR optional
      !IS_INCLUDE_DATA type /SCWM/DLV_QUERY_INCL_STR_PRD optional
    exporting
      !ET_ITEMS type /SCWM/DLV_ITEM_OUT_PRD_TAB
      !EO_MESSAGE type ref to /SCWM/CL_DM_MESSAGE_NO
    raising
      /SCDL/CX_DELIVERY .
  class-methods QUERY
    importing
      !IR_DM type ref to /SCWM/CL_DLV_MANAGEMENT_PRD optional
      !IT_DOCID type /SCWM/DLV_DOCID_ITEM_TAB optional
      !IT_DOCNO type /SCWM/DLV_DOCNO_ITEMNO_TAB optional
      !IV_WHNO type /SCWM/LGNUM optional
      !IT_SELECTION type /SCWM/DLV_SELECTION_TAB optional
      !IV_DOCCAT type /SCDL/DL_DOCCAT optional
      !IS_READ_OPTIONS type /SCWM/DLV_QUERY_CONTR_STR optional
      !IS_EXCLUDE_DATA type /SCWM/DLV_QUERY_EXCL_STR optional
      !IS_INCLUDE_DATA type /SCWM/DLV_QUERY_INCL_STR_PRD optional
    exporting
      !ET_HU_TOP type /SCWM/TT_HUHDR_INT
      !ET_HU_PRD type /SCWM/DLV_ITEM_OUT_PRD_HU_TAB
      !ET_HU_HEADERS type /SCWM/TT_HUHDR_INT
      !ET_HU_ITEMS type /SCWM/TT_HUITM_INT
      !ET_HU_REF type /SCWM/TT_HUREF_INT
      !ET_HEADERS type /SCWM/DLV_HEADER_OUT_PRD_TAB
      !ET_ITEMS type /SCWM/DLV_ITEM_OUT_PRD_TAB
      !ET_ITEMS_TO type /SCWM/DLV_ITEM_OUT_TO_PRD_TAB
      !EO_MESSAGE type ref to /SCWM/CL_DM_MESSAGE_NO
      !ET_OD_HEADERS type /SCWM/DLV_HEADER_OUT_FD_TAB
      !ET_DOCCAT_TEXTS type /SCWM/DLV_DOCCAT_TEXT_TAB
      !ET_DOCTYPE_TEXTS type /SCWM/DLV_DOCTYPE_TEXT_TAB
      !ET_ITEMTYPE_TEXTS type /SCWM/DLV_ITEMTYPE_TEXT_TAB
      !ET_ITEMCAT_TEXTS type /SCWM/DLV_ITEMCAT_TEXT_TAB
      !ET_INCO1_TEXTS type /SCWM/DLV_INCO1_TEXT_TAB
    raising
      /SCDL/CX_DELIVERY .
  class-methods QUERY_INIT
    importing
      !IV_HEAD type XFELD default ABAP_FALSE
      !IV_ITEM type XFELD default ABAP_FALSE
      !IV_DYN_DATA type XFELD default ABAP_FALSE
      !IV_LOCK type XFELD default ABAP_FALSE
      !IV_LOCK_MODE type ENQMODE default ZWMGC_ENQMODE_WRITE
    exporting
      !ES_EXCLUDE_DATA type /SCWM/DLV_QUERY_EXCL_STR
      !ES_INCLUDE_DATA type /SCWM/DLV_QUERY_INCL_STR_PRD
      !ES_READ_OPTIONS type /SCWM/DLV_QUERY_CONTR_STR .
protected section.
private section.
ENDCLASS.



CLASS ZCL_EWM_BASE_DB_DLV IMPLEMENTATION.


METHOD DLV_TO_REFDOC_R.
*----------------------------------------------------------------------*
* Title  MTHD HEAD_TO_REFDOC_R
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Method selects deliveries for a reference document
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lr_cx_dlv                TYPE REF TO /scdl/cx_delivery,

  lr_dm                    TYPE REF TO /scwm/cl_dm_message_no,

  lt_selection             TYPE /scwm/dlv_selection_tab,

  ls_exclude_data          type /scwm/dlv_query_excl_str,
  ls_include_data          type /scwm/dlv_query_incl_str_prd,
  ls_read_options          type /scwm/dlv_query_contr_str,

  lv_fname                 TYPE /scdl/dl_logfname,
  lv_refdocno              TYPE /scdl/dl_refdocno.


*=======================================================================
* Input
*=======================================================================

  REFRESH: et_dlv_h.

  CALL FUNCTION 'CONVERSION_EXIT_ALPHA_OUTPUT'
    EXPORTING
      input  = iv_refdocno
    IMPORTING
      output = lv_refdocno.


*=======================================================================
* PREPARE execution
*=======================================================================

  query_init(
    exporting
      iv_item         = abap_true
      iv_dyn_data     = iv_dyn_data
      iv_lock         = iv_lock
      iv_lock_mode    = iv_lock_mode
    importing
      es_include_data = ls_include_data
      es_exclude_data = ls_exclude_data
      es_read_options = ls_read_options ).

  ls_exclude_data-head_all = abap_false.
  ls_exclude_data-item_all = abap_false.

  if ( is_exclude_data is not initial ).
    ls_exclude_data = is_exclude_data.
  endif.

  if ( is_include_data is not initial ).
    ls_include_data = is_include_data.
  endif.

  if ( is_read_options is not initial ).
    ls_read_options = is_read_options.
  endif.

  lt_selection[] = it_selection[].

  IF iv_refdocno IS NOT INITIAL.

    CASE iv_refdoccat.

      WHEN /SCDL/IF_DL_DOC_C=>sc_doccat_erp.

        lv_fname = /scdl/if_dl_logfname_c=>sc_refdocno_erp_i.

      WHEN OTHERS.

        RAISE EXCEPTION TYPE zcx_ewm_base_db
          EXPORTING
            textid = zcx_ewm_base_db=>parameter_invalid.

    ENDCASE.

    query_prep_sel_eq(
      EXPORTING
        iv_logfname  = lv_fname
        iv_value_c   = iv_refdocno
      CHANGING
        ct_selection = lt_selection ).
  ENDIF.


*=======================================================================
* READ deliveries by reference document
*=======================================================================

  TRY.
      query(
        EXPORTING
          iv_whno         = iv_lgnum
          it_selection    = lt_selection
          iv_doccat       = iv_doccat
*          iv_dyn_data     = iv_dyn_data
*          iv_lock         = iv_lock
*          iv_lock_mode    = iv_lock_mode
          is_exclude_data = ls_exclude_data
          is_include_data = ls_include_data
          is_read_options = ls_read_options
        IMPORTING
          et_headers      = et_dlv_h
          et_items        = et_dlv_i
          eo_message      = lr_dm ).
    CATCH /scdl/cx_delivery INTO lr_cx_dlv.
      zcx_ewm_base_db=>raise_dm(
        ir_cx_dlv = lr_cx_dlv ).
      zcx_ewm_base_db=>raise_syst( ).
  ENDTRY.

  zcx_ewm_base_db=>raise_dm(
    ir_dm = lr_dm ).

  IF ( lines( et_dlv_h ) = 0 ).
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid       = zcx_ewm_base_db=>dlv_head_to_refdoc_r
        gv_refdocno  = iv_refdocno
        gv_refdoccat = iv_refdoccat.
  ENDIF.













*
ENDMETHOD.


METHOD head_to_refdoc_r.
*----------------------------------------------------------------------*
* Title  MTHD HEAD_TO_REFDOC_R
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Method selects deliveries for a reference document
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lr_cx_dlv                TYPE REF TO /scdl/cx_delivery,

  lr_dm                    TYPE REF TO /scwm/cl_dm_message_no,

  lt_selection             TYPE /scwm/dlv_selection_tab,

  lv_fname                 TYPE /scdl/dl_logfname,
  lv_refdocno              TYPE /scdl/dl_refdocno.


*=======================================================================
* Input
*=======================================================================

  REFRESH: et_dlv_h.

  CALL FUNCTION 'CONVERSION_EXIT_ALPHA_OUTPUT'
    EXPORTING
      input  = iv_refdocno
    IMPORTING
      output = lv_refdocno.


*=======================================================================
* PREPARE query
*=======================================================================

  lt_selection[] = it_selection[].

  IF iv_refdocno IS NOT INITIAL.

    CASE iv_refdoccat.

      WHEN /SCDL/IF_DL_DOC_C=>sc_doccat_erp.

        lv_fname = /SCDL/IF_DL_LOGFNAME_C=>SC_REFDOCCAT_ERP_H.

      WHEN OTHERS.

        RAISE EXCEPTION TYPE zcx_ewm_base_db
          EXPORTING
            textid = zcx_ewm_base_db=>parameter_invalid.

    ENDCASE.

    query_prep_sel_eq(
      EXPORTING
        iv_logfname  = lv_fname
        iv_value_c   = lv_refdocno
      CHANGING
        ct_selection = lt_selection ).
  ENDIF.


*=======================================================================
* READ deliveries by reference document
*=======================================================================

  TRY.
      query_dlv_h(
        EXPORTING
          iv_whno         = iv_lgnum
          it_selection    = lt_selection
          iv_doccat       = iv_doccat
          iv_dyn_data     = iv_dyn_data
          iv_lock         = iv_lock
          iv_lock_mode    = iv_lock_mode
          is_exclude_data = is_exclude_data
          is_include_data = is_include_data
          is_read_options = is_read_options
        IMPORTING
          et_headers      = et_dlv_h
          eo_message      = lr_dm ).
    CATCH /scdl/cx_delivery INTO lr_cx_dlv.
      zcx_ewm_base_db=>raise_dm(
        ir_cx_dlv = lr_cx_dlv ).
      zcx_ewm_base_db=>raise_syst( ).
  ENDTRY.

  zcx_ewm_base_db=>raise_dm(
    ir_dm = lr_dm ).

  IF ( lines( et_dlv_h ) = 0 ).
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid       = zcx_ewm_base_db=>dlv_head_to_refdoc_r
        gv_refdocno  = iv_refdocno
        gv_refdoccat = iv_refdoccat.
  ENDIF.













*
ENDMETHOD.


METHOD query.
*----------------------------------------------------------------------*
* Title  MTHD QUERY
*----------------------------------------------------------------------*
* Indumotora
* Author : David Nava
*----------------------------------------------------------------------*
* Program description:
* Read delivery data
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lr_dm                    TYPE REF TO /scwm/cl_dlv_management_prd,

  ls_exclude_data          TYPE /scwm/dlv_query_excl_str,
  ls_include_data          TYPE /scwm/dlv_query_incl_str_prd.


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* CREATE object manager
*=======================================================================

  lr_dm = ir_dm.
  IF ( lr_dm IS NOT BOUND ).
    lr_dm = /scwm/cl_dlv_management_prd=>get_instance( ).
  ENDIF.


*=======================================================================
* PREPARE execution
*=======================================================================

  query_init(
    IMPORTING
      es_include_data = ls_include_data
      es_exclude_data = ls_exclude_data ).

  IF ( is_exclude_data IS NOT INITIAL ).
    ls_exclude_data = is_exclude_data.
  ENDIF.

  IF ( is_include_data IS NOT INITIAL ).
    ls_include_data = is_include_data.
  ENDIF.


*=======================================================================
* EXEC query
*=======================================================================

  lr_dm->query(
    EXPORTING
      it_docid          = it_docid
      it_docno          = it_docno
      iv_whno           = iv_whno
      it_selection      = it_selection
      iv_doccat         = iv_doccat
      is_read_options   = is_read_options
      is_exclude_data   = ls_exclude_data
      is_include_data   = ls_include_data
    IMPORTING
      et_hu_top         = et_hu_top
      et_hu_prd         = et_hu_prd
      et_hu_headers     = et_hu_headers
      et_hu_items       = et_hu_items
      et_hu_ref         = et_hu_ref
      et_headers        = et_headers
      et_items          = et_items
      et_items_to       = et_items_to
      eo_message        = eo_message
      et_od_headers     = et_od_headers
      et_doccat_texts   = et_doccat_texts
      et_doctype_texts  = et_doctype_texts
      et_itemtype_texts = et_itemtype_texts
      et_itemcat_texts  = et_itemcat_texts
      et_inco1_texts    = et_inco1_texts ).









*
ENDMETHOD.


method query_dlv_h.
*----------------------------------------------------------------------*
* Title  MTHD QUERY_DLV_H
* Copyright (c) 2024 Prologic. All rights reserved
*----------------------------------------------------------------------*
* Indumotora
* Author : David Nava
*----------------------------------------------------------------------*
* Program description:
* Read delivery header data
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  field-symbols:

  <lt_docno>               type /scwm/dlv_docno_itemno_tab,
  <lt_docid>               type /scwm/dlv_docid_item_tab.


  data:

  lr_dm                    type ref to /scwm/cl_dlv_management_prd,

  lt_docno                 type /scwm/dlv_docno_itemno_tab,
  lt_docid                 type /scwm/dlv_docid_item_tab,

  ls_docno                 type /scwm/dlv_docno_itemno_str,
  ls_docid                 type /scwm/dlv_docid_item_str,
  ls_exclude_data          type /scwm/dlv_query_excl_str,
  ls_include_data          type /scwm/dlv_query_incl_str_prd,
  ls_read_options          type /scwm/dlv_query_contr_str,

  lv_doccat                type /scdl/dl_doccat,
  lv_doccat_both           type xfeld.


*=======================================================================
* Input
*=======================================================================

  lv_doccat      = iv_doccat.
  lv_doccat_both = abap_false.


*=======================================================================
* CREATE object manager
*=======================================================================

  lr_dm = ir_dm.
  if ( lr_dm is not bound ).
    lr_dm = /scwm/cl_dlv_management_prd=>get_instance( ).
  endif.


*=======================================================================
* PREPARE execution
*=======================================================================

  query_init(
    exporting
      iv_head         = abap_true
      iv_dyn_data     = iv_dyn_data
      iv_lock         = iv_lock
      iv_lock_mode    = iv_lock_mode
    importing
      es_include_data = ls_include_data
      es_exclude_data = ls_exclude_data
      es_read_options = ls_read_options ).

  if ( is_exclude_data is not initial ).
    ls_exclude_data = is_exclude_data.
  endif.

  ls_exclude_data-head_all = abap_false.

  if ( is_include_data is not initial ).
    ls_include_data = is_include_data.
  endif.

  if ( is_read_options is not initial ).
    ls_read_options = is_read_options.
  endif.

* .SET table w/ document numbers........................................
  assign it_docno[] to <lt_docno>.
  if ( iv_docno is not initial ).
    assign lt_docno[] to <lt_docno>.
    <lt_docno> = it_docno[].
    call function 'CONVERSION_EXIT_ALPHA_INPUT'
      exporting
        input  = iv_docno
      importing
        output = ls_docno-docno.
    ls_docno-doccat = iv_doccat.
    append ls_docno to <lt_docno>.
  endif.

* .SET table w/ document IDs............................................
  assign it_docid[] to <lt_docid>.
  if ( iv_docid is not initial ).
    assign lt_docid[] to <lt_docid>.
    <lt_docid> = it_docid[].
    ls_docid-docid  = iv_docid.
    ls_docid-doccat = iv_doccat.
    append ls_docid to <lt_docid>.
  endif.

* .SET document category................................................
  if ( lv_doccat_both = abap_false ).
    loop at <lt_docno> into ls_docno
      where doccat is not initial.
      if ( lv_doccat is initial ).
        lv_doccat = ls_docno-doccat.
      endif.
      if ( lv_doccat <> ls_docno-doccat ).
        lv_doccat_both = abap_true.
        exit.
      endif.
    endloop.
  endif.

  if ( lv_doccat_both = abap_false ).
    loop at <lt_docid> into ls_docid
      where doccat is not initial.
      if ( lv_doccat is initial ).
        lv_doccat = ls_docid-doccat.
      endif.
      if ( lv_doccat <> ls_docid-doccat ).
        lv_doccat_both = abap_true.
        exit.
      endif.
    endloop.
  endif.

  if ( lv_doccat_both = abap_true ).
    clear: lv_doccat.
  endif.


*=======================================================================
* EXEC query
*=======================================================================

  lr_dm->query(
    exporting
      it_docid          = <lt_docid>
      it_docno          = <lt_docno>
      iv_whno           = iv_whno
      it_selection      = it_selection
      iv_doccat         = lv_doccat
      is_read_options   = ls_read_options
      is_exclude_data   = ls_exclude_data
      is_include_data   = ls_include_data
    importing
      et_headers        = et_headers
      eo_message        = eo_message ).









*
endmethod.


method query_dlv_i.
*----------------------------------------------------------------------*
* Title  MTHD QUERY_DLV_I
* Copyright (c) 2024 Prologic . All rights reserved
*----------------------------------------------------------------------*
* Indumotora
* Author : David Nava
*----------------------------------------------------------------------*
* Program description:
* Read delivery items data
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  field-symbols:

  <lt_docid>               type /scwm/dlv_docid_item_tab,
  <lt_docno>               type /scwm/dlv_docno_itemno_tab.


  data:

  lr_dlv_manager           type ref to /scwm/cl_dlv_management_prd,

  lt_docid                 type /scwm/dlv_docid_item_tab,
  lt_docno                 type /scwm/dlv_docno_itemno_tab,

  ls_exclude_data          type /scwm/dlv_query_excl_str,
  ls_include_data          type /scwm/dlv_query_incl_str_prd,
  ls_read_options          type /scwm/dlv_query_contr_str,
  ls_docid                 type /scwm/dlv_docid_item_str,
  ls_docno                 type /scwm/dlv_docno_itemno_str,

  lv_doccat                type /scdl/dl_doccat,
  lv_doccat_both           type xfeld.


*=======================================================================
* Input
*=======================================================================

  lv_doccat      = iv_doccat.
  lv_doccat_both = abap_false.


*=======================================================================
* CREATE object manager
*=======================================================================

  lr_dlv_manager = ir_dm.
  if ( lr_dlv_manager is not bound ).
    lr_dlv_manager = /scwm/cl_dlv_management_prd=>get_instance( ).
  endif.


*=======================================================================
* PREPARE execution
*=======================================================================

  query_init(
    exporting
      iv_item         = abap_true
      iv_dyn_data     = iv_dyn_data
      iv_lock         = iv_lock
      iv_lock_mode    = iv_lock_mode
    importing
      es_include_data = ls_include_data
      es_exclude_data = ls_exclude_data
      es_read_options = ls_read_options ).

  ls_exclude_data-head_all = abap_false.
  ls_exclude_data-item_all = abap_false.

  if ( is_exclude_data is not initial ).
    ls_exclude_data = is_exclude_data.
  endif.

  if ( is_include_data is not initial ).
    ls_include_data = is_include_data.
  endif.

  if ( is_read_options is not initial ).
    ls_read_options = is_read_options.
  endif.

* .SET table w/ document IDs............................................
  assign it_docid[] to <lt_docid>.
  if ( iv_docid is not initial ).
    assign lt_docid[] to <lt_docid>.
    <lt_docid> = it_docid[].
    ls_docid-docid  = iv_docid.
    ls_docid-doccat = iv_doccat.
    append ls_docid to <lt_docid>.
  endif.

* .SET table w/ document numbers........................................
  assign it_docno[] to <lt_docno>.
  if ( iv_docno is not initial ).
    assign lt_docno[] to <lt_docno>.
    <lt_docno> = it_docno[].
    call function 'CONVERSION_EXIT_ALPHA_INPUT'
      exporting
        input  = iv_docno
      importing
        output = ls_docno-docno.
    ls_docno-doccat = iv_doccat.
    append ls_docno to <lt_docno>.
  endif.

* .SET document category................................................
  if ( lv_doccat_both = abap_false ).
    loop at <lt_docno> into ls_docno
      where doccat is not initial.
      if ( lv_doccat is initial ).
        lv_doccat = ls_docno-doccat.
      endif.
      if ( lv_doccat <> ls_docno-doccat ).
        lv_doccat_both = abap_true.
        exit.
      endif.
    endloop.
  endif.

  if ( lv_doccat_both = abap_false ).
    loop at <lt_docid> into ls_docid
      where doccat is not initial.
      if ( lv_doccat is initial ).
        lv_doccat = ls_docid-doccat.
      endif.
      if ( lv_doccat <> ls_docid-doccat ).
        lv_doccat_both = abap_true.
        exit.
      endif.
    endloop.
  endif.

  if ( lv_doccat_both = abap_true ).
    clear: lv_doccat.
  endif.


*=======================================================================
* EXEC query
*=======================================================================

  lr_dlv_manager->query(
    exporting
      it_docid        = <lt_docid>
      it_docno        = <lt_docno>
      iv_whno         = iv_whno
      iv_doccat       = lv_doccat
      it_selection    = it_selection
      is_read_options = ls_read_options
      is_exclude_data = ls_exclude_data
      is_include_data = ls_include_data
    importing
      et_items        = et_items
      eo_message      = eo_message ).









*
endmethod.


METHOD query_init.
*----------------------------------------------------------------------*
* Title  MTHD QUERY_INIT
*----------------------------------------------------------------------*
* Indumotora
* Author : David Nava
*----------------------------------------------------------------------*
* Program description:
* Prepare execution of method /SCWM/CL_DLV_MANAGEMENT_PRD->QUERY()
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================


*=======================================================================
* Input
*=======================================================================

  CLEAR: es_exclude_data, es_include_data, es_read_options.


*=======================================================================
* SET exclude data
*=======================================================================

  es_exclude_data-head_partyloc  = abap_true.
  es_exclude_data-head_date      = abap_true.
  es_exclude_data-head_addmeas   = abap_true.
  es_exclude_data-head_status    = abap_true.
  es_exclude_data-head_refdoc    = abap_true.
  es_exclude_data-head_transport = abap_true.
  es_exclude_data-head_text      = abap_true.
  es_exclude_data-head_textline  = abap_true.
  es_exclude_data-head_all       = abap_true.
  es_exclude_data-item_partyloc  = abap_true.
  es_exclude_data-item_dates     = abap_true.
  es_exclude_data-item_addmeas   = abap_true.
  es_exclude_data-item_status    = abap_true.
  es_exclude_data-item_refdoc    = abap_true.
  es_exclude_data-item_splittab  = abap_true.
  es_exclude_data-item_docflow   = abap_true.
  es_exclude_data-item_text      = abap_true.
  es_exclude_data-item_textline  = abap_true.
  es_exclude_data-item_hierarchy = abap_true.
  es_exclude_data-item_serialn   = abap_true.
  es_exclude_data-item_all       = abap_true.
  es_exclude_data-hu_data        = abap_true.
  es_exclude_data-hu_prd_data    = abap_true.
  es_exclude_data-item_to        = abap_true.


*=======================================================================
* SET include data
*=======================================================================

  CLEAR: es_include_data.


*=======================================================================
* SET read options
*=======================================================================

  es_read_options-mix_in_object_instances = abap_true.

  IF ( iv_lock = abap_true ).
    es_read_options-lock_result = abap_true.
    es_read_options-lock_mode   = zwmgc_enqmode_write.
  ENDIF.

  IF ( iv_dyn_data = abap_false ).
    es_read_options-data_retrival_only = abap_true.
  ENDIF.

  IF ( iv_head = abap_true ).
    es_read_options-head_part_select = abap_true.
    es_exclude_data-head_all = abap_false.
  ENDIF.

  IF ( iv_item = abap_true ).
    es_read_options-item_part_select = abap_true.
    es_exclude_data-item_all = abap_false.
  ENDIF.

  IF (     iv_head = abap_true
       AND iv_item = abap_true ).
    es_read_options-head_part_select = abap_false.
    es_read_options-item_part_select = abap_false.
  ENDIF.











*
ENDMETHOD.


METHOD query_prep_sel_eq.
*----------------------------------------------------------------------*
* Title  METHOD QUERY_PREP_SEL_EQ.
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Prepare selection criterion for the query (EQ-statement)
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  ls_selection             TYPE /scwm/dlv_selection_str.


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* ADD criterion
*=======================================================================

  ls_selection-fieldname = iv_logfname.
  ls_selection-sign      = wmegc_sign_inclusive.
  ls_selection-option    = wmegc_option_eq.

  IF ( iv_value_c IS NOT INITIAL ).
    ls_selection-low = iv_value_c.
  ELSEIF ( iv_guid IS NOT INITIAL ).
    ls_selection-low = iv_guid.
  ELSE.
    RETURN.
  ENDIF.

  APPEND ls_selection TO ct_selection.











*
ENDMETHOD.
ENDCLASS.
