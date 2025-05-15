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
class ZCL_EWM_BASE_DB_PRODUCT definition
  public
  final
  create public .

public section.

  class-methods GET_MATID_BY_MATNR
    importing
      !IV_MDLAPPL type /SCMB/MDL_APPL_COMPONENT
      !IV_MATNR type /SAPAPO/MATNR
    exporting
      !EV_MATID22 type /SAPAPO/MATID
      !EV_MATID16 type /SCWM/DE_MATID
    raising
      ZCX_EWM_BASE_DB .
  class-methods GET_MATPACK_BY_MATID
    importing
      !IV_MATID22 type /SAPAPO/MATID
    exporting
      !ES_MATPACK type /SAPAPO/MATPACK_STR
    raising
      ZCX_EWM_BASE_DB .
  class-methods GET_MATNR_BY_MATID
    importing
      !IV_MDLAPPL type /SCMB/MDL_APPL_COMPONENT default WMEGC_MDL_APPL_COMP
      !IV_MATID16 type /SCWM/DE_MATID optional
      !IV_MATID22 type /SAPAPO/MATID optional
    returning
      value(RV_MATNR) type /SAPAPO/MATNR
    raising
      ZCX_EWM_BASE_DB .
  class-methods GET_MATXT
    importing
      !IV_LANGU type SYLANGU
      !IV_MATID22 type /SAPAPO/MATID optional
      !IV_MATID16 type /SCWM/DE_MATID optional
    returning
      value(RV_MAKTX) type /SAPAPO/MAKTX
    raising
      ZCX_EWM_BASE_DB .
  class-methods GET_MATXT_MULTI
    importing
      !IV_LANGU type SYLANGU
      !IT_MATID type /SAPAPO/DM_MATID_TAB
    returning
      value(RT_MATXT) type /SAPAPO/MATTXT_TAB
    raising
      ZCX_EWM_BASE_DB .
  class-methods GET_MATMAP_MULTI
    importing
      !IT_MATID_R type /SAPAPO/RTAB_MATID
    exporting
      !ET_MATMAP type BAPI10001PRDMAPTAB
    raising
      ZCX_EWM_BASE_DB .
protected section.
private section.
ENDCLASS.



CLASS ZCL_EWM_BASE_DB_PRODUCT IMPLEMENTATION.


METHOD GET_MATID_BY_MATNR.
*----------------------------------------------------------------------*
* Title MTHD GET_MATID_BY_MATNR
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Company:  PROLOGIC
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* Determine the GUID of the product
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lr_cx_mdl                TYPE REF TO /scmb/cx_mdl,

  ls_key                   TYPE /scmb/mdl_matnr_str,
  ls_data                  TYPE /scmb/mdl_product_key_str.


*=======================================================================
* Input
*=======================================================================

  ls_key-matnr = iv_matnr.


*=======================================================================
* READ guid
*=======================================================================

  TRY.
      CALL FUNCTION '/SCMB/MDL_PRODUCT_GET'
        EXPORTING
          iv_appl_component   = iv_mdlappl
          is_key              = ls_key
          iv_bypassing_buffer = abap_false
          iv_no_raw16         = abap_false
          iv_get_only_id      = abap_true
        IMPORTING
          es_data             = ls_data.
    CATCH /scmb/cx_mdl INTO lr_cx_mdl.
      RAISE EXCEPTION TYPE zcx_ewm_base_db
        EXPORTING
          previous = lr_cx_mdl
          textid   = zcx_ewm_base_db=>product_get_matid_by_matnr
          gv_matnr = iv_matnr.
  ENDTRY.

  IF ( ls_data IS INITIAL ).
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid   = zcx_ewm_base_db=>product_get_matid_by_matnr
        gv_matnr = iv_matnr.
  ENDIF.


*=======================================================================
* OUTPUT
*=======================================================================

  CALL FUNCTION '/SAPAPO/CIF_GUID_CONVERT'
    EXPORTING
      iv_guid_c32      = ls_data-matid
    IMPORTING
      ev_guid_x16      = ev_matid16
      ev_guid_c22      = ev_matid22
    EXCEPTIONS
      parameters_error = 1
      OTHERS           = 2.

  ASSERT sy-subrc = 0.












*
ENDMETHOD.


METHOD get_matmap_multi.
*----------------------------------------------------------------------*
* Title  MTHD GET_MATMAP_MULTI
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* GET Mapping information for material
*----------------------------------------------------------------------*
*======================================================================
* Declaration/Initialization
*======================================================================


*======================================================================
* Input
*======================================================================
  CLEAR: et_matmap.


*======================================================================
* GET Information from DB
*======================================================================
  SELECT *
    INTO TABLE et_matmap
    FROM /sapapo/matmap
    WHERE matid IN it_matid_r.
  IF sy-subrc <> 0.                                        "#EC_NEEDED
  ENDIF.










*
ENDMETHOD.


METHOD get_matnr_by_matid.
*----------------------------------------------------------------------*
* Title MTHD GET_MATNR_BY_MATID
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Company:  PROLOGIC
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* Determine the product number to the GUID
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lr_cx_mdl                TYPE REF TO /scmb/cx_mdl,

  ls_data                  TYPE /scmb/mdl_product_key_str,

  lv_matid                 TYPE /scmb/mdl_matid.


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* READ product number
*=======================================================================

  lv_matid = iv_matid16.
  IF ( iv_matid22 IS NOT INITIAL ).
    CALL FUNCTION '/SCMB/MDL_GUID_CONVERT'
      EXPORTING
        iv_guid22 = iv_matid22
      IMPORTING
        ev_guid16 = lv_matid.
  ENDIF.

  TRY.
      CALL FUNCTION '/SCMB/MDL_PRODUCT_GET'
        EXPORTING
          iv_appl_component   = iv_mdlappl
          iv_id               = lv_matid
          iv_language         = sy-langu
          iv_bypassing_buffer = abap_false
          iv_no_raw16         = abap_false
          iv_get_only_id      = abap_false
        IMPORTING
          es_data             = ls_data.
    CATCH /scmb/cx_mdl INTO lr_cx_mdl.
      RAISE EXCEPTION TYPE zcx_ewm_base_db
        EXPORTING
          previous     = lr_cx_mdl
          textid       = zcx_ewm_base_db=>product_get_matnr_by_matid
          gv_matid_mdl = lv_matid.
  ENDTRY.


*=======================================================================
* OUTPUT
*=======================================================================

  rv_matnr = ls_data-matnr.












*
ENDMETHOD.


METHOD get_matpack_by_matid.
*----------------------------------------------------------------------*
* Title GET_MATPACK_BY_MATID
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Company:  PROLOGIC
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* Get packaging data of a product
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:
    lt_matid        TYPE /sapapo/pr_set_matpack,
    lt_matpack      TYPE /sapapo/matpack_tab.

*=======================================================================
* Input
*=======================================================================


*=======================================================================
* Get packaging data
*=======================================================================

  APPEND iv_matid22 TO lt_matid.

  CALL FUNCTION '/SAPAPO/DM_MATPACK_GET'
    EXPORTING
      it_sel_matpack = lt_matid
    IMPORTING
      et_db_matpack  = lt_matpack.

  READ TABLE lt_matpack
       INTO es_matpack
       WITH KEY matid = iv_matid22.

  IF sy-subrc <> 0.
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid = zcx_ewm_base_db=>get_matpack_by_matid.
  ENDIF.










*


*
ENDMETHOD.


METHOD get_matxt.
*----------------------------------------------------------------------*
* Title  MTHD GET_MATXT
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Company:  PROLOGIC
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* Return material description
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lt_matid                 TYPE /SAPAPO/DM_MATID_TAB, "/sapapo/dm_material_str_tab,
  lt_matxt                 TYPE /sapapo/mattxt_tab,

  ls_matid                 TYPE /sapapo/dm_material_str,
  ls_matxt                 TYPE /sapapo/mattxt_str.


*=======================================================================
* Input
*=======================================================================

  ls_matid-matid = iv_matid22.
  IF ( ls_matid-matid IS INITIAL ).
    CALL FUNCTION '/SCMB/MDL_GUID_CONVERT'
      EXPORTING
        iv_guid16 = iv_matid16
      IMPORTING
        ev_guid22 = ls_matid-matid.
  ENDIF.
  ASSERT ls_matid-matid IS NOT INITIAL.

  APPEND ls_matid TO lt_matid.


*=======================================================================
* GET material description
*=======================================================================

  lt_matxt = get_matxt_multi( iv_langu = iv_langu
                              it_matid = lt_matid ).

  READ TABLE lt_matxt INTO ls_matxt
    INDEX 1.
  IF ( sy-subrc = 0 ).
    rv_maktx = ls_matxt-maktx.
  ENDIF.









*
ENDMETHOD.


METHOD get_matxt_multi.
*----------------------------------------------------------------------*
* Title  MTHD GET_MATXT_MULTI
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Company:  PROLOGIC
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* Return material description(s) from buffer or read them from the
* database
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* GET material descriptions
*=======================================================================

  CALL FUNCTION '/SAPAPO/DM_MATERIAL_GET'
    EXPORTING
      iv_langu           = iv_langu
    TABLES
      i_matid_tab        = it_matid
      e_mattxt_tab       = rt_matxt
    EXCEPTIONS
      material_not_found = 1
      OTHERS             = 2.

  IF ( sy-subrc <> 0 ).                                     "#EC NEEDED
  ENDIF.










*
ENDMETHOD.
ENDCLASS.
