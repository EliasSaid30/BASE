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
class ZCL_EWM_BASE_DB_PACK definition
  public
  final
  create public .

public section.

  methods INIT_PACK
    importing
      !IV_BADI_APPL type /SCWM/DE_HUAPPL
      !IT_GUID_HU type /SCWM/TT_GUID_HU optional
      !IV_LGNUM type /SCWM/LGNUM optional
    raising
      ZCX_EWM_BASE_DB .
  methods AFTER_SAVE
    importing
      !IV_COMMIT type ABAP_BOOL
      !IV_WAIT type ABAP_BOOL .
  methods HU_CREATE
    importing
      !IV_PMAT type /SCWM/DE_MATID
      !IV_HUIDENT type /SCWM/HUIDENT optional
      !IS_HU_CREATE type /SCWM/S_HUHDR_CREATE_EXT optional
      !IV_LGPLA type /SCWM/DE_LGPLA
    exporting
      !ES_HUHDR type /SCWM/S_HUHDR_INT
    raising
      ZCX_EWM_BASE_DB .
  methods HU_REPACK_TO_HU
    importing
      !IV_DEST_HU type /SCWM/GUID_HU
      !IV_SOURCE_HU type /SCWM/GUID_HU
      !IV_STOCK_GUID type /LIME/GUID_STOCK
      !IS_QUANTITY type /SCWM/S_QUAN
    exporting
      !ES_QUANTITY type /SCWM/S_QUAN
    raising
      ZCX_EWM_BASE .
  methods HU_REPACK_TO_LGPLA
    importing
      !IV_SOURCE_HU type /SCWM/GUID_HU
      !IV_STOCK_GUID type /LIME/GUID_STOCK
      !IS_QUANTITY type /SCWM/S_QUAN
      !IV_DEST_LGPLA type /SCWM/LGPLA
    exporting
      !ES_QUANTITY type /SCWM/S_QUAN
    raising
      ZCX_EWM_BASE_DB .
  methods INIT
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_PROCTY type /SCWM/DE_PROCTY optional
      !IS_PACK_CONTROLE type /SCWM/S_PACK_CONTROLE optional
    raising
      ZCX_EWM_BASE_DB .
  methods SAVE
    importing
      !IV_COMMIT type ABAP_BOOL
      !IV_WAIT type ABAP_BOOL
    raising
      ZCX_EWM_BASE_DB .
  methods CONSTRUCTOR .
  methods HU_INTO_HU
    importing
      !IV_HU_SOURCE type /SCWM/GUID_HU
      !IV_HU_DEST type /SCWM/GUID_HU
    raising
      ZCX_EWM_BASE_DB .
  class-methods CLEANUP
    importing
      !IR_WM_PACKING type ref to /SCWM/CL_WM_PACKING .
  methods EMPTY_HU
    importing
      !IV_HU type /SCWM/GUID_HU
      !IV_DEST_LGPLA type /SCWM/DE_LGPLA optional
      !IV_DEST_HU type /SCWM/GUID_HU optional
    raising
      ZCX_EWM_BASE .
  class-methods CLOSE_HU
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_WRK_STN type /SCWM/DE_WORKSTATION
      !IV_GUID_HU type /SCWM/GUID_HU
    raising
      ZCX_EWM_BASE_DB .
protected section.

  data SR_PACK type ref to /SCWM/CL_WM_PACKING .
private section.
ENDCLASS.



CLASS ZCL_EWM_BASE_DB_PACK IMPLEMENTATION.


METHOD after_save.
*----------------------------------------------------------------------*
* Title  AFTER_SAVE
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Company:  PROLOGIC
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* Things That Need to be Done After the Save
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* ...
*=======================================================================
  sr_pack->after_save(
      iv_commit = iv_commit
      iv_wait   = iv_wait ).











*
ENDMETHOD.


METHOD cleanup.
*----------------------------------------------------------------------*
* Title  MTHD CLEANUP
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Company:  PROLOGIC
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* Clear global static buffers
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lr_wm_packing            TYPE REF TO /scwm/cl_wm_packing.


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
* EXEC clean-up
*=======================================================================

  lr_wm_packing->/scwm/if_pack_bas~cleanup( ).












*
ENDMETHOD.


 METHOD close_hu.
*----------------------------------------------------------------------*
* Title  MTHD CLOSE_HU
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author : Elias Hernandez
*----------------------------------------------------------------------*
* Program description:
* Method : Close HU
*----------------------------------------------------------------------*

*=======================================================================
* Declaration
*=======================================================================

  DATA:
    ls_wrkc                TYPE /scwm/tworkst,
    ls_pack_controle       TYPE /scwm/s_pack_controle,
    ls_workst              TYPE /scwm/tworkst,

    lo_wm_pack             TYPE REF TO /scwm/cl_wm_packing,
    lr_log                 TYPE REF TO /scwm/cl_log           ##NEEDED.


*=======================================================================
* Initialization
*=======================================================================

  CALL METHOD /scwm/cl_wm_packing=>get_instance
    IMPORTING
      eo_instance = lo_wm_pack.

  ls_pack_controle-cdstgrp_mat   = abap_true.
  ls_pack_controle-cdstgrp_hu    = abap_true.
  ls_pack_controle-processor_det = abap_true.

  CALL FUNCTION '/SCWM/TWORKST_READ_SINGLE'
    EXPORTING
      iv_lgnum             = iv_lgnum
      iv_workstation       = iv_wrk_stn
   IMPORTING
      ES_WORKST            = ls_workst

   EXCEPTIONS
     ERROR                = 1
     NOT_FOUND            = 2
     OTHERS               = 3
            .
  IF sy-subrc <> 0.
* Workcenter no found
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid     = zcx_ewm_base_db=>wrk_ctr_not_found
        gv_wrkctr  = iv_wrk_stn.
  ENDIF.

  ls_wrkc-lgnum       = iv_lgnum.
  ls_wrkc-workstation = iv_wrk_stn.
  ls_wrkc-procs       = ls_workst-procs.

   CALL METHOD /scwm/cl_tm=>set_lgnum( iv_lgnum ).

  CALL METHOD lo_wm_pack->init_by_workstation
    EXPORTING
      is_workstation   = ls_wrkc
      is_pack_controle = ls_pack_controle
      iv_no_hu_by_wc   = abap_true
    EXCEPTIONS
      error            = 1
      OTHERS           = 2.

  IF sy-subrc <> 0.
    /scwm/cl_pack_view=>msg_error( ).
  ENDIF.

  CALL METHOD lo_wm_pack->hu_process_completed
      EXPORTING
        iv_hu  = iv_guid_hu
      EXCEPTIONS
        error  = 1
        OTHERS = 2.

  IF sy-subrc <> 0.
*     in case of error, release the lock
      CALL FUNCTION 'DEQUEUE_/SCWM/EHU'
        EXPORTING
          mode_/scwm/s_huhdr_int = 'E'
          mandt                  = sy-mandt
*          huident                = iv_guid_hu
          lgnum                  = iv_lgnum
          _scope                 = '2'.

      /scwm/cl_pack_view=>msg_error( ).
  ENDIF.

  CALL METHOD lo_wm_pack->/scwm/if_pack~save
    EXPORTING
      iv_commit = abap_true
      iv_wait   = abap_true
    EXCEPTIONS
        error     = 1
        OTHERS    = 2.
    IF sy-subrc <> 0.
      /scwm/cl_pack_view=>msg_error( ).
    ENDIF.









*
  ENDMETHOD.


METHOD constructor.
*----------------------------------------------------------------------*
* Title  CONSTRUCTOR
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Company:  PROLOGIC
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* Constructor
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  /scwm/cl_wm_packing=>get_instance(
    IMPORTING
      eo_instance = sr_pack ).


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* ...
*=======================================================================



ENDMETHOD.


METHOD empty_hu.
*----------------------------------------------------------------------*
* Title  EMPTY_HU
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Company:  PROLOGIC
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* Empty HU / Repack complete HU
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================
  DATA:

    lv_rcode               TYPE sy-subrc.

*=======================================================================
* Input
*=======================================================================


*=======================================================================
* ...
*=======================================================================

  sr_pack->empty_hu(
    EXPORTING
      iv_hu         = iv_hu
      iv_dest_lgpla = iv_dest_lgpla
      iv_dest_hu    = iv_dest_hu
    IMPORTING
      ev_rcode      = lv_rcode
    EXCEPTIONS
      error         = 1
      OTHERS        = 2 ).
  IF sy-subrc <> 0 OR lv_rcode <> 0.
    zcx_ewm_base_db=>raise_syst( ).
  ENDIF.











*
ENDMETHOD.


METHOD hu_create.
*----------------------------------------------------------------------*
* Title  HU_CREATE
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Company:  PROLOGIC
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* Create Handling Unit
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================
  CLEAR es_huhdr.

*=======================================================================
* Input
*=======================================================================


*=======================================================================
* ...
*=======================================================================
  sr_pack->/scwm/if_pack_bas~create_hu(
    EXPORTING
      iv_pmat      = iv_pmat
      iv_huident   = iv_huident
      is_hu_create = is_hu_create
      i_location   = iv_lgpla
    RECEIVING
      es_huhdr     = es_huhdr
    EXCEPTIONS
      error        = 1
      OTHERS       = 2 ).
  IF sy-subrc <> 0.
    zcx_ewm_base_db=>raise_syst( ).
  ENDIF.











*
ENDMETHOD.


METHOD hu_into_hu.
*----------------------------------------------------------------------*
* Title  HU_INTO_HU
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Company:  PROLOGIC
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* Pack one HU into another
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================
*  DATA:

*=======================================================================
* Input
*=======================================================================


*=======================================================================
* ...
*=======================================================================
  sr_pack->/scwm/if_pack_bas~pack_hu(
    EXPORTING
      iv_source_hu = iv_hu_source
      iv_dest_hu   = iv_hu_dest
    EXCEPTIONS
      error        = 1
      OTHERS       = 2 ).
  IF sy-subrc <> 0.
    zcx_ewm_base_db=>raise_syst( ).
  ENDIF.










*
ENDMETHOD.


METHOD hu_repack_to_hu.
*----------------------------------------------------------------------*
* Title  HU_REPACK_TO_HU
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Company:  PROLOGIC
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* Repack Stock from One HU to Another
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* ...
*=======================================================================

  sr_pack->/scwm/if_pack_bas~repack_stock(
    EXPORTING
      iv_dest_hu    = iv_dest_hu
      iv_source_hu  = iv_source_hu
      iv_stock_guid = iv_stock_guid
      is_quantity   = is_quantity
    IMPORTING
      es_quantity   = es_quantity
    EXCEPTIONS
      error         = 1
      OTHERS        = 2 ).
  IF sy-subrc <> 0.
    zcx_ewm_base_db=>raise_syst( ).
  ENDIF.









*
ENDMETHOD.


METHOD hu_repack_to_lgpla.
*----------------------------------------------------------------------*
* Title  MTHD: HU_REPACK_TO_LGPLA
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Company:  PROLOGIC
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* Repack Stock from HU to storage bin
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* Repack Stock from HU to storage bin
*=======================================================================

  sr_pack->/scwm/if_pack_bas~unpack_stock(
    EXPORTING
      iv_source_hu  = iv_source_hu
      iv_stock_guid = iv_stock_guid
      is_quantity   = is_quantity
      iv_dest_lgpla = iv_dest_lgpla
    IMPORTING
      es_quantity   = es_quantity
    EXCEPTIONS
      error         = 1
      OTHERS        = 2
          ).
  IF sy-subrc <> 0.
    zcx_ewm_base_db=>raise_syst( ).
  ENDIF.







*
ENDMETHOD.


METHOD init.
*----------------------------------------------------------------------*
* Title  INIT
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Company:  PROLOGIC
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* Initialize wm packing
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* ...
*=======================================================================
  sr_pack->init(
    EXPORTING
      iv_lgnum               = iv_lgnum
      is_pack_controle       = is_pack_controle
      iv_procty              = iv_procty
    EXCEPTIONS
      error                  = 1
      OTHERS                 = 2
         ).
  IF sy-subrc <> 0.
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid      = zcx_ewm_base_db=>wmpacking_init.
  ENDIF.










*
ENDMETHOD.


METHOD init_pack.
*----------------------------------------------------------------------*
* Title  INIT_PACK
*----------------------------------------------------------------------*
* Inchcape
* Company:  PROLOGIC
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* init packing
*----------------------------------------------------------------------*


*=======================================================================
* Declaration/Initialization
*=======================================================================


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* init
*=======================================================================
  sr_pack->init_pack(
    EXPORTING
      iv_badi_appl  = iv_badi_appl
      it_guid_hu    = it_guid_hu
*    iv_loc_type   =
*    iv_loc_index  =
*    iv_no_refresh =
      iv_lgnum      = iv_lgnum
*  IMPORTING
*    et_hutree     =
*    et_huhdr      =
*    et_huitm      =
    EXCEPTIONS
      error         = 1
      OTHERS        = 2
         ).
  IF sy-subrc <> 0.
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid = zcx_ewm_base_db=>wmpacking_init.
  ENDIF.











*
ENDMETHOD.


METHOD save.
*----------------------------------------------------------------------*
* Title  SAVE
*----------------------------------------------------------------------*
* Inchcape
* Company:  PROLOGIC
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* Save
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* ...
*=======================================================================
  sr_pack->/scwm/if_pack_bas~save(
    EXPORTING
      iv_commit = iv_commit
      iv_wait   = iv_wait
    EXCEPTIONS
      error     = 1
      OTHERS    = 2 ).
  IF sy-subrc <> 0.
    zcx_ewm_base_db=>raise_syst( ).
  ENDIF.









*
ENDMETHOD.
ENDCLASS.
