*----------------------------------------------------------------------*
* Title: ZIF_EWM_BASE_C
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author : Alberto Magaña
*----------------------------------------------------------------------*
* Program description:
* ZIF_EWM_BASE_C
*----------------------------------------------------------------------*
interface ZIF_EWM_BASE_C
  public .


  constants GC_CUSTOMERCONSTANT type BU_ID_TYPE value 'CRM002' ##NO_TEXT.
  constants GC_VENDORCONSTANT type BU_ID_TYPE value 'CRM004' ##NO_TEXT.
  constants GC_CUSTOMER_PREFIXCONSTANT type CHAR01 value 'C' ##NO_TEXT.
  constants GC_VENDOR_PREFIXCONSTANT type CHAR01 value 'P' ##NO_TEXT.
  constants GC_UPDKZ_UPDATECONSTANT type UPDKZ_D value 'U' ##NO_TEXT.
  constants GC_UPDKZ_INSERTCONSTANT type UPDKZ_D value 'I' ##NO_TEXT.
  constants GC_UPDKZ_DELETECONSTANT type UPDKZ_D value 'D' ##NO_TEXT.
  constants GC_FIELDNAME_HUID type FIELDNAME value 'HUID' ##NO_TEXT.
  constants GC_FIELDNAME_NLTYPCONSTANT type FIELDNAME value 'NLTYP' ##NO_TEXT.
  constants GC_FIELDNAME_NLBERCONSTANT type FIELDNAME value 'NLBER' ##NO_TEXT.
  constants GC_FIELDNAME_NLPLACONSTANT type FIELDNAME value 'NLPLA' ##NO_TEXT.
  constants GC_FIELDNAME_KZSUBCONSTANT type FIELDNAME value ' ' ##NO_TEXT.
  constants GC_PACK_LEVEL_TYPECONSTANT type /SCWM/DE_PSLEVELTYPE value 'QCLP' ##NO_TEXT.
  constants GC_QUANCLA_UCONSTANT type /SCWM/DE_QUANCLA value 'U' ##NO_TEXT.
  constants GC_QUANCLA_CCONSTANT type /SCWM/DE_QUANCLA value 'C' ##NO_TEXT.
  constants GC_QUANCLA_PCONSTANT type /SCWM/DE_QUANCLA value 'P' ##NO_TEXT.
  constants GC_UOM_UNCONSTANT type MEINH value 'UN' ##NO_TEXT.
  constants GC_UOM_DYCONSTANT type MEINH value 'DY' ##NO_TEXT.
  constants GC_UOM_CJCONSTANT type MEINH value 'CJ' ##NO_TEXT.
  constants GC_UOM_PALCONSTANT type MEINH value 'PAL' ##NO_TEXT.
  constants GC_PACK_LEVEL_TYPE_QCLC type /SCWM/DE_PSLEVELTYPE value 'QCLC' ##NO_TEXT.
  constants GC_PROCTY_301P type /SCWM/DE_PROCTY value '301P' ##NO_TEXT.
  constants GC_CARAC_GUION type CHAR01 value '-' ##NO_TEXT.
  constants GC_FLT_Z_SCWM_SR_SEND_SHPMNT type PPFDFLTCO1 value 'Z_SCWM_SR_SEND_SHPMNT' ##NO_TEXT.
  constants GC_FLT_ZEWM_SR_SEND_MSG_SHPMNT type PPFDFLTCO1 value 'ZEWM_SR_SEND_MSG_SHPMNT' ##NO_TEXT.
endinterface.
