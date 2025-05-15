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
class ZCL_EWM_BASE_DB_PMAT definition
  public
  final
  create public .

public section.

  class-methods GET_RANGE_PMAT
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_PMAT type /SCWM/DE_PMAT
      !IV_PMATID type /SCWM/DE_MATID
    exporting
      !ES_NRIV type NRIV
    raising
      ZCX_EWM_BASE_DB .
protected section.
private section.

  class-data ST_HUNR type /SCWM/TT_THUNR .
  class-data ST_NRIV type NRIV_TT .

  class-methods HUNR_READ
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_PMTYP type /SCWM/DE_PMTYP
    exporting
      !EV_INT_NR type /SCWM/VV_INT_NKR
    raising
      ZCX_EWM_BASE_DB .
  class-methods HUNRIV_READ
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_INT_NR type /SCWM/VV_INT_NKR
    exporting
      !ES_NRIV type NRIV
    raising
      ZCX_EWM_BASE_DB .
ENDCLASS.



CLASS ZCL_EWM_BASE_DB_PMAT IMPLEMENTATION.


method GET_RANGE_PMAT.
*----------------------------------------------------------------------*
* Title  GET_RANGE_PMAT
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Company:  PROLOGIC
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* GET range from Packing Material
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  ls_matpack               TYPE /SAPAPO/MATPACK_STR,

  lv_matid                 TYPE /SAPAPO/MATID,
  lv_int_nr                TYPE /SCWM/VV_INT_NKR.

*=======================================================================
* Input
*=======================================================================

  CHECK iv_pmatid   IS NOT INITIAL OR
        iv_pmat     IS NOT INITIAL.

  CLEAR: es_nriv.

*=======================================================================
* GET Packing Material Type
*=======================================================================

*  TRY.
  IF iv_pmatid   IS INITIAL.
    CALL METHOD ZCL_EWM_BASE_DB_PRODUCT=>GET_MATID_BY_MATNR
      EXPORTING
        IV_MDLAPPL = zwmgc_appl_ewm
        IV_MATNR   = iv_pmat
      IMPORTING
        EV_MATID22 = lv_matid.
  ELSE.
    CALL FUNCTION '/SCMB/MDL_GUID_CONVERT'
      EXPORTING
        IV_GUID16       = iv_pmatid
*       IV_GUID22       =
      IMPORTING
*       EV_GUID16       =
        EV_GUID22       = lv_matid
              .

  ENDIF.

  CHECK lv_matid   IS NOT INITIAL.


  CALL METHOD ZCL_EWM_BASE_DB_PRODUCT=>GET_MATPACK_BY_MATID
    EXPORTING
      IV_MATID22 = lv_matid
    IMPORTING
      ES_MATPACK = ls_matpack.


*   CATCH ZCX_EWM_BASE_DB .
*  ENDTRY.


*=======================================================================
* GET Range Number Assigned
*=======================================================================

  CALL METHOD ZCL_EWM_BASE_DB_PMAT=>HUNR_READ
    EXPORTING
      IV_LGNUM  = iv_lgnum
      IV_PMTYP  = ls_matpack-pmtyp
    IMPORTING
      EV_INT_NR = lv_int_nr.


  CALL METHOD ZCL_EWM_BASE_DB_PMAT=>HUNRIV_READ
    EXPORTING
      IV_LGNUM  = iv_lgnum
      IV_INT_NR = lv_int_nr
    IMPORTING
      ES_NRIV   = ES_NRIV.












*
endmethod.


method HUNRIV_READ.
*----------------------------------------------------------------------*
* Title  HUNRIV_READ
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Company:  PROLOGIC
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* Read Range Number Assigned to Packing Material Type
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================
  DATA:

  ls_nriv                  TYPE nriv,

  lv_txt                   TYPE string.


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* GET Range Number
*=======================================================================

  READ TABLE st_nriv INTO ls_nriv WITH KEY NRRANGENR = iv_int_nr
                                  BINARY SEARCH.
  IF NOT sy-subrc IS INITIAL.
    CALL FUNCTION 'NUMBER_GET_INFO'
      EXPORTING
        NR_RANGE_NR              = iv_int_nr
        OBJECT                   = zwmgc_huid
        SUBOBJECT                = iv_lgnum
      IMPORTING
        INTERVAL                 = ls_nriv
      EXCEPTIONS
        INTERVAL_NOT_FOUND       = 1
        OBJECT_NOT_FOUND         = 2
        OTHERS                   = 3.
    CASE sy-subrc.
      WHEN 0.
        INSERT ls_nriv INTO TABLE st_nriv.
      WHEN 1.
        MESSAGE e044(/scwm/hu_wm) WITH iv_int_nr INTO lv_txt.
        RAISE EXCEPTION TYPE zcx_ewm_base_db.
      WHEN OTHERS.
        MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
                WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4
                INTO lv_txt.
        RAISE EXCEPTION TYPE zcx_ewm_base_db.
    ENDCASE.
  ENDIF.


*=======================================================================
* RETURNING
*=======================================================================

  es_nriv = ls_nriv.









*
endmethod.


method HUNR_READ.
*----------------------------------------------------------------------*
* Title  HUNR_READ
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Company:  PROLOGIC
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* Read Range Number Assigned to Packing Material Type
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================
  DATA:

  ls_hunr                  TYPE /scwm/thunr,

  lv_txt                   TYPE string.


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* GET Range Number
*=======================================================================

  READ TABLE st_hunr INTO ls_hunr WITH KEY lgnum = iv_lgnum
                                           pmtyp = iv_pmtyp
                                  BINARY SEARCH.
  IF NOT sy-subrc IS INITIAL.
    SELECT * FROM /scwm/thunr APPENDING TABLE st_hunr
                              WHERE lgnum = iv_lgnum AND
                                    pmtyp = iv_pmtyp
                              ORDER BY PRIMARY KEY.
    IF sy-subrc IS INITIAL.
      READ TABLE st_hunr INTO ls_hunr WITH KEY lgnum = iv_lgnum
                                               pmtyp = iv_pmtyp
                                      BINARY SEARCH.
    ENDIF.
    IF NOT sy-subrc IS INITIAL.
      MESSAGE e036(/scwm/hufunctions) WITH iv_pmtyp INTO lv_txt.
      RAISE EXCEPTION TYPE zcx_ewm_base_db.
    ENDIF.
  ENDIF.


*=======================================================================
* RETURNING
*=======================================================================

  ev_int_nr = ls_hunr-int_nr.










*
endmethod.
ENDCLASS.
