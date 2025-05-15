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
class ZCX_EWM_BASE definition
  public
  inheriting from CX_STATIC_CHECK
  create public .

public section.
  type-pools ABAP .
  type-pools WMEGC .
  type-pools ZWMGC .

  interfaces IF_T100_DYN_MSG .
  interfaces IF_T100_MESSAGE .
  interfaces ZIF_EWM_BASE_EXCEPTION .

  class-data GV_MESSAGE type STRING .
  data GV_DOMVAL type DOMVALUE_L .

  methods CONSTRUCTOR
    importing
      !TEXTID like IF_T100_MESSAGE=>T100KEY optional
      !PREVIOUS like PREVIOUS optional
      !GV_MESSAGE type STRING optional
      !GV_DOMVAL type DOMVALUE_L optional .
  methods GET_TEXT_PREVIOUS
    returning
      value(RV_TEXT) type STRING .
  class-methods IS_ERROR_SEVERITY
    importing
      !IV_SEVERITY type BAPI_MTYPE
    returning
      value(RV_ERROR) type BOOLEAN .
  class-methods BAPIRET_ADD_SYST
    changing
      !CT_BAPIRET type BAPIRETTAB .
  class-methods BAPIRET_RAISE
    importing
      !IV_SEVERITY type BAPI_MTYPE
      !IT_BAPIRET type BAPIRETTAB
    raising
      ZCX_EWM_BASE .
  class-methods DM_RAISE
    importing
      !IR_DM type ref to /SCDL/CL_DM_MESSAGE
      !IR_CX_DLV type ref to /SCDL/CX_DELIVERY
      !IT_MESSAGES type /SCDL/DM_MESSAGE_TAB
      !IV_DOCCAT type /SCDL/DL_DOCCAT
      !IV_DOCID type /SCDL/DL_DOCID
      !IV_ITEMID type /SCDL/DL_ITEMID
      !IV_HUID type /SCDL/DL_HUID
      !IV_LOGFNAME type /SCDL/DL_LOGFNAME
    raising
      ZCX_EWM_BASE .
  class-methods SYST_RAISE
    raising
      ZCX_EWM_BASE .
  class-methods LOG_RAISE
    importing
      !IR_LOG type ref to /SCWM/CL_LOG
    raising
      ZCX_EWM_BASE .
  class-methods STRING_RAISE
    importing
      !IV_MESSAGE type STRING
    raising
      ZCX_EWM_BASE .
  class-methods GET_MESSAGE
    returning
      value(RR_CX_MESSAGE) type ref to IF_T100_MESSAGE .
protected section.
private section.
ENDCLASS.



CLASS ZCX_EWM_BASE IMPLEMENTATION.


METHOD BAPIRET_ADD_SYST.
*----------------------------------------------------------------------*
* Title  BAPIRET_ADD_SYST
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author : David Nava
*----------------------------------------------------------------------*
* Program description:
* ADD message to BAPI return table
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  ls_bapiret               TYPE bapiret2.


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* ADD message to BAPI return table
*=======================================================================

  ls_bapiret-type       = sy-msgty.
  ls_bapiret-id         = sy-msgid.
  ls_bapiret-number     = sy-msgno.
  ls_bapiret-message_v1 = sy-msgv1.
  ls_bapiret-message_v2 = sy-msgv2.
  ls_bapiret-message_v3 = sy-msgv3.
  ls_bapiret-message_v4 = sy-msgv4.

  APPEND ls_bapiret TO ct_bapiret.














*
ENDMETHOD.


METHOD BAPIRET_RAISE.
*----------------------------------------------------------------------*
* Title  BAPIRET_RAISE
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author : David Nava
*----------------------------------------------------------------------*
* Program description:
* Raise error message in return table as exception
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  ls_bapiret               TYPE bapiret2.


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* CHECK If we first must check the return "flag" of the SAP function?
*=======================================================================

  IF ( iv_severity IS NOT INITIAL ).
*   .yes

*   // CHECK If processing failed due to an error?......................
    IF ( is_error_severity( iv_severity ) = abap_false ).
*     .no
      RETURN.

    ENDIF.

  ENDIF.


*=======================================================================
* RAISE exception
*=======================================================================

  LOOP AT it_bapiret INTO ls_bapiret.

*   // Initialization...................................................

*   // CHECK If message type declares an error?.........................
    IF ( iv_severity IS NOT INITIAL ).
      IF ( ls_bapiret-type <> iv_severity ).
*       .no
        CONTINUE.
      ENDIF.
    ELSE.
      IF ( is_error_severity( ls_bapiret-type ) = abap_false ).
*       .no
        CONTINUE.
      ENDIF.
    ENDIF.

*   // RAISE exception..................................................
    MESSAGE ID ls_bapiret-id
      TYPE ls_bapiret-type NUMBER ls_bapiret-number
      WITH ls_bapiret-message_v1 ls_bapiret-message_v2
           ls_bapiret-message_v3 ls_bapiret-message_v4
      INTO gv_message.
    zcx_ewm_base=>syst_raise( ).

  ENDLOOP.












*
ENDMETHOD.


  method CONSTRUCTOR.
CALL METHOD SUPER->CONSTRUCTOR
EXPORTING
PREVIOUS = PREVIOUS
.
me->GV_MESSAGE = GV_MESSAGE .
me->GV_DOMVAL = GV_DOMVAL .
clear me->textid.
if textid is initial.
  IF_T100_MESSAGE~T100KEY = IF_T100_MESSAGE=>DEFAULT_TEXTID.
else.
  IF_T100_MESSAGE~T100KEY = TEXTID.
endif.
  endmethod.


METHOD dm_raise.
*----------------------------------------------------------------------*
* Title  DM_RAISE
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author : David Nava
*----------------------------------------------------------------------*
* Program description:
* Raise delivery message as exception
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lr_dm                    TYPE REF TO /scdl/cl_dm_message,

  lt_messages              TYPE /scdl/dm_message_tab,
  lt_bapiret               TYPE bapirettab,

  ls_message               TYPE /scdl/dm_message_str,
  ls_bapiret               TYPE bapiret2,

  lv_severity              TYPE bapi_mtype.


*=======================================================================
* Input
*=======================================================================

  lr_dm = ir_dm.
  IF ( ir_cx_dlv IS BOUND ).
    lr_dm = ir_cx_dlv->mo_message.
  ENDIF.


*=======================================================================
* GET messages
*=======================================================================

  IF ( lr_dm IS BOUND ).
    lt_messages = lr_dm->get_messages( ).
  ENDIF.
  APPEND LINES OF it_messages TO lt_messages.

* .Document Category
  IF ( iv_doccat IS NOT INITIAL ).
    DELETE lt_messages
      WHERE doccat <> iv_doccat.
    IF ( sy-subrc <> 0 ).                                   "#EC NEEDED
    ENDIF.
  ENDIF.

* . Document ID
  IF ( iv_docid IS NOT INITIAL ).
    DELETE lt_messages
      WHERE docid <> iv_docid.
    IF ( sy-subrc <> 0 ).                                   "#EC NEEDED
    ENDIF.
  ENDIF.

* .Item ID
  IF ( iv_itemid IS NOT INITIAL ).
    DELETE lt_messages
      WHERE itemid <> iv_itemid.
    IF ( sy-subrc <> 0 ).                                   "#EC NEEDED
    ENDIF.
  ENDIF.

* .Handling Unit ID
  IF ( iv_huid IS NOT INITIAL ).
    DELETE lt_messages
      WHERE huid <> iv_huid.
    IF ( sy-subrc <> 0 ).                                   "#EC NEEDED
    ENDIF.
  ENDIF.

* .Logical Field Name
  IF ( iv_logfname IS NOT INITIAL ).
    DELETE lt_messages
      WHERE logfname <> iv_logfname.
    IF ( sy-subrc <> 0 ).                                   "#EC NEEDED
    ENDIF.
  ENDIF.


*=======================================================================
* RAISE exception (if necessary)
*=======================================================================

  LOOP AT lt_messages INTO ls_message.

*   // SET message type.................................................
    IF ( ls_message-msgty = zwmgc_msgty_error ).
      IF ( lv_severity IS INITIAL ).
        lv_severity = zwmgc_msgty_error.
      ENDIF.
    ELSEIF ( ls_message-msgty = zwmgc_msgty_abort ).
      IF ( lv_severity <> zwmgc_msgty_dump ).
        lv_severity = zwmgc_msgty_abort.
      ENDIF.
    ELSEIF ( ls_message-msgty = zwmgc_msgty_dump ).
      lv_severity = zwmgc_msgty_dump.
    ENDIF.

*   // ADD message......................................................
    ls_bapiret-id         = ls_message-msgid.
    ls_bapiret-number     = ls_message-msgno.
    ls_bapiret-type       = ls_message-msgty.
    ls_bapiret-message_v1 = ls_message-msgv1.
    ls_bapiret-message_v2 = ls_message-msgv2.
    ls_bapiret-message_v3 = ls_message-msgv3.
    ls_bapiret-message_v4 = ls_message-msgv4.
    APPEND ls_bapiret TO lt_bapiret.

  ENDLOOP.

  IF ( lv_severity IS INITIAL ).
    lv_severity = zwmgc_msgty_status.
  ENDIF.

  bapiret_raise( iv_severity = lv_severity
                 it_bapiret  = lt_bapiret ).















*
ENDMETHOD.


METHOD get_message.
*----------------------------------------------------------------------*
* Title  MTHD GET_MESSAGE
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author : David Nava
*----------------------------------------------------------------------*
* Program description:
* Returns the raised exception object
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lr_cx_message            TYPE REF TO if_t100_message,
  lr_cx_root               TYPE REF TO cx_root,
  lr_cx_base               TYPE REF TO zcx_ewm_base.


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* GET exception object
*=======================================================================

*  lr_cx_root = me.
*
*  DO.
*
*    IF ( lr_cx_root->previous IS BOUND ).
*      lr_cx_root = lr_cx_root->previous.
*    ELSE.
*      EXIT.
*    ENDIF.
*
*  ENDDO.


*=======================================================================
* Output
*=======================================================================

*  TRY.
*      lr_cx_base ?= lr_cx_root.
*    CATCH cx_root.                                      "#EC NO_HANDLER
*  ENDTRY.










*
ENDMETHOD.


method GET_TEXT_PREVIOUS.
*----------------------------------------------------------------------*
* Title  GET_TEXT_PREVIOUS
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Autor:  David Nava
*----------------------------------------------------------------------*
* Program description:
* Returns message short text of the previous exception
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================
  DATA:

  lr_cx_root               TYPE REF TO cx_root.

*=======================================================================
* Input
*=======================================================================


*=======================================================================
* RETURN short text
*=======================================================================

  lr_cx_root = me.

  DO.

    IF ( lr_cx_root->previous IS BOUND ).
      lr_cx_root = lr_cx_root->previous.
    ELSE.
      EXIT.
    ENDIF.

  ENDDO.

  CALL METHOD cl_message_helper=>get_text_for_message
    EXPORTING
      text   = lr_cx_root
    RECEIVING
      result = rv_text.











*
endmethod.


METHOD IS_ERROR_SEVERITY.
*----------------------------------------------------------------------*
* Title  IS_ERROR_SEVERITY
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author : David Nava
*----------------------------------------------------------------------*
* Program description:
* Check if processing of a SAP function failed
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* CHECK If processing failed
*=======================================================================

  rv_error = abap_false.
  IF ( iv_severity CA wmegc_severity_eax ).
*   .yes
    rv_error = abap_true.

  ENDIF.












*
ENDMETHOD.


METHOD log_raise.
*----------------------------------------------------------------------*
* Title  LOG_RAISE
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author : David Nava
*----------------------------------------------------------------------*
* Program description:
* Raise error message of the application log
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lt_bapiret               TYPE bapirettab,

  lv_severity              TYPE bapi_mtype.


*=======================================================================
* Input
*=======================================================================

  CHECK ir_log IS BOUND.


*=======================================================================
* CHECK If processing failed due to an error?
*=======================================================================

  lv_severity = ir_log->get_severity( ).

  IF ( is_error_severity( lv_severity ) = abap_false ).
*   .no
    RETURN.

  ENDIF.


*=======================================================================
* RAISE exception
*=======================================================================

  lt_bapiret = ir_log->get_prot( ).

  bapiret_raise( iv_severity = lv_severity
                 it_bapiret  = lt_bapiret ).












*
ENDMETHOD.


METHOD string_raise.
*----------------------------------------------------------------------*
* Title  STRING_RAISE
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author : David Nava
*----------------------------------------------------------------------*
* Program description:
* Throw string as exception
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  ls_msgv                  TYPE zewm_s_base_sy.


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* THROW string as exception
*=======================================================================

  ls_msgv = iv_message.

  MESSAGE e000 WITH ls_msgv-v1 ls_msgv-v2 ls_msgv-v3 ls_msgv-v4
    INTO gv_message.

  syst_raise( ).













*
ENDMETHOD.


method SYST_RAISE.
*----------------------------------------------------------------------*
* Title  SYST_RAISE
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author : David Nava
*----------------------------------------------------------------------*
* Program description:
* Throw sy-msg as exception
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  data:

  lr_cx                    type ref to zcx_ewm_base.


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* THROW sy-msg as exception
*=======================================================================

  create object lr_cx.

  lr_cx->zif_ewm_base_exception~gv_msgv1 = sy-msgv1.
  lr_cx->zif_ewm_base_exception~gv_msgv2 = sy-msgv2.
  lr_cx->zif_ewm_base_exception~gv_msgv3 = sy-msgv3.
  lr_cx->zif_ewm_base_exception~gv_msgv4 = sy-msgv4.

  lr_cx->if_t100_message~t100key-msgid = sy-msgid.
  lr_cx->if_t100_message~t100key-msgno = sy-msgno.

  lr_cx->if_t100_message~t100key-attr1 =
                zif_ewm_base_exception~gc_msgv1.
  lr_cx->if_t100_message~t100key-attr2 =
                zif_ewm_base_exception~gc_msgv2.
  lr_cx->if_t100_message~t100key-attr3 =
                zif_ewm_base_exception~gc_msgv3.
  lr_cx->if_t100_message~t100key-attr4 =
                zif_ewm_base_exception~gc_msgv4.

  raise exception lr_cx.


endmethod.
ENDCLASS.
