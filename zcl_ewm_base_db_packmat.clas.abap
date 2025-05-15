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
class ZCL_EWM_BASE_DB_PACKMAT definition
  public
  final
  create public .

public section.

  class-methods READ_SINGLE_PACKMAT
    importing
      !IV_MATNR type /SAPAPO/MATNR optional
      !IV_MATID type /SAPAPO/MATID optional
    returning
      value(RS_MATPACK) type /SAPAPO/MATPACK .
protected section.
private section.
ENDCLASS.



CLASS ZCL_EWM_BASE_DB_PACKMAT IMPLEMENTATION.


METHOD read_single_packmat.
*----------------------------------------------------------------------*
* Title  MTHD ZCL_EWM_BASE_DB_PACKMAT-READ_SINGLE_PACKMAT
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : Alaedhin Díaz
*----------------------------------------------------------------------*
* Program description:
* Read Single PackMat data
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:
    ls_matpack            TYPE /sapapo/matpack,

    lv_matid              TYPE /sapapo/matid.

  IF iv_matnr IS INITIAL
    AND iv_matid IS INITIAL.
    RETURN.
  ENDIF.


*=======================================================================
* Process
*=======================================================================

  IF iv_matnr IS SUPPLIED.

    " .Convert MATNR into MATID format
    TRY.
      CALL METHOD zcl_ewm_base_db_product=>get_matid_by_matnr
        EXPORTING
          iv_mdlappl = wmegc_mdl_appl_comp
          iv_matnr   = iv_matnr
        IMPORTING
          ev_matid22 = lv_matid.
      CATCH zcx_ewm_base_db.
        RETURN.
    ENDTRY.

*    CALL FUNCTION 'CONVERSION_EXIT_PRODU_INPUT'
*      EXPORTING
*        input        = iv_matnr
*      IMPORTING
*        output       = lv_matid
*      EXCEPTIONS
*        length_error = 1
*        OTHERS       = 2.
*
*    IF sy-subrc <> 0.
*      RETURN.
*    ENDIF.

  ENDIF.

  IF iv_matid IS SUPPLIED.
    lv_matid = iv_matid.
  ENDIF.

*=======================================================================
* Read DB data
*=======================================================================

  SELECT SINGLE *
  INTO CORRESPONDING FIELDS OF ls_matpack
  FROM /sapapo/matpack
  WHERE matid = lv_matid.

  IF sy-subrc NE 0.
    RETURN.
  ENDIF.


*=======================================================================
* Output
*=======================================================================

  IF ls_matpack IS NOT INITIAL.
    rs_matpack = ls_matpack.
  ENDIF.












*
ENDMETHOD.
ENDCLASS.
