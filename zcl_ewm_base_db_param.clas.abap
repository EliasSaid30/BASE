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
class ZCL_EWM_BASE_DB_PARAM definition
  public
  final
  create public .

public section.

  interfaces ZIF_EWM_BASE_PARAM_C .

  methods CONSTRUCTOR
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_ENHAN type CLIKE .
  methods GET
    importing
      !IV_ENHAN type ZEWM_DE_BASE_PARAMS_KEYENH optional
      !IV_KEYNAM type ZEWM_DE_BASE_PARAMS_KEYNAM
      !IV_DYN_FILTER type ZEWM_DE_BASE_PARAMS_FILTER optional
      !IV_IGNORE_MULTI type XFELD default ABAP_FALSE
    exporting
      !ES_VALUE type ZEWM_T_PVAL
    raising
      ZCX_EWM_BASE_DB .
  class-methods GET_INSTANCE
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_ENHAN type ZEWM_DE_BASE_PARAMS_KEYENH
    returning
      value(RR_PARAM) type ref to ZCL_EWM_BASE_DB_PARAM .
  methods GET_MULTI
    importing
      !IV_ENHAN type ZEWM_DE_BASE_PARAMS_KEYENH optional
      !IV_KEYNAM type ZEWM_DE_BASE_PARAMS_KEYNAM
      !IV_DYN_FILTER type ZEWM_DE_BASE_PARAMS_FILTER optional
    exporting
      !ET_VALUES type ZEWM_TT_PVAL .
  methods GET_MULTI_RANGE
    importing
      !IV_ENHAN type ZEWM_DE_BASE_PARAMS_KEYENH optional
      !IV_KEYNAM type ZEWM_DE_BASE_PARAMS_KEYNAM
      !IV_DYN_FILTER type ZEWM_DE_BASE_PARAMS_FILTER optional
      !IV_EXCLUDE type XFELD optional
      !IS_KEYATT type ZEWM_S_BASE_PKEY_ATT optional
    exporting
      !ET_RANGE type ANY TABLE
    raising
      ZCX_EWM_BASE_DB .
  class-methods GET_SINGLETON
    returning
      value(RR_SINGLETON) type ref to ZCL_EWM_BASE_DB_PARAM .
  methods GET_VALUE
    importing
      !IV_ENHAN type ZEWM_DE_BASE_PARAMS_KEYENH optional
      !IV_KEYNAM type ZEWM_DE_BASE_PARAMS_KEYNAM
      !IV_DYN_FILTER type ZEWM_DE_BASE_PARAMS_FILTER optional
      !IV_IGNORE_MULTI type XFELD default ABAP_FALSE
      !IS_KEYATT type ZEWM_S_BASE_PKEY_ATT optional
    exporting
      !EV_VALUE type ANY
    raising
      ZCX_EWM_BASE_DB .
protected section.
private section.

  aliases GC_FIELDNAME_STC
    for ZIF_EWM_BASE_PARAM_C~GC_FIELDNAME_STC .

  class-data SR_PARAM type ref to ZCL_EWM_BASE_DB_PARAM .
  data GT_PKEY type ZEWM_TT_PKEY .
  data GT_ENHAN type ZEWM_TT_PKEYENH .
  data GT_FILENH type ZEWM_TT_PKFILENH .
  data GT_VAL type ZEWM_TT_PVAL .
  data GT_WHSE type ZEWM_TT_PWSHE .
  data GV_DFLT_ENHAN type ZEWM_DE_BASE_PARAMS_KEYENH .
  data GV_LGNUM type /SCWM/LGNUM .

  methods FIL_ENHAN
    importing
      !IV_ENHAN type ZEWM_DE_BASE_PARAMS_KEYENH
    changing
      !CT_VAL type ZEWM_TT_PVAL .
  methods FIL_KEYNAM
    importing
      !IV_KEYNAM type ZEWM_DE_BASE_PARAMS_KEYNAM
    changing
      !CT_VAL type ZEWM_TT_PVAL .
  methods FIL_DYN_FILTER
    importing
      !IV_DYN_FILTER type ZEWM_DE_BASE_PARAMS_FILTER
    changing
      !CT_VAL type ZEWM_TT_PVAL .
  methods GET_FIELDNAME
    importing
      !IV_KEYNAM type ZEWM_DE_BASE_PARAMS_KEYNAM
      !IS_KEYATT type ZEWM_S_BASE_PKEY_ATT optional
      !IV_IGNORE_MULTI type XFELD default ABAP_FALSE
    exporting
      !EV_FIELDNAME type FIELDNAME
    raising
      ZCX_EWM_BASE_DB .
  methods READ
    importing
      !IV_LGNUM type /SCWM/LGNUM
    exporting
      !ET_VAL type ZEWM_TT_PVAL
      !ET_ENHAN type ZEWM_TT_PKEYENH
      !ET_PKEY type ZEWM_TT_PKEY
      !ET_PWHSE type ZEWM_TT_PWSHE
      !ET_FILENH type ZEWM_TT_PKFILENH .
ENDCLASS.



CLASS ZCL_EWM_BASE_DB_PARAM IMPLEMENTATION.


METHOD constructor.
*----------------------------------------------------------------------*
* Title MTHD CONSTRUCTOR
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Read parameter definition, settings and values into global buffer and
* memorize the default values
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* SET memory for the default values
*=======================================================================

* .Warehouse Number
  me->gv_lgnum = iv_lgnum.

* .Enhancement Relevance
  me->gv_dflt_enhan = iv_enhan.


*=======================================================================
* READ parameter definition, settings and values
*=======================================================================

  me->read(
    EXPORTING
      iv_lgnum   = iv_lgnum
    IMPORTING
      et_val     = me->gt_val
      et_enhan   = me->gt_enhan
      et_pkey    = me->gt_pkey
      et_pwhse   = me->gt_whse
      et_filenh  = me->gt_filenh ).




















*
ENDMETHOD.


METHOD FIL_DYN_FILTER.
*----------------------------------------------------------------------*
* Title  MTHD FIL_DYN_FILTER
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Filter parameter values by dynamic filter relevance
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  ls_val                   TYPE zewm_t_pval.


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* FILTER parameter values by enhancement relevance
*=======================================================================

  LOOP AT ct_val INTO ls_val.

*   // CHECK If parameter value is assigned to this enhancement?........
    READ TABLE me->gt_filenh TRANSPORTING NO FIELDS
      WITH KEY keynam = ls_val-keynam
               keynum = ls_val-keynum
               keyfil = iv_dyn_filter.

    IF ( sy-subrc <> 0 ).
*     .no
      DELETE ct_val
        WHERE keynam = ls_val-keynam
          AND keynum = ls_val-keynum.
      IF ( sy-subrc <> 0 ).                                 "#EC NEEDED
      ENDIF.
    ENDIF.

  ENDLOOP.












*
ENDMETHOD.


METHOD fil_enhan.
*----------------------------------------------------------------------*
* Title  MTHD FIL_ENHAN
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Filter parameter values by enhancement relevance
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  ls_val                   TYPE zewm_t_pval.


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* FILTER parameter values by enhancement relevance
*=======================================================================

  LOOP AT ct_val INTO ls_val.

*   // CHECK If parameter value is assigned to this enhancement?........
    READ TABLE me->gt_enhan TRANSPORTING NO FIELDS
      WITH KEY keynam = ls_val-keynam
               keynum = ls_val-keynum
               keyenh = iv_enhan.

    IF ( sy-subrc <> 0 ).
*     .no
      DELETE ct_val
        WHERE keynam = ls_val-keynam
          AND keynum = ls_val-keynum.
      IF ( sy-subrc <> 0 ).                                 "#EC NEEDED
      ENDIF.
    ENDIF.

  ENDLOOP.












*
ENDMETHOD.


METHOD fil_keynam.
*----------------------------------------------------------------------*
* Title  MTHD FIL_KEYNAM
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Filter parameter values by key name
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* FILTER parameter values by key name
*=======================================================================

  DELETE ct_val
    WHERE keynam <> iv_keynam.
  IF ( sy-subrc <> 0 ).                                     "#EC NEEDED
  ENDIF.











*
ENDMETHOD.


METHOD get.
*----------------------------------------------------------------------*
* Title  MTHD GET
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Determine a single paramter value and return whose attributes
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lt_values                TYPE zewm_tt_pval,

  ls_value                 TYPE zewm_t_pval,

  lv_enhan                 TYPE zewm_de_base_params_keyenh.


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* SET filter validation values
*=======================================================================

* .Enhancement relevance
  lv_enhan = me->gv_dflt_enhan.
  IF ( iv_enhan IS NOT INITIAL ).
    lv_enhan = iv_enhan.
  ENDIF.


*=======================================================================
* GET parameter values
*=======================================================================

  me->get_multi(
    EXPORTING
      iv_enhan          = lv_enhan
      iv_keynam         = iv_keynam
      iv_dyn_filter     = iv_dyn_filter
    IMPORTING
      et_values         = lt_values ).


*=======================================================================
* OUTPUT
*=======================================================================

  IF ( lines( lt_values ) = 0 ).
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid    = zcx_ewm_base_db=>param_get
        gv_keynam = iv_keynam.
  ELSEIF ( lines( lt_values ) > 1 ).
    IF ( iv_ignore_multi = abap_false ).
      RAISE EXCEPTION TYPE zcx_ewm_base_db
        EXPORTING
          textid    = zcx_ewm_base_db=>param_get_not_unique
          gv_keynam = iv_keynam.
    ENDIF.
  ENDIF.

  READ TABLE lt_values INTO ls_value
    INDEX 1.
  ASSERT sy-subrc = 0.

  MOVE-CORRESPONDING ls_value TO es_value.










*
ENDMETHOD.


METHOD get_fieldname.
*----------------------------------------------------------------------*
* Title  MTHD GET_FIELDNAME
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* GET Fieldname that is requiered for parameter
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  ls_pkey                  TYPE zewm_t_pkey,
  ls_keyatt                TYPE zewm_s_base_pkey_att,
  ls_valatt                TYPE zewm_s_base_pval_att,       "#EC NEEDED
  ls_compkey               TYPE abap_compdescr,
  ls_compval               TYPE abap_compdescr,

  lo_typedesc              TYPE REF TO cl_abap_typedescr,
  lo_str_key               TYPE REF TO cl_abap_structdescr,
  lo_str_val               TYPE REF TO cl_abap_structdescr,

  lv_field_key             TYPE abap_compname,
  lv_field_val             TYPE abap_compname.

  FIELD-SYMBOLS:

  <lv_key_fld>             TYPE any.


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* SET Flags parameters Key
*=======================================================================

  IF is_keyatt IS NOT INITIAL.
    ls_keyatt = is_keyatt.
  ELSE.
    READ TABLE me->gt_pkey
      INTO ls_pkey
      WITH KEY keynam = iv_keynam.
    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE zcx_ewm_base_db
        EXPORTING
          textid    = zcx_ewm_base_db=>param_get
          gv_keynam = iv_keynam.
    ENDIF.
    MOVE-CORRESPONDING ls_pkey TO ls_keyatt.
  ENDIF.


*=======================================================================
* GET Field Names of Structures
*=======================================================================

  lo_typedesc = cl_abap_structdescr=>describe_by_data( ls_keyatt ).
  lo_str_key ?= lo_typedesc.

  lo_typedesc = cl_abap_structdescr=>describe_by_data( ls_valatt ).
  lo_str_val ?= lo_typedesc.


*=======================================================================
* GET Selected Field Name
*=======================================================================

  LOOP AT lo_str_key->components INTO ls_compkey.
    ASSIGN COMPONENT ls_compkey-name
        OF STRUCTURE ls_keyatt
        TO <lv_key_fld>.
    IF <lv_key_fld> EQ abap_true.
      IF lv_field_val IS NOT INITIAL.
        IF iv_ignore_multi EQ abap_false.
          RAISE EXCEPTION TYPE zcx_ewm_base_db
            EXPORTING
              textid    = zcx_ewm_base_db=>param_field_multi
                gv_keynam = iv_keynam.
        ENDIF.
*       Continue
        CONTINUE.
      ENDIF.
      lv_field_key = ls_compkey-name.
      CONCATENATE gc_fieldname_stc lv_field_key+4
          INTO lv_field_val.
      READ TABLE lo_str_val->components
        INTO ls_compval
        WITH KEY name = lv_field_val.
      IF sy-subrc <> 0.
        RAISE EXCEPTION TYPE zcx_ewm_base_db
          EXPORTING
            textid    = zcx_ewm_base_db=>param_field_not_map
            gv_keynam = iv_keynam.
      ENDIF.
    ENDIF.
  ENDLOOP.


*=======================================================================
* OUTPUT
*=======================================================================

  IF lv_field_val IS INITIAL.
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid    = zcx_ewm_base_db=>param_field_not_sel
        gv_keynam = iv_keynam.
  ENDIF.

  MOVE lv_field_val TO ev_fieldname.
















*
ENDMETHOD.


METHOD get_instance.
*----------------------------------------------------------------------*
* Title  MTHD GET_INSTANCE
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Return the memorized parameter instance or if no-one is stored,
* creates a new one
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* GET memorized instance
*=======================================================================

  IF ( sr_param IS BOUND ).
    IF ( sr_param->gv_lgnum = iv_lgnum ).
      rr_param = sr_param.
      RETURN.
    ENDIF.
  ENDIF.


*=======================================================================
* CREATE instance
*=======================================================================

  CREATE OBJECT rr_param
    EXPORTING
      iv_lgnum = iv_lgnum
      iv_enhan = iv_enhan.

  sr_param = rr_param.



















*
ENDMETHOD.


METHOD get_multi.
*----------------------------------------------------------------------*
* Title  MTHD GET_MULTI
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Return all paramter values including all attributes
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

    lt_val                 TYPE zewm_tt_pval,

    ls_val                 TYPE zewm_t_pval,

    lv_enhan               TYPE zewm_de_base_params_keyenh.


*=======================================================================
* Input
*=======================================================================

  REFRESH: et_values.

  lt_val[] = me->gt_val[].


*=======================================================================
* SET filter validation values
*=======================================================================

* .Enhancement relevance
  lv_enhan = me->gv_dflt_enhan.
  IF ( iv_enhan IS NOT INITIAL ).
    lv_enhan = iv_enhan.
  ENDIF.


*=======================================================================
* FILTER parameter values by key name
*=======================================================================

  me->fil_keynam(
    EXPORTING
      iv_keynam = iv_keynam
    CHANGING
      ct_val    = lt_val ).


*=======================================================================
* FILTER parameter values by enhancement relevance
*=======================================================================

  me->fil_enhan(
    EXPORTING
      iv_enhan = lv_enhan
    CHANGING
      ct_val   = lt_val ).


*=======================================================================
* FILTER parameter values by dynamic filter relevance
*=======================================================================
  IF iv_dyn_filter IS NOT INITIAL.
    me->fil_dyn_filter(
      EXPORTING
        iv_dyn_filter = iv_dyn_filter
      CHANGING
        ct_val   = lt_val ).
  ENDIF.

*=======================================================================
* OUTPUT
*=======================================================================

  et_values = lt_val.









*
ENDMETHOD.


METHOD get_multi_range.
*----------------------------------------------------------------------*
* Title  MTHD GET_MULTI_RANGE
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Return all paramter values including all attributes
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lt_val                   TYPE zewm_tt_pval,

  ls_val                   TYPE zewm_t_pval,

  lv_fieldname             TYPE fieldname.


  FIELD-SYMBOLS:

  <lv_field>               TYPE any.

*=======================================================================
* Input
*=======================================================================

  REFRESH ET_RANGE.


*=======================================================================
* GET parameter values
*=======================================================================

  me->get_multi(
    EXPORTING
      iv_enhan          = iv_enhan
      iv_keynam         = iv_keynam
      iv_dyn_filter     = iv_dyn_filter
    IMPORTING
      et_values         = lt_val ).


*=======================================================================
* GET field used on Range
*=======================================================================

  me->get_fieldname(
    EXPORTING
      iv_keynam       = iv_keynam
      is_keyatt       = is_keyatt
      iv_ignore_multi = abap_true
    IMPORTING
      ev_fieldname    = lv_fieldname ).


*=======================================================================
* OUTPUT
*=======================================================================

  LOOP AT lt_val INTO ls_val.
    ASSIGN COMPONENT lv_fieldname
        OF STRUCTURE ls_val
        TO <lv_field>.
    IF <lv_field> IS NOT INITIAL.
      CALL METHOD zcl_ewm_base=>range_append_eq
        EXPORTING
          iv_value   = <lv_field>
          iv_exclude = iv_exclude
        changing
          ct_range   = et_range.
    ENDIF.
  ENDLOOP.

  IF et_range IS INITIAL.
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid    = zcx_ewm_base_db=>param_field_not_data
        gv_keynam = iv_keynam
        gv_fieldn = lv_fieldname.
  ENDIF.













*
ENDMETHOD.


METHOD get_singleton.
*----------------------------------------------------------------------*
* Title  MTHD GET_SINGLETON
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Returns the active instance
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* CREATE instance
*=======================================================================

  IF ( sr_param IS NOT BOUND ).
    RETURN.
  ENDIF.


*=======================================================================
* Output
*=======================================================================

  rr_singleton = sr_param.







*
ENDMETHOD.


METHOD get_value.
*----------------------------------------------------------------------*
* Title  MTHD GET_VALUE
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Determine a single paramter value and return single attributes
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lt_values                TYPE zewm_tt_pval,

  ls_value                 TYPE zewm_t_pval,

  lv_enhan                 TYPE zewm_de_base_params_keyenh,
  lv_fieldname             TYPE fieldname.


  FIELD-SYMBOLS:

  <lv_field>               TYPE any.


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* SET filter validation values
*=======================================================================

* .Enhancement relevance
  lv_enhan = me->gv_dflt_enhan.
  IF ( iv_enhan IS NOT INITIAL ).
    lv_enhan = iv_enhan.
  ENDIF.


*=======================================================================
* GET parameter values
*=======================================================================

  me->get_multi(
    EXPORTING
      iv_enhan          = lv_enhan
      iv_keynam         = iv_keynam
      iv_dyn_filter     = iv_dyn_filter
    IMPORTING
      et_values         = lt_values ).


*=======================================================================
* GET field used on Range
*=======================================================================

  me->get_fieldname(
    EXPORTING
      iv_keynam       = iv_keynam
      is_keyatt       = is_keyatt
      iv_ignore_multi = abap_true
    IMPORTING
      ev_fieldname    = lv_fieldname ).


*=======================================================================
* OUTPUT
*=======================================================================

  IF ( lines( lt_values ) = 0 ).
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid    = zcx_ewm_base_db=>param_get
        gv_keynam = iv_keynam.
  ELSEIF ( lines( lt_values ) > 1 ).
    IF ( iv_ignore_multi = abap_false ).
      RAISE EXCEPTION TYPE zcx_ewm_base_db
        EXPORTING
          textid    = zcx_ewm_base_db=>param_get_not_unique
          gv_keynam = iv_keynam.
    ENDIF.
  ENDIF.

  READ TABLE lt_values INTO ls_value
    INDEX 1.
  ASSERT sy-subrc = 0.

  ASSIGN COMPONENT lv_fieldname
      OF STRUCTURE ls_value
      TO <lv_field>.

  MOVE <lv_field> TO ev_value.










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
* Read all parameter definitions, settings and assignments
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================


*=======================================================================
* Input
*=======================================================================

  REFRESH: et_val, et_enhan, et_pkey.


*=======================================================================
* READ parameter Headers
*=======================================================================

  SELECT *
    INTO TABLE et_pkey
    FROM zewm_t_pkey.
  IF ( sy-subrc <> 0 ).                                     "#EC NEEDED
  ENDIF.


*=======================================================================
* READ Parameter keys on Warehouse
*=======================================================================

  SELECT *
    INTO TABLE et_pwhse
    FROM zewm_t_pkeyt300
    WHERE lgnum  = iv_lgnum.
  IF ( sy-subrc <> 0 ).                                     "#EC NEEDED
  ENDIF.


*=======================================================================
* READ parameter values
*=======================================================================

  SELECT *
    INTO TABLE et_val
    FROM zewm_t_pval
    WHERE lgnum  = iv_lgnum.
  IF ( sy-subrc <> 0 ).                                     "#EC NEEDED
  ENDIF.
  SORT et_val BY lgnum keynam keynum.


*=======================================================================
* READ enhancement relevance
*=======================================================================

  IF ( lines( et_val ) > 0 ).
*   .Enhancement
    SELECT *
      INTO TABLE et_enhan
      FROM zewm_t_pkeyenh
      FOR  ALL ENTRIES IN et_val
      WHERE lgnum  = iv_lgnum
        AND keynam = et_val-keynam
        AND keynum = et_val-keynum.
    IF ( sy-subrc <> 0 ).                                   "#EC NEEDED
    ENDIF.
*   .Dynamic Filter
    SELECT *
      INTO TABLE et_filenh
      FROM zewm_t_pkfilenh
      FOR  ALL ENTRIES IN et_val
      WHERE lgnum  = iv_lgnum
        AND keynam = et_val-keynam
        AND keynum = et_val-keynum.
    IF ( sy-subrc <> 0 ).                                   "#EC NEEDED
    ENDIF.
  ENDIF.
















*
ENDMETHOD.
ENDCLASS.
