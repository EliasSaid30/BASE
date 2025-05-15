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
class ZCL_EWM_BASE_DB_HU definition
  public
  final
  create public .

public section.
  type-pools WMEGC .

  interfaces /SCWM/IF_TM_APPL .
  interfaces ZIF_EWM_BASE_TM_APPL .

  aliases GV_CLEANUP_REASON
    for ZIF_EWM_BASE_TM_APPL~GV_CLEANUP_REASON .
  aliases GV_CLEANUP_REG
    for ZIF_EWM_BASE_TM_APPL~GV_CLEANUP_REG .

  class-methods CHANGE_HU_HDR
    importing
      !IS_HUHDR type /SCWM/S_HUHDR_INT
      !IV_CHECK type XFELD optional
      !IV_COMMIT type XFELD
      !IV_SAVE type XFELD default ABAP_TRUE
      !IV_WAIT type XFELD
    exporting
      !ES_HUHDR type /SCWM/S_HUHDR_INT .
  class-methods CHANGE
    importing
      !IV_COMMIT type XFELD default ABAP_TRUE
      !IV_CLEANUP type XFELD default ABAP_TRUE
      !IV_INIT_PACK type XFELD default ABAP_TRUE
      !IV_SAVE type XFELD default ABAP_TRUE
      !IR_WM_PACKING type ref to /SCWM/CL_WM_PACKING optional
      !IV_CHECK type XFELD default ABAP_FALSE
      !IS_HUHDR type /SCWM/S_HUHDR_INT
    exporting
      !ES_HUHDR type /SCWM/S_HUHDR_INT
    raising
      ZCX_EWM_BASE_DB .
  class-methods CREATE
    importing
      !IV_LGNUM type /SCWM/LGNUM optional
      !IV_PMAT type /SCWM/DE_MATID
      !IV_HUIDENT type /SCWM/DE_HUIDENT
      !IV_LGPLA type /SCWM/DE_LGPLA
      !IV_COMMIT type XFELD default ABAP_TRUE
      !IV_CLEANUP type XFELD default ABAP_TRUE
      !IV_INIT_PACK type XFELD default ABAP_TRUE
      !IV_SAVE type XFELD default ABAP_TRUE
      !IR_PACK type ref to /SCWM/CL_PACK
    returning
      value(RS_HUHDR) type /SCWM/S_HUHDR_INT
    raising
      ZCX_EWM_BASE_DB .
  class-methods DELETE
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_GUID_HU type /SCWM/GUID_HU optional
      !IV_HUIDENT type /SCWM/DE_HUIDENT optional
      !IV_COMMIT type XFELD default ABAP_TRUE
      !IV_CLEANUP type XFELD default ABAP_TRUE
      !IV_INIT_PACK type XFELD default ABAP_TRUE
      !IV_SAVE type XFELD default ABAP_TRUE
      !IR_PACK type ref to /SCWM/CL_PACK optional
    raising
      ZCX_EWM_BASE_DB .
  class-methods GET_HUHDR
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_APPL type /SCWM/DE_HUAPPL default WMEGC_HUAPPL_WME
      !IV_HUIDENT type /SCWM/DE_HUIDENT optional
      !IV_GUID_HU type /SCWM/GUID_HU optional
      !IV_LOCK_MODE type ENQMODE optional
      !IV_LOCK_WAIT type DDENQWAIT default ABAP_FALSE
      !IV_BUFFER_ONLY type XFELD default ABAP_FALSE
    returning
      value(RS_HUHDR) type /SCWM/S_HUHDR_INT
    raising
      ZCX_EWM_BASE_DB .
  class-methods GET_HUITM
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_APPL type /SCWM/DE_HUAPPL default WMEGC_HUAPPL_WME
      !IV_HUIDENT type /SCWM/DE_HUIDENT optional
      !IV_GUID_HU type /SCWM/GUID_HU optional
    exporting
      !ET_HUITM type /SCWM/TT_HUITM_INT
    raising
      ZCX_EWM_BASE_DB .
  class-methods GET_IDENT_REASON
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_GUID_HU type /SCWM/GUID_HU optional
      !IV_HUIDENT type /SCWM/DE_HUIDENT optional
      !IV_REFRESH type ABAP_BOOL default ABAP_FALSE
      !IV_BUFFER_ONLY type XFELD default ABAP_FALSE
    exporting
      value(EV_REASON) type CLIKE
    raising
      ZCX_EWM_BASE_DB .
  class-methods GET_INSTANCE
    returning
      value(RR_SINGLETON) type ref to ZCL_EWM_BASE_DB_HU .
  class-methods GET_KIND_STOCK .
  class-methods GET_STATUS
    importing
      !IV_GUID_HU type /SCWM/GUID_HU
      !IV_REFRESH type ABAP_BOOL default ABAP_FALSE
      !IV_STAT type CRM_J_STATUS
    returning
      value(RS_HUSTATUS) type /SCWM/S_HUSTATUS
    raising
      ZCX_EWM_BASE_DB .
  class-methods GET_USER_STATUS_ACTIV
    importing
      !IV_GUID_HU type /SCWM/GUID_HU
      !IV_REFRESH type ABAP_BOOL default ABAP_FALSE
    returning
      value(RV_HUSTATUS) type J_STATUS
    raising
      ZCX_EWM_BASE_DB .
  class-methods GET_USER_STATUS_TEXT
    importing
      !IV_GUID_HU type /SCWM/GUID_HU
      !IV_STATUS type J_STATUS
    exporting
      !EV_TXT_SHORT type J_TXT04
      !EV_TXT_LONG type J_TXT30
    raising
      ZCX_EWM_BASE_DB .
  class-methods INIT
    importing
      !IV_GUID_HU type /SCWM/GUID_HU optional
      !IT_GUID_HU type /SCWM/TT_GUID_HU optional .
  class-methods MOVE
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_LGPLA type /SCWM/DE_LGPLA
      !IV_GUID_HU type /SCWM/GUID_HU
      !IV_HUIDENT type /SCWM/DE_HUIDENT optional
      !IV_COMMIT type XFELD optional
      !IV_CLEANUP type XFELD optional
      !IV_INIT_PACK type XFELD optional
      !IV_SAVE type XFELD optional
      !IR_WM_PACKING type ref to /SCWM/CL_WM_PACKING optional
    raising
      ZCX_EWM_BASE_DB .
  class-methods MOVE_MULTI
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_LGPLA type /SCWM/DE_LGPLA
      !IT_GUID_HU type /SCWM/TT_GUID_HU optional
      !IT_HUIDENT type /SCWM/TT_HUIDENT optional
      !IV_COMMIT type XFELD optional
      !IV_CLEANUP type XFELD optional
      !IV_INIT_PACK type XFELD optional
      !IV_SAVE type XFELD optional
      !IR_WM_PACKING type ref to /SCWM/CL_WM_PACKING optional
    raising
      ZCX_EWM_BASE_DB .
  class-methods READ
    importing
      !IS_HUIDENT type /SCWM/S_HUIDENT optional
      !IV_GUID_HU type /SCWM/GUID_HU optional
    exporting
      !ES_HUHDR type /SCWM/S_HUHDR_INT
      !ET_HUITM type /SCWM/TT_HUITM_INT
      !ET_HUTREE type /SCWM/TT_HUTREE
      !ET_HIGH type /SCWM/TT_HUHDR_INT
      !ET_HUREF type /SCWM/TT_HUREF_INT
      !ET_IDENT type /SCWM/TT_IDENT_INT
    raising
      ZCX_EWM_BASE_DB .
  class-methods READ_BY_IDENT
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_IDART type /SCWM/DE_HUIDART
      !IV_IDENT type /SCWM/DE_IDENT
    exporting
      !ET_GUID_HU type /SCWM/TT_GUID_HU
      !ET_HUHDR type /SCWM/TT_HUHDR_INT
    raising
      ZCX_EWM_BASE_DB .
  class-methods READ_HUHDR
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_APPL type /SCWM/DE_HUAPPL
      !IV_HUIDENT type /SCWM/DE_HUIDENT optional
      !IV_GUID_HU type /SCWM/GUID_HU optional
      !IV_NOBUF type XFELD
      !IV_LOCK_MODE type ENQMODE optional
      !IV_LOCK_WAIT type DDENQWAIT optional
    returning
      value(RS_HUHDR) type /SCWM/S_HUHDR_INT
    raising
      ZCX_EWM_BASE_DB .
  class-methods READ_HUHDR_MULTI
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_NOBUF type XFELD default ABAP_TRUE
      !IV_LOCK_MODE type ENQMODE optional
      !IT_HUIDENT type /SCWM/TT_HUIDENT optional
      !IT_GUID_HU type /SCWM/TT_GUID_HU optional
    exporting
      !ET_HUHDR type /SCWM/TT_HUHDR_INT
    raising
      ZCX_EWM_BASE_DB .
  class-methods READ_HUITM
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_APPL type /SCWM/DE_HUAPPL
      !IV_HUIDENT type /SCWM/DE_HUIDENT optional
      !IV_GUID_HU type /SCWM/GUID_HU optional
    exporting
      !ET_HUITM type /SCWM/TT_HUITM_INT
    raising
      ZCX_EWM_BASE_DB .
  class-methods READ_IDENT
    importing
      !IV_GUID_HU type /SCWM/GUID_HU
      !IV_IDART type /SCWM/DE_HUIDART
    returning
      value(RS_HU_IDENT) type /SCWM/HU_IDENT
    raising
      ZCX_EWM_BASE_DB .
  class-methods READ_IDENT_BY_RANGE
    importing
      !IV_GUID_HU type /SCWM/GUID_HU optional
      !IT_GUID_HU_2 type /SCWM/TT_GUID_HU optional
      !IT_GUID_HU type RSELOPTION optional
      !IV_IDART type /SCWM/DE_HUIDART optional
      !IT_IDART type RSELOPTION optional
      !IV_IDENT type /SCWM/DE_IDENT optional
      !IT_IDENT type RSELOPTION optional
      !IV_ALL type XFELD optional
    returning
      value(RT_IDENT) type ZEWM_TT_BASE_HU_IDENT
    raising
      ZCX_EWM_BASE_DB .
  class-methods READ_MULTI
    importing
      !IT_HUIDENT type /SCWM/TT_HUIDENT optional
      !IT_GUID_HU type /SCWM/TT_GUID_HU optional
      !IV_LGNUM type /SCWM/LGNUM optional
    exporting
      !ET_HUHDR type /SCWM/TT_HUHDR_INT
      !ET_HUITM type /SCWM/TT_HUITM_INT
      !ET_HUTREE type /SCWM/TT_HUTREE
      !ET_HIGH type /SCWM/TT_HUHDR_INT
      !ET_HUREF type /SCWM/TT_HUREF_INT
      !ET_IDENT type /SCWM/TT_IDENT_INT
      !ET_GUID_HU type /SCWM/TT_GUID_HU
    raising
      ZCX_EWM_BASE_DB .
  class-methods READ_STATUS
    importing
      !IV_GUID_HU type /SCWM/GUID_HU
      !IV_STAT type CRM_J_STATUS
    returning
      value(RS_HUSTATUS) type /SCWM/S_HUSTATUS
    raising
      ZCX_EWM_BASE_DB .
  class-methods READ_STATUS_ALL
    importing
      !IV_GUID_HU type /SCWM/GUID_HU
    returning
      value(RT_HUSTATUS) type /SCWM/TT_HUSTATUS
    raising
      ZCX_EWM_BASE_DB .
  class-methods REMOVE_IDENT
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_HUIDENT type /SCWM/DE_HUIDENT optional
      !IV_GUID_HU type /SCWM/GUID_HU optional
      !IV_IDART type /SCWM/DE_HUIDART
      !IV_COMMIT type XFELD default ABAP_TRUE
      !IV_CLEANUP type XFELD default ABAP_TRUE
      !IV_INIT_PACK type XFELD default ABAP_TRUE
      !IV_SAVE type XFELD default ABAP_TRUE
      !IR_PACK type ref to /SCWM/CL_PACK
    raising
      ZCX_EWM_BASE_DB .
  class-methods REPLACE_IDENT_REASON
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_HUIDENT type /SCWM/DE_HUIDENT optional
      !IV_GUID_HU type /SCWM/GUID_HU optional
      !IV_DOCUMENT type CLIKE optional
      !IV_COMMIT type ZEWM_DE_BASE_COMMIT
      !IV_NOBUF type XFELD default ABAP_TRUE
      !IV_CLEANUP type XFELD default ABAP_FALSE
      !IV_INIT_PACK type XFELD default ABAP_TRUE
      !IV_SAVE type XFELD default ABAP_TRUE
      !IR_PACK type ref to /SCWM/CL_PACK
      !IV_HUIDENT_EXT type CLIKE optional
    raising
      ZCX_EWM_BASE_DB .
  class-methods SET_IDENT
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_HUIDENT type /SCWM/DE_HUIDENT optional
      !IV_GUID_HU type /SCWM/GUID_HU optional
      !IV_IDART type /SCWM/DE_HUIDART
      !IV_HUIDENT_EXT type CLIKE
      !IV_COMMIT type XFELD default ABAP_TRUE
      !IV_NOBUF type XFELD default ABAP_FALSE
      !IV_CLEANUP type XFELD default ABAP_TRUE
      !IV_INIT_PACK type XFELD default ABAP_TRUE
      !IV_SAVE type XFELD default ABAP_TRUE
      !IR_PACK type ref to /SCWM/CL_PACK optional
    raising
      ZCX_EWM_BASE_DB .
  class-methods SET_STATUS_USER
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_HUIDENT type /SCWM/DE_HUIDENT optional
      !IV_GUID_HU type /SCWM/GUID_HU optional
      !IV_STATUS type J_STATUS
      !IV_COMMIT type ZEWM_DE_BASE_COMMIT default ABAP_FALSE
      !IV_CLEANUP type XFELD
      !IV_INIT_PACK type XFELD
      !IV_SAVE type XFELD
      !IR_PACK type ref to /SCWM/CL_PACK optional
    raising
      ZCX_EWM_BASE_DB .
protected section.
private section.

  aliases GC_CLEANUP_COMMIT
    for ZIF_EWM_BASE_TM_APPL~GC_CLEANUP_COMMIT .
  aliases GC_CLEANUP_DEQUEUE
    for ZIF_EWM_BASE_TM_APPL~GC_CLEANUP_DEQUEUE .
  aliases GC_CLEANUP_END
    for ZIF_EWM_BASE_TM_APPL~GC_CLEANUP_END .
  aliases GC_CLEANUP_ROLLBACK
    for ZIF_EWM_BASE_TM_APPL~GC_CLEANUP_ROLLBACK .
  aliases CLEANUP
    for ZIF_EWM_BASE_TM_APPL~CLEANUP .
  aliases CLEANUP_NOW
    for ZIF_EWM_BASE_TM_APPL~CLEANUP_NOW .

  data GT_HUSTATUS type /SCWM/TT_HUSTATUS .
  data GT_HUHDR type /SCWM/TT_HUHDR .
  data GT_IDENT type ZEWM_TT_BASE_HU_IDENT .
  class-data SR_SINGLETON type ref to ZCL_EWM_BASE_DB_HU .

  class-methods SET_IDENT_BUFFER
    importing
      !IV_GUID_HU type /SCWM/GUID_HU optional
      !IV_IDART type /SCWM/DE_HUIDART optional
      !IV_IDENT type /SCWM/DE_IDENT optional
      !IS_IDENT type /SCWM/HU_IDENT optional
    raising
      ZCX_EWM_BASE_DB .
  methods SET_STATUS_INT
    importing
      !IV_GUID_HU type /SCWM/GUID_HU
      !IV_STATUS type J_STATUS
      !IV_INACTIVE type J_INACT .
ENDCLASS.



CLASS ZCL_EWM_BASE_DB_HU IMPLEMENTATION.


  method /SCWM/IF_TM_APPL~CHECK_SAVE.
  endmethod.


  method /SCWM/IF_TM_APPL~CLEANUP.
  endmethod.


METHOD change.
*----------------------------------------------------------------------*
* Title MTHD CHANGE
*----------------------------------------------------------------------*
* Indumotora
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* Set measurements of a HU
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lr_wm_packing            TYPE REF TO /scwm/cl_wm_packing,

  lt_guid_hu               TYPE /scwm/tt_guid_hu,

  ls_guid_hu               TYPE /scwm/s_guid_hu.


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* SET packaging framework
*=======================================================================

  lr_wm_packing = ir_wm_packing.
  IF ( lr_wm_packing IS NOT BOUND ).
    /scwm/cl_wm_packing=>get_instance(
      IMPORTING
        eo_instance = lr_wm_packing ).
  ENDIF.


*=======================================================================
* RE-SET global data
*=======================================================================

  IF ( iv_cleanup = abap_true ).
    lr_wm_packing->/scwm/if_pack_bas~cleanup( ).
  ENDIF.


*=======================================================================
* GET Head data of the Handling Units
*=======================================================================

  ls_guid_hu-guid_hu = is_huhdr-guid_hu.
  APPEND ls_guid_hu TO lt_guid_hu.


*=======================================================================
* SET initial packaging data
*=======================================================================

  IF ( iv_init_pack = abap_true ).

    lr_wm_packing->init_pack(
      EXPORTING
        iv_badi_appl   = wmegc_huappl_wme
        it_guid_hu     = lt_guid_hu
      EXCEPTIONS
        error          = 1
        OTHERS         = 2 ).
    IF ( sy-subrc <> 0 ).
      RAISE EXCEPTION TYPE zcx_ewm_base_db
        EXPORTING
          textid = zcx_ewm_base_db=>hu_set_ident_pack_init.
    ENDIF.

  ENDIF.


*=======================================================================
* SET Handling Unit attributes
*=======================================================================

  lr_wm_packing->/scwm/if_pack_bas~change_huhdr(
    EXPORTING
      iv_check   = iv_check
      is_huhdr   = is_huhdr
    IMPORTING
      es_huhdr   = es_huhdr
    EXCEPTIONS
      error      = 1
      not_locked = 2
      OTHERS     = 3 ).

  IF ( sy-subrc <> 0 ).
    zcx_ewm_base_db=>raise_syst( ).
  ENDIF.


*=======================================================================
* POST assignment
*=======================================================================

  IF (     iv_save = abap_true
       AND /scwm/cl_pack=>gv_changed = abap_true ).

    lr_wm_packing->save(
      EXPORTING
        iv_commit = iv_commit
        iv_wait   = abap_true
      EXCEPTIONS
        error     = 1
        OTHERS    = 2 ).
    IF ( sy-subrc <> 0 ).
      IF ( iv_commit = abap_true ).
        ROLLBACK WORK.
      ENDIF.
      zcx_ewm_base_db=>raise_syst( ).
    ENDIF.

  ENDIF.











*
ENDMETHOD.


METHOD change_hu_hdr.
*----------------------------------------------------------------------*
* Title  MTHD CHANGE_HU_HDR
*----------------------------------------------------------------------*
* Indumotora
* Author : Alberto Magaña
*----------------------------------------------------------------------*
* Program description:
* This method changes the Header of a given HU
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:
        lo_wm_packing     TYPE REF TO /scwm/cl_wm_packing.


*=======================================================================
* Change HU Header
*=======================================================================

  IF lo_wm_packing IS NOT BOUND.
    CALL METHOD /scwm/cl_wm_packing=>get_instance
      IMPORTING
        eo_instance = lo_wm_packing.
  ENDIF.

  CALL METHOD lo_wm_packing->/scwm/if_pack_bas~change_huhdr
    EXPORTING
      is_huhdr   = is_huhdr
    IMPORTING
      es_huhdr   = es_huhdr
    EXCEPTIONS
      error      = 1
      not_locked = 2
      OTHERS     = 3.
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
                 WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.


*=======================================================================
* Save Changes of Pack. Mat.
*=======================================================================
  IF iv_commit = abap_true.
    CALL METHOD lo_wm_packing->/scwm/if_pack_bas~save
      EXPORTING
        iv_commit = iv_commit
        iv_wait   = iv_wait
      EXCEPTIONS
        error     = 1
        OTHERS    = 2.
    IF sy-subrc <> 0.
      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
                 WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    ENDIF.
  ENDIF.











*
ENDMETHOD.


METHOD create.
*----------------------------------------------------------------------*
* Title  MTHD CREATE
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author : David Nava
*----------------------------------------------------------------------*
* Program description:
* This method creates a new Handling Unit
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lr_wm_packing            TYPE REF TO /scwm/cl_wm_packing,
  lr_pack                  TYPE REF TO /scwm/cl_pack,
  lr_log                   TYPE REF TO /scwm/cl_log.


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* SET packaging framework
*=======================================================================

  lr_pack = ir_pack.
  IF ( lr_pack IS NOT BOUND ).
    /scwm/cl_wm_packing=>get_instance(
      IMPORTING
        eo_instance = lr_wm_packing ).
    lr_pack = lr_wm_packing.
  ENDIF.

*=======================================================================
* RE-SET global data
*=======================================================================

  IF ( iv_cleanup = abap_true ).
    lr_pack->/scwm/if_pack_bas~cleanup( ).
  ENDIF.


*=======================================================================
* SET initial packaging data
*=======================================================================

  IF ( iv_init_pack = abap_true ).

    LR_PACK->INIT_PACK(
     EXPORTING
       iv_badi_appl           = wmegc_huappl_wme
       iv_lgnum               = iv_lgnum
     EXCEPTIONS
        error           = 1
        OTHERS          = 2 ).
    IF ( sy-subrc <> 0 ).
      RAISE EXCEPTION TYPE zcx_ewm_base_db
        EXPORTING
          textid = zcx_ewm_base_db=>hu_create_pack_init.
    ENDIF.

  ENDIF.


*=======================================================================
* EXEC creation
*=======================================================================

  lr_pack->/scwm/if_pack_bas~create_hu(
    EXPORTING
      iv_pmat    = iv_pmat
      iv_huident = iv_huident
      i_location = iv_lgpla
    RECEIVING
      es_huhdr   = rs_huhdr
    EXCEPTIONS
      error      = 1
      OTHERS     = 2 ).

  IF ( sy-subrc <> 0 ).
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid     = zcx_ewm_base_db=>hu_create
        gv_huident = iv_huident.
  ENDIF.


*=======================================================================
* POST assignment
*=======================================================================

  IF (     iv_save = abap_true
       AND /scwm/cl_pack=>gv_changed = abap_true ).

    lr_pack->save(
      EXPORTING
        iv_commit = iv_commit
        iv_wait   = abap_true
      EXCEPTIONS
        error     = 1
        OTHERS    = 2 ).
    IF ( sy-subrc <> 0 ).
      IF ( iv_commit = abap_true ).
        ROLLBACK WORK.
      ENDIF.
      zcx_ewm_base_db=>raise_syst( ).
    ENDIF.

  ENDIF.











*
ENDMETHOD.


METHOD delete.
*----------------------------------------------------------------------*
* Title  MTHD DELETE
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author : David Nava
*----------------------------------------------------------------------*
* Program description:
* This method deletes a new Handling Unit
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lr_pack                  TYPE REF TO /scwm/cl_pack,
  lr_wm_packing            TYPE REF TO /scwm/cl_wm_packing,

  lt_guid_hu               TYPE /scwm/tt_guid_hu,

  ls_huhdr                 TYPE /scwm/s_huhdr_int,

  ls_guid_hu               TYPE /scwm/s_guid_hu,

  lV_APPL                  TYPE /SCWM/DE_HUAPPL.


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* SET packaging framework
*=======================================================================

  lr_pack = ir_pack.
  IF ( lr_pack IS NOT BOUND ).
    /scwm/cl_wm_packing=>get_instance(
      IMPORTING
        eo_instance = lr_wm_packing ).
    lr_pack = lr_wm_packing.
  ENDIF.


*=======================================================================
* RE-SET global data
*=======================================================================

  IF ( iv_cleanup = abap_true ).
    lr_pack->/scwm/if_pack_bas~cleanup( ).
  ENDIF.


*=======================================================================
* GET HU guid
*=======================================================================

  ls_huhdr-guid_hu = iv_guid_hu.
  IF ( iv_guid_hu IS INITIAL ).
    ls_huhdr = get_huhdr( iv_appl    = lv_appl
                          iv_lgnum   = iv_lgnum
                          iv_huident = iv_huident ).
  ENDIF.

  ls_guid_hu-guid_hu = ls_huhdr-guid_hu.
  APPEND ls_guid_hu TO lt_guid_hu.


*=======================================================================
* SET initial packaging data
*=======================================================================

  IF ( iv_init_pack = abap_true ).

    lr_pack->init_pack(
      EXPORTING
        iv_badi_appl   = wmegc_huappl_wme
        it_guid_hu     = lt_guid_hu
      EXCEPTIONS
        error          = 1
        OTHERS         = 2 ).
    IF ( sy-subrc <> 0 ).
      RAISE EXCEPTION TYPE zcx_ewm_base_db
        EXPORTING
          textid = zcx_ewm_base_db=>hu_delete_pack_init.
    ENDIF.

  ENDIF.


*=======================================================================
* EXEC deletion
*=======================================================================

  LOOP AT lt_guid_hu INTO ls_guid_hu.

    lr_pack->delete_hu(
      EXPORTING
        iv_hu  = ls_guid_hu-guid_hu
      EXCEPTIONS
        error  = 1
        OTHERS = 2 ).

    IF ( sy-subrc <> 0 ).
      zcx_ewm_base_db=>raise_syst( ).
    ENDIF.

  ENDLOOP.


*=======================================================================
* POST deletion
*=======================================================================

  IF (     iv_save = abap_true
       AND /scwm/cl_pack=>gv_changed = abap_true ).

    lr_pack->save(
      EXPORTING
        iv_commit = iv_commit
        iv_wait   = abap_true
      EXCEPTIONS
        error     = 1
        OTHERS    = 2 ).
    IF ( sy-subrc <> 0 ).
      IF ( iv_commit = abap_true ).
        ROLLBACK WORK.
      ENDIF.
      zcx_ewm_base_db=>raise_syst( ).
    ENDIF.

  ENDIF.










*
ENDMETHOD.


METHOD get_huhdr.
*----------------------------------------------------------------------*
* Title  GET_HUHDR
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author : David Nava
*----------------------------------------------------------------------*
* Program description:
* Return header data of this Handling Unit
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* GET header data from buffer
*=======================================================================

  CALL FUNCTION '/SCWM/HU_READ'
    EXPORTING
      iv_appl      = iv_appl
      iv_db_select = abap_false
      iv_top       = abap_false
      iv_lock      = iv_lock_mode
      iv_wait      = iv_lock_wait
      iv_guid_hu   = iv_guid_hu
      iv_lgnum     = iv_lgnum
      iv_huident   = iv_huident
    IMPORTING
      es_huhdr     = rs_huhdr
    EXCEPTIONS
      deleted      = 1
      not_found    = 2
      error        = 3
      OTHERS       = 4.

  IF ( sy-subrc = 0 ).
    RETURN.
  ELSE.
    IF ( iv_buffer_only = abap_true ).
      zcx_ewm_base_db=>raise_syst( ).
    ENDIF.
  ENDIF.


*=======================================================================
* READ header data from database
*=======================================================================

  rs_huhdr = read_huhdr( iv_lgnum     = iv_lgnum
                         iv_appl      = iv_appl
                         iv_huident   = iv_huident
                         iv_guid_hu   = iv_guid_hu
                         iv_nobuf     = abap_false
                         iv_lock_mode = iv_lock_mode
                         iv_lock_wait = iv_lock_wait ).

















*
ENDMETHOD.


METHOD get_huitm.
*----------------------------------------------------------------------*
* Title  GET_HUITM
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* Reads the items (stock) of a Handling Unit from the global buffer
* and database
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  REFRESH: et_huitm.


*=======================================================================
* Input
*=======================================================================

 ASSERT ID zewm_base_error
      CONDITION    iv_guid_HU IS NOT INITIAL
               OR  iv_huident IS NOT INITIAL.

  IF (     iv_guid_HU IS INITIAL
       AND iv_huident IS INITIAL ).

    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid = zcx_ewm_base_db=>parameter_invalid.

  ENDIF.


*=======================================================================
* RETURN Handling Unit items from global buffer
*=======================================================================

  CALL FUNCTION '/SCWM/HU_READ'
    EXPORTING
      iv_appl      = iv_appl
      iv_db_select = space
      iv_guid_hu   = iv_guid_hu
      iv_huident   = iv_huident
      iv_lgnum     = iv_lgnum
    IMPORTING
      et_huitm     = et_huitm
    EXCEPTIONS
      OTHERS       = 4.

  IF ( sy-subrc = 0 ).
    RETURN.
  ENDIF.


*=======================================================================
* READ Handling Unit items from database
*=======================================================================

  read_huitm(
    EXPORTING
      iv_appl    = iv_appl
      iv_lgnum   = iv_lgnum
      iv_guid_hu = iv_guid_hu
      iv_huident = iv_huident
    IMPORTING
      et_huitm   = et_huitm ).










*
ENDMETHOD.


METHOD GET_IDENT_REASON.
*----------------------------------------------------------------------*
* Title MTHD GET_IDENT_REASON
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       :  David Nava
*----------------------------------------------------------------------*
* Program description:
* GET alternative HU identificaion: Reason
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================
  DATA:
  lr_buffer                TYPE REF TO zcl_ewm_base_db_hu,

  ls_huhdr                 TYPE /scwm/s_huhdr_int,
  ls_ident                 TYPE /scwm/hu_ident,

  lv_reason                TYPE char20.


*=======================================================================
* Input
*=======================================================================

  CLEAR: ev_reason.

  lr_buffer = get_instance( ).


*=======================================================================
* GET hu guid
*=======================================================================

  ls_huhdr-guid_hu = iv_guid_hu.

  IF ( iv_guid_hu IS INITIAL ).
    ls_huhdr = get_huhdr( iv_lgnum   = iv_lgnum
                          iv_huident = iv_huident ).

  ENDIF.


*=======================================================================
* CHECK If the local buffer must be initialized?
*=======================================================================

  IF ( iv_refresh = abap_true ).
*   .yes
    DELETE lr_buffer->gt_ident
      WHERE guid_hu = ls_huhdr-guid_hu
      AND idart     = zwmgc_huidart_reason.

    IF ( sy-subrc <> 0 ).                                   "#EC NEEDED
    ENDIF.

  ENDIF.


*=======================================================================
* GET alternative hu identification (from buffer)
*=======================================================================

  READ TABLE lr_buffer->gt_ident INTO ls_ident
    WITH KEY guid_hu = ls_huhdr-guid_hu
             idart   = zwmgc_huidart_reason.

  IF ( sy-subrc = 0 ).
    CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
      EXPORTING
        input  = ls_ident-huident
      IMPORTING
        output = ev_reason.
    RETURN.
  ENDIF.


*=======================================================================
* READ alternative hu identification (from db)
*=======================================================================

  TRY.

    ls_ident = read_ident( iv_guid_hu = ls_huhdr-guid_hu
                           iv_idart   = zwmgc_huidart_reason ).
  CATCH zcx_ewm_base_db.
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid     = zcx_ewm_base_db=>hu_get_ident_bo
        gv_huident = iv_huident.

  ENDTRY.


*=======================================================================
* UPDATE buffer
*=======================================================================

  APPEND ls_ident TO lr_buffer->gt_ident.


*=======================================================================
* OUTPUT
*=======================================================================

  IF ( ev_reason IS REQUESTED ).

    ev_reason = ls_ident-huident.

  ENDIF.











*
ENDMETHOD.


METHOD get_instance.
*----------------------------------------------------------------------*
* Title  MTHD GET_INSTANCE
*----------------------------------------------------------------------*
* Company:  PROLOGIC
* Project Rel. : Indumotora
* Author :  David Nava
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

  IF ( sr_singleton IS NOT BOUND ).
    CREATE OBJECT sr_singleton.
  ENDIF.


*=======================================================================
* Output
*=======================================================================

  rr_singleton = sr_singleton.







*
ENDMETHOD.


  method GET_KIND_STOCK.
  endmethod.


METHOD get_status.
*----------------------------------------------------------------------*
* Title  GET_STATUS
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Return system status of a Handling Unit
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lr_buffer                TYPE REF TO zcl_ewm_base_db_hu.


*=======================================================================
* Input
*=======================================================================

  lr_buffer = get_instance( ).


*=======================================================================
* CHECK If the local buffer must be initialized?
*=======================================================================

  IF ( iv_refresh = abap_true ).
*   .yes

    DELETE lr_buffer->gt_hustatus
      WHERE objnr = iv_guid_hu
        AND stat  = iv_stat.
    IF ( sy-subrc <> 0 ).                                   "#EC NEEDED
    ENDIF.

  ENDIF.


*=======================================================================
* CHECK If the data is already local buffered?
*=======================================================================

  READ TABLE lr_buffer->gt_hustatus INTO rs_hustatus
    WITH KEY objnr = iv_guid_hu
             stat  = iv_stat.
  IF ( sy-subrc = 0 ).
*   .yes
    RETURN.
  ENDIF.


*=======================================================================
* READ Handling Unit status from the database
*=======================================================================

  rs_hustatus = zcl_ewm_base_db_hu=>read_status(
                  iv_guid_hu = iv_guid_hu
                  iv_stat    = iv_stat ).


*=======================================================================
* ADD data to the local Buffer
*=======================================================================

  APPEND rs_hustatus TO lr_buffer->gt_hustatus.
















*
ENDMETHOD.


METHOD get_user_status_activ.
*----------------------------------------------------------------------*
* Title  GET_USER_STATUS_ACTIV
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Return user status active of a Handling Unit
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lr_buffer                TYPE REF TO zcl_ewm_base_db_hu,

  lt_hustatus              TYPE /scwm/tt_hustatus,
  lt_stat_r                TYPE crmt_report_range_stat_ta,

  ls_hustatus              TYPE /scwm/s_hustatus.


*=======================================================================
* Input
*=======================================================================

  lr_buffer = get_instance( ).


*=======================================================================
* CHECK If the local buffer must be initialized?
*=======================================================================

  IF ( iv_refresh = abap_true ).
*   .yes

    DELETE lr_buffer->gt_hustatus
      WHERE objnr = iv_guid_hu.
    IF ( sy-subrc <> 0 ).                                   "#EC NEEDED
    ENDIF.

  ENDIF.


*=======================================================================
* CHECK If the data is already local buffered?
*=======================================================================
  zcl_ewm_base=>range_append_cp(
    EXPORTING
      iv_value = 'I*'
*     iv_exclude =
    changing
      ct_range = lt_stat_r ).



  lt_hustatus = lr_buffer->gt_hustatus.
  DELETE lt_hustatus
    WHERE objnr <> iv_guid_hu OR
          stat  IN lt_stat_r  OR
          inact = abap_true.
  READ TABLE lt_hustatus INTO ls_hustatus INDEX 1.
  IF ( sy-subrc = 0 ).
    rv_hustatus = ls_hustatus-stat.
*   .yes
    RETURN.
  ENDIF.


*=======================================================================
* READ Handling Unit status from the database
*=======================================================================

  lt_hustatus = zcl_ewm_base_db_hu=>read_status_all(
                  iv_guid_hu = iv_guid_hu ).


*=======================================================================
* ADD data to the local Buffer
*=======================================================================

  APPEND LINES OF lt_hustatus TO lr_buffer->gt_hustatus.



*=======================================================================
* Output
*=======================================================================
  DELETE lt_hustatus
    WHERE objnr <> iv_guid_hu OR
          stat  IN lt_stat_r  OR
          inact = abap_true.
  READ TABLE lt_hustatus INTO ls_hustatus INDEX 1.

  rv_hustatus = ls_hustatus-stat.
















*
ENDMETHOD.


METHOD get_user_status_text.
*----------------------------------------------------------------------*
* Title  GET_USER_STATUS_ACTIV
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Get User Status Text
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================


  DATA:
    lt_tj30                TYPE tttj30,
    lt_tj30t               TYPE bu_tj30t_t,
    ls_tj30t               TYPE tj30t,
    lv_status              TYPE j_status.


*=======================================================================
* Input
*=======================================================================
  IF iv_status IS INITIAL.
    TRY.
        CALL METHOD zcl_ewm_base_db_hu=>get_user_status_activ
          EXPORTING
            iv_guid_hu  = iv_guid_hu
          RECEIVING
            rv_hustatus = lv_status.
      CATCH zcx_ewm_base_db.
    ENDTRY.
  ELSE.
    lv_status = iv_status.
  ENDIF.


*=======================================================================
* Get Text status
*=======================================================================

  CALL FUNCTION '/SCTM/GET_USR_STATUS_TEXTS'
    EXPORTING
      iv_obtyp                 = zwmgc_hu_obj_cat_hup
      iv_logon_lang_texts_only = abap_true
    TABLES
      et_tj30                  = lt_tj30
      et_tj30t                 = lt_tj30t.

  READ TABLE lt_tj30t INTO ls_tj30t
    WITH KEY estat = lv_status.

  ev_txt_short = ls_tj30t-txt04.
  ev_txt_long = ls_tj30t-txt30.











*
ENDMETHOD.


METHOD init.
*----------------------------------------------------------------------*
* Title  INIT
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* Initializing of the global buffer
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lr_buffer                TYPE REF TO zcl_ewm_base_db_hu,

  lt_guid_hu               TYPE /scwm/tt_guid_hu,
  lt_guid_hu_sel           TYPE rseloption,

  ls_guid_hu               TYPE /scwm/s_guid_hu.


*=======================================================================
* Input
*=======================================================================

  lr_buffer = get_instance( ).

  lt_guid_hu[] = it_guid_hu[].
  IF ( iv_guid_hu IS NOT INITIAL ).
    ls_guid_hu-guid_hu = iv_guid_hu.
    APPEND ls_guid_hu TO lt_guid_hu.
  ENDIF.

  LOOP AT lt_guid_hu INTO ls_guid_hu.
    zcl_ewm_base=>range_append_eq(
      EXPORTING
        iv_value = ls_guid_hu-guid_hu
      CHANGING
        ct_range = lt_guid_hu_sel ).
  ENDLOOP.


*=======================================================================
* RE-SET global buffer: HU Framework
*=======================================================================

  CALL FUNCTION '/SCWM/HUMAIN_REFRESH'
    EXPORTING
      it_hu_guids   = lt_guid_hu
    EXCEPTIONS
      error_message = 1
      OTHERS        = 2.
  IF ( sy-subrc <> 0 ).                                     "#EC NEEDED
  ENDIF.


*=======================================================================
* RE-SET global buffer: HU system status
*=======================================================================

  DELETE lr_buffer->gt_hustatus
    WHERE objnr IN lt_guid_hu_sel.
  IF ( sy-subrc <> 0 ).                                     "#EC NEEDED
  ENDIF.



*=======================================================================
* RE-SET global buffer: Alternative HU identifications
*=======================================================================

  DELETE lr_buffer->gt_ident
    WHERE guid_hu IN lt_guid_hu_sel.
  IF ( sy-subrc <> 0 ).                                     "#EC NEEDED
  ENDIF.









*
ENDMETHOD.


METHOD move.
*----------------------------------------------------------------------*
* Title  MTHD MOVE
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* This method moves or unpacks a Handling Unit
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:
    lt_guid_hu               TYPE /scwm/tt_guid_hu,

    ls_huhdr                 TYPE /scwm/s_huhdr_int,
    ls_guid_hu               TYPE /scwm/s_guid_hu.


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* GET HU guid
*=======================================================================

  ls_huhdr-guid_hu = iv_guid_hu.
  IF ( iv_guid_hu IS INITIAL ).
    ls_huhdr = get_huhdr( iv_lgnum   = iv_lgnum
                          iv_huident = iv_huident ).
  ENDIF.

  ls_guid_hu-guid_hu = ls_huhdr-guid_hu.
  APPEND ls_guid_hu TO lt_guid_hu.


*=======================================================================
* MOVE HU Multiple
*=======================================================================

  move_multi(
      iv_lgnum      = iv_lgnum
      iv_lgpla      = iv_lgpla
      it_guid_hu    = lt_guid_hu
      iv_commit     = iv_commit
      iv_cleanup    = iv_cleanup
      iv_init_pack  = iv_init_pack
      iv_save       = iv_save
      ir_wm_packing = ir_wm_packing ).








*
ENDMETHOD.


METHOD move_multi.
*----------------------------------------------------------------------*
* Title  MTHD MOVE_MULTI
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* This method moves or unpacks Multiple Handling Units
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:
    lt_guid_hu               TYPE /scwm/tt_guid_hu,

    ls_huhdr                 TYPE /scwm/s_huhdr_int,
    ls_guid_hu               TYPE /scwm/s_guid_hu,

    lr_wm_packing            TYPE REF TO /scwm/cl_wm_packing.


*=======================================================================
* Input
*=======================================================================

  IF it_guid_hu IS INITIAL AND
     it_huident IS INITIAL.
    EXIT.
  ENDIF.


*=======================================================================
* SET packaging framework
*=======================================================================

  lr_wm_packing = ir_wm_packing.
  IF ( lr_wm_packing IS NOT BOUND ).
    /scwm/cl_wm_packing=>get_instance(
      IMPORTING
        eo_instance = lr_wm_packing ).
  ENDIF.


*=======================================================================
* RE-SET global data
*=======================================================================

  IF ( iv_cleanup = abap_true ).
    lr_wm_packing->/scwm/if_pack_bas~cleanup( ).
  ENDIF.


*=======================================================================
* GET HU guid
*=======================================================================

  lt_guid_hu = it_guid_hu.
  IF ( lt_guid_hu IS INITIAL ).
    read_multi(
       EXPORTING
         it_huident = it_huident
         iv_lgnum   = iv_lgnum
       IMPORTING
         et_guid_hu = lt_guid_hu ).

  ENDIF.


*=======================================================================
* SET initial packaging data
*=======================================================================

  IF ( iv_init_pack = abap_true ).

    lr_wm_packing->init_pack(
      EXPORTING
        iv_badi_appl   = wmegc_huappl_wme
        it_guid_hu     = lt_guid_hu
      EXCEPTIONS
        error          = 1
        OTHERS         = 2 ).
    IF ( sy-subrc <> 0 ).
      RAISE EXCEPTION TYPE zcx_ewm_base_db
        EXPORTING
          textid = zcx_ewm_base_db=>hu_move_pack_init.
    ENDIF.

  ENDIF.


*=======================================================================
* EXEC move or unpack
*=======================================================================

  LOOP AT lt_guid_hu INTO ls_guid_hu.

    lr_wm_packing->move_hu(
                     EXPORTING
                       iv_hu    = ls_guid_hu-guid_hu
                       iv_bin   = iv_lgpla
                     EXCEPTIONS
                       error    = 1
                       OTHERS   = 2
                       ).
    IF ( sy-subrc <> 0 ).
      zcx_ewm_base_db=>raise_syst( ).
    ENDIF.

  ENDLOOP.


*=======================================================================
* POST move or unpack
*=======================================================================

  IF (     iv_save = abap_true
       AND /scwm/cl_pack=>gv_changed = abap_true ).

    lr_wm_packing->save(
      EXPORTING
        iv_commit = iv_commit
        iv_wait   = abap_true
      EXCEPTIONS
        error     = 1
        OTHERS    = 2 ).
    IF ( sy-subrc <> 0 ).
      IF ( iv_commit = abap_true ).
        ROLLBACK WORK.
      ENDIF.
      zcx_ewm_base_db=>raise_syst( ).
    ENDIF.

  ENDIF.










*
ENDMETHOD.


METHOD read.
*----------------------------------------------------------------------*
* Title  READ
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* GET header, item(s),tree(s),ref(s),ident(s) of one HU
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================
  DATA: lt_huident                    TYPE /scwm/tt_huident,
        lt_guid_hu                    TYPE /scwm/tt_guid_hu,
        ls_guid_hu                    TYPE /scwm/s_guid_hu,
        lt_huhdr                      TYPE /scwm/tt_huhdr_int.

*=======================================================================
* Input
*=======================================================================

  REFRESH: et_huitm, et_hutree, et_high, et_huref, et_ident.

  CLEAR: es_huhdr.


*=======================================================================
* Get data
*=======================================================================

  CLEAR: lt_huident, ls_guid_hu, lt_guid_hu.
  IF is_huident IS NOT INITIAL.
    APPEND is_huident TO lt_huident.
  ENDIF.
  IF iv_guid_hu IS NOT INITIAL.
    ls_guid_hu-guid_hu = iv_guid_hu.
    APPEND ls_guid_hu TO lt_guid_hu.
  ENDIF.

  CLEAR: lt_huhdr.
  zcl_ewm_base_db_hu=>read_multi(
    EXPORTING
      it_huident = lt_huident
      it_guid_hu = lt_guid_hu
    IMPORTING
      et_huhdr   = lt_huhdr
      et_huitm   = et_huitm
      et_hutree  = et_hutree
      et_high    = et_high
      et_huref   = et_huref
      et_ident   = et_ident ).

  IF iv_guid_hu IS NOT INITIAL.
    READ TABLE lt_huhdr
    INTO es_huhdr
    WITH KEY guid_hu = iv_guid_hu.
    IF sy-subrc <> 0.
*Error reading HU &1.
      RAISE EXCEPTION TYPE zcx_ewm_base_db
        EXPORTING
          textid     = zcx_ewm_base_db=>hu_read_guid
          gv_guid_hu = iv_guid_hu.
    ENDIF.
  ENDIF.

  IF is_huident IS NOT INITIAL.
    READ TABLE lt_huhdr
      INTO es_huhdr
        WITH KEY huident = is_huident-huident
         lgnum = is_huident-lgnum.
    IF sy-subrc <> 0.
*Error reading HU &1.
      RAISE EXCEPTION TYPE zcx_ewm_base_db
        EXPORTING
          textid     = zcx_ewm_base_db=>hu_read_huident
          GV_HUIDENT = is_huident-huident.
    ENDIF.
  ENDIF.










*
ENDMETHOD.


METHOD read_by_ident.
*----------------------------------------------------------------------*
* Title  MTHD READ_BY_IDENT
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Reads all Handling Units which are assigned to this alternative
* HU identification
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lt_ident_sel             TYPE rseloption,
  lt_idart_sel             TYPE rseloption.


*=======================================================================
* Input
*=======================================================================

  REFRESH: et_guid_hu, et_huhdr.


*=======================================================================
* READ GUIDs of the Handling Units assigned to this alternative ID
*=======================================================================

  zcl_ewm_base=>range_append_eq(
    EXPORTING
      iv_value = iv_idart
    CHANGING
      ct_range = lt_idart_sel ).

  zcl_ewm_base=>range_append_eq(
    EXPORTING
      iv_value = iv_ident
    CHANGING
      ct_range = lt_ident_sel ).

  CALL FUNCTION '/SCWM/HU_SELECT_IDENT'
    EXPORTING
      iv_lgnum    = iv_lgnum
      ir_addident = lt_ident_sel
      ir_idart    = lt_idart_sel
    IMPORTING
      et_guid_hu  = et_guid_hu.

  IF ( lines( et_guid_hu ) = 0 ).
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid      = zcx_ewm_base_db=>hu_read_by_ident
        gv_hu_ident = iv_ident.
  ENDIF.


*=======================================================================
* READ Handling Unit header data
*=======================================================================

  IF ( et_huhdr IS REQUESTED ).

    read_huhdr_multi(
      EXPORTING
        iv_lgnum   = iv_lgnum
        it_guid_hu = et_guid_hu
      IMPORTING
        et_huhdr   = et_huhdr ).

  ENDIF.









*
ENDMETHOD.


METHOD read_huhdr.
*----------------------------------------------------------------------*
* Title  READ_HUHDR
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author : David Nava
*----------------------------------------------------------------------*
* Program description:
* READ header data of this Handling Unit
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lt_guid_hu               TYPE /scwm/tt_guid_hu,

  ls_guid_hu               TYPE /scwm/s_guid_hu.


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* RESET buffer for this Handling Unit (otherwise SAP won't read again)
*=======================================================================

  IF ( iv_nobuf = abap_true ).

    IF ( iv_guid_hu IS NOT INITIAL ).

      ls_guid_hu-guid_hu = iv_guid_hu.
      APPEND ls_guid_hu TO lt_guid_hu.

      CALL FUNCTION '/SCWM/HUMAIN_REFRESH'
        EXPORTING
          it_hu_guids   = lt_guid_hu
        EXCEPTIONS
          error_message = 1
          OTHERS        = 2.
      IF ( sy-subrc <> 0 ).                                 "#EC NEEDED
      ENDIF.

    ENDIF.

  ENDIF.


*=======================================================================
* READ header data
*=======================================================================

  CALL FUNCTION '/SCWM/HU_READ'
    EXPORTING
      iv_appl    = iv_appl
      iv_top     = abap_false
      iv_lock    = iv_lock_mode
      iv_wait    = iv_lock_wait
      iv_guid_hu = iv_guid_hu
      iv_lgnum   = iv_lgnum
      iv_huident = iv_huident
    IMPORTING
      es_huhdr   = rs_huhdr
    EXCEPTIONS
      deleted    = 1
      not_found  = 2
      error      = 3
      OTHERS     = 4.

  IF ( sy-subrc = 0 ).
    RETURN.
  ENDIF.


*=======================================================================
* RAISE exception
*=======================================================================

  IF ( iv_guid_hu IS NOT INITIAL ).
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid     = zcx_ewm_base_db=>hu_read_huhdr_guid
        gv_guid_hu = iv_guid_hu.
  ELSE.
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid     = zcx_ewm_base_db=>hu_read_huhdr_huident
        gv_huident = iv_huident.
  ENDIF.

*=======================================================================
* GET HU STATUS
*=======================================================================
  CALL METHOD /scwm/cl_pack=>get_hu_status
    EXPORTING
      IV_OBJNR       = rs_huhdr-guid_hu
    IMPORTING
      EV_SYS_STATUS  = rs_huhdr-system_status
      EV_USER_STATUS = rs_huhdr-user_status
      EV_ICON_STATUS = rs_huhdr-icon_status.

















*
ENDMETHOD.


METHOD read_huhdr_multi.
*----------------------------------------------------------------------*
* Title  READ_HUHDR_MULTI
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Read head data of Handling Units
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  ls_huhdr                 TYPE /scwm/s_huhdr_int.


*=======================================================================
* Input
*=======================================================================

  ASSERT ID zewm_base_error
    CONDITION     iv_lgnum IS NOT INITIAL
              AND (    lines( it_huident ) > 0
                    OR lines( it_guid_hu ) > 0 ).

  IF (    iv_lgnum IS INITIAL
       OR (     lines( it_huident ) = 0
            AND lines( it_guid_hu ) = 0 ) ).
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid = zcx_ewm_base_db=>parameter_invalid.
  ENDIF.

  REFRESH: et_huhdr.


*=======================================================================
* RESET buffer for this Handling Unit (otherwise SAP won't read again)
*=======================================================================

  IF ( iv_nobuf = abap_true ).

    IF ( lines( it_guid_hu ) > 0 ).

      CALL FUNCTION '/SCWM/HUMAIN_REFRESH'
        EXPORTING
          it_hu_guids   = it_guid_hu
        EXCEPTIONS
          error_message = 1
          OTHERS        = 2.
      IF ( sy-subrc <> 0 ).                                 "#EC NEEDED
      ENDIF.

    ENDIF.

  ENDIF.


*=======================================================================
* READ header data
*=======================================================================

  CALL FUNCTION '/SCWM/HU_READ_MULT'
    EXPORTING
      it_huident   = it_huident
      it_guid_hu   = it_guid_hu
      iv_lock      = iv_lock_mode
      iv_lgnum     = iv_lgnum
    IMPORTING
      et_huhdr     = et_huhdr
    EXCEPTIONS
      wrong_input  = 1
      not_possible = 2
      OTHERS       = 3.

  IF ( sy-subrc <> 0 ).
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid = zcx_ewm_base_db=>hu_read_huhdr_multi.
  ENDIF.

  LOOP AT et_huhdr INTO ls_huhdr.

    READ TABLE it_huident TRANSPORTING NO FIELDS
      WITH KEY huident = ls_huhdr-huident.
    IF ( sy-subrc <> 0 ).
      READ TABLE it_guid_hu TRANSPORTING NO FIELDS
        WITH KEY guid_hu = ls_huhdr-guid_hu.
      IF ( sy-subrc <> 0 ).
        DELETE et_huhdr
          WHERE guid_hu = ls_huhdr-guid_hu.
        IF ( sy-subrc <> 0 ).                               "#EC NEEDED
        ENDIF.
      ENDIF.
    ENDIF.

  ENDLOOP.








*
ENDMETHOD.


METHOD read_huitm.
*----------------------------------------------------------------------*
* Title  MTHD READ_HUITM
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* Reads the items (stock) of a Handling Unit
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  REFRESH: et_huitm.


*=======================================================================
* Input
*=======================================================================

  ASSERT ID zewm_base_error
      CONDITION    iv_guid_hu IS NOT INITIAL
         OR (      iv_lgnum   IS NOT INITIAL
               AND iv_huident IS NOT INITIAL ).


  IF (          iv_guid_hu IS INITIAL
       AND  (   iv_huident IS INITIAL
             OR iv_lgnum   IS INITIAL ) ) .

    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid = zcx_ewm_base_db=>parameter_invalid.

  ENDIF.



*=======================================================================
* READ items (stock)
*=======================================================================

  CALL FUNCTION '/SCWM/HU_READ'
    EXPORTING
      iv_appl    = iv_appl
      iv_guid_hu = iv_guid_hu
      iv_huident = iv_huident
      iv_lgnum   = iv_lgnum
    IMPORTING
      et_huitm   = et_huitm
    EXCEPTIONS
      OTHERS     = 1.

  IF ( sy-subrc <> 0 ).
    zcx_ewm_base_db=>raise_syst( ).
  ENDIF.

  IF ( lines( et_huitm ) = 0 ).
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid = zcx_ewm_base_db=>hu_read_huitm.
  ENDIF.










*
ENDMETHOD.


METHOD read_ident.
*----------------------------------------------------------------------*
* Title MTD READ_IDENT
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Read alternative HU identification by type
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:
    lt_idart               TYPE rseloption,
    lt_guid_hu             TYPE rseloption,
    lt_hu_ident            TYPE zewm_tt_base_hu_ident.


*=======================================================================
* Input
*=======================================================================

  zcl_ewm_base=>range_append_eq(
    EXPORTING
      iv_value = iv_idart
    CHANGING
      ct_range = lt_idart ).

  zcl_ewm_base=>range_append_eq(
    EXPORTING
      iv_value = iv_guid_hu
    CHANGING
      ct_range = lt_guid_hu ).


*=======================================================================
* READ alternative HU identification
*=======================================================================

  lt_hu_ident  = zcl_ewm_base_db_hu=>read_ident_by_range(
                   it_guid_hu = lt_guid_hu
                   it_idart   = lt_idart ).

  READ TABLE lt_hu_ident
    INTO rs_hu_ident
    INDEX 1.
  IF sy-subrc <> 0.
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid     = zcx_ewm_base_db=>hu_read_ident
        gv_huidart = iv_idart.
  ENDIF.







*
ENDMETHOD.


METHOD read_ident_by_range.
*----------------------------------------------------------------------*
* Title MTD READ_IDENT
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Read alternative HU identification by type
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  FIELD-SYMBOLS:

    <lt_guid_hu> TYPE rseloption,
    <lt_idart>   TYPE rseloption,
    <lt_ident>   TYPE rseloption.


  DATA:

    lt_guid_hu TYPE rseloption,
    lt_idart   TYPE rseloption,
    lt_ident   TYPE rseloption,

    ls_guid_hu TYPE /scwm/s_guid_hu.


*=======================================================================
* Input
*=======================================================================

* .Handling Unit IDs
  ASSIGN it_guid_hu TO <lt_guid_hu>.
  IF ( iv_guid_hu IS NOT INITIAL ).
    ASSIGN lt_guid_hu TO <lt_guid_hu>.
    <lt_guid_hu> = it_guid_hu.
    zcl_ewm_base=>range_append_eq(
      EXPORTING
        iv_value = iv_guid_hu
      CHANGING
        ct_range = <lt_guid_hu> ).
  ELSEIF ( lines( it_guid_hu_2 ) > 0 ).
    ASSIGN lt_guid_hu TO <lt_guid_hu>.
    <lt_guid_hu> = it_guid_hu.
    LOOP AT it_guid_hu_2 INTO ls_guid_hu.
      zcl_ewm_base=>range_append_eq(
        EXPORTING
          iv_value = ls_guid_hu-guid_hu
        CHANGING
          ct_range = <lt_guid_hu> ).
    ENDLOOP.
  ENDIF.

* .Type - alternative HU identification
  ASSIGN it_idart TO <lt_idart>.
  IF ( iv_idart IS NOT INITIAL ).
    ASSIGN lt_idart TO <lt_idart>.
    <lt_idart> = it_idart.
    zcl_ewm_base=>range_append_eq(
      EXPORTING
        iv_value = iv_idart
      CHANGING
        ct_range = <lt_idart> ).
  ENDIF.

* .Number - alternative HU identification
  ASSIGN it_ident TO <lt_ident>.
  IF ( iv_ident IS NOT INITIAL ).
    ASSIGN lt_ident TO <lt_ident>.
    <lt_ident> = it_ident.
    zcl_ewm_base=>range_append_eq(
      EXPORTING
        iv_value = iv_ident
      CHANGING
        ct_range = <lt_ident> ).
  ENDIF.


*=======================================================================
* READ alternative identifications
*=======================================================================

  IF ( iv_all = abap_false ).
*HANA CC: BEGIN OF CODE ADJUSTMENT # COARSOLARI # 25.11.2022
*    SELECT *
*      INTO TABLE rt_ident
*      FROM /scwm/hu_ident
*      WHERE guid_hu IN <lt_guid_hu>
*        AND idart   IN <lt_idart>
*        AND huident IN <lt_ident>.

     SELECT *
      INTO TABLE rt_ident
      FROM /scwm/hu_ident
      WHERE guid_hu IN <lt_guid_hu>
        AND idart   IN <lt_idart>
        AND huident IN <lt_ident>
      ORDER BY PRIMARY KEY.
*HANA CC: END OF CODE ADJUSTMENT # COARSOLARI # 25.11.2022



    IF ( sy-subrc <> 0 ).                                   "#EC NEEDED
    ENDIF.

  ELSE.

    IF ( lines( <lt_guid_hu> ) > 0 ).

*HANA CC: BEGIN OF CODE ADJUSTMENT # COAGFIGLIOLI # 29.11.2022
*      SELECT *
*        INTO TABLE rt_ident
*        FROM /scwm/hu_ident
*        WHERE guid_hu IN <lt_guid_hu>.

      SELECT *
        INTO TABLE rt_ident
        FROM /scwm/hu_ident
        WHERE guid_hu IN <lt_guid_hu>
        ORDER BY PRIMARY KEY.

*HANA CC: END OF CODE ADJUSTMENT # COAGFIGLIOLI # 29.11.2022

      IF ( sy-subrc <> 0 ).                                 "#EC NEEDED
      ENDIF.

    ELSE.

*HANA CC: BEGIN OF CODE ADJUSTMENT # COAGFIGLIOLI # 29.11.2022
*      SELECT *
*        INTO TABLE rt_ident
*        FROM /scwm/hu_ident
*        WHERE guid_hu IN ( SELECT guid_hu
*                             FROM /scwm/hu_ident
*                             WHERE idart   IN <lt_idart>
*                               AND huident IN <lt_ident> ).

      SELECT *
        INTO TABLE rt_ident
        FROM /scwm/hu_ident
        WHERE guid_hu IN ( SELECT guid_hu
                             FROM /scwm/hu_ident
                             WHERE idart   IN <lt_idart>
                               AND huident IN <lt_ident> )
        ORDER BY PRIMARY KEY.

*HANA CC: END OF CODE ADJUSTMENT # COAGFIGLIOLI # 29.11.2022

      IF ( sy-subrc <> 0 ).                                 "#EC NEEDED
      ENDIF.

    ENDIF.

  ENDIF.


  IF ( lines( rt_ident ) = 0 ).
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid = zcx_ewm_base_db=>hu_read_ident_by_range.
  ENDIF.












*
ENDMETHOD.


METHOD read_multi.
*----------------------------------------------------------------------*
* Title  GET_MULTI
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* GET header(s), item(s),tree(s),ref(s),ident(s) of HU(s)
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* Get data
*=======================================================================
  CALL FUNCTION '/SCWM/HU_READ_MULT'
    EXPORTING
      it_huident   = it_huident
      it_guid_hu   = it_guid_hu
      iv_lgnum     = iv_lgnum
    IMPORTING
      et_huhdr     = et_huhdr
      et_huitm     = et_huitm
      et_hutree    = et_hutree
      et_high      = et_high
      et_huref     = et_huref
      et_ident     = et_ident
      et_guid_hu   = et_guid_hu
    EXCEPTIONS
      wrong_input  = 1
      not_possible = 2
      OTHERS       = 3.
  IF sy-subrc <> 0.
    zcx_ewm_base_db=>raise_syst( ).
  ENDIF.








*
ENDMETHOD.


METHOD read_status.
*----------------------------------------------------------------------*
* Title  READ_STATUS
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Read system status of a Handling Unit
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lt_huhdr                 TYPE /scwm/tt_huhdr_int,
  lt_hustatus              TYPE /scwm/tt_hustatus,

  ls_huhdr                 TYPE /scwm/s_huhdr_int.


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* READ Handling Unit status (system)
*=======================================================================

  ls_huhdr-guid_hu = iv_guid_hu.
  APPEND ls_huhdr TO lt_huhdr.


  CALL FUNCTION '/SCWM/HU_STATUS_SELECT'
    EXPORTING
      iv_stat   = iv_stat
      it_huhdr  = lt_huhdr
    IMPORTING
      et_hustat = lt_hustatus.

  IF ( LINES( lt_hustatus ) = 1 ).
    READ TABLE lt_hustatus INTO rs_hustatus
      INDEX 1.
    ASSERT sy-subrc = 0.
  ELSE.
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid       = zcx_ewm_base_db=>hu_read_status
        gv_hu_status = iv_stat.
  ENDIF.














*
ENDMETHOD.


METHOD READ_STATUS_ALL.
*----------------------------------------------------------------------*
* Title  READ_STATUS
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Read system status of a Handling Unit
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lt_huhdr                 TYPE /scwm/tt_huhdr_int,
  lt_hustatus              TYPE /scwm/tt_hustatus,

  ls_huhdr                 TYPE /scwm/s_huhdr_int.


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* READ Handling Unit status (system)
*=======================================================================

  ls_huhdr-guid_hu = iv_guid_hu.
  APPEND ls_huhdr TO lt_huhdr.


  CALL FUNCTION '/SCWM/HU_STATUS_SELECT'
    EXPORTING
      it_huhdr  = lt_huhdr
    IMPORTING
      et_hustat = lt_hustatus.

  IF ( LINES( lt_hustatus ) > 0 ).
    rt_hustatus = lt_hustatus.
  ELSE.
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid       = zcx_ewm_base_db=>hu_read_status.
  ENDIF.














*
ENDMETHOD.


METHOD REMOVE_IDENT.
*----------------------------------------------------------------------*
* Title  SET_IDENT
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Add an alternative HU identification
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lr_buffer                TYPE REF TO zcl_ewm_base_db_hu,
  lr_pack                  TYPE REF TO /scwm/cl_pack,
  lr_wm_packing            TYPE REF TO /scwm/cl_wm_packing,

  lt_guid_hu               TYPE /scwm/tt_guid_hu,

  ls_huhdr_int             TYPE /scwm/s_huhdr_int,
  ls_guid_hu               TYPE /scwm/s_guid_hu,

  lv_guid_hu               TYPE /scwm/guid_hu.


*=======================================================================
* Input
*=======================================================================

  lr_buffer = get_instance( ).


*=======================================================================
* SET packaging framework
*=======================================================================

  lr_pack = ir_pack.
  IF ( lr_pack IS NOT BOUND ).
    /scwm/cl_wm_packing=>get_instance(
      IMPORTING
        eo_instance = lr_wm_packing ).
    lr_pack = lr_wm_packing.
  ENDIF.


*=======================================================================
* RE-SET global data
*=======================================================================

  IF ( iv_cleanup = abap_true ).
    lr_pack->/scwm/if_pack_bas~cleanup( ).
  ENDIF.


*=======================================================================
* GET Head data of the Handling Units
*=======================================================================

  lv_guid_hu = iv_guid_hu.

  IF ( iv_huident IS NOT INITIAL ).
    ls_huhdr_int = get_huhdr( iv_lgnum   = iv_lgnum
                              iv_huident = iv_huident ).
    lv_guid_hu = ls_huhdr_int-guid_hu.
  ENDIF.

  ls_guid_hu-guid_hu = lv_guid_hu.
  APPEND ls_guid_hu TO lt_guid_hu.


*=======================================================================
* SET initial packaging data
*=======================================================================

  IF ( iv_init_pack = abap_true ).

    lr_pack->init_pack(
      EXPORTING
        iv_badi_appl   = wmegc_huappl_wme
        it_guid_hu     = lt_guid_hu
      EXCEPTIONS
        error          = 1
        OTHERS         = 2 ).
    IF ( sy-subrc <> 0 ).
      RAISE EXCEPTION TYPE zcx_ewm_base_db
        EXPORTING
          textid = zcx_ewm_base_db=>hu_set_ident_pack_init.
    ENDIF.

  ENDIF.


*=======================================================================
* SET the alternative HU identification
*=======================================================================

  LOOP AT lt_guid_hu INTO ls_guid_hu.

    lr_pack->/scwm/if_pack_bas~hu_ident_remove(
      EXPORTING
        iv_guid_hu = ls_guid_hu-guid_hu
        iv_idart   = iv_idart
      EXCEPTIONS
        error      = 1 ).

    IF ( sy-subrc <> 0 ).
      zcx_ewm_base_db=>raise_syst( ).
    ENDIF.

  ENDLOOP.


*=======================================================================
* POST assignment
*=======================================================================

  IF (     iv_save = abap_true
       AND /scwm/cl_pack=>gv_changed = abap_true ).

    lr_pack->save(
      EXPORTING
        iv_commit = iv_commit
        iv_wait   = abap_true
      EXCEPTIONS
        error     = 1
        OTHERS    = 2 ).
    IF ( sy-subrc <> 0 ).
      IF ( iv_commit = abap_true ).
        ROLLBACK WORK.
      ENDIF.
      zcx_ewm_base_db=>raise_syst( ).
    ENDIF.

  ENDIF.


*=======================================================================
* UPDATE local buffer
*=======================================================================

  LOOP AT lt_guid_hu INTO ls_guid_hu.

      DELETE lr_buffer->gt_ident
        WHERE guid_hu = ls_guid_hu-guid_hu
          AND idart   = iv_idart.
      IF ( sy-subrc <> 0 ).                                 "#EC NEEDED
      ENDIF.

  ENDLOOP.











*
ENDMETHOD.


METHOD REPLACE_IDENT_REASON.
**----------------------------------------------------------------------*
** Title MTHD SET_INDET_REASON.
** Copyright (c) 2024 ProLogic LA S.C. All rights reserved
**----------------------------------------------------------------------*
** Project Rel. : Indumotora
** Author       : David Nava
**----------------------------------------------------------------------*
** Program description:
** SET Reason Description
**----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* REMOVE alternative HU identification: Reason
*=======================================================================
  remove_ident(
      iv_lgnum       = iv_lgnum
      iv_huident     = iv_huident
      iv_guid_hu     = iv_guid_hu
      iv_cleanup     = abap_false
      iv_idart       = zwmgc_huidart_reason
      iv_init_pack   = iv_init_pack
      iv_save        = abap_false
      ir_pack        = ir_pack ).


*=======================================================================
* SET alternative HU identification: Reason
*=======================================================================

  set_ident(
    EXPORTING
      iv_lgnum       = iv_lgnum
      iv_huident     = iv_huident
      iv_guid_hu     = iv_guid_hu
      iv_commit      = iv_commit
      iv_nobuf       = iv_nobuf
      iv_cleanup     = abap_false
      iv_idart       = zwmgc_huidart_reason
      iv_init_pack   = abap_false
      iv_save        = iv_save
      iv_huident_ext = iv_huident_ext
      ir_pack        = ir_pack ).











*
ENDMETHOD.


METHOD set_ident.
*----------------------------------------------------------------------*
* Title  SET_IDENT
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Add an alternative HU identification
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lr_buffer                TYPE REF TO zcl_ewm_base_db_hu,
  lr_pack                  TYPE REF TO /scwm/cl_pack,
  lr_wm_packing            TYPE REF TO /scwm/cl_wm_packing,

  lt_guid_hu               TYPE /scwm/tt_guid_hu,

  ls_huhdr_int             TYPE /scwm/s_huhdr_int,
  ls_guid_hu               TYPE /scwm/s_guid_hu,

  lv_guid_hu               TYPE /scwm/guid_hu,
  lv_huident_ext           TYPE /scwm/de_ident.


*=======================================================================
* Input
*=======================================================================

  lr_buffer = get_instance( ).

  lv_huident_ext = iv_huident_ext.


*=======================================================================
* SET packaging framework
*=======================================================================

  lr_pack = ir_pack.
  IF ( lr_pack IS NOT BOUND ).
    /scwm/cl_wm_packing=>get_instance(
      IMPORTING
        eo_instance = lr_wm_packing ).
    lr_pack = lr_wm_packing.
  ENDIF.


*=======================================================================
* RE-SET global data
*=======================================================================

  IF ( iv_cleanup = abap_true ).
    lr_pack->/scwm/if_pack_bas~cleanup( ).
  ENDIF.


*=======================================================================
* GET Head data of the Handling Units
*=======================================================================

  lv_guid_hu = iv_guid_hu.

  IF ( iv_huident IS NOT INITIAL ).
    ls_huhdr_int = get_huhdr( iv_lgnum   = iv_lgnum
                              iv_huident = iv_huident ).
    lv_guid_hu = ls_huhdr_int-guid_hu.
  ENDIF.

  ls_guid_hu-guid_hu = lv_guid_hu.
  APPEND ls_guid_hu TO lt_guid_hu.


*=======================================================================
* SET initial packaging data
*=======================================================================

  IF ( iv_init_pack = abap_true ).

    lr_pack->init_pack(
      EXPORTING
        iv_badi_appl   = wmegc_huappl_wme
        it_guid_hu     = lt_guid_hu
      EXCEPTIONS
        error          = 1
        OTHERS         = 2 ).
    IF ( sy-subrc <> 0 ).
      RAISE EXCEPTION TYPE zcx_ewm_base_db
        EXPORTING
          textid = zcx_ewm_base_db=>hu_set_ident_pack_init.
    ENDIF.

  ENDIF.


*=======================================================================
* SET the alternative HU identification
*=======================================================================

  LOOP AT lt_guid_hu INTO ls_guid_hu.

    lr_pack->/scwm/if_pack_bas~hu_ident_set(
      EXPORTING
        iv_guid_hu = ls_guid_hu-guid_hu
        iv_huident = lv_huident_ext
        iv_idart   = iv_idart
      EXCEPTIONS
        error      = 1
        OTHERS     = 2 ).

    IF ( sy-subrc <> 0 ).
      zcx_ewm_base_db=>raise_syst( ).
    ENDIF.

  ENDLOOP.


*=======================================================================
* POST assignment
*=======================================================================

  IF (     iv_save = abap_true
       AND /scwm/cl_pack=>gv_changed = abap_true ).

    lr_pack->save(
      EXPORTING
        iv_commit = iv_commit
        iv_wait   = abap_true
      EXCEPTIONS
        error     = 1
        OTHERS    = 2 ).
    IF ( sy-subrc <> 0 ).
      IF ( iv_commit = abap_true ).
        ROLLBACK WORK.
      ENDIF.
      zcx_ewm_base_db=>raise_syst( ).
    ENDIF.

  ENDIF.


*=======================================================================
* UPDATE local buffer
*=======================================================================

  LOOP AT lt_guid_hu INTO ls_guid_hu.

    IF ( iv_nobuf = abap_false ).

      set_ident_buffer( iv_guid_hu = ls_guid_hu-guid_hu
                        iv_idart   = iv_idart
                        iv_ident   = lv_huident_ext ).

    ELSE.

      DELETE lr_buffer->gt_ident
        WHERE guid_hu = ls_guid_hu-guid_hu
          AND idart   = iv_idart.
      IF ( sy-subrc <> 0 ).                                 "#EC NEEDED
      ENDIF.

    ENDIF.

  ENDLOOP.










*
ENDMETHOD.


METHOD set_ident_buffer.
*----------------------------------------------------------------------*
* Title  MTHD SET_IDENT_BUFFER
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Add this alternative HU identification to the local buffer
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  FIELD-SYMBOLS:

  <ls_ident>               TYPE /scwm/hu_ident.


  DATA:

  lr_buffer                TYPE REF TO zcl_ewm_base_db_hu,

  ls_ident                 TYPE /scwm/hu_ident.


*=======================================================================
* Input
*=======================================================================

  lr_buffer = get_instance( ).

  IF ( is_ident IS NOT INITIAL ).
    ls_ident = is_ident.
  ELSE.
    ls_ident-guid_hu = iv_guid_hu.
    ls_ident-idart   = iv_idart.
    ls_ident-huident = iv_ident.
  ENDIF.


*=======================================================================
* ADD/UPDATE alternative HU identification
*=======================================================================

  READ TABLE lr_buffer->gt_ident ASSIGNING <ls_ident>
    WITH KEY guid_hu = ls_ident-guid_hu
             idart   = ls_ident-idart.

  IF ( sy-subrc <> 0 ).
    APPEND INITIAL LINE TO lr_buffer->gt_ident ASSIGNING <ls_ident>.
    ASSERT <ls_ident> IS ASSIGNED.
  ENDIF.

  <ls_ident> = ls_ident.











*
ENDMETHOD.


METHOD set_status_int.
*----------------------------------------------------------------------*
* Title  MTHD SET_STATUS_INT
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Insert or update this HU status in the local buffer
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  FIELD-SYMBOLS:

  <ls_hustatus>            TYPE /scwm/s_hustatus.


  DATA:

  lr_buffer                TYPE REF TO zcl_ewm_base_db_hu.


*=======================================================================
* Input
*=======================================================================

  lr_buffer = get_instance( ).


*=======================================================================
* ADD/UPDATE HU status
*=======================================================================

  READ TABLE lr_buffer->gt_hustatus ASSIGNING <ls_hustatus>
    WITH KEY objnr = iv_guid_hu
             stat  = iv_status.

  IF ( sy-subrc <> 0 ).
    APPEND INITIAL LINE TO lr_buffer->gt_hustatus
      ASSIGNING <ls_hustatus>.
    ASSERT <ls_hustatus> IS ASSIGNED.
    <ls_hustatus>-objnr = iv_guid_hu.
    <ls_hustatus>-stat  = iv_status.
  ENDIF.

  <ls_hustatus>-inact = iv_inactive.










*
ENDMETHOD.


METHOD set_status_user.
*----------------------------------------------------------------------*
* Title MTHD: SET_STATUS_USER
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Set HU user status
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:
    lr_pack                  TYPE REF TO /scwm/cl_pack,
    lr_wm_packing            TYPE REF TO /scwm/cl_wm_packing,

    lt_guid_hu               TYPE /scwm/tt_guid_hu,

    ls_huhdr_int             TYPE /scwm/s_huhdr_int,
    ls_guid_hu               TYPE /scwm/s_guid_hu,

    lv_guid_hu               TYPE /scwm/guid_hu.


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* SET packaging framework
*=======================================================================

  lr_pack = ir_pack.
  IF ( lr_pack IS NOT BOUND ).
    /scwm/cl_wm_packing=>get_instance(
      IMPORTING
        eo_instance = lr_wm_packing ).
    lr_pack = lr_wm_packing.
  ENDIF.


*=======================================================================
* RE-SET global data
*=======================================================================

  IF ( iv_cleanup = abap_true ).
    lr_pack->/scwm/if_pack_bas~cleanup( ).
  ENDIF.


*=======================================================================
* GET Head data of the Handling Units
*=======================================================================

  lv_guid_hu = iv_guid_hu.

  IF iv_huident IS NOT INITIAL.
    ls_huhdr_int = get_huhdr( iv_lgnum   = iv_lgnum
                              iv_huident = iv_huident ).
    lv_guid_hu = ls_huhdr_int-guid_hu.
  ENDIF.

  ls_guid_hu-guid_hu = lv_guid_hu.
  APPEND ls_guid_hu TO lt_guid_hu.


*=======================================================================
* SET initial packaging data
*=======================================================================

  IF iv_init_pack = abap_true.

    lr_pack->init_pack(
      EXPORTING
        iv_badi_appl   = wmegc_huappl_wme
        it_guid_hu     = lt_guid_hu
      EXCEPTIONS
        error          = 1
        OTHERS         = 2 ).
    IF ( sy-subrc <> 0 ).
      RAISE EXCEPTION TYPE zcx_ewm_base_db
        EXPORTING
          textid = zcx_ewm_base_db=>hu_set_ident_pack_init.
    ENDIF.

  ENDIF.


*=======================================================================
* SET the user status
*=======================================================================

  lr_pack->user_status_maintain(
    EXPORTING
      iv_guid_hu    = lv_guid_hu
      iv_status     = iv_status
    EXCEPTIONS
      error         = 1
      OTHERS        = 2 ).

  IF sy-subrc <> 0.
    zcx_ewm_base_db=>raise_syst( ).
  ENDIF.


*=======================================================================
* POST assignment
*=======================================================================

  IF iv_save = abap_true AND
     /scwm/cl_pack=>gv_changed = abap_true.

    lr_pack->save(
      EXPORTING
        iv_commit = iv_commit
        iv_wait   = abap_true
      EXCEPTIONS
        error     = 1
        OTHERS    = 2 ).

    IF sy-subrc <> 0.
      IF iv_commit = abap_true.
        ROLLBACK WORK.
      ENDIF.
      zcx_ewm_base_db=>raise_syst( ).
    ENDIF.

  ENDIF.










*
ENDMETHOD.


METHOD zif_ewm_base_tm_appl~cleanup.
*----------------------------------------------------------------------*
* Title  MTHD ZIF_EWM_base_TM_APPL~CLEANUP
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author : David Nava
*----------------------------------------------------------------------*
* Program description:
* Register application buffer for cleanup processing
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lr_buffer                TYPE REF TO zcl_ewm_base_db_hu.


*=======================================================================
* Input
*=======================================================================

  BREAK-POINT ID zewm_base_cleanup.

  lr_buffer = get_instance( ).


*=======================================================================
* CHECK If application buffer is already registered?
*=======================================================================

  IF ( lr_buffer->gv_cleanup_reg = abap_true ).
*   .yes
    RETURN.
  ENDIF.


*=======================================================================
* REGISTER application buffer for cleanup
*=======================================================================

  lr_buffer->gv_cleanup_reg = abap_true.

  IF ( iv_reason IS NOT INITIAL ).
    lr_buffer->gv_cleanup_reason = iv_reason.
  ENDIF.

  zcl_ewm_base=>register_cleanup( ir_application = lr_buffer ).

  /scwm/cl_tm=>register_cleanup_hu( ).












*
ENDMETHOD.


METHOD zif_ewm_base_tm_appl~cleanup_now.
*----------------------------------------------------------------------*
* Title  MTHD ZIF_EWM_base_TM_APPL~CLEANUP_NOW
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author : David Nava
*----------------------------------------------------------------------*
* Program description:
* Delete buffered data immediately
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lr_buffer                TYPE REF TO zcl_ewm_base_db_hu.


*=======================================================================
* Input
*=======================================================================

  BREAK-POINT ID zewm_base_cleanup.

  lr_buffer = get_instance( ).


*=======================================================================
* EXEC cleanup
*=======================================================================

  lr_buffer->gv_cleanup_reg    = abap_true.
  lr_buffer->gv_cleanup_reason = gc_cleanup_end.

  lr_buffer->/scwm/if_tm_appl~cleanup(
    iv_reason = lr_buffer->gv_cleanup_reason ).

  /scwm/cl_pack_tm=>cleanup(
    EXPORTING
      iv_lgnum = iv_lgnum
      iv_appl  = wmegc_huappl_wme ).

  CALL FUNCTION '/SCWM/ADD_HU_UPDATE'
    EXPORTING
      iv_cleanup = abap_true.







*
ENDMETHOD.
ENDCLASS.
