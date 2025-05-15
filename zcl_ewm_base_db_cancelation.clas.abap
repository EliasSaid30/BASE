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
class ZCL_EWM_BASE_DB_CANCELATION definition
  public
  final
  create public .

public section.

  interfaces /SCDL/IF_DL_DOC_C .
  interfaces /SCWM/IF_TM_APPL .

  data GR_ADAPTER_HDL type ref to /SCWM/CL_DLV_HANDLER_ADAPTER .
  data GR_CANCPICK_SP type ref to /SCWM/CL_CANCPICK_SP .
  data GR_PROT type ref to /SCWM/CL_LOG .
  data GV_MESSAGE type STRING .

  methods CANCEL_PICKING
    importing
      !IS_HU_CANCEL type /SCWM/S_HUHDR_INT
    exporting
      !EV_REJECTED type XFELD
    raising
      ZCX_EWM_BASE_DB .
  methods CANCEL_WT .
  methods CONSTRUCTOR
    importing
      !IV_LGNUM type /SCWM/LGNUM .
  class-methods GET_INSTANCE
    importing
      !IV_LGNUM type /SCWM/LGNUM
    returning
      value(RR_INSTANCE) type ref to ZCL_EWM_BASE_DB_CANCELATION .
  methods INIT .
  methods SET_HANDLER
    importing
      !IR_ADAPTER_HDL type ref to /SCWM/CL_DLV_HANDLER_ADAPTER .
protected section.

  data GV_CURR_ROW type BAPI_LINE .
  data GV_LGNUM type /SCWM/LGNUM .

  methods ADD_MSG_TO_PROT
    importing
      !IV_MSGTY type SYMSGTY optional
      !IV_MSGID type SYMSGID optional
      !IV_MSGNO type SYMSGNO optional
      !IV_MSGV1 type SYMSGV optional
      !IV_MSGV2 type SYMSGV optional
      !IV_MSGV3 type SYMSGV optional
      !IV_MSGV4 type SYMSGV optional
      !IV_MSG type BAPI_MSG optional
      !IV_PARAM type BAPI_PARAM optional
      !IV_ROW type BAPI_LINE optional
      !IV_FIELD type BAPI_FLD optional .
  methods PREPARE_CANCEL_PICKING .
private section.

  class-data SR_SINGLETON type ref to ZCL_EWM_BASE_DB_CANCELATION .
ENDCLASS.



CLASS ZCL_EWM_BASE_DB_CANCELATION IMPLEMENTATION.


METHOD /scwm/if_tm_appl~check_save.
ENDMETHOD.


METHOD /scwm/if_tm_appl~cleanup.
ENDMETHOD.


METHOD add_msg_to_prot.
*----------------------------------------------------------------------*
* Title  MTHD ADD_MSG_TO_PROT
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*---------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author : David Nava
*----------------------------------------------------------------------*
* Program description:
* Delete buffered data
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================
  DATA:

  lv_row                   TYPE bapi_line.


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* ADD Message
*=======================================================================
* set row on imported value or on current row
  IF iv_row IS NOT INITIAL.
    lv_row = iv_row.
  ELSEIF gv_curr_row IS NOT INITIAL.
    lv_row = gv_curr_row.
  ENDIF.


* if message was imported: add this to prot
  IF iv_msgty IS SUPPLIED AND iv_msgid IS SUPPLIED AND iv_msgno IS SUPPLIED.

    gr_prot->add_message(
        ip_msgty = iv_msgty
        ip_msgid = iv_msgid
        ip_msgno = iv_msgno
        ip_msgv1 = iv_msgv1
        ip_msgv2 = iv_msgv2
        ip_msgv3 = iv_msgv3
        ip_msgv4 = iv_msgv4
        ip_msg   = iv_msg
        ip_param = iv_param
        ip_row   = lv_row
        ip_field = iv_field ).

* no message imported: add sy-message
  ELSE.

    gr_prot->add_message(
        ip_param = iv_param
        ip_row   = lv_row
        ip_field = iv_field ).

  ENDIF.












*
ENDMETHOD.


METHOD cancel_picking.
**----------------------------------------------------------------------*
** Title  MTHD CANCEL_PICKING
** Copyright (c) 2024 ProLogic LA S.C. All rights reserved
**---------------------------------------------------------------------*
** Project Rel. : Indumotora
** Author : David Nava
**----------------------------------------------------------------------*
** Method description:
**  Cancel the picking per HUs (HU is available again, no ODO assingment)
**----------------------------------------------------------------------*
**=======================================================================
** Declaration/Initialization
**=======================================================================
*  DATA:
*
*  lr_controller            TYPE REF TO /scmb/cl_controller,
*  lr_dlv_handler           TYPE REF TO /scwm/cl_dlv_handler_adapter,
*  lr_tm                    TYPE REF TO object,
*
*  lt_selection             TYPE /scmb/t_sp_selection,
*  lt_message               TYPE /scmb/t_messages_int,
*  lt_hu_cancpick           TYPE /scwm/tt_asp_hu_cancpick,
*  lt_huitm                 TYPE /scwm/tt_huitm_int,
*  lt_hu_key                TYPE /scwm/tt_aspk_hu_cancpick,
*  lt_dlv_key               TYPE /scwm/tt_aspk_dlv_cancpick,
*  lt_rcode                 TYPE /scmb/t_sp_return_code,
*
*  ls_selection             TYPE /scmb/s_sp_selection,
*  ls_hu_key                LIKE LINE OF lt_hu_key,
*  ls_dlv_key               LIKE LINE OF lt_dlv_key,
*
*  lv_rejected              TYPE boole_d.
*
*  FIELD-SYMBOLS:
*
*  <ls_huitm>               TYPE /scwm/s_huitm_int,
*  <ls_message>             TYPE /scmb/s_messages_int.
*
*
**=======================================================================
** Input
**=======================================================================
*
*
**=======================================================================
** SET handler
**=======================================================================
*  IF ( gr_adapter_hdl IS INITIAL ).
*    lr_controller = /scmb/cl_controller=>get_instance( ).
*    IF lr_controller IS BOUND.
*      lr_controller->initialize( lr_tm ).
*    ENDIF.
*    CREATE OBJECT lr_dlv_handler.
*    set_handler( lr_dlv_handler ).
*  ENDIF.
*
*
**=======================================================================
** Get  dlv-items of HU
**=======================================================================
*
*  TRY.
*      zcl_ewm_base_db_hu=>get_huitm(
*          EXPORTING
*            iv_lgnum   = gv_lgnum
*            iv_guid_hu = is_hu_cancel-guid_hu
*          IMPORTING
*            et_huitm   = lt_huitm ).
*
*      LOOP AT lt_huitm
*        ASSIGNING <ls_huitm>
*        WHERE qdoccat = wmegc_doccat_pdo.
*        ls_dlv_key-doccat = <ls_huitm>-qdoccat. "PDO
*        ls_dlv_key-docid  = <ls_huitm>-qdocid.
*        ls_dlv_key-itemid = <ls_huitm>-qitmid.
*
*        APPEND ls_dlv_key TO lt_dlv_key.
*
*      ENDLOOP.
*
*    CATCH zcx_ewm_base_db .
*      CLEAR lt_dlv_key.
*  ENDTRY.
*
** any ODO found for canceling
*  IF lt_dlv_key IS INITIAL.
**     info to prot: No cancel pick needed
*    MESSAGE i001(zewm_base_cancel) "No cancelation of picking for HU&1 needed.
*       WITH is_hu_cancel-huident
*       INTO gv_message.
*    add_msg_to_prot( ).
*    RETURN.
*  ENDIF.
*
*
**=======================================================================
** Prepare cancelation
**=======================================================================
*  MESSAGE i002(zewm_base_cancel) "Cancel picking for HU &1.
*     WITH is_hu_cancel-huident
*     INTO gv_message.
*  add_msg_to_prot( ).
*
*  CLEAR ls_selection.
*  ls_selection-fieldname = /scwm/if_ui_c=>sc_field_huident.
*  ls_selection-sign      = wmegc_sign_inclusive.
*  ls_selection-option    = wmegc_option_eq.
*  ls_selection-low       = is_hu_cancel-huident.
*  APPEND ls_selection TO lt_selection.
*
*  prepare_cancel_picking( ).
*
*  IF gr_cancpick_sp IS INITIAL.
** create service provider
*    CREATE OBJECT gr_cancpick_sp
*      EXPORTING
*        io_attribute_handler = gr_adapter_hdl->mo_attr_handler
*        io_message_handler   = gr_adapter_hdl->mo_msg_handler
*        iv_mode              = 'S'.
*  ENDIF.
** cleanup
*  gr_cancpick_sp->cleanup(
*      EXPORTING
*        reason = /scmb/if_sp_transaction=>sc_cleanup_end ).
*
*
**=======================================================================
** make selection in service provider of HUs to prepare cancelation
**=======================================================================
*  gr_cancpick_sp->/scmb/if_sp_query~execute(
*    EXPORTING
*      query      = /scwm/if_sp_cancpick_c=>sc_qry_cancpick_hu
*      selections = lt_selection
*    IMPORTING
*      outrecords = lt_hu_cancpick "lt_dlv_sp
*      rejected   = lv_rejected
*         ).
** errors occurred?
*  IF lv_rejected = abap_true
*  OR lt_hu_cancpick IS INITIAL.
**   Cancelation of picking for HU &1 was rejected. &2
*    MESSAGE e003(zewm_base_cancel)
*       WITH is_hu_cancel-huident
*            '(QUERY_DLV)'                                   "#EC NOTEXT
*       INTO gv_message.
*    add_msg_to_prot( ).
*
*
**   get error from message in message handler (via enhancement method)
*    lt_message = gr_adapter_hdl->mo_msg_handler->zget_message( ).
*
*    LOOP AT lt_message
*      ASSIGNING <ls_message>.
*      add_msg_to_prot(
*          iv_msgty = <ls_message>-s_msg-msgty
*          iv_msgid = <ls_message>-s_msg-msgid
*          iv_msgno = <ls_message>-s_msg-msgno
*          iv_msgv1 = <ls_message>-s_msg-msgv1
*          iv_msgv2 = <ls_message>-s_msg-msgv2
*          iv_msgv3 = <ls_message>-s_msg-msgv3
*          iv_msgv4 = <ls_message>-s_msg-msgv4
**          iv_msg   = <ls_message>-v_message_text
*             ).
*    ENDLOOP.
*
*    ev_rejected = abap_true.
*    RETURN.
*  ENDIF.
*
*
**=======================================================================
** make selection in service provider of HUs to prepare cancelation
** Internal selection of delivery
**=======================================================================
*  gr_cancpick_sp->/scmb/if_sp_aspect~select(
*    EXPORTING
*      inkeys       = lt_dlv_key
*      aspect       = /scwm/if_sp_c=>sc_asp_item
*    IMPORTING
*      rejected     = lv_rejected
*      return_codes = lt_rcode
*         ).
** errors occurred?
*  IF lv_rejected = abap_true
*  OR lt_hu_cancpick IS INITIAL.
**   Cancelation of picking for HU &1 was rejected. &2
*    MESSAGE e003(zewm_base_cancel)
*       WITH is_hu_cancel-huident
*            '(SELECT_HU)'                                   "#EC NOTEXT
*       INTO gv_message.
*    add_msg_to_prot( ).
*
*
**   get error from message in message handler (via enhancement method)
*    lt_message = gr_adapter_hdl->mo_msg_handler->zget_message( ).
*
*    LOOP AT lt_message
*      ASSIGNING <ls_message>.
*      add_msg_to_prot(
*          iv_msgty = <ls_message>-s_msg-msgty
*          iv_msgid = <ls_message>-s_msg-msgid
*          iv_msgno = <ls_message>-s_msg-msgno
*          iv_msgv1 = <ls_message>-s_msg-msgv1
*          iv_msgv2 = <ls_message>-s_msg-msgv2
*          iv_msgv3 = <ls_message>-s_msg-msgv3
*          iv_msgv4 = <ls_message>-s_msg-msgv4
**          iv_msg   = <ls_message>-v_message_text
*             ).
*    ENDLOOP.
*
*    ev_rejected = abap_true.
*    RETURN.
*  ENDIF.
*
*
**=======================================================================
** go on with cancelation of picking
**=======================================================================
*  ls_hu_key-guid_hu = is_hu_cancel-guid_hu.
*  APPEND ls_hu_key TO lt_hu_key.
*
*  gr_cancpick_sp->/scmb/if_sp_action~execute(
*        EXPORTING
*          aspect             = /scwm/if_sp_c=>sc_asp_hu
*          inkeys             = lt_hu_key
*          action             = /scwm/if_sp_cancpick_c=>sc_act_unassign_stock
*        IMPORTING
*         rejected           = lv_rejected
*         return_codes       = lt_rcode
*         ).
*  READ TABLE lt_rcode
*    WITH KEY failed = abap_true TRANSPORTING NO FIELDS.
*  IF sy-subrc = 0 "RCODE found
*    OR lv_rejected = abap_true.
*
*    ROLLBACK WORK.
**   Cancelation of picking for HU &1 was rejected. &2
*    MESSAGE e003(zewm_base_cancel)
*       WITH is_hu_cancel-huident
*            '(CANCEL_EXECUTE)'                              "#EC NOTEXT
*       INTO gv_message.
*    add_msg_to_prot( ).
*
**   get error from message in message handler (via enhancement method)
*    lt_message = gr_adapter_hdl->mo_msg_handler->zget_message( ).
*
*    LOOP AT lt_message
*      ASSIGNING <ls_message>.
*      add_msg_to_prot(
*          iv_msgty = <ls_message>-s_msg-msgty
*          iv_msgid = <ls_message>-s_msg-msgid
*          iv_msgno = <ls_message>-s_msg-msgno
*          iv_msgv1 = <ls_message>-s_msg-msgv1
*          iv_msgv2 = <ls_message>-s_msg-msgv2
*          iv_msgv3 = <ls_message>-s_msg-msgv3
*          iv_msgv4 = <ls_message>-s_msg-msgv4
**          iv_msg   = <ls_message>-v_message_text
*             ).
*    ENDLOOP.
*
*    ev_rejected = abap_true.
*    RETURN.
*  ENDIF.
*
*
**=======================================================================
** save the cancelation to DB
**=======================================================================
*  gr_cancpick_sp->/scmb/if_sp_transaction~before_save(
*    IMPORTING
*      rejected = lv_rejected
*         ).
*
*  IF lv_rejected = abap_true.
*    ROLLBACK WORK.
**   Cancelation of picking for HU &1 was rejected. &2
*    MESSAGE e003(zewm_base_cancel)
*       WITH is_hu_cancel-huident
*            '(BEFORE_SAVE)'                                 "#EC NOTEXT
*       INTO gv_message.
*    add_msg_to_prot( ).
*
*    ev_rejected = abap_true.
*    RETURN.
*  ENDIF.
*
*
*  gr_cancpick_sp->/scmb/if_sp_transaction~save(
**  EXPORTING
**    synchronously = ABAP_FALSE
*    IMPORTING
*      rejected      = lv_rejected  ).
*
*  IF lv_rejected = abap_true.
*    ROLLBACK WORK.
**   Cancelation of picking for HU &1 was rejected. &2
*    MESSAGE e003(zewm_base_cancel)
*       WITH is_hu_cancel-huident
*            '(SAVE)'                                        "#EC NOTEXT
*       INTO gv_message.
*    add_msg_to_prot( ).
*
*    ev_rejected = abap_true.
*    RETURN.
*  ENDIF.
*
*
*  COMMIT WORK AND WAIT.
*  CLEAR gr_cancpick_sp.
*
*  /scwm/cl_tm=>cleanup(
*    EXPORTING
*      iv_reason = /scmb/if_sp_transaction=>sc_cleanup_commit
*      iv_lgnum  = gv_lgnum ).
*
*
** info to prot
*  MESSAGE i004(zewm_base_cancel) "Picking of HU &1 was canceled.
*     WITH is_hu_cancel-huident
*     INTO gv_message.
*  add_msg_to_prot( ).
*
*
*
*
*
*
*
*
*
*
*
*
**
ENDMETHOD.


  method CANCEL_WT.
  endmethod.


METHOD constructor.
*----------------------------------------------------------------------*
* Title MTDH CONSTRUCTOR
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*---------------------------------------------------------------------*
* Project Rel. : Indumotora
* Autor        : David Nava
*----------------------------------------------------------------------*
* Program description:
* Constructor
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* SET values
*=======================================================================

* Set LGNUM
  gv_lgnum = iv_lgnum.

* Get protocol
  CREATE OBJECT gr_prot
    EXPORTING
      iv_lgnum = gv_lgnum.










*
ENDMETHOD.


METHOD get_instance.
*----------------------------------------------------------------------*
* Title MTDH CANCEL_TO_MULTI
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*---------------------------------------------------------------------*
* Project Rel. : Indumotora
* Autor        : David Nava
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
    CREATE OBJECT sr_singleton
      EXPORTING
        iv_lgnum         = iv_lgnum.
  ENDIF.


*=======================================================================
* Output
*=======================================================================

  rr_instance = sr_singleton.







*
ENDMETHOD.


METHOD init.
*----------------------------------------------------------------------*
* Title MTDH INIT
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*---------------------------------------------------------------------*
* Project Rel. : Indumotora
* Autor        : David Nava
*----------------------------------------------------------------------*
* Program description:
* initialize attributes (buffers) of instance
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* Initialize
*=======================================================================

  IF gr_prot IS NOT INITIAL.
    gr_prot->init( ).
  ENDIF.

  CALL FUNCTION '/SCWM/TO_INIT_NEW'
    EXPORTING
      iv_lgnum       = gv_lgnum.

  CLEAR: gv_message.











*
ENDMETHOD.


METHOD prepare_cancel_picking.
*----------------------------------------------------------------------*
* Title  MTHD PREPARE_CANCEL_PICKING
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*---------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author : David Nava
*----------------------------------------------------------------------*
* Program description:
* Set needed defaults for cancel picking
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================
  DATA:
  lt_value                 TYPE /scmb/t_default_values_det,

  ls_value                 TYPE /scmb/s_default_values_det,
  ls_esdus                 TYPE /scmb/esdus.



*=======================================================================
* Input
*=======================================================================


*=======================================================================
* SET default
*=======================================================================
* Check/Upd. table/SCMB/ESDUS
  SELECT SINGLE * FROM /scmb/esdus INTO ls_esdus
    WHERE uname   = sy-uname
      AND action  = wmegc_gmcode_canc_pick
      AND element = wmegc_fname_lgnum.

  IF sy-subrc <> 0.
    ls_esdus-uname   = sy-uname.
    ls_esdus-action  = wmegc_gmcode_canc_pick.
    ls_esdus-element = wmegc_fname_lgnum.
    ls_esdus-active  = gv_lgnum.
    INSERT INTO /scmb/esdus VALUES ls_esdus.
  ELSE.
    IF ls_esdus-active <> gv_lgnum.
      ls_esdus-active = gv_lgnum.
      UPDATE /scmb/esdus FROM ls_esdus.
    ENDIF.
  ENDIF.


* Initialisierung /SCMB/CL_EES_DEFAULTS
  ls_value-v_fieldname = wmegc_fname_lgnum. " 'LGNUM'.
  ls_value-v_mandatory = abap_true.
  ls_value-v_memoryid  = '/SCWM/LGN'.
  APPEND ls_value TO lt_value.

  /scmb/cl_ees_defaults=>init(
        EXPORTING
          iv_identifier            = '/SCWM/CANCPICK'
          iv_values_structure      = '/SCWM/S_SP_DEFAULT_CANCPICK'
          it_values_definition     = lt_value
             ).














*
ENDMETHOD.


METHOD set_handler.
*----------------------------------------------------------------------*
* Title  MTHD SET_HANDLER
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*---------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author : David Nava
*----------------------------------------------------------------------*
* Program description:
* Set Handler
*----------------------------------------------------------------------*
* set handler (message hanlder and attribute handler)
  IF gr_adapter_hdl <> ir_adapter_hdl
    AND ir_adapter_hdl IS NOT INITIAL.
    gr_adapter_hdl  = ir_adapter_hdl.
  ENDIF.










*
ENDMETHOD.
ENDCLASS.
