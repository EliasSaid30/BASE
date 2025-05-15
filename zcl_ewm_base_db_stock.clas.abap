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
class ZCL_EWM_BASE_DB_STOCK definition
  public
  final
  create public .

public section.

  class-methods GET_PHYSICAL_STOCK
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IT_MATID type /SCWM/TT_MATID
      !IT_LGTYP_R type RSELOPTION optional
      !IT_LGPLA_R type RSELOPTION optional
      !IT_RSRC_R type RSELOPTION optional
    exporting
      !ET_STOCK type /SCWM/TT_STOCK_SELECT
      !ET_BAPIRET type BAPIRET2_T .
  class-methods GET_AVAILABLE_STOCK
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IT_MATID_R type RSELOPTION
      !IT_LGTYP_R type RSELOPTION optional
      !IT_LGPLA_R type RSELOPTION optional
      !IT_RSRC_R type RSELOPTION optional
    exporting
      !ET_BAPIRET type BAPIRET2_T
      !ET_AQUA type /SCWM/TT_AQUA .
protected section.
private section.
ENDCLASS.



CLASS ZCL_EWM_BASE_DB_STOCK IMPLEMENTATION.


METHOD GET_AVAILABLE_STOCK.
*----------------------------------------------------------------------*
* Title  Method GET_AVAILABLE_STOCK
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author : David Nava
*----------------------------------------------------------------------*
* Program description:
* GET Available Stock per Storage Type or Storage Bin (list) and product
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  ls_bapiret               TYPE bapiret2.


*=======================================================================
* Input
*=======================================================================

  CHECK iv_lgnum   IS NOT INITIAL AND
        it_matid_r IS NOT INITIAL.


*=======================================================================
* GET Storage Type Master Data of Product
*=======================================================================

  CALL FUNCTION '/SCWM/AQUA_SELECT'
    EXPORTING
      iv_lgnum               = iv_lgnum
      IR_LGTYP               = it_lgtyp_r
      ir_lgpla               = it_lgpla_r
      IR_MATID               = it_matid_r
      IR_RSRC                = it_rsrc_r
    IMPORTING
      ET_AQUA                = et_aqua
    EXCEPTIONS
      WRONG_INPUT            = 1
      OTHERS                 = 2.
  IF sy-subrc <> 0.
    ls_bapiret-id          = sy-msgid.
    ls_bapiret-type        = /scwm/cl_dm_message_no=>sc_msgty_info.
    ls_bapiret-number      = sy-msgno.
    ls_bapiret-message_v1  = sy-msgv1.
    ls_bapiret-message_v2  = sy-msgv2.
    ls_bapiret-message_v3  = sy-msgv3.
    ls_bapiret-message_v4  = sy-msgv4.
    APPEND ls_bapiret TO et_bapiret.
  ENDIF.


















*
endmethod.


METHOD GET_PHYSICAL_STOCK.
*----------------------------------------------------------------------*
* Title  Method GET_PHYSICAL_STOCK
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author : David Nava
*----------------------------------------------------------------------*
* Program description:
* GET Physical Stock per Storage Type (list) and product
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  ls_bapiret               TYPE bapiret2.


*=======================================================================
* Input
*=======================================================================

  CHECK iv_lgnum IS NOT INITIAL AND
        it_matid IS NOT INITIAL.


*=======================================================================
* GET Physical Stock
*=======================================================================

  CALL FUNCTION '/SCWM/SELECT_STOCK'
    EXPORTING
      iv_lgnum               = iv_lgnum
      it_matid               = it_matid
      ir_lgpla               = it_lgpla_r
      ir_lgtyp               = it_lgtyp_r
    IMPORTING
      et_huitm               = et_stock
    EXCEPTIONS
      error                  = 1
      OTHERS                 = 2.

  IF sy-subrc <> 0.
    ls_bapiret-id          = sy-msgid.
    ls_bapiret-type        = /scwm/cl_dm_message_no=>sc_msgty_info.
    ls_bapiret-number      = sy-msgno.
    ls_bapiret-message_v1  = sy-msgv1.
    ls_bapiret-message_v2  = sy-msgv2.
    ls_bapiret-message_v3  = sy-msgv3.
    ls_bapiret-message_v4  = sy-msgv4.
    APPEND ls_bapiret TO et_bapiret.
  ENDIF.










*
endmethod.
ENDCLASS.
