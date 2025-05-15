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
class ZCL_EWM_BASE_DB_PACKSPEC definition
  public
  final
  create public .

public section.

  class-methods GET_BY_PS_HEAD
    importing
      !IS_PS_HEADER_KEY type /SCWM/S_PS_HEADER_KEY
    exporting
      !ET_PACKSPEC type /SCWM/TT_PACKSPEC_INT
      !ET_ELEMENTGROUP type /SCWM/TT_PS_ELEMENTGROUP .
  class-methods GET_PM_BY_PSGUID
    importing
      !IV_PACKSPEC type /SCWM/DE_GUID_PS
    exporting
      !EV_PMATID type /SCWM/DE_MATID
      !EV_PMAT type /SCWM/DE_PMAT
    raising
      ZCX_EWM_BASE_DB .
protected section.
private section.
ENDCLASS.



CLASS ZCL_EWM_BASE_DB_PACKSPEC IMPLEMENTATION.


method GET_BY_PS_HEAD.
*----------------------------------------------------------------------*
* Title  GET_BY_PS_HEAD
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Company:  PROLOGIC
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* Read Packing Material from incoming Packing Specification IDs
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================
  DATA:

  lt_ps_key                TYPE /scwm/tt_ps_header_key,

  ls_ps_key                TYPE /scwm/s_ps_header_key,
  ls_read_opt              TYPE /scwm/s_ps_read_options,

  lv_result                TYPE boolean,
  lv_status                TYPE /scwm/de_ps_status.


*=======================================================================
* Input
*=======================================================================

  CHECK is_ps_header_key-ps_id   IS NOT INITIAL OR
        is_ps_header_key-guid_ps IS NOT INITIAL.

  REFRESH: et_packspec, et_elementgroup.

*=======================================================================
* GET Packaging Specifications
*=======================================================================

  IF is_ps_header_key-guid_ps IS NOT INITIAL AND
     is_ps_header_key-ps_id   IS INITIAL.

    ls_ps_key-guid_ps = is_ps_header_key-guid_ps.

    CALL FUNCTION 'CONVERSION_EXIT_PSID_OUTPUT'
      EXPORTING
        INPUT         = is_ps_header_key-guid_ps
      IMPORTING
        OUTPUT        = ls_ps_key-ps_id.

  ELSEIF is_ps_header_key-guid_ps IS INITIAL AND
         is_ps_header_key-ps_id   IS NOT INITIAL.

    ls_ps_key-ps_id   = is_ps_header_key-ps_id.

    CALL FUNCTION 'CONVERSION_EXIT_PSID_INPUT'
      EXPORTING
        INPUT         = is_ps_header_key-ps_id
      IMPORTING
        OUTPUT        = ls_ps_key-guid_ps.

  ELSE.

    ls_ps_key-guid_ps = is_ps_header_key-guid_ps.
    ls_ps_key-ps_id   = is_ps_header_key-ps_id.

  ENDIF.


  /scwm/cl_ppelipak_cntl=>header_existence_check(
    IMPORTING
      ev_result = lv_result
      ev_status = lv_status
    CHANGING
      cs_key    = ls_ps_key
    EXCEPTIONS
      no_authority = 1
      check_error  = 2
      OTHERS       = 3 ).

  CHECK sy-subrc  = 0.
  CHECK lv_result = abap_true.
  CHECK lv_status = zwmgc_ps_status_active.
  APPEND ls_ps_key TO lt_ps_key.

  ls_read_opt-read_all = abap_false.
  ls_read_opt-header   = abap_true.
  IF ( et_elementgroup IS REQUESTED ).
    ls_read_opt-content  = abap_true.
    ls_read_opt-levels   = abap_true.
    ls_read_opt-elements = abap_true.
  ENDIF.

  /scwm/cl_ppelipak_cntl=>packspec_read(
    EXPORTING
      it_ps_key       = lt_ps_key
    IMPORTING
      et_packspec     = et_packspec
      et_elementgroup = et_elementgroup
    CHANGING
      cs_read_options = ls_read_opt
    EXCEPTIONS
      read_error      = 1
      lock_error      = 0
      OTHERS          = 2 ).

  IF ( sy-subrc <> 0 ).
*  RAISE EXCEPTION TYPE
  ENDIF.








*
endmethod.


method GET_PM_BY_PSGUID.
*----------------------------------------------------------------------*
* Title  GET_PM_BY_PSGUID
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Company:  PROLOGIC
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* Read Packing Material from incoming Packing Specification IDs
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================
  DATA:

  lt_packspec              TYPE /scwm/tt_packspec_int,
  lt_elementgroup          TYPE /scwm/tt_ps_elementgroup,

  ls_ps_key                TYPE /scwm/s_ps_header_key,
  ls_elementgroup          TYPE /scwm/s_ps_elementgroup_int,
  ls_elements              TYPE /scwm/s_ps_element_int.


*=======================================================================
* Input
*=======================================================================

  CHECK iv_packspec IS NOT INITIAL.

  CLEAR: ev_pmatid.


*=======================================================================
* GET Packing Specification
*=======================================================================

  ls_ps_key-guid_ps = iv_packspec.

  CALL METHOD ZCL_EWM_BASE_DB_PACKSPEC=>GET_BY_PS_HEAD
    EXPORTING
      IS_PS_HEADER_KEY = ls_ps_key
    IMPORTING
      ET_PACKSPEC      = lt_packspec
      ET_ELEMENTGROUP  = lt_elementgroup.


*=======================================================================
* GET Packing Material
*=======================================================================

  READ TABLE lt_elementgroup INTO ls_elementgroup INDEX 1.

  READ TABLE ls_elementgroup-elements INTO ls_elements INDEX 1.

  CALL METHOD ZCL_EWM_BASE_DB_PRODUCT=>GET_MATNR_BY_MATID
    EXPORTING
      IV_MDLAPPL = zwmgc_appl_ewm
      IV_MATID16 = ls_elements-matid
    RECEIVING
      RV_MATNR   = ev_pmat.

  ev_pmatid = ls_elements-matid.












*
endmethod.
ENDCLASS.
