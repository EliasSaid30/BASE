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
class ZCL_EWM_BASE definition
  public
  final
  create public .

public section.

  class-methods GET_TM_INSTANCE
    returning
      value(RR_TM) type ref to /SCWM/CL_TM .
  class-methods RANGE_APPEND_EQ
    importing
      !IV_VALUE type SIMPLE
      !IV_EXCLUDE type XFELD optional
    changing
      !CT_RANGE type INDEX TABLE .
  class-methods RANGE_CONVERT
    importing
      !IT_RANGE type INDEX TABLE
    exporting
      !ET_RANGE type INDEX TABLE .
  class-methods REGISTER_CLEANUP
    importing
      !IR_APPLICATION type ref to /SCWM/IF_TM_APPL
      !IV_SEQNO type I optional .
  class-methods RANGE_APPEND_BT
    importing
      !IV_VALUE_L type SIMPLE
      !IV_VALUE_H type SIMPLE
      !IV_EXCLUDE type XFELD optional
    changing
      !CT_RANGE type INDEX TABLE .
  class-methods RANGE_APPEND_CP
    importing
      !IV_VALUE type SIMPLE
      !IV_EXCLUDE type XFELD optional
    changing
      !CT_RANGE type INDEX TABLE .
protected section.
private section.
ENDCLASS.



CLASS ZCL_EWM_BASE IMPLEMENTATION.


METHOD get_tm_instance.
*----------------------------------------------------------------------*
* Title  MTHD GET_TM_INSTANCE
* Copyright (c) 2024 ProLogic LA. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author : David Nava
*----------------------------------------------------------------------*
* Program description:
* Returns the active Transaction Manager
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* GET Transaction Manager
*=======================================================================

  TRY.
      rr_tm ?= /scwm/cl_tm_factory=>get_service(
                  iv_service = /scwm/cl_tm_factory=>sc_manager ).
    CATCH /scwm/cx_tm_factory.
      ASSERT ID /scwm/tm_trace CONDITION 1 = 0.
  ENDTRY.










*
ENDMETHOD.


METHOD RANGE_APPEND_BT.
*----------------------------------------------------------------------*
* Title  RANGE_APPEND_EQ
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author : David Nava
*----------------------------------------------------------------------*
* Program description:
* ADD 'BT' value to a range table
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  FIELD-SYMBOLS:

  <ls_range>               TYPE any,
  <lv_sign>                TYPE any.


  DATA:

  lv_tabix                 TYPE sytabix.


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* ADD 'EQ' value to a range table
*=======================================================================

  CALL FUNCTION '/SCTM/APPEND_RANGE'
    EXPORTING
      iv_value_low            = iv_value_l
      iv_value_high           = iv_value_h
      iv_option               = wmegc_option_bt
    CHANGING
      ct_range                = ct_range
    EXCEPTIONS
      invalid_range_structure = 1
      OTHERS                  = 2.

  IF ( sy-subrc <> 0 ).
    ASSERT 1 = 0.
  ENDIF.

  IF ( iv_exclude = abap_true ).
    lv_tabix = lines( ct_range ).
    READ TABLE ct_range ASSIGNING <ls_range>
      INDEX lv_tabix.
    ASSERT sy-subrc = 0.
    ASSIGN COMPONENT zwmgc_field_sign OF STRUCTURE <ls_range> TO <lv_sign>.
    <lv_sign> = wmegc_sign_exclusive.
  ENDIF.












*
ENDMETHOD.


METHOD RANGE_APPEND_CP.
*----------------------------------------------------------------------*
* Title  RANGE_APPEND_EQ
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author : David Nava
*----------------------------------------------------------------------*
* Program description:
* ADD 'CP' value to a range table
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  FIELD-SYMBOLS:

  <ls_range>               TYPE any,
  <lv_sign>                TYPE any.


  DATA:

  lv_tabix                 TYPE sytabix.


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* ADD 'EQ' value to a range table
*=======================================================================

  CALL FUNCTION '/SCTM/APPEND_RANGE'
    EXPORTING
      iv_value_low            = iv_value
      iv_option               = wmegc_option_cp
    CHANGING
      ct_range                = ct_range
    EXCEPTIONS
      invalid_range_structure = 1
      OTHERS                  = 2.

  IF ( sy-subrc <> 0 ).
    ASSERT 1 = 0.
  ENDIF.

  IF ( iv_exclude = abap_true ).
    lv_tabix = lines( ct_range ).
    READ TABLE ct_range ASSIGNING <ls_range>
      INDEX lv_tabix.
    ASSERT sy-subrc = 0.
    ASSIGN COMPONENT zwmgc_field_sign OF STRUCTURE <ls_range> TO <lv_sign>.
    <lv_sign> = wmegc_sign_exclusive.
  ENDIF.












*
ENDMETHOD.


METHOD range_append_eq.
*----------------------------------------------------------------------*
* Title  RANGE_APPEND_EQ
* Copyright (c) 2024 ProLogic LA. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author : David Nava
*----------------------------------------------------------------------*
* Program description:
* ADD 'EQ' value to a range table
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  FIELD-SYMBOLS:

  <ls_range>               TYPE rsdsselopt.


  DATA:

  lv_tabix                 TYPE sytabix.


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* ADD 'EQ' value to a range table
*=======================================================================

  CALL FUNCTION '/SCTM/APPEND_RANGE'
    EXPORTING
      iv_value_low            = iv_value
      iv_option               = wmegc_option_eq
    CHANGING
      ct_range                = ct_range
    EXCEPTIONS
      invalid_range_structure = 1
      OTHERS                  = 2.

  IF ( sy-subrc <> 0 ).
    ASSERT 1 = 0.
  ENDIF.

  IF ( iv_exclude = abap_true ).
    lv_tabix = lines( ct_range ).
    READ TABLE ct_range ASSIGNING <ls_range>
      INDEX lv_tabix.
    ASSERT sy-subrc = 0.
    <ls_range>-sign = wmegc_sign_exclusive.
  ENDIF.














*
ENDMETHOD.


METHOD range_convert.
*----------------------------------------------------------------------*
* Title  MTHD RANGE_CONVERT
* Copyright (c) 2024 ProLogic LA. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author : David Nava
*----------------------------------------------------------------------*
* Program description:
* Convert range tab / select-option to range tab / select-option
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  FIELD-SYMBOLS:

  <ls_range_in>            TYPE any,
  <ls_range_out>           TYPE any.


  DATA:

  ls_refdata               TYPE REF TO data.


*=======================================================================
* Input
*=======================================================================

  REFRESH: et_range[].


*=======================================================================
* MOVE values from one range tab to the other
*=======================================================================

  CREATE DATA ls_refdata LIKE LINE OF it_range.
  ASSIGN ls_refdata->* TO <ls_range_in>.
  CREATE DATA ls_refdata LIKE LINE OF et_range.
  ASSIGN ls_refdata->* TO <ls_range_out>.

  LOOP AT it_range ASSIGNING <ls_range_in>.
    APPEND INITIAL LINE TO et_range ASSIGNING <ls_range_out>.
    MOVE-CORRESPONDING <ls_range_in> TO <ls_range_out>.
  ENDLOOP.









*
ENDMETHOD.


METHOD register_cleanup.
*----------------------------------------------------------------------*
* Title  MTHD REGISTER_CLEANUP
* Copyright (c) 2024 ProLogic LA. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author : David Nava
*----------------------------------------------------------------------*
* Program description:
* Register application object for /SCWM/CL_TM->CLEANUP
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lr_tm                    TYPE REF TO /scwm/cl_tm.


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* GET Transaction Manager
*=======================================================================

  lr_tm = get_tm_instance( ).


*=======================================================================
* REGISTER cleanup
*=======================================================================

  lr_tm->/scwm/if_tm~register_cleanup(
    EXPORTING
      io_application = ir_application
      iv_seqno       = iv_seqno ).











*
ENDMETHOD.
ENDCLASS.
