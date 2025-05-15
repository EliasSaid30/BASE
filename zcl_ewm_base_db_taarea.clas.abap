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
class ZCL_EWM_BASE_DB_TAAREA definition
  public
  final
  create public .

public section.

  class-methods GET_BIN_TAAREA_TA
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_ACT_TYPE type /SCWM/DE_ACTTY
      !IV_AAREA type /SCWM/DE_AAREA
      !IV_START type XFELD optional
      !IV_END type XFELD optional
      !IV_CLF type XFELD optional
    exporting
      !ES_LAGP_START type /SCWM/LAGP
      !ES_LAGP_END type /SCWM/LAGP
      !ES_LAGP_CLF type /SCWM/LAGP .
  class-methods READ_TAAREA_TA
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_ACT_TYPE type /SCWM/DE_ACTTY
      !IV_AAREA type /SCWM/DE_AAREA
    exporting
      !ES_TAAREA_TA type /SCWM/TAAREA_TA .
protected section.
private section.
ENDCLASS.



CLASS ZCL_EWM_BASE_DB_TAAREA IMPLEMENTATION.


method GET_BIN_TAAREA_TA.
*----------------------------------------------------------------------*
* Title MTHD READ_TAAREA_TA
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Company:  PROLOGIC
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* GET BIN data from additional Attributes to AA
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  ls_taarea_ta             TYPE /scwm/taarea_ta,
  ls_lagp                  TYPE /scwm/lagp,

  lv_index                 TYPE syst_index,
  lv_lgpla                 TYPE /scwm/de_lgpla.


*=======================================================================
* Input
*=======================================================================

  CHECK iv_start IS NOT INITIAL OR
        iv_end   IS NOT INITIAL OR
        iv_clf   IS NOT INITIAL.


  CLEAR: es_lagp_start,
         es_lagp_end,
         es_lagp_clf.


*=======================================================================
* READ TAAREA_TA
*=======================================================================

  zcl_ewm_base_db_taarea=>read_taarea_ta(
    EXPORTING
      iv_lgnum     = iv_lgnum
      iv_act_type  = iv_act_type
      iv_aarea     = iv_aarea
    IMPORTING
      es_taarea_ta = ls_taarea_ta ).

  IF ls_taarea_ta IS INITIAL.
*  RAISE ERROR
  ENDIF.


*=======================================================================
* READ Storage bin Data
*=======================================================================

  DO 3 TIMES.
    lv_index = sy-index.

    CLEAR: lv_lgpla,
           ls_lagp.

    CASE lv_index.
      WHEN 1.
        CHECK iv_start IS NOT INITIAL.
        lv_lgpla = ls_taarea_ta-start_point.
      WHEN 2.
        CHECK iv_end IS NOT INITIAL.
        lv_lgpla = ls_taarea_ta-end_point.
      WHEN 3.
        CHECK iv_clf IS NOT INITIAL.
        lv_lgpla = ls_taarea_ta-clf_bin.
    ENDCASE.

    CHECK lv_lgpla IS NOT INITIAL.

    CALL FUNCTION '/SCWM/LAGP_READ_SINGLE'
      EXPORTING
        iv_lgnum      = iv_lgnum
        iv_lgpla      = lv_lgpla
      IMPORTING
        es_lagp       = ls_lagp
      EXCEPTIONS
        wrong_input   = 1
        not_found     = 2
        enqueue_error = 3
        OTHERS        = 4.

    CHECK sy-subrc = 0.

    CASE lv_index.
      WHEN 1.
        es_lagp_start = ls_lagp.
      WHEN 2.
        es_lagp_end   = ls_lagp.
      WHEN 3.
        es_lagp_clf   = ls_lagp.
    ENDCASE.

  ENDDO.












*
endmethod.


method READ_TAAREA_TA.
*----------------------------------------------------------------------*
* Title MTHD READ_TAAREA_TA
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Company:  PROLOGIC
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* Read Additional Attributes to Activity Area
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================


*=======================================================================
* Input
*=======================================================================

  CLEAR: es_taarea_ta.


*=======================================================================
* READ from DB
*=======================================================================

  CALL FUNCTION '/SCWM/TAAREA_TA_READ'
    EXPORTING
      iv_lgnum     = iv_lgnum
      iv_act_type  = iv_act_type
      iv_aarea     = iv_aarea
    IMPORTING
      es_taarea_ta = es_taarea_ta
    EXCEPTIONS
      wrong_input  = 1
      OTHERS       = 2.











*
endmethod.
ENDCLASS.
