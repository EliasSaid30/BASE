*----------------------------------------------------------------------*
* Title: ZIF_EWM_BASE_EXCEPTION
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author : Alberto Magaña
*----------------------------------------------------------------------*
* Program description:
* ZIF_EWM_BASE_EXCEPTION
*----------------------------------------------------------------------*
interface ZIF_EWM_BASE_EXCEPTION
  public .


  constants GC_MSGV1 type SEOCPDNAME value 'ZIF_EWM_BASE_EXCEPTION~GV_MSGV1' ##NO_TEXT.
  constants GC_MSGV2 type SEOCPDNAME value 'ZIF_EWM_BASE_EXCEPTION~GV_MSGV2' ##NO_TEXT.
  constants GC_MSGV3 type SEOCPDNAME value 'ZIF_EWM_BASE_EXCEPTION~GV_MSGV3' ##NO_TEXT.
  constants GC_MSGV4 type SEOCPDNAME value 'ZIF_EWM_BASE_EXCEPTION~GV_MSGV4' ##NO_TEXT.
  data GV_MSGV1 type SYMSGV .
  data GV_MSGV2 type SYMSGV .
  data GV_MSGV3 type SYMSGV .
  data GV_MSGV4 type SYMSGV .
endinterface.
