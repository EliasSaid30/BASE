*----------------------------------------------------------------------*
* Title: ZIF_EWM_BASE_IDOC_C
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author : Alberto Magaña
*----------------------------------------------------------------------*
* Program description:
* ZIF_EWM_BASE_IDOC_C
*----------------------------------------------------------------------*
interface ZIF_EWM_BASE_IDOC_C
  public .


  constants GC_I_BAND type EDI_IDOCTP value 'ZEWM_I_BAND' ##NO_TEXT.
  constants GC_MESTY_BAND type EDI_MESTYP value 'ZEWM_TM_BAND' ##NO_TEXT.
  constants GC_RCVPRT type EDI_RCVPRT value 'LS' ##NO_TEXT.
  constants GC_SNDPRT type EDI_SNDPRT value 'LS' ##NO_TEXT.
  constants GC_SEG_BAND_C type EDILSEGTYP value 'ZEWM_E_BAND_C' ##NO_TEXT.
  constants GC_SEG_BAND_I type EDILSEGTYP value 'ZEWM_E_BAND_U' ##NO_TEXT.
endinterface.
