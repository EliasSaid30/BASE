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
interface ZIF_EWM_BASE_TM_APPL
  public .


  constants GC_CLEANUP_END type STRING value 'END' ##NO_TEXT.
  constants GC_CLEANUP_COMMIT type STRING value 'COMMIT' ##NO_TEXT.
  constants GC_CLEANUP_DEQUEUE type STRING value 'DEQUEUE' ##NO_TEXT.
  constants GC_CLEANUP_ROLLBACK type STRING value 'ROLLBACK' ##NO_TEXT.
  constants GC_INDICATOR_BY_SYSTEM type /SCDL/DL_INDICATOR value 'C' ##NO_TEXT.
  constants GC_INDICATOR_CHANGE_MANUALLY type /SCDL/DL_INDICATOR value 'M' ##NO_TEXT.
  constants GC_INDICATOR_NOT_CHANGEABLE type /SCDL/DL_INDICATOR value 'E' ##NO_TEXT.
  constants GC_INDICATOR_CHANGEABLE type /SCDL/DL_INDICATOR value 'P' ##NO_TEXT.
  constants GC_PARTY_ROLE_STPRTF type /SCDL/DL_PARTY_ROLE value 'STPRTF' ##NO_TEXT.
  data GV_CLEANUP_REASON type STRING .
  data GV_CLEANUP_REG type XFELD .

  class-methods CLEANUP
    importing
      !IV_REASON type STRING .
  class-methods CLEANUP_NOW
    importing
      !IV_LGNUM type /SCWM/LGNUM .
endinterface.
