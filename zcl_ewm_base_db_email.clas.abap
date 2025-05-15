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
class ZCL_EWM_BASE_DB_EMAIL definition
  public
  final
  create public .

public section.

  class-methods SEND_MAIL_BY_DLIST
    importing
      !IV_SUBJECT type SO_OBJ_DES
      !IV_DIST_LIST type SO_OBJ_NAM
      !IV_SYSTEM_DLI type SO_TEXT001
      !IV_COMMIT type BOOLEAN optional
      !IV_DEFAULT_FORMAT type BOOLEAN optional
      !IT_BODY_MESSAGE type SOLI_TAB
      !IT_ATTACHMENTS type ZEWM_TT_BASE_EMAIL_ATTACHMENT
    returning
      value(RV_SENT_TO_ALL) type OS_BOOLEAN
    exceptions
      NO_DIST_LIST
      ERROR_EMAIL .
protected section.
private section.

  class-data LR_SEND_EMAIL type ref to CL_BCS .
  class-data LR_DOCUMENT type ref to CL_DOCUMENT_BCS .
  class-data LR_RECIPIENT type ref to IF_RECIPIENT_BCS .
  class-data LR_SENDER type ref to IF_SENDER_BCS .
  constants GC_HTM type SO_OBJ_TP value 'HTM' ##NO_TEXT.
  class-data GS_ATTACHMENTS type ZEWM_S_BASE_EMAIL_ATTACHMENT .

  class-methods CHECK_DLIST
    importing
      !IV_DIST_LIST type SO_OBJ_NAM
      !IV_SYSTEM_DLI type SO_TEXT001
    returning
      value(RV_ERROR) type BOOLEAN .
  class-methods SET_BODY_FORMAT
    importing
      !IT_BODY_MESSAGE type SOLI_TAB
    returning
      value(RT_BODY_MESSAGE) type SOLI_TAB .
ENDCLASS.



CLASS ZCL_EWM_BASE_DB_EMAIL IMPLEMENTATION.


METHOD CHECK_DLIST.
*----------------------------------------------------------------------*
* Title  MTHD CHECK_DLIST
* Copyright (c) 2024 ProLogic LA. All rights reserved
*----------------------------------------------------------------------*
* Author : Elias Hernandez
*----------------------------------------------------------------------*
* Program description:
* Read distribution list
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:
    lt_objpara TYPE TABLE OF selc,
    lt_objparb TYPE TABLE OF soop1,
    lt_member  TYPE TABLE OF sodm1,

    lv_error   TYPE boolean.

*=======================================================================
* Process
*=======================================================================

  ". Read Distribution list
  CALL FUNCTION 'SO_DLI_READ'
    EXPORTING
      distributionlist           = iv_dist_list
      system_dli                 = iv_system_dli
    TABLES
      member                     = lt_member
      objpara                    = lt_objpara
      objparb                    = lt_objparb
    EXCEPTIONS
      active_user_not_exist      = 1
      communication_failure      = 2
      component_not_available    = 3
      dl_name_not_exist          = 4
      folder_not_exist           = 5
      folder_no_authorization    = 6
      forwarder_not_exist        = 7
      object_not_exist           = 8
      object_no_authorization    = 9
      operation_no_authorization = 10
      owner_not_exist            = 11
      parameter_error            = 12
      substitute_not_active      = 13
      substitute_not_defined     = 14
      system_failure             = 15
      user_not_exist             = 16
      x_error                    = 17
      OTHERS                     = 18.
  IF sy-subrc <> 0.
    ". No distribution list found
    lv_error = abap_true.
  ENDIF.

*=======================================================================
* Output
*=======================================================================

  rv_error = lv_error.











*
ENDMETHOD.


METHOD send_mail_by_dlist.
*----------------------------------------------------------------------*
* Title  MTHD SEND_MAIL_BY_DLIST
* Copyright (c) 2024 ProLogic LA. All rights reserved
*----------------------------------------------------------------------*
* Author : Elias Hernandez
*----------------------------------------------------------------------*
* Program description:
* Send E-mail using distribution list
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:
    lt_body_message TYPE soli_tab,

    lv_error        TYPE os_boolean,
    lv_sent_to_all  TYPE os_boolean,
    lv_private      TYPE os_boolean.


*=======================================================================
* Process
*=======================================================================

  ". Check Distribution list exists
  lv_error = check_dlist(
      iv_dist_list  = iv_dist_list
      iv_system_dli = iv_system_dli ).

  IF lv_error EQ abap_true.
    RAISE no_dist_list.
  ENDIF.

* Begin creation of E-mail
  TRY.
      lr_send_email = cl_bcs=>create_persistent( ).

      ". Create message body (document)
      TRY.
          ". Set format for message
          IF iv_default_format EQ abap_true.
            lt_body_message = set_body_format(
                              it_body_message = it_body_message ).
          ELSE.
            lt_body_message = it_body_message.
          ENDIF.

          lr_document = cl_document_bcs=>create_document( i_type    = gc_htm
                                                          i_subject = iv_subject
                                                          i_text    = lt_body_message ).
        CATCH cx_document_bcs.
          RAISE error_email.
      ENDTRY.

      ". Set message body into E-mail object
      lr_send_email->set_document( lr_document ).

      ". If there are attachments, add them into the document
      IF it_attachments IS NOT INITIAL.
        LOOP AT it_attachments INTO gs_attachments.
          TRY.
              lr_document->add_attachment(
                  i_attachment_type     = gs_attachments-attachment_type       ". Mandatory value
                  i_attachment_subject  = gs_attachments-attachment_subject    ". Mandatory value
                  i_attachment_size     = gs_attachments-attachment_size       ". Optional
                  i_attachment_language = gs_attachments-attachment_language   ". Optional
                  i_att_content_text    = gs_attachments-att_content_text      ". Optional
                  i_att_content_hex     = gs_attachments-att_content_hex       ". Optional
                  i_attachment_header   = gs_attachments-attachment_header     ". Optional
                  iv_vsi_profile        = gs_attachments-vsi_profile ).        ". Optional
            CATCH cx_document_bcs.
              RAISE error_email.
          ENDTRY.
        ENDLOOP.
      ENDIF.

      ". Set sender (SAP-User)
      TRY.
          lr_sender = cl_sapuser_bcs=>create( sy-uname ).
          lr_send_email->set_sender( lr_sender ).
        CATCH cx_address_bcs.
          RAISE error_email.
      ENDTRY.

      ". Set receiver (from distribution list)
      IF iv_system_dli EQ abap_true.
        lv_private = abap_false.
      ELSE.
        lv_private = abap_true.
      ENDIF.

      TRY.
          lr_recipient = cl_distributionlist_bcs=>getu_persistent( i_dliname = iv_dist_list "lv_lista_distrib
                                                                   i_private = lv_private ).
          lr_send_email->add_recipient( i_recipient = lr_recipient ).
        CATCH cx_address_bcs.
          RAISE error_email.
      ENDTRY.

      ". Send E-mail
      lv_sent_to_all = lr_send_email->send( i_with_error_screen = abap_true ).

    CATCH cx_send_req_bcs.
      RAISE error_email.
  ENDTRY.


*=======================================================================
* Output
*=======================================================================

  rv_sent_to_all = lv_sent_to_all.

  IF iv_commit EQ abap_true.
    COMMIT WORK.
  ELSE.
    RETURN.
  ENDIF.











*
ENDMETHOD.


METHOD set_body_format.
*----------------------------------------------------------------------*
* Title  MTHD SEND_MAIL_BY_DLIST
* Copyright (c) 2024 ProLogic LA. All rights reserved
*----------------------------------------------------------------------*
* Author : Elias Hernandez
*----------------------------------------------------------------------*
* Program description:
* Set body format for message body
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:
    lt_body_message TYPE soli_tab,

    ls_body_message TYPE soli.

  CONSTANTS:
    lc_html_open TYPE so_text255 VALUE '<HTML> <BODY>',
    lc_html_clse TYPE so_text255 VALUE '</BODY> </HTML>',
    lc_jump      TYPE so_text255 VALUE '</P>'.


*=======================================================================
* Process
*=======================================================================

  ". Set HTML opening tag
  ls_body_message-line = lc_html_open.
  APPEND ls_body_message TO lt_body_message.

  ". Add jummp indicator
  LOOP AT it_body_message INTO ls_body_message.
    CONCATENATE ls_body_message-line
                lc_jump
           INTO ls_body_message-line.
    APPEND ls_body_message TO lt_body_message.
  ENDLOOP.

  ". Set HTML closing tag
  ls_body_message-line = lc_html_clse.
  APPEND ls_body_message TO lt_body_message.


*=======================================================================
* Output
*=======================================================================

  IF lt_body_message IS NOT INITIAL.
    rt_body_message = lt_body_message.
  ENDIF.











*
ENDMETHOD.
ENDCLASS.
