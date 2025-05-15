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
*----------------------------------------------------------------------*
***INCLUDE LZEWM_FG_BASE_QRFCF01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Form  RESTART
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*      -->P_ABAP_FALSE  text
*      -->P_LV_PROT_NO  text
*      -->P_IS_RFC_QUEUE  text
*      -->P_LR_LOG  text
*      -->P_LS_LOG_HEAD  text
*----------------------------------------------------------------------*
FORM restart USING iv_lock_error TYPE xfeld
                   iv_prot_no    TYPE /scwm/de_tologno
                   is_rfc_queue  TYPE /scwm/s_rfc_queue
                   lr_log        TYPE REF TO /scwm/cl_log
                   ls_log_head   TYPE bal_s_log.


*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:
    lv_loghandle             TYPE balloghndl.


*=======================================================================
* Input
*=======================================================================

*=======================================================================
* SAVE Log
*=======================================================================

  TRY.
      lr_log->save_applog(
                EXPORTING
                  is_log       = ls_log_head
                IMPORTING
                  ev_loghandle = lv_loghandle ).
      lr_log->save_applog2db( iv_loghandle = lv_loghandle ).
      COMMIT WORK.
    CATCH /scwm/cx_basics.                              "#EC NO_HANDLER
  ENDTRY.


*=======================================================================
* RESTART qRFC
*=======================================================================

  IF ( iv_lock_error = abap_true ).
    CALL FUNCTION 'RESTART_OF_BACKGROUNDTASK'.
  ENDIF.

  MESSAGE e011(/scwm/erpintegration)
         WITH iv_prot_no is_rfc_queue-queue.


ENDFORM.
