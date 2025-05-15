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
class ZCL_EWM_BASE_LOGSYS definition
  public
  final
  create public .

public section.

  methods CONSTRUCTOR
    importing
      !IV_MANDT type MANDT .
  class-methods GET_INSTANCE
    importing
      !IV_MANDT type MANDT
    returning
      value(RR_T000) type ref to ZCL_EWM_BASE_LOGSYS .
  methods GET_LOGSYS_VALUE
    importing
      !IV_MANDT type MANDT
    exporting
      !EV_LOGSYS type T000-LOGSYS
    raising
      ZCX_EWM_BASE_DB .
protected section.
private section.

  data GV_MANDT type MANDT .
  data GT_T000 type SFW_T000 .
  class-data SR_T000 type ref to ZCL_EWM_BASE_LOGSYS .

  methods READ
    importing
      !IV_MANDT type MANDT
    exporting
      !ET_T000 type SFW_T000 .
ENDCLASS.



CLASS ZCL_EWM_BASE_LOGSYS IMPLEMENTATION.


METHOD constructor.
*----------------------------------------------------------------------*
* Title MTHD CONSTRUCTOR
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : Luis Arcega
*----------------------------------------------------------------------*
* Program description:
* Constructor to Read LOG Syst. Data
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
  me->gv_mandt = iv_mandt.



*=======================================================================
* READ parameter definition, settings and values
*=======================================================================

  me->read(
    EXPORTING
      iv_mandt   = iv_mandt
    IMPORTING
      et_t000     = me->gt_t000
 ).




















*
ENDMETHOD.


METHOD get_instance.
*----------------------------------------------------------------------*
* Title  MTHD GET_INSTANCE
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : Luis Arcega
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

  IF ( sr_t000 IS BOUND ).
    IF ( sr_t000->gv_mandt = iv_mandt ).
      rr_t000 = sr_t000.
      RETURN.
    ENDIF.
  ENDIF.


*=======================================================================
* CREATE instance
*=======================================================================

  CREATE OBJECT rr_t000
    EXPORTING
      iv_mandt = iv_mandt.

  sr_t000 = rr_t000.



















*
ENDMETHOD.


  METHOD get_logsys_value.
*----------------------------------------------------------------------*
* Title  MTHD GET_LOGSYS_VALUE
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : Luis Arcega
*----------------------------------------------------------------------*
* Program description:
* Determine a single paramter value and return single attributes
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

    DATA:

      lt_values    TYPE  sfw_t000,

      ls_value     TYPE t000,

      lv_mandt     TYPE mandt,
      lv_fieldname TYPE fieldname VALUE 'LOGSYS'.


    FIELD-SYMBOLS:

    <lv_field>               TYPE any.


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* SET filter validation values
*=======================================================================

    lv_mandt = iv_mandt.

* .Read whole Data
    me->read(
    EXPORTING
      iv_mandt = lv_mandt
    IMPORTING
      et_t000 = lt_values ).

    READ TABLE lt_values INTO ls_value
      INDEX 1.
    ASSERT sy-subrc = 0.

    ASSIGN COMPONENT lv_fieldname
        OF STRUCTURE ls_value
        TO <lv_field>.

    MOVE <lv_field> TO ev_logsys.










*
  ENDMETHOD.


METHOD read.
*----------------------------------------------------------------------*
* Title  MTHD READ
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : Luis Arcega
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

  REFRESH: et_t000.


*=======================================================================
* READ parameter Headers
*=======================================================================

  SELECT *
    INTO TABLE et_t000
    FROM T000
    WHERE mandt = iv_mandt.
  IF ( sy-subrc <> 0 ).                                     "#EC NEEDED
  ENDIF.



















*
ENDMETHOD.
ENDCLASS.
