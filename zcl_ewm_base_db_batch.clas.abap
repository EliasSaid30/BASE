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
class ZCL_EWM_BASE_DB_BATCH definition
  public
  final
  create public .

public section.
  type-pools WMEGC .
  type-pools ZWMGC .

  interfaces /SCWM/IF_TM_APPL .
  interfaces ZIF_EWM_BASE_TM_APPL .

  aliases GV_CLEANUP_REASON
    for ZIF_EWM_BASE_TM_APPL~GV_CLEANUP_REASON .
  aliases GV_CLEANUP_REG
    for ZIF_EWM_BASE_TM_APPL~GV_CLEANUP_REG .

  class-methods GET_INSTANCE
    returning
      value(RR_SINGLETON) type ref to ZCL_EWM_BASE_DB_BATCH .
  class-methods GET_NPF
    importing
      !IS_BATCH type /SCWM/S_BATCH
      !IV_MATNR type /SCWM/DE_MATNR optional
      !IV_BATCHNO type /SCWM/DE_CHARG optional
    returning
      value(RS_BATCH_NPF) type ZEWM_S_BASE_PROD_BATCH_NPF
    raising
      ZCX_EWM_BASE_DB
      /SCWM/CX_BATCH_MANAGEMENT .
  class-methods INIT .
  class-methods IS_NPF_VALID
    importing
      !IS_BATCH type /SCWM/S_BATCH
      !IV_NPF type ATWRT
    returning
      value(RV_VALID) type ABAP_BOOL .
  class-methods READ_BATCH_NPF
    importing
      !IS_BATCH type /SCWM/S_BATCH
      !IV_MATNR type /SCWM/DE_MATNR optional
      !IV_BATCHNO type /SCWM/DE_CHARG optional
    returning
      value(RS_BATCH_NPF) type ZEWM_S_BASE_PROD_BATCH_NPF
    raising
      ZCX_EWM_BASE_DB
      /SCWM/CX_BATCH_MANAGEMENT .
  class-methods READ_BATCH_DATA
    importing
      !IS_BATCH type /SCWM/S_BATCH
      !IV_MATNR type /SCWM/DE_MATNR optional
      !IV_BATCHNO type /SCWM/DE_CHARG optional
    exporting
      !ES_UI_BATCH type /SCWM/S_UI_BATCH
      !ET_VAL_NUM type TT_BAPI1003_ALLOC_VALUES_NUM
      !ET_VAL_CHAR type TT_BAPI1003_ALLOC_VALUES_CHAR
      !ET_VAL_CURR type TT_BAPI1003_ALLOC_VALUES_CURR
      !EV_VAL_FLG type XFELD
    raising
      ZCX_EWM_BASE_DB
      /SCWM/CX_BATCH_MANAGEMENT .
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

  data GT_NPFS type ZEWM_TT_BASE_PROD_BATCH_NPF .
  class-data SR_SINGLETON type ref to ZCL_EWM_BASE_DB_BATCH .
ENDCLASS.



CLASS ZCL_EWM_BASE_DB_BATCH IMPLEMENTATION.


METHOD /scwm/if_tm_appl~check_save.
ENDMETHOD.


METHOD /scwm/if_tm_appl~cleanup.
ENDMETHOD.


METHOD get_instance.
*----------------------------------------------------------------------*
* Title  MTHD  GET_INSTANCE
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* return active Instance
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


METHOD get_npf.
*----------------------------------------------------------------------*
* Title  MTHD GET_NPF
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Return NPFs asociated to Product-batch.
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================
  DATA:

  lr_buffer                TYPE REF TO zcl_ewm_base_db_batch.


*=======================================================================
* Input
*=======================================================================
  lr_buffer = get_instance( ).


*=======================================================================
* GET data from buffer
*=======================================================================
  IF iv_batchno IS NOT INITIAL AND
     is_batch-matid IS NOT INITIAL.
    READ TABLE lr_buffer->gt_npfs
      INTO rs_batch_npf
      WITH KEY lgnum   = is_batch-lgnum
               matid   = is_batch-matid
               batchno = iv_batchno.
  ELSEIF iv_matnr IS NOT INITIAL AND
         iv_batchno IS NOT INITIAL.
    READ TABLE lr_buffer->gt_npfs
      INTO rs_batch_npf
      WITH KEY lgnum   = is_batch-lgnum
               matnr   = iv_matnr
               batchno = iv_batchno.
  ELSEIF iv_matnr IS NOT INITIAL AND
         is_batch-batchid IS NOT INITIAL.
    READ TABLE lr_buffer->gt_npfs
      INTO rs_batch_npf
      WITH KEY lgnum   = is_batch-lgnum
               matnr   = iv_matnr
               batchid = is_batch-batchid.
  ELSE.
    READ TABLE lr_buffer->gt_npfs
      INTO rs_batch_npf
      WITH KEY lgnum   = is_batch-lgnum
               matid   = is_batch-matid
               batchid = is_batch-batchid.
  ENDIF.
  IF sy-subrc <> 0.
    TRY.
      CALL METHOD zcl_ewm_base_db_batch=>read_batch_npf
        EXPORTING
          is_batch   = is_batch
          iv_matnr   = iv_matnr
          iv_batchno = iv_batchno
        RECEIVING
          rs_batch_npf = rs_batch_npf.
      CATCH zcx_ewm_base_db
           /scwm/cx_batch_management.
       RAISE EXCEPTION TYPE /scwm/cx_batch_management.
    ENDTRY.

    APPEND rs_batch_npf TO  lr_buffer->gt_npfs.
  ENDIF.











*
ENDMETHOD.


METHOD init.
*----------------------------------------------------------------------*
* Title  MTHD INIT
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Initializing of the global buffer
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lr_buffer                TYPE REF TO zcl_ewm_base_db_batch.


*=======================================================================
* Input
*=======================================================================
  lr_buffer = get_instance( ).


*=======================================================================
* RE-SET global buffer: BAtch system status
*=======================================================================

  CLEAR: lr_buffer->gt_npfs[].
  IF ( sy-subrc <> 0 ).                                     "#EC NEEDED
  ENDIF.











*
ENDMETHOD.


METHOD is_npf_valid.
*----------------------------------------------------------------------*
* Title  MTHD  IS_NPF_VALID
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* return active Instance
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================
  DATA:

  ls_batch_npf             TYPE zewm_s_base_prod_batch_npf.


*=======================================================================
* Input
*=======================================================================
  rv_valid = abap_false.
  CHECK is_batch IS NOT INITIAL.


*=======================================================================
* GET NPFs
*=======================================================================
  TRY.
      ls_batch_npf = zcl_ewm_base_db_batch=>get_npf(
                                              is_batch = is_batch ).
      IF iv_npf = ls_batch_npf-npf OR
         iv_npf = ls_batch_npf-npf2.
        rv_valid = abap_true.
      ENDIF.
    CATCH zcx_ewm_base_db.
      RETURN.
    CATCH /scwm/cx_batch_management.
      RETURN.
  ENDTRY.









*
ENDMETHOD.


METHOD read_batch_data.
*----------------------------------------------------------------------*
* Title  MTHD READ_BATCH_NPF
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Read Product-Batch characteristics NPFs
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================
  DATA:

    lv_msg                   TYPE string,
    lv_matnr                 TYPE /scwm/de_matnr,

    lr_batch                 TYPE REF TO /scwm/cl_batch_appl,
    lr_ref_exc               TYPE REF TO cx_root.


*=======================================================================
* INPUT
*=======================================================================
  CLEAR: es_ui_batch,
         et_val_num,
         et_val_char,
         et_val_curr,
         ev_val_flg.
  CHECK is_batch IS NOT INITIAL.
  /scwm/cl_batch_appl=>cleanup( ).

*=======================================================================
* GET instance for Batch.
*=======================================================================
  TRY.
      lr_batch ?= /scwm/cl_batch_appl=>get_instance(
                        iv_productid   = is_batch-matid
                        iv_batchid     = is_batch-batchid
                        iv_productno   = iv_matnr
                        iv_batchno     = iv_batchno
                        iv_lgnum       = is_batch-lgnum ).
    CATCH /scwm/cx_batch_management.
      RAISE EXCEPTION TYPE /scwm/cx_batch_management.
*         EXPORTING
*           textid  = /scwm/cx_batch_precheck=>invalid_batchid
*           batchid = lv_batchid.
  ENDTRY.


*=======================================================================
* GET Batch and values
*=======================================================================
  TRY.
      lr_batch->get_batch(
          IMPORTING
            es_batch      = es_ui_batch
            et_val_num    = et_val_num
            et_val_char   = et_val_char
            et_val_curr   = et_val_curr ).
    CATCH /scwm/cx_batch_management.
*@TODO raise exception
  ENDTRY.








*
ENDMETHOD.


METHOD read_batch_npf.
*----------------------------------------------------------------------*
* Title  MTHD READ_BATCH_NPF
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Read Product-Batch characteristics NPFs
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================
  DATA:

  lt_val_char              TYPE tt_bapi1003_alloc_values_char,

  ls_val_char              TYPE bapi1003_alloc_values_char.


*=======================================================================
* Input
*=======================================================================
  CLEAR: rs_batch_npf.


*=======================================================================
* READ BATCH characteristics data
*=======================================================================
  CLEAR: lt_val_char.

  TRY.
    CALL METHOD zcl_ewm_base_db_batch=>read_batch_data
      EXPORTING
        is_batch        = is_batch
        iv_matnr        = iv_matnr
        iv_batchno      = iv_batchno
      IMPORTING
        et_val_char     = lt_val_char .
   CATCH zcx_ewm_base_db
        /scwm/cx_batch_management.
      RAISE EXCEPTION TYPE /scwm/cx_batch_management.
  ENDTRY.


*=======================================================================
* READ GET NPFs
*=======================================================================
  MOVE-CORRESPONDING is_batch TO rs_batch_npf.
  rs_batch_npf-matnr   = iv_matnr.
  rs_batch_npf-batchno = iv_batchno.
* First NPF
  READ TABLE lt_val_char
    INTO ls_val_char
    WITH KEY charact = 'Z_NUMERO_PARTE'.
  IF sy-subrc = 0.
    rs_batch_npf-npf = ls_val_char-value_char.
  ENDIF.

* Second NPF
  READ TABLE lt_val_char
    INTO ls_val_char
    WITH KEY charact = 'Z_NUMERO_PARTE_II'.
  IF sy-subrc = 0.
    rs_batch_npf-npf2 = ls_val_char-value_char.
  ENDIF.








*
ENDMETHOD.


METHOD zif_ewm_base_tm_appl~cleanup.
*----------------------------------------------------------------------*
* Title  MTHD ZIF_EWM_BASE_TM_APPL~CLEANUP
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Register application buffer for cleanup processing
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lr_buffer                TYPE REF TO zcl_ewm_base_db_batch.


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












*
ENDMETHOD.


METHOD zif_ewm_base_tm_appl~cleanup_now.
*----------------------------------------------------------------------*
* Title  MTHD ZIF_EWM_BASE_TM_APPL~CLEANUP_NOW
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Delete buffered data immediately
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lr_buffer                TYPE REF TO zcl_ewm_base_db_batch.


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














*
ENDMETHOD.
ENDCLASS.
