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
interface ZIF_EWM_BASE_LOGOBJECTS_C
  public .


  constants GC_O_LOG_QRFC type BALOBJ_D value 'Z_LOG_QRFC' ##NO_TEXT.
  constants GC_S_TASK_CONFIRM type BALSUBOBJ value 'TO_CONFIRM' ##NO_TEXT.
  constants GC_S_CREATE_HU type BALSUBOBJ value 'CREATE_HU' ##NO_TEXT.
  constants GC_S_WO_MERGE type BALSUBOBJ value 'WO_MERGE' ##NO_TEXT.
  constants GC_S_CLOSE_HU type BALSUBOBJ value 'CLOSE_HU' ##NO_TEXT.
  constants GC_S_CANCEL_PICK_HU type BALSUBOBJ value 'HU_CANCPIC' ##NO_TEXT.
  constants GC_S_PACK_HU type BALSUBOBJ value 'PACK_HU' ##NO_TEXT.
  constants GC_S_IDOC_END_PALLET type BALSUBOBJ value 'IDOC_END_PALLET' ##NO_TEXT.
  constants GC_S_TASK_UPDATE type BALSUBOBJ value 'TASK_UPDATE' ##NO_TEXT.
endinterface.
