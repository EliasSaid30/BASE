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
class ZCL_EWM_BASE_DB_TU definition
  public
  final
  create public .

public section.

  class-methods ADD_HU
    importing
      !IR_SR_BOM type ref to /SCWM/CL_SR_BOM optional
      !IR_SR_BO_TU type ref to /SCWM/CL_SR_BO_TU
      !IV_LGNUM type /SCWM/LGNUM
      !IV_GUID_HU type /SCWM/GUID_HU optional
      !IV_HUIDENT type /SCWM/DE_HUIDENT optional
      !IV_DIRECT_ASGN_ONLY type XFELD
      !IV_SKIP_DLV_SAVE type XFELD
      !IV_SKIP_SYNCH type XFELD
      !IV_COMMIT type ZEWM_DE_BASE_COMMIT
      !IV_SAVE type XFELD
    raising
      ZCX_EWM_BASE_DB .
  class-methods CREATE
    importing
      !IR_SR_BOM type ref to /SCWM/CL_SR_BOM
      !IV_LGNUM type /SCWM/LGNUM
      !IV_MTR type /SCMB/MDL_TTYPE
      !IV_PMAT type /SCWM/DE_PMAT
      !IV_ACT_DIR type /SCMB/DE_SR_ACT_DIRECTION optional
      !IV_ROUTE_ID type /SCMB/DE_ROUTE_ID optional
      !IV_START_PLAN_TSTFR type /SCMB/DE_SR_ACT_START_PLAN_FR optional
      !IV_START_PLAN_TSTTO type /SCMB/DE_SR_ACT_START_PLAN_TO optional
      !IV_END_PLAN_TSTFR type /SCMB/DE_SR_ACT_END_PLAN_FR optional
      !IV_END_PLAN_TSTTO type /SCMB/DE_SR_ACT_END_PLAN_TO optional
      !IV_IDART1 type /SCWM/DE_SR_IDART optional
      !IV_IDTXT1 type ANY optional
      !IV_COMMIT type ZEWM_DE_BASE_COMMIT default ABAP_FALSE
      !IV_SAVE type XFELD default ABAP_FALSE
    exporting
      !ES_BO_TU_DATA type /SCWM/S_BO_TU_DATA
      !ER_BO_TU type ref to /SCWM/CL_SR_BO_TU
    raising
      ZCX_EWM_BASE_DB .
  class-methods DEL_HU
    importing
      !IR_SR_TUDLV type ref to /SCWM/CL_SR_TUDLV optional
      !IR_SR_BO_TU type ref to /SCWM/CL_SR_BO_TU optional
      !IS_TU_ACT type /SCWM/S_TU_SR_ACT_NUM optional
      !IV_DIRECT_ASGN_ONLY type XFELD
      !IV_GUID_HU type /SCWM/GUID_HU
      !IV_DOCCAT type /SCDL/DL_DOCCAT
      !IV_CHECK_DB type XFELD
      !IV_COMMIT type ZEWM_DE_BASE_COMMIT
      !IV_CLEANUP type XFELD
      !IV_SAVE type XFELD
    raising
      ZCX_EWM_BASE_DB .
  class-methods GET
    importing
      !IR_SR_BOM type ref to /SCWM/CL_SR_BOM
      !IV_LGNUM type /SCWM/LGNUM
      !IV_TU_NUM_EXT type /SCWM/DE_TU_NUM_EXT optional
      !IV_TU_NUM type /SCWM/DE_TU_NUM optional
      !IV_TU_ACT_NUM type /SCWM/DE_TU_SR_ACT_NUM optional
      !IV_PLANNED type XFELD
      !IV_EXECUTED type XFELD
      !IV_ACTIVE type XFELD
      !IV_INVALID type XFELD
    exporting
      !ER_BO_TU type ref to /SCWM/CL_SR_BO_TU
      !ES_BO_TU type /SCWM/S_BO_TUNIT
      !ES_BO_TU_DATA type /SCWM/S_BO_TU_DATA
    raising
      ZCX_EWM_BASE_DB .
  class-methods GET_GUIA
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_TU_NUM type /SCWM/DE_TU_NUM
      !IV_ERP_DOCNO type VBELN_VL
      !IV_ID_GUIA type ZEWM_DE_BASE_ID_GUIA
      !IV_GUIA type ZEWM_DE_BASE_GUIA
    returning
      value(ET_TU_GUIAS) type ZEWM_TT_BASE_TU_GUIDE
    raising
      ZCX_EWM_BASE_DB .
  class-methods GET_GUIA_MULTI
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IT_TU_NUM_R type /SCWM/TT_RANGE_YMOVE optional
      !IT_ERP_DOCNO_R type ZEWM_TT_BASE_ERP_DOCNO_R optional
      !IT_SEQ_NUM_R type ZEWM_TT_BASE_SEQ_NUM_R optional
      !IT_GUIDE_R type ZEWM_TT_BASE_GUIA_R optional
    returning
      value(ET_TU_GUIAS) type ZEWM_TT_BASE_TU_GUIDE
    raising
      ZCX_EWM_BASE_DB .
  class-methods GET_SR_BOM_INSTANCE
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_CALL_MODE type /SCWM/DE_SR_BOM_CALL_MODE default WMESR_CALL_MODE_STANDARD
      !IR_LOG type ref to /SCWM/CL_LOG optional
      !IV_REFRESH type XFELD default ABAP_FALSE
    returning
      value(RR_SR_BOM) type ref to /SCWM/CL_SR_BOM .
  class-methods READ
    importing
      !IR_SR_BOM type ref to /SCWM/CL_SR_BOM optional
      !IV_LGNUM type /SCWM/LGNUM
      !IV_TU_NUM_EXT type /SCWM/DE_TU_NUM_EXT optional
      !IV_TU_NUM type /SCWM/DE_TU_NUM optional
      !IV_TU_ACT_NUM type /SCWM/DE_TU_SR_ACT_NUM optional
      !IV_PLANNED type XFELD
      !IV_EXECUTED type XFELD
      !IV_ACTIVE type XFELD
      !IV_INVALID type XFELD
    exporting
      !ER_BO_TU type ref to /SCWM/CL_SR_BO_TU
      !ES_BO_TU type /SCWM/S_BO_TUNIT
      !ES_BO_TU_DATA type /SCWM/S_BO_TU_DATA
    raising
      ZCX_EWM_BASE_DB .
  class-methods READ_GUIA
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IT_TU_NUM_R type /SCWM/TT_RANGE_YMOVE
      !IT_ERP_DOCNO_R type ZEWM_TT_BASE_ERP_DOCNO_R
      !IT_SEQ_NUM_R type ZEWM_TT_BASE_SEQ_NUM_R
      !IT_GUIDE_R type ZEWM_TT_BASE_GUIA_R
    returning
      value(RT_TU_GUIAS) type ZEWM_TT_BASE_TU_GUIDE
    raising
      ZCX_EWM_BASE_DB .
  class-methods READ_MULTI
    importing
      !IR_SR_BOM type ref to /SCWM/CL_SR_BOM optional
      !IV_LGNUM type /SCWM/LGNUM
      !IV_TU_NUM_EXT type /SCWM/DE_TU_NUM_EXT optional
      !IV_TU_NUM type /SCWM/DE_TU_NUM optional
      !IV_TU_ACT_NUM type /SCWM/DE_TU_SR_ACT_NUM optional
      !IT_TU_NUM type INDEX TABLE optional
      !IV_IDART type CLIKE optional
      !IV_IDENT type CLIKE optional
      !IT_IDENT type INDEX TABLE optional
      !IV_PLANNED type XFELD
      !IV_EXECUTED type XFELD
      !IV_ACTIVE type XFELD
      !IV_INVALID type XFELD
    exporting
      !ET_BO_TU type /SCWM/TT_BO_TUNIT
    raising
      ZCX_EWM_BASE_DB .
  class-methods READ_MULTI_SEL_PREP
    importing
      !IR_SR_BOM type ref to /SCWM/CL_SR_BOM
      !IV_TU_NUM_EXT type /SCWM/DE_TU_NUM_EXT optional
      !IV_TU_NUM type /SCWM/DE_TU_NUM optional
      !IV_TU_ACT_NUM type /SCWM/DE_TU_SR_ACT_NUM optional
      !IT_TU_NUM type INDEX TABLE optional
      !IV_IDART type CLIKE optional
      !IV_IDENT type CLIKE optional
      !IT_IDENT type INDEX TABLE optional
      !IV_PLANNED type XFELD
      !IV_EXECUTED type XFELD
      !IV_ACTIVE type XFELD
      !IV_INVALID type XFELD
    exporting
      !ER_TU_QUERY type ref to /SCWM/CL_SR_TU_QUERY
      !ES_QUERY_EXCL type /SCWM/S_SR_QUERY_EXCL
    raising
      ZCX_EWM_BASE_DB .
  class-methods READ_DLV_HU
    importing
      !IR_SR_TUDLV type ref to /SCWM/CL_SR_TUDLV optional
      !IR_SR_BO_TU type ref to /SCWM/CL_SR_BO_TU
      !IV_DIRECT_ASGN_ONLY type XFELD
    exporting
      !ET_BO_TU_DLV_HU type /SCWM/TT_BO_TU_DLV_NO_SORT
    raising
      ZCX_EWM_BASE_DB .
  class-methods READ_DLV_HU_DB
    importing
      !IS_TU_ACT type /SCWM/S_TU_SR_ACT_NUM
    exporting
      !ET_TU_DLV_HU type /SCWM/TT_TU_DLV_NO_SORT
    raising
      ZCX_EWM_BASE_DB .
  class-methods READ_DLV_DB
    importing
      !IS_TU_ACT type /SCWM/S_TU_SR_ACT_NUM
    exporting
      !ET_TU_DLV_HU type /SCWM/TT_TU_DLV_NO_SORT
    raising
      ZCX_EWM_BASE_DB .
  class-methods SET_GUIA
    importing
      !IS_TU_GUIA type ZEWM_T_BASE_TUGU
    raising
      ZCX_EWM_BASE_DB .
  class-methods SET_GUIA_MULTI
    importing
      !IT_TU_GUIAS type ZEWM_TT_BASE_TU_GUIDE
    raising
      ZCX_EWM_BASE_DB .
  class-methods SET_STATUS_ARR_AT_CHK_POINT
    importing
      !IR_BO_TU type ref to /SCWM/CL_SR_BO_TU
      !IV_LGNUM type /SCWM/LGNUM
      !IV_CHKPT type /SCWM/DE_CHECK_POINT
    raising
      ZCX_EWM_BASE_DB .
  class-methods SET_STATUS_DEP_FROM_CHK_POINT
    importing
      !IR_BO_TU type ref to /SCWM/CL_SR_BO_TU optional
      !IV_LGNUM type /SCWM/LGNUM
      !IV_CHKPT type /SCWM/DE_CHECK_POINT
    raising
      ZCX_EWM_BASE_DB .
  class-methods SET_STATUS_GI_TU
    importing
      !IR_BO_TU type ref to /SCWM/CL_SR_BO_TU
      !IV_CHECK_ONLY type BOOLE_D default ABAP_FALSE
      !IV_SKIP_GM type BOOLE_D default ABAP_FALSE
      !IV_CANCEL type ABAP_BOOL default ABAP_FALSE
    exporting
      !ET_BO_TU_DLV_GM type /SCWM/TT_BO_TU_DLV
    changing
      !CV_LGNUM type /SCWM/LGNUM
    raising
      ZCX_EWM_BASE_DB .
  class-methods SET_STATUS_LOADING_FINISHED
    importing
      !IR_BO_TU type ref to /SCWM/CL_SR_BO_TU
      !IV_CHECK_ONLY type BOOLE_D default ABAP_FALSE
      !IV_ACTION_ONLY type BOOLE_D default ABAP_FALSE
      !IV_REASON type /SCWM/DE_SR_REASON optional
    raising
      ZCX_EWM_BASE_DB .
protected section.
private section.
ENDCLASS.



CLASS ZCL_EWM_BASE_DB_TU IMPLEMENTATION.


METHOD add_hu.
*----------------------------------------------------------------------*
* Title  MTHD ADD_HU
* Copyright (c) 2024 ProLogic LA S.C.. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Assign a Handling Unit to a Transport Unit using BOM
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================
  DATA:

  lr_bom                   TYPE REF TO /scwm/cl_sr_bom,

  lt_tu_dlv_hu_load        TYPE /scwm/tt_bo_tu_dlv_no_sort,
  lt_tu_dlv_hu             TYPE /scwm/tt_bo_tu_dlv_no_sort,

  ls_tu_dlv                TYPE /scwm/s_bo_tu_dlv,
  ls_tu_sr_act_num         TYPE /scwm/s_tu_sr_act_num.


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* GET S&R Business Object Manager
*=======================================================================

  lr_bom = ir_sr_bom.
  IF ( lr_bom IS NOT BOUND ).
    lr_bom = get_sr_bom_instance( iv_lgnum = iv_lgnum ).
  ENDIF.


*=======================================================================
* GET Shipping & Receiving numbers
*=======================================================================

  ls_tu_sr_act_num = ir_sr_bo_tu->get_num( ).


*=======================================================================
* SET Handling Units to be loaded
*=======================================================================

  CLEAR: ls_tu_dlv.
  MOVE: iv_guid_hu             TO ls_tu_dlv-top_hu,
        iv_huident             TO ls_tu_dlv-top_huident,
        iv_lgnum               TO ls_tu_dlv-lgnum.
  MOVE-CORRESPONDING ls_tu_sr_act_num TO ls_tu_dlv.
  APPEND ls_tu_dlv TO lt_tu_dlv_hu.


*=======================================================================
* EXEC  loading
*=======================================================================

  TRY.
      ir_sr_bo_tu->add_tu_dlv(
        EXPORTING
          iv_check_only   = abap_false
          iv_cross_hu_add = abap_true
          iv_skip_synch   = iv_skip_synch
          it_bo_tu_dlv_no_sort = lt_tu_dlv_hu
        IMPORTING
          et_bo_tu_dlv_no_sort_success = lt_tu_dlv_hu_load ) .
      /scwm/cl_sr_tm=>tm( ).
    CATCH /scwm/cx_sr_error.                            "#EC NO_HANDLER
  ENDTRY.

  IF ( lines( lt_tu_dlv_hu_load ) = 0 ).
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid = zcx_ewm_base_db=>tu_add_hu.
  ENDIF.


*=======================================================================
* SAVE reverse loading
*=======================================================================

  IF ( iv_save = abap_true ).
    TRY.
        lr_bom->save( iv_skip_dlv_save = iv_skip_dlv_save ).
      CATCH /scwm/cx_sr_error.
        ASSERT 1 = 0.
    ENDTRY.
    IF ( iv_commit = abap_true ).
      COMMIT WORK AND WAIT.
    ENDIF.
  ENDIF.












*
ENDMETHOD.


METHOD create.
*----------------------------------------------------------------------*
* Title  CREATE
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Create a transportation unit
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lr_sr_bom                TYPE REF TO /scwm/cl_sr_bom,
  lr_log                   TYPE REF TO /scwm/cl_log,

  ls_bo_tu_new             TYPE /scwm/s_bo_tu_new.


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* LOAD business manager: Shipping and receiving
*=======================================================================

  IF ( ir_sr_bom IS BOUND ).
    lr_sr_bom = ir_sr_bom.
  ELSE.
    lr_sr_bom = get_sr_bom_instance( iv_lgnum = iv_lgnum ).
  ENDIF.


*=======================================================================
* GET application log for error handling
*=======================================================================

  lr_log = lr_sr_bom->get_log( ).


*=======================================================================
* CREATE transportation unit
*=======================================================================

  ls_bo_tu_new-yard       = iv_lgnum.
  ls_bo_tu_new-mtr        = iv_mtr.
  ls_bo_tu_new-pmat       = iv_pmat.
  ls_bo_tu_new-act_dir    = iv_act_dir.
  ls_bo_tu_new-route_curr = iv_route_id.

  ls_bo_tu_new-idart1      = iv_idart1.
  ls_bo_tu_new-tu_id_text1 = iv_idtxt1.

  ls_bo_tu_new-start_plan_tstfr = iv_start_plan_tstfr.
  IF ( ls_bo_tu_new-start_plan_tstfr IS INITIAL ).
    GET TIME STAMP FIELD ls_bo_tu_new-start_plan_tstfr.
  ENDIF.

  ls_bo_tu_new-start_plan_tstto = iv_start_plan_tstto.
  IF ( ls_bo_tu_new-start_plan_tstto IS INITIAL ).
    GET TIME STAMP FIELD ls_bo_tu_new-start_plan_tstto.
  ENDIF.

  ls_bo_tu_new-end_plan_tstfr = iv_end_plan_tstfr.
  IF ( ls_bo_tu_new-end_plan_tstfr IS INITIAL ).
    GET TIME STAMP FIELD ls_bo_tu_new-end_plan_tstfr.
  ENDIF.

  ls_bo_tu_new-end_plan_tstto = iv_end_plan_tstto.
  IF ( ls_bo_tu_new-end_plan_tstto IS INITIAL ).
    GET TIME STAMP FIELD ls_bo_tu_new-end_plan_tstto.
  ENDIF.

  TRY.
      lr_sr_bom->create_new_bo_tu(
        EXPORTING
          is_bo_tu_new = ls_bo_tu_new
        IMPORTING
          eo_bo_tu     = er_bo_tu ).
    CATCH /scwm/cx_sr_error.
      zcx_ewm_base_db=>raise_log( ir_log = lr_log ).
      RAISE EXCEPTION TYPE zcx_ewm_base_db
        EXPORTING
          textid = zcx_ewm_base_db=>tu_create.
  ENDTRY.

  IF ( es_bo_tu_data IS REQUESTED ).
    TRY.
        er_bo_tu->get_data(
          IMPORTING
            es_bo_tu_data = es_bo_tu_data ).
      CATCH /scwm/cx_sr_error.
        zcx_ewm_base_db=>raise_log( ir_log = lr_log ).
        RAISE EXCEPTION TYPE zcx_ewm_base_db
          EXPORTING
            textid = zcx_ewm_base_db=>tu_create.
    ENDTRY.
  ENDIF.


*=======================================================================
* SAVE creation of the transportation unit
*=======================================================================

  IF ( iv_save = abap_true ).
    TRY.
        lr_sr_bom->save( ).
      CATCH /scwm/cx_sr_error.
        zcx_ewm_base_db=>raise_log( ir_log = lr_log ).
        RAISE EXCEPTION TYPE zcx_ewm_base_db
          EXPORTING
            textid = zcx_ewm_base_db=>tu_create.
    ENDTRY.
  ENDIF.


*=======================================================================
* Output
*=======================================================================

  IF ( iv_commit = abap_true ).
    COMMIT WORK AND WAIT.
  ENDIF.




















*
ENDMETHOD.


METHOD DEL_HU.
*----------------------------------------------------------------------*
* Title  MTHD DEL_HU
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Unassign a Handling Unit from a Transport Unit
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lr_sr_tudlv              TYPE REF TO /scwm/cl_sr_tudlv,

  lt_tu_act_key            TYPE /scwm/tt_tu_sr_act_num,
  lt_guid_hu               TYPE /scwm/tt_guid_hu,
  lt_tudlv_db              TYPE /scwm/tt_tu_dlv,            "#EC NEEDED

  ls_tu_act_key            TYPE /scwm/s_tu_sr_act_num,
  ls_guid_hu               TYPE /scwm/s_guid_hu,

  lv_rejected              TYPE abap_bool.


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* GET Number of an S&R Activity of a TU
*=======================================================================

  ls_tu_act_key = is_tu_act.
  IF ( ls_tu_act_key IS INITIAL ).
    IF ( ir_sr_bo_tu IS BOUND ).
      ls_tu_act_key     = ir_sr_bo_tu->get_num( ).
    ELSE.
      RAISE EXCEPTION TYPE zcx_ewm_base_db
        EXPORTING
          textid = zcx_ewm_base_db=>parameter_invalid.
    ENDIF.
  ENDIF.


*=======================================================================
* GET TU/Delivery Interface Manager
*=======================================================================

  lr_sr_tudlv = ir_sr_tudlv.
  IF ( lr_sr_tudlv IS NOT BOUND ).
    lr_sr_tudlv = /scwm/cl_sr_tudlv=>get_instance( ).
  ENDIF.

  IF ( iv_cleanup = abap_true ).
    /scwm/cl_sr_tudlv=>cleanup( ).
    lr_sr_tudlv = /scwm/cl_sr_tudlv=>get_instance( ).
  ENDIF.
  ASSERT lr_sr_tudlv IS BOUND.


*=======================================================================
* INIT loading
*=======================================================================

  APPEND ls_tu_act_key TO lt_tu_act_key.

  IF ( iv_guid_hu IS NOT INITIAL ).
    ls_guid_hu-guid_hu = iv_guid_hu.
    APPEND ls_guid_hu TO lt_guid_hu.
  ENDIF.

  lr_sr_tudlv->setup(
    EXPORTING
      it_tu_act_key  = lt_tu_act_key
      iv_direct_only = iv_direct_asgn_only
      it_guid_hu     = lt_guid_hu
      iv_check_db    = iv_check_db
    IMPORTING
      et_tudlv_db    = lt_tudlv_db ).


*=======================================================================
* EXEC loading
*=======================================================================

  lr_sr_tudlv->del_hu(
   EXPORTING
     is_tu_act_key  = ls_tu_act_key
     iv_guid_hu     = iv_guid_hu
     iv_manual      = abap_true
  IMPORTING
     ev_rejected    = lv_rejected ).

  IF ( lv_rejected = abap_true ).
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid     = zcx_ewm_base_db=>tu_del_hu
        gv_guid_hu = iv_guid_hu.
  ENDIF.


*=======================================================================
* SAVE loading
*=======================================================================

  IF ( iv_save = abap_true ).

    lr_sr_tudlv->save( ).

    IF ( iv_commit = abap_true ).
      COMMIT WORK AND WAIT.
    ENDIF.

  ENDIF.












*
ENDMETHOD.


METHOD get.
*----------------------------------------------------------------------*
* Title  MTHD GET_TU
* Copyright (c) 2024 ProLogic LAs S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Returns the Business Object of a Transport Unit
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lr_bom                   TYPE REF TO /scwm/cl_sr_bom,

  lt_tu_num_ext_sel        TYPE rseloption,
  lt_tu_num_sel            TYPE rseloption,
  lt_tu_act_num_sel        TYPE rseloption,
  lt_bo_tu                 TYPE /scwm/tt_bo_tunit,

  ls_bo_tu                 TYPE /scwm/s_bo_tunit,
  ls_bo_tu_data            TYPE /scwm/s_bo_tu_data.


*=======================================================================
* Input
*=======================================================================

  ASSERT ID zewm_base_error
      CONDITION   iv_tu_num_ext IS NOT INITIAL
               OR iv_tu_num     IS NOT INITIAL.

  IF (       iv_tu_num_ext IS INITIAL
        AND  iv_tu_num     IS INITIAL ).

    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid = zcx_ewm_base_db=>parameter_invalid.

  ENDIF.


*=======================================================================
* GET S&R Business Object Manager
*=======================================================================

  lr_bom = ir_sr_bom.
  IF ( lr_bom IS NOT BOUND ).
    lr_bom = get_sr_bom_instance( iv_lgnum = iv_lgnum ).
  ENDIF.


*=======================================================================
* PREP buffer refresh and query
*=======================================================================

* .External Transport Unit Number
  IF ( iv_tu_num_ext IS NOT INITIAL ).
    zcl_ewm_base=>range_append_eq(
      EXPORTING
        iv_value = iv_tu_num_ext
      CHANGING
        ct_range = lt_tu_num_ext_sel ).
  ENDIF.

* .Internal Transport Unit Number
  IF ( iv_tu_num IS NOT INITIAL ).
    zcl_ewm_base=>range_append_eq(
      EXPORTING
        iv_value = iv_tu_num
      CHANGING
        ct_range = lt_tu_num_sel ).
  ENDIF.

* .Transport Unit Activity
  IF ( iv_tu_act_num IS NOT INITIAL ).
    zcl_ewm_base=>range_append_eq(
      EXPORTING
        iv_value = iv_tu_act_num
      CHANGING
        ct_range = lt_tu_act_num_sel ).
  ENDIF.


*=======================================================================
* GET Transport Unit (from buffer)
*=======================================================================

  LOOP AT lr_bom->mt_bo_tu INTO ls_bo_tu
    WHERE tu_num        IN lt_tu_num_sel
      AND tu_sr_act_num IN lt_tu_act_num_sel
      AND num_ext       IN lt_tu_num_ext_sel.

*   // CHECK If Transport Unit belongs to this warehouse?...............
    TRY.
        ls_bo_tu-bo_ref->get_data(
          IMPORTING
            es_bo_tu_data = ls_bo_tu_data ).
      CATCH /scwm/cx_sr_error.
        ASSERT 1 = 0.
    ENDTRY.
    CHECK ls_bo_tu_data-yard_lgnum = lr_bom->mv_yard.

*   // FILTER by status.................................................
    CASE ls_bo_tu_data-sr_act_state.

      WHEN wmesr_act_state_planned.
        CHECK iv_planned = abap_true.

      WHEN wmesr_act_state_active.
        CHECK iv_active = abap_true.

      WHEN wmesr_act_state_executed.
        CHECK iv_executed = abap_true.

      WHEN wmesr_act_state_invalid.
        CHECK iv_executed = abap_true.

    ENDCASE.

*   // SAVE Transport Unit Activity.....................................
    APPEND ls_bo_tu TO lt_bo_tu.

  ENDLOOP.

  IF ( lines( lt_bo_tu ) = 1 ).

*   .Business Object
    READ TABLE lt_bo_tu INTO es_bo_tu
     INDEX 1.
    ASSERT sy-subrc = 0.

*   .Business Object Instance
    er_bo_tu = es_bo_tu-bo_ref.

*   .Business Object Data
    TRY.
        er_bo_tu->get_data(
          IMPORTING
            es_bo_tu_data = es_bo_tu_data ).
      CATCH /scwm/cx_sr_error.
        ASSERT 1 = 0.
    ENDTRY.

    RETURN.

  ELSEIF ( lines( lt_bo_tu ) > 1 ).

    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid        = zcx_ewm_base_db=>tu_get_unique
        gv_tu_num_ext = ls_bo_tu-num_ext.

  ENDIF.


*=======================================================================
* GET Transport Unit (from database)
*=======================================================================

  read(
    EXPORTING
      ir_sr_bom     = ir_sr_bom
      iv_lgnum      = iv_lgnum
      iv_tu_num_ext = iv_tu_num_ext
      iv_tu_num     = iv_tu_num
      iv_tu_act_num = iv_tu_act_num
      iv_planned    = iv_planned
      iv_executed   = iv_executed
      iv_active     = iv_active
      iv_invalid    = iv_invalid
    IMPORTING
      er_bo_tu      = er_bo_tu
      es_bo_tu      = es_bo_tu
      es_bo_tu_data = es_bo_tu_data ).










*
ENDMETHOD.


METHOD get_guia.
*----------------------------------------------------------------------*
* Title MTHD GET_GUIA
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : Elias Hernandez
*----------------------------------------------------------------------*
* Program description:
* Get Single from table TU "Guia despacho"
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================
  DATA:

  lt_tu_num_r              TYPE /scwm/tt_range_ymove,
  lt_erp_docno_r           TYPE zewm_tt_base_erp_docno_r,
  lt_seq_num_r             TYPE zewm_tt_base_seq_num_r,
  lt_guide_r               TYPE zewm_tt_base_guia_r,
  lt_tu_guides             TYPE zewm_tt_base_tu_guide.


*=======================================================================
* Input
*=======================================================================

  IF iv_lgnum     IS INITIAL AND
     iv_tu_num    IS INITIAL AND
     iv_erp_docno IS INITIAL AND
     iv_id_guia   IS INITIAL AND
     iv_guia      IS INITIAL.

    RAISE EXCEPTION TYPE zcx_ewm_base_db.

  ENDIF.


*=======================================================================
* Prepare Data
*=======================================================================

  IF iv_tu_num IS NOT INITIAL.
    zcl_ewm_base=>range_append_eq(
      EXPORTING
        iv_value = iv_tu_num
      CHANGING
        ct_range = lt_tu_num_r ).
  ENDIF.

  IF iv_erp_docno IS NOT INITIAL.
    zcl_ewm_base=>range_append_eq(
      EXPORTING
        iv_value = iv_erp_docno
      CHANGING
        ct_range = lt_erp_docno_r ).
  ENDIF.

  IF iv_id_guia IS NOT INITIAL.
    zcl_ewm_base=>range_append_eq(
      EXPORTING
        iv_value = iv_id_guia
      CHANGING
        ct_range = lt_seq_num_r ).
  ENDIF.

  IF iv_guia IS NOT INITIAL.
    zcl_ewm_base=>range_append_eq(
      EXPORTING
        iv_value = iv_guia
      CHANGING
        ct_range = lt_guide_r ).
  ENDIF.


*=======================================================================
* Read data
*=======================================================================

    et_tu_guias = get_guia_multi( iv_lgnum       = iv_lgnum
                                  it_tu_num_r    = lt_tu_num_r
                                  it_erp_docno_r = lt_erp_docno_r
                                  it_seq_num_r   = lt_seq_num_r
                                  it_guide_r     = lt_guide_r ).











*
ENDMETHOD.


METHOD get_guia_multi.
*----------------------------------------------------------------------*
* Title MTHD GET_GUIA_MULTI
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : Elias Hernandez
*----------------------------------------------------------------------*
* Program description:
* Get Multi from table TU "Guía despacho"
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================


*=======================================================================
* Input
*=======================================================================

  IF iv_lgnum       IS INITIAL AND
     it_tu_num_r    IS INITIAL AND
     it_erp_docno_r IS INITIAL AND
     it_seq_num_r   IS INITIAL AND
     it_guide_r     IS INITIAL.

    RAISE EXCEPTION TYPE zcx_ewm_base_db.
  ENDIF.


*=======================================================================
* Read data
*=======================================================================

   et_tu_guias = read_guia( iv_lgnum       = iv_lgnum
                            it_tu_num_r    = it_tu_num_r
                            it_erp_docno_r = it_erp_docno_r
                            it_seq_num_r   = it_seq_num_r
                            it_guide_r     = it_guide_r ).










*
ENDMETHOD.


METHOD get_sr_bom_instance.
*----------------------------------------------------------------------*
* Title  MTHD GET_SR_BOM_INSTANCE
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Return the S&R Business Object Manager
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* GET S&R Business Object Manager Instance
*=======================================================================

  TRY.
      rr_sr_bom = /scwm/cl_sr_bom=>get_instance(
                    iv_call_mode = iv_call_mode
                    io_log       = ir_log ).
    CATCH /scwm/cx_sr_error.
      ASSERT 1 = 0.
  ENDTRY.


*=======================================================================
* CHECK If S&R Business Object Manager is instanced for this Warehouse?
*=======================================================================

  IF ( rr_sr_bom->mv_yard IS INITIAL ).
    rr_sr_bom->mv_yard = iv_lgnum.
  ELSEIF ( rr_sr_bom->mv_yard <> iv_lgnum ).
    ASSERT 1 = 0.
  ENDIF.


*=======================================================================
* CLEANUP
*=======================================================================

  IF ( iv_refresh = abap_true ).
    rr_sr_bom->cleanup( ).
  ENDIF.








*
ENDMETHOD.


METHOD read.
*----------------------------------------------------------------------*
* Title  MTHD READ
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Read Transport Unit (from database) and create business object
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lr_log                   TYPE REF TO /scwm/cl_log,
  lr_bom                   TYPE REF TO /scwm/cl_sr_bom,
  lr_tu_query              TYPE REF TO /scwm/cl_sr_tu_query,

  lt_tu_num_ext_sel        TYPE rseloption,
  lt_tu_num_sel            TYPE rseloption,
  lt_tu_act_num_sel        TYPE rseloption,
  lt_bo_tu                 TYPE /scwm/tt_bo_tunit,

  ls_bo_tu_data            TYPE /scwm/s_bo_tu_data,
  ls_act_num               TYPE /scwm/s_tu_sr_act_num,
  ls_sel                   TYPE rsdsselopt,
  ls_tu_num_ext_sel        TYPE /scwm/s_sel_tu_num_ext,
  ls_tu_num_sel            TYPE /scwm/s_sel_tu_num,
  ls_tu_act_num_sel        TYPE /scwm/s_sel_tu_sr_act_num,
  ls_query_exclude         TYPE /scwm/s_sr_query_excl,
  ls_bo_tu                 TYPE /scwm/s_bo_tunit.


*=======================================================================
* Input
*=======================================================================

  ASSERT ID zewm_base_error
       CONDITION   iv_tu_num_ext IS NOT INITIAL
                OR iv_tu_num     IS NOT INITIAL.

  IF (       iv_tu_num_ext IS INITIAL
        AND  iv_tu_num     IS INITIAL ).

    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid = zcx_ewm_base_db=>parameter_invalid.

  ENDIF.


*=======================================================================
* GET S&R Business Object Manager
*=======================================================================

  lr_bom = ir_sr_bom.
  IF ( lr_bom IS NOT BOUND ).
    lr_bom = get_sr_bom_instance( iv_lgnum = iv_lgnum ).
  ENDIF.


*=======================================================================
* PREP buffer refresh and query
*=======================================================================

* .External Transport Unit Number
  IF ( iv_tu_num_ext IS NOT INITIAL ).
    zcl_ewm_base=>range_append_eq(
      EXPORTING
        iv_value = iv_tu_num_ext
      CHANGING
        ct_range = lt_tu_num_ext_sel ).
  ENDIF.

* .Internal Transport Unit Number
  IF ( iv_tu_num IS NOT INITIAL ).
    zcl_ewm_base=>range_append_eq(
      EXPORTING
        iv_value = iv_tu_num
      CHANGING
        ct_range = lt_tu_num_sel ).
  ENDIF.

* .Transport Unit Activity
  IF ( iv_tu_act_num IS NOT INITIAL ).
    zcl_ewm_base=>range_append_eq(
      EXPORTING
        iv_value = iv_tu_act_num
      CHANGING
        ct_range = lt_tu_act_num_sel ).
  ENDIF.


*=======================================================================
* REFRESH buffer
*=======================================================================

  LOOP AT lr_bom->mt_bo_tu INTO ls_bo_tu
    WHERE tu_num        IN lt_tu_num_sel
      AND tu_sr_act_num IN lt_tu_act_num_sel
      AND num_ext       IN lt_tu_num_ext_sel.

    ls_act_num-tu_num        = ls_bo_tu-tu_num.
    ls_act_num-tu_sr_act_num = ls_bo_tu-tu_sr_act_num.

    lr_bom->del_bo_tu( is_tu_sr_act_num = ls_act_num ).

  ENDLOOP.


*=======================================================================
* PREP query
*=======================================================================

  lr_log = lr_bom->get_log( ).

  CREATE OBJECT lr_tu_query
    EXPORTING
      io_log = lr_log.

* .External Transport Unit Number
  READ TABLE lt_tu_num_ext_sel INTO ls_sel
    INDEX 1.
  IF ( sy-subrc = 0 ).
    MOVE-CORRESPONDING ls_sel TO ls_tu_num_ext_sel.         "#EC ENHOK
    lr_tu_query->add_tu_num_ext( is_tu_num_ext = ls_tu_num_ext_sel ).
  ENDIF.

* .Internal Transport Unit Number
  READ TABLE lt_tu_num_sel INTO ls_sel
    INDEX 1.
  IF ( sy-subrc = 0 ).
    MOVE-CORRESPONDING ls_sel TO ls_tu_num_sel.             "#EC ENHOK
    lr_tu_query->add_tu_num( is_tu_num = ls_tu_num_sel ).
  ENDIF.

* .Transport Unit Activity
  READ TABLE lt_tu_act_num_sel INTO ls_sel
    INDEX 1.
  IF ( sy-subrc = 0 ).
    MOVE-CORRESPONDING ls_sel TO ls_tu_act_num_sel.         "#EC ENHOK
    lr_tu_query->add_tu_sr_act_id(
      is_tu_sr_act_id = ls_tu_act_num_sel ).
  ENDIF.

* .SET exclude data
  IF ( iv_planned = abap_false ).
    ls_query_exclude-excl_planned = abap_true.
  ENDIF.
  IF ( iv_executed = abap_false ).
    ls_query_exclude-excl_executed = abap_true.
  ENDIF.
  IF ( iv_invalid = abap_false ).
    ls_query_exclude-excl_invalid = abap_true.
  ENDIF.
  IF ( iv_active = abap_false ).
    ls_query_exclude-excl_active = abap_true.
  ENDIF.


*=======================================================================
* EXEC query
*=======================================================================

  TRY.
      lr_bom->query(
        EXPORTING
          io_tu_query = lr_tu_query
          is_exclude  = ls_query_exclude
        IMPORTING
          et_bo_tu    = lt_bo_tu ).
    CATCH /scwm/cx_sr_error.                            "#EC NO_HANDLER
  ENDTRY.

  LOOP AT lt_bo_tu INTO ls_bo_tu.
*   .GET Business Object data
    TRY.
        ls_bo_tu-bo_ref->get_data(
          IMPORTING
            es_bo_tu_data = ls_bo_tu_data ).
      CATCH /scwm/cx_sr_error.
        ASSERT 1 = 0.
    ENDTRY.
*   .CHECK If Transport Unit (Activity) belongs to another Warehouse?
    IF ( ls_bo_tu_data-yard_lgnum <> lr_bom->mv_yard ).
*     .yes
      DELETE lt_bo_tu
        WHERE tu_num        = ls_bo_tu-tu_num
          AND tu_sr_act_num = ls_bo_tu-tu_sr_act_num.
      ASSERT sy-subrc = 0.
*     .REMOVE Business Object
      ls_act_num-tu_num        = ls_bo_tu-tu_num.
      ls_act_num-tu_sr_act_num = ls_bo_tu-tu_sr_act_num.
      lr_bom->del_bo_tu( is_tu_sr_act_num = ls_act_num ).
      CONTINUE.
    ENDIF.
  ENDLOOP.

  IF ( lines( lt_bo_tu ) = 0 ).
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid        = zcx_ewm_base_db=>tu_read
        gv_tu_num_ext = iv_tu_num_ext.
  ELSEIF ( lines( lt_bo_tu ) > 1 ).
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid        = zcx_ewm_base_db=>tu_read_unique
        gv_tu_num_ext = ls_bo_tu-num_ext.
  ENDIF.


*=======================================================================
* OUTPUT
*=======================================================================

* .Business Object
  READ TABLE lt_bo_tu INTO es_bo_tu
    INDEX 1.
  ASSERT sy-subrc = 0.

* .Business Object Instance
  er_bo_tu = es_bo_tu-bo_ref.

* .Business Object Data
  TRY.
      er_bo_tu->get_data(
        IMPORTING
          es_bo_tu_data = es_bo_tu_data ).
    CATCH /scwm/cx_sr_error.
      ASSERT 1 = 0.
  ENDTRY.









*
ENDMETHOD.


METHOD READ_DLV_DB.
*----------------------------------------------------------------------*
* Title  MTHD READ_DLV_HU_DB
* Copyright (c) 2024 ProLogic LA S.C.. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Read all Handling Units which are assigned to this Transport Unit
* direct from DB
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================


*=======================================================================
* Input
*=======================================================================

  REFRESH: et_tu_dlv_hu.

  CHECK is_tu_act IS NOT INITIAL.


*=======================================================================
* READ TU/Delivery Interface Manager
*=======================================================================

  SELECT *
    FROM /scwm/tu_dlv
    INTO TABLE et_tu_dlv_hu
    WHERE tu_num         = is_tu_act-tu_num AND
          tu_sr_act_num  = is_tu_act-tu_sr_act_num.

  IF sy-subrc <> 0.
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid    = zcx_ewm_base_db=>tu_read_dlv_hu_db
        gv_tu_num = is_tu_act-tu_num.
  ENDIF.


*=======================================================================
* OUTPUT
*=======================================================================

  DELETE et_tu_dlv_hu WHERE top_hu IS NOT INITIAL.

  IF ( lines( et_tu_dlv_hu ) = 0 ).
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid    = zcx_ewm_base_db=>tu_read_dlv_hu_db
        gv_tu_num = is_tu_act-tu_num.
  ENDIF.














*
ENDMETHOD.


METHOD read_dlv_hu.
*----------------------------------------------------------------------*
* Title  MTHD READ_DLV_HU
* Copyright (c) 2024 ProLogic LA S.C.. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Read all Handling Units which are assigned to this Transport Unit
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lr_sr_tudlv              TYPE REF TO /scwm/cl_sr_tudlv,

  ls_tu_act_key            TYPE /scwm/s_tu_sr_act_num,
  ls_tu_act_num_ext        TYPE /scwm/s_tu_sr_act_num_ext.


*=======================================================================
* Input
*=======================================================================

  REFRESH: et_bo_tu_dlv_hu.

  ls_tu_act_key     = ir_sr_bo_tu->get_num( ).
  ls_tu_act_num_ext = ir_sr_bo_tu->get_num_ext( ).


*=======================================================================
* GET TU/Delivery Interface Manager
*=======================================================================

  lr_sr_tudlv = ir_sr_tudlv.
  IF ( lr_sr_tudlv IS NOT BOUND ).
    lr_sr_tudlv = /scwm/cl_sr_tudlv=>get_instance( ).
  ENDIF.
  ASSERT lr_sr_tudlv IS BOUND.


*=======================================================================
* GET Handling Units which are assigned to this Transport Unit
*=======================================================================

  lr_sr_tudlv->get_bo_tu_dlv(
    EXPORTING
      is_tu_act_key = ls_tu_act_key
      iv_direct     = iv_direct_asgn_only
    IMPORTING
      et_bo_tu_hu   = et_bo_tu_dlv_hu ).

  IF ( lines( et_bo_tu_dlv_hu ) = 0 ).
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid        = zcx_ewm_base_db=>tu_read_dlv_hu
        gv_tu_num_ext = ls_tu_act_num_ext-tu_num_ext.
  ENDIF.








*
ENDMETHOD.


METHOD read_dlv_hu_db.
*----------------------------------------------------------------------*
* Title  MTHD READ_DLV_HU_DB
* Copyright (c) 2024 ProLogic LA S.C.. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Read all Handling Units which are assigned to this Transport Unit
* direct from DB
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================


*=======================================================================
* Input
*=======================================================================

  REFRESH: et_tu_dlv_hu.

  CHECK is_tu_act IS NOT INITIAL.


*=======================================================================
* READ TU/Delivery Interface Manager
*=======================================================================

  SELECT *
    FROM /scwm/tu_dlv
    INTO TABLE et_tu_dlv_hu
    WHERE tu_num         = is_tu_act-tu_num AND
          tu_sr_act_num  = is_tu_act-tu_sr_act_num.

  IF sy-subrc <> 0.
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid    = zcx_ewm_base_db=>tu_read_dlv_hu_db
        gv_tu_num = is_tu_act-tu_num.
  ENDIF.


*=======================================================================
* OUTPUT
*=======================================================================

  SORT et_tu_dlv_hu BY top_hu.

  DELETE ADJACENT DUPLICATES FROM et_tu_dlv_hu COMPARING top_hu.

  IF ( lines( et_tu_dlv_hu ) = 0 ).
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid    = zcx_ewm_base_db=>tu_read_dlv_hu_db
        gv_tu_num = is_tu_act-tu_num.
  ENDIF.














*
ENDMETHOD.


METHOD read_guia.
*----------------------------------------------------------------------*
* Title MTHD READ_GUIA
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : Elias Hernandez
*----------------------------------------------------------------------*
* Program description:
* Read the informacion from TU "Guía despacho"
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lt_tu_guias              TYPE zewm_tt_base_tu_guide.


*=======================================================================
* Input
*=======================================================================
  IF iv_lgnum        IS INITIAL AND
     it_tu_num_r     IS INITIAL AND
     it_erp_docno_r  IS INITIAL AND
     it_seq_num_r    IS INITIAL AND
     it_guide_r      IS INITIAL.

     RAISE EXCEPTION TYPE zcx_ewm_base_db.

  ENDIF.
  CLEAR: rt_tu_guias.


*=======================================================================
* READ process category
*=======================================================================


  SELECT * FROM zewm_t_base_tugu
    INTO TABLE rt_tu_guias
      WHERE lgnum        EQ iv_lgnum        AND
            tu_num       IN it_tu_num_r     AND
            erp_docno    IN it_erp_docno_r  AND
            seq_num      IN it_seq_num_r    AND
            guia         IN it_guide_r.

  IF sy-subrc <> 0.
*    RAISE EXCEPTION TYPE zcx_ewm_base_db.
  ENDIF.









*
ENDMETHOD.


METHOD read_multi.
*----------------------------------------------------------------------*
* Title  MTHD READ_MULTI
* Copyright (c) 2024 ProLogic LA S.C.. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Read Transport Unit (from database) and create business object
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lr_bom                   TYPE REF TO /scwm/cl_sr_bom,
  lr_tu_query              TYPE REF TO /scwm/cl_sr_tu_query,

  ls_bo_tu_data            TYPE /scwm/s_bo_tu_data,
  ls_act_num               TYPE /scwm/s_tu_sr_act_num,
  ls_query_excl            TYPE /scwm/s_sr_query_excl,
  ls_bo_tu                 TYPE /scwm/s_bo_tunit.


*=======================================================================
* Input
*=======================================================================

  REFRESH: et_bo_tu.


*=======================================================================
* GET S&R Business Object Manager
*=======================================================================

  lr_bom = ir_sr_bom.
  IF ( lr_bom IS NOT BOUND ).
    lr_bom = get_sr_bom_instance( iv_lgnum = iv_lgnum ).
  ENDIF.


*=======================================================================
* PREP query
*=======================================================================

  read_multi_sel_prep(
    EXPORTING
      ir_sr_bom     = lr_bom
      iv_tu_num_ext = iv_tu_num_ext
      iv_tu_num     = iv_tu_num
      iv_tu_act_num = iv_tu_act_num
      it_tu_num     = it_tu_num
      iv_idart      = iv_idart
      iv_ident      = iv_ident
      it_ident      = it_ident
      iv_planned    = iv_planned
      iv_executed   = iv_executed
      iv_active     = iv_active
      iv_invalid    = iv_invalid
    IMPORTING
      er_tu_query   = lr_tu_query
      es_query_excl = ls_query_excl ).


*=======================================================================
* EXEC query
*=======================================================================

  TRY.
      lr_bom->query(
        EXPORTING
          io_tu_query = lr_tu_query
          is_exclude  = ls_query_excl
        IMPORTING
          et_bo_tu    = et_bo_tu ).
    CATCH /scwm/cx_sr_error.                            "#EC NO_HANDLER
  ENDTRY.

  LOOP AT et_bo_tu INTO ls_bo_tu.
*   .GET Business Object data
    TRY.
        ls_bo_tu-bo_ref->get_data(
          IMPORTING
            es_bo_tu_data = ls_bo_tu_data ).
      CATCH /scwm/cx_sr_error.
        ASSERT 1 = 0.
    ENDTRY.
*   .CHECK If Transport Unit (Activity) belongs to another Warehouse?
    IF ( ls_bo_tu_data-yard_lgnum <> lr_bom->mv_yard ).
*     .yes
      DELETE et_bo_tu
        WHERE tu_num        = ls_bo_tu-tu_num
          AND tu_sr_act_num = ls_bo_tu-tu_sr_act_num.
      ASSERT sy-subrc = 0.
*     .REMOVE Business Object
      ls_act_num-tu_num        = ls_bo_tu-tu_num.
      ls_act_num-tu_sr_act_num = ls_bo_tu-tu_sr_act_num.
      lr_bom->del_bo_tu( is_tu_sr_act_num = ls_act_num ).
      CONTINUE.
    ENDIF.
  ENDLOOP.


*=======================================================================
* OUTPUT
*=======================================================================

  IF ( lines( et_bo_tu ) = 0 ).
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid = zcx_ewm_base_db=>tu_read_multi.
  ENDIF.









*
ENDMETHOD.


METHOD read_multi_sel_prep.
*----------------------------------------------------------------------*
* Title  MTHD READ_MULTI_SEL_PREP
* Copyright (c) 2024 ProLogic LA S.C.. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Prepares the query of the Transport Unit Activites
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  FIELD-SYMBOLS:

  <lt_data>                TYPE ANY TABLE,
  <ls_data>                TYPE any.


  DATA:

  lr_log                   TYPE REF TO /scwm/cl_log,

  ls_sel_tu_num_ext        TYPE /scwm/s_sel_tu_num_ext,
  ls_sel_tu_num            TYPE /scwm/s_sel_tu_num,
  ls_sel_tu_act_id         TYPE /scwm/s_sel_tu_sr_act_num,
  ls_sel_idart             TYPE /scwm/s_sel_idart,
  ls_sel_ident             TYPE /scwm/s_sel_ident,
  ls_refdata               TYPE REF TO data,
  ls_data                  TYPE zewm_s_base_tu_num,

  lv_set                   TYPE xfeld.


*=======================================================================
* Input
*=======================================================================

  FREE: er_tu_query.

  CLEAR: es_query_excl.


*=======================================================================
* PREP query - search criteria
*=======================================================================

  lr_log = ir_sr_bom->get_log( ).

  CREATE OBJECT er_tu_query
    EXPORTING
      io_log = lr_log.

* // External Transport Unit Number (explicit)..........................
  IF ( iv_tu_num_ext IS NOT INITIAL ).
    CLEAR: ls_sel_tu_num_ext.
    ls_sel_tu_num_ext-option = wmegc_option_eq.
    ls_sel_tu_num_ext-sign   = wmegc_sign_inclusive.
    ls_sel_tu_num_ext-low    = iv_tu_num_ext.
    er_tu_query->add_tu_num_ext( is_tu_num_ext = ls_sel_tu_num_ext ).
    lv_set = abap_true.
  ENDIF.

* // Internal Transport Unit Number (explicit)..........................
  IF ( iv_tu_num IS NOT INITIAL ).
    CLEAR: ls_sel_tu_num.
    ls_sel_tu_num-option = wmegc_option_eq.
    ls_sel_tu_num-sign   = wmegc_sign_inclusive.
    ls_sel_tu_num-low    = iv_tu_num.
    er_tu_query->add_tu_num( is_tu_num = ls_sel_tu_num ).
    lv_set = abap_true.
  ENDIF.

* // Transport Unit Activity (explicit).................................
  IF ( iv_tu_act_num IS NOT INITIAL ).
    CLEAR: ls_sel_tu_act_id.
    ls_sel_tu_act_id-option = wmegc_option_eq.
    ls_sel_tu_act_id-sign   = wmegc_sign_inclusive.
    ls_sel_tu_act_id-low    = iv_tu_act_num.
    er_tu_query->add_tu_sr_act_id( is_tu_sr_act_id = ls_sel_tu_act_id ).
    lv_set = abap_true.
  ENDIF.

* // Numbers of S&R Activities (dynamic)................................
  IF ( it_tu_num IS SUPPLIED ).
    ASSIGN it_tu_num TO <lt_data>.
    CREATE DATA ls_refdata LIKE LINE OF <lt_data>.
    ASSIGN ls_refdata->* TO <ls_data>.
    LOOP AT <lt_data> INTO <ls_data>.
      MOVE-CORRESPONDING <ls_data> TO ls_data.              "#EC ENHOK
      CHECK ls_data IS NOT INITIAL.
*     .External Transport Unit Number
      IF ( ls_data-tu_num_ext IS NOT INITIAL ).
        CLEAR: ls_sel_tu_num_ext.
        ls_sel_tu_num_ext-option = wmegc_option_eq.
        ls_sel_tu_num_ext-sign   = wmegc_sign_inclusive.
        ls_sel_tu_num_ext-low    = ls_data-tu_num_ext.
        er_tu_query->add_tu_num_ext(
          is_tu_num_ext = ls_sel_tu_num_ext ).
        lv_set = abap_true.
      ENDIF.
*     .Internal Transport Unit Number
      IF ( ls_data-tu_num IS NOT INITIAL ).
        CLEAR: ls_sel_tu_num.
        ls_sel_tu_num-option = wmegc_option_eq.
        ls_sel_tu_num-sign   = wmegc_sign_inclusive.
        ls_sel_tu_num-low    = ls_data-tu_num.
        er_tu_query->add_tu_num( is_tu_num = ls_sel_tu_num ).
        lv_set = abap_true.
      ENDIF.
*     .Transport Unit Activity
      IF ( ls_data-tu_sr_act_num IS NOT INITIAL ).
        CLEAR: ls_sel_tu_act_id.
        ls_sel_tu_act_id-option = wmegc_option_eq.
        ls_sel_tu_act_id-sign   = wmegc_sign_inclusive.
        ls_sel_tu_act_id-low    = ls_data-tu_sr_act_num.
        er_tu_query->add_tu_sr_act_id(
          is_tu_sr_act_id = ls_sel_tu_act_id ).
        lv_set = abap_true.
      ENDIF.
    ENDLOOP.
  ENDIF.

* .Alternative TU Identification Type
  IF ( iv_idart IS NOT INITIAL ).
    CLEAR: ls_sel_idart.
    ls_sel_idart-option = wmegc_option_eq.
    ls_sel_idart-sign   = wmegc_sign_inclusive.
    ls_sel_idart-low    = iv_idart.
    er_tu_query->add_idart( is_sel_idart  = ls_sel_idart ).
    lv_set = abap_true.
  ENDIF.

* .Alternative TU Identification
  IF ( iv_ident IS NOT INITIAL ).
    CLEAR: ls_sel_ident.
    ls_sel_ident-option = wmegc_option_eq.
    ls_sel_ident-sign   = wmegc_sign_inclusive.
    ls_sel_ident-low    = iv_ident.
    er_tu_query->add_ident( is_sel_ident = ls_sel_ident ).
    lv_set = abap_true.
  ENDIF.

  IF ( it_ident IS SUPPLIED ).
    ASSIGN it_ident TO <lt_data>.
    CREATE DATA ls_refdata LIKE LINE OF <lt_data>.
    ASSIGN ls_refdata->* TO <ls_data>.
    LOOP AT <lt_data> INTO <ls_data>.
      CLEAR: ls_sel_ident.
      ls_sel_ident-option = wmegc_option_eq.
      ls_sel_ident-sign   = wmegc_sign_inclusive.
      ls_sel_ident-low    = <ls_data>.
      er_tu_query->add_ident( is_sel_ident = ls_sel_ident ).
      lv_set = abap_true.
    ENDLOOP.
  ENDIF.


*=======================================================================
* CHECK If incoming parameters are valid
*=======================================================================

  ASSERT ID zewm_base_error
    CONDITION lv_set = abap_true.

  IF ( lv_set = abap_false ).
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid = zcx_ewm_base_db=>parameter_invalid.
  ENDIF.


*=======================================================================
* PREP query - data to be excluded
*=======================================================================

  IF ( iv_planned = abap_false ).
    es_query_excl-excl_planned = abap_true.
  ENDIF.
  IF ( iv_executed = abap_false ).
    es_query_excl-excl_executed = abap_true.
  ENDIF.
  IF ( iv_invalid = abap_false ).
    es_query_excl-excl_invalid = abap_true.
  ENDIF.
  IF ( iv_active = abap_false ).
    es_query_excl-excl_active = abap_true.
  ENDIF.









*
ENDMETHOD.


METHOD set_guia.
*----------------------------------------------------------------------*
* Title MTHD SET_GUIA
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Set Single for table TU "Guía despacho"
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================
  DATA:

  lt_tu_guias              TYPE zewm_tt_base_tu_guide.

*=======================================================================
* Input
*=======================================================================
  IF is_tu_guia IS INITIAL.
    RAISE EXCEPTION TYPE zcx_ewm_base_db.
  ENDIF.


*=======================================================================
* SET New Register in the TABLE
*=======================================================================
  APPEND is_tu_guia TO lt_tu_guias.

  set_guia_multi( lt_tu_guias ).











*
ENDMETHOD.


METHOD set_guia_multi.
*----------------------------------------------------------------------*
* Title MTHD SET_GUIA_MULTI
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : Elias Hernandez
*----------------------------------------------------------------------*
* Program description:
* Set Multi Register from table TU "Guía despacho"
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================


*=======================================================================
* Input
*=======================================================================

  IF it_tu_guias IS INITIAL.
    RAISE EXCEPTION TYPE zcx_ewm_base_db.
  ENDIF.


*=======================================================================
* SET MULTI Register in the TABLE Z Real Recibido
*=======================================================================

  MODIFY zewm_t_base_tugu FROM TABLE it_tu_guias.










*
ENDMETHOD.


METHOD set_status_arr_at_chk_point.
*----------------------------------------------------------------------*
* Title  SET_STATUS_ARR_AT_CHK_POINT
* Copyright (c) 2024 ProLogic LA S.C.. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Set "Arrival at Checkpoint" status for TU
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* SET TU status - Arrival at checkpoint
*=======================================================================

  TRY.
      ir_bo_tu->cico( iv_lgnum = iv_lgnum
                      iv_chkpt = iv_chkpt
                      iv_act   = wmesr_act_check_in ).
    CATCH /scwm/cx_sr_error.
      zcx_ewm_base_db=>raise_syst( ).
  ENDTRY.








*
ENDMETHOD.


METHOD set_status_dep_from_chk_point.
*----------------------------------------------------------------------*
* Title  SET_DEPARTURE_FROM_CHK_POINT
* Copyright (c) 2024 ProLogic LA S.C.. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Set "Departure from Checkpoint" status for TU
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================


*======================================================================
* Input
*======================================================================


*======================================================================
* SET TU status - Departure from checkpoint
*======================================================================

  TRY.
      ir_bo_tu->cico(
        EXPORTING
          iv_lgnum = iv_lgnum
          iv_chkpt = iv_chkpt
          iv_act   = wmesr_act_check_out ).
    CATCH /scwm/cx_sr_error.
      zcx_ewm_base_db=>raise_syst( ).
  ENDTRY.











*
ENDMETHOD.


METHOD set_status_gi_tu.
*----------------------------------------------------------------------*
* Title  MTHD SET_STATUS_GI_TU
* Copyright (c) 2024 ProLogic LA S.C.. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Set status "loading finished" for this Transport Unit
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

*=======================================================================
* Input
*=======================================================================


*=======================================================================
* SET status - Loading finished
*=======================================================================

  TRY.
      ir_bo_tu->set_tu_goods_movement(

        EXPORTING
          iv_check_only   = iv_check_only
          iv_activity     = wmesr_act_post_goods_issue
          iv_skip_gm      = iv_skip_gm
          iv_cancel       = iv_cancel
        IMPORTING
          et_bo_tu_dlv_gm = et_bo_tu_dlv_gm
        CHANGING
          cv_lgnum        = cv_lgnum ) .
           CATCH /scwm/cx_sr_error .
      zcx_ewm_base_db=>raise_syst( ).
  ENDTRY.













*
ENDMETHOD.


METHOD set_status_loading_finished.
*----------------------------------------------------------------------*
* Title  MTHD SET_STATUS_LOADING_FINISHED
* Copyright (c) 2024 ProLogic LA S.C.. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Set status "loading finished" for this Transport Unit
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* SET status - Loading finished
*=======================================================================

  TRY.
      ir_bo_tu->set_tu_status_change(
        iv_check_only  = iv_check_only
        iv_action_only = iv_action_only
        iv_activity    = wmesr_act_end_load
        iv_reason      = iv_reason ).
    CATCH /scwm/cx_sr_error .
      zcx_ewm_base_db=>raise_syst( ).
  ENDTRY.













*
ENDMETHOD.
ENDCLASS.
