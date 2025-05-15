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
class ZCX_EWM_BASE_DB definition
  public
  inheriting from ZCX_EWM_BASE
  create public .

public section.

  constants:
    begin of FDO_SET_REFDOC_H,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '016',
      attr1 type scx_attrname value 'GV_DOCNO',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of FDO_SET_REFDOC_H .
  constants:
    begin of FDO_SET_REFDOC_H_2,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '017',
      attr1 type scx_attrname value 'GV_DOCCAT',
      attr2 type scx_attrname value 'GV_DOCNO',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of FDO_SET_REFDOC_H_2 .
  constants:
    begin of GET_BY_QUEUE,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '007',
      attr1 type scx_attrname value 'GV_LGNUM',
      attr2 type scx_attrname value 'GV_QUEUE',
      attr3 type scx_attrname value 'GV_STATUS',
      attr4 type scx_attrname value 'GV_FLGWHO',
    end of GET_BY_QUEUE .
  constants:
    begin of FDO_SET_REFDOC_H_3,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '018',
      attr1 type scx_attrname value 'GV_DOCCAT',
      attr2 type scx_attrname value 'GV_DOCNO',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of FDO_SET_REFDOC_H_3 .
  constants:
    begin of GET_HU_ASSIGNED_BY_WHO,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '005',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of GET_HU_ASSIGNED_BY_WHO .
  constants:
    begin of WHO_BY_TOPWHO,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '014',
      attr1 type scx_attrname value 'GV_WHO',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of WHO_BY_TOPWHO .
  constants:
    begin of PRODUCT_GET_MATNR_BY_MATID,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '003',
      attr1 type scx_attrname value 'GV_MATID_MDL',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of PRODUCT_GET_MATNR_BY_MATID .
  constants:
    begin of PRODUCT_GET_MATID_BY_MATNR,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '001',
      attr1 type scx_attrname value 'GV_MATNR',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of PRODUCT_GET_MATID_BY_MATNR .
  constants:
    begin of PARAM_GET_NOT_UNIQUE,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '024',
      attr1 type scx_attrname value 'GV_KEYNAM',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of PARAM_GET_NOT_UNIQUE .
  constants:
    begin of PARAM_GET,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '023',
      attr1 type scx_attrname value 'GV_KEYNAM',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of PARAM_GET .
  constants:
    begin of PARAM_FIELD_NOT_SEL,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '022',
      attr1 type scx_attrname value 'GV_KEYNAM',
      attr2 type scx_attrname value 'GV_FIELDN',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of PARAM_FIELD_NOT_SEL .
  constants:
    begin of PARAM_FIELD_NOT_MAP,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '021',
      attr1 type scx_attrname value 'GV_KEYNAM',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of PARAM_FIELD_NOT_MAP .
  constants:
    begin of PARAM_FIELD_NOT_DATA,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '020',
      attr1 type scx_attrname value 'GV_KEYNAM',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of PARAM_FIELD_NOT_DATA .
  constants:
    begin of PARAM_FIELD_MULTI,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '019',
      attr1 type scx_attrname value 'GV_KEYNAM',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of PARAM_FIELD_MULTI .
  constants:
    begin of HU_READ_STATUS,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '051',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of HU_READ_STATUS .
  constants:
    begin of PARAMETER_INVALID,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '010',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of PARAMETER_INVALID .
  constants:
    begin of HU_SET_IDENT_PACK_INIT,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '008',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of HU_SET_IDENT_PACK_INIT .
  constants:
    begin of HU_READ_HUITM,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '013',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of HU_READ_HUITM .
  constants:
    begin of HU_READ_HUIDENT,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '012',
      attr1 type scx_attrname value 'GV_HUIDENT',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of HU_READ_HUIDENT .
  constants:
    begin of HU_READ_HUHDR_HUIDENT,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '012',
      attr1 type scx_attrname value 'GV_HUIDENT',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of HU_READ_HUHDR_HUIDENT .
  constants:
    begin of HU_READ_HUHDR_GUID,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '011',
      attr1 type scx_attrname value 'GV_GUID_HU',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of HU_READ_HUHDR_GUID .
  constants:
    begin of HU_READ_GUID,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '011',
      attr1 type scx_attrname value 'GV_GUID_HU',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of HU_READ_GUID .
  constants:
    begin of HU_DELETE_PACK_INIT,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '008',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of HU_DELETE_PACK_INIT .
  constants:
    begin of HU_CREATE_PACK_INIT,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '008',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of HU_CREATE_PACK_INIT .
  constants:
    begin of HU_CREATE,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '009',
      attr1 type scx_attrname value 'GV_HUIDENT',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of HU_CREATE .
  constants:
    begin of GET_MATPACK_BY_MATID,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '002',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of GET_MATPACK_BY_MATID .
  constants:
    begin of WHO_HU_ASSIGN,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '006',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of WHO_HU_ASSIGN .
  constants:
    begin of READ_ACTIVE_ACTIVITY_TU,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '046',
      attr1 type scx_attrname value 'GV_TU_NUM',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of READ_ACTIVE_ACTIVITY_TU .
  constants:
    begin of READ_TU_KEY,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '045',
      attr1 type scx_attrname value 'GV_TU_NUM_EXT',
      attr2 type scx_attrname value 'GV_LGNUM',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of READ_TU_KEY .
  constants:
    begin of TU_GET_UNIQUE,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '040',
      attr1 type scx_attrname value 'GV_TU_NUM_EXT',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of TU_GET_UNIQUE .
  constants:
    begin of TU_DEL_HU,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '044',
      attr1 type scx_attrname value 'GV_GUID_HU',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of TU_DEL_HU .
  constants:
    begin of TU_READ_MULTI,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '043',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of TU_READ_MULTI .
  constants:
    begin of TU_READ_DLV_HU_DB,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '042',
      attr1 type scx_attrname value 'GV_TU_NUM_EXT',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of TU_READ_DLV_HU_DB .
  constants:
    begin of TU_READ_DLV_HU,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '041',
      attr1 type scx_attrname value 'GV_TU_NUM_EXT',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of TU_READ_DLV_HU .
  constants:
    begin of TU_LOADING_ACTIVE,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '036',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of TU_LOADING_ACTIVE .
  constants:
    begin of TU_READ_UNIQUE,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '039',
      attr1 type scx_attrname value 'GV_TU_NUM_EXT',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of TU_READ_UNIQUE .
  constants:
    begin of TU_READ,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '038',
      attr1 type scx_attrname value 'GV_TU_NUM_EXT',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of TU_READ .
  constants:
    begin of TU_SET_ARRIVAL_AT_CHK_POINT,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '037',
      attr1 type scx_attrname value 'GV_TU_NUM',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of TU_SET_ARRIVAL_AT_CHK_POINT .
  constants:
    begin of TU_SET_LOADING_FINISHED,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '032',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of TU_SET_LOADING_FINISHED .
  constants:
    begin of TU_GET_STATUS,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '035',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of TU_GET_STATUS .
  constants:
    begin of TU_GET_BO_TU,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '034',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of TU_GET_BO_TU .
  constants:
    begin of TU_SET_DEPARTURE_FROM_CHKPT,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '033',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of TU_SET_DEPARTURE_FROM_CHKPT .
  constants:
    begin of READ_TU_DATA,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '031',
      attr1 type scx_attrname value 'GV_ROUTE_ID',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of READ_TU_DATA .
  constants:
    begin of TU_SET_LOADING_STARTED,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '028',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of TU_SET_LOADING_STARTED .
  constants:
    begin of READ_TUNIT,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '030',
      attr1 type scx_attrname value 'GV_TU_NUM',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of READ_TUNIT .
  constants:
    begin of TU_SET_LOADING_GI,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '029',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of TU_SET_LOADING_GI .
  constants:
    begin of TU_CREATE,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '026',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of TU_CREATE .
  constants:
    begin of TU_CREATE_SR_BOM,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '027',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of TU_CREATE_SR_BOM .
  constants:
    begin of WHO_SELECT,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '015',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of WHO_SELECT .
  constants:
    begin of TU_ADD_HU,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '025',
      attr1 type scx_attrname value 'GV_HUIDENT',
      attr2 type scx_attrname value 'GV_TU_NUM_EXT',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of TU_ADD_HU .
  constants:
    begin of WMPACKING_INIT,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '004',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of WMPACKING_INIT .
  constants:
    begin of HU_GET_IDENT_TICKET,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '047',
      attr1 type scx_attrname value 'GV_HUIDENT',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of HU_GET_IDENT_TICKET .
  constants:
    begin of HU_READ_IDENT_BY_RANGE,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '049',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of HU_READ_IDENT_BY_RANGE .
  constants:
    begin of TO_READ_MULTI_WHR,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '053',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of TO_READ_MULTI_WHR .
  constants:
    begin of DLV_HEAD_TO_REFDOC_R,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '052',
      attr1 type scx_attrname value 'GV_REFDOCCAT',
      attr2 type scx_attrname value 'GV_DOCNO',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of DLV_HEAD_TO_REFDOC_R .
  constants:
    begin of HU_READ_IDENT,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '050',
      attr1 type scx_attrname value 'GV_HUIDART',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of HU_READ_IDENT .
  constants:
    begin of GET_IDENT_TICKET,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '048',
      attr1 type scx_attrname value 'GV_HUIDENT',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of GET_IDENT_TICKET .
  constants:
    begin of HU_READ_BY_IDENT,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '054',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of HU_READ_BY_IDENT .
  constants:
    begin of HU_READ_HUHDR_MULTI,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '055',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of HU_READ_HUHDR_MULTI .
  constants:
    begin of HU_MOVE_PACK_INIT,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '056',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of HU_MOVE_PACK_INIT .
  constants:
    begin of HU_GET_IDENT_BO,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '057',
      attr1 type scx_attrname value 'GV_HUIDENT',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of HU_GET_IDENT_BO .
  constants:
    begin of READ_TRART,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '058',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of READ_TRART .
  constants:
    begin of EMPTY_FIELDS,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '059',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of EMPTY_FIELDS .
  constants:
    begin of NO_FOUND,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '060',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of NO_FOUND .
  constants:
    begin of TO_GET_CONF_HU,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '063',
      attr1 type scx_attrname value 'GV_HUIDENT',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of TO_GET_CONF_HU .
  constants:
    begin of TO_GET_OPEN_HU,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '064',
      attr1 type scx_attrname value 'GV_HUIDENT',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of TO_GET_OPEN_HU .
  constants:
    begin of TO_GET_OPEN_WHO,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '065',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of TO_GET_OPEN_WHO .
  constants:
    begin of HU_REPL_ASS,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '066',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of HU_REPL_ASS .
  constants:
    begin of WRK_CTR_NOT_FOUND,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '067',
      attr1 type scx_attrname value 'GV_WRKCTR',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of WRK_CTR_NOT_FOUND .
  constants:
    begin of READ_LEG,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '068',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of READ_LEG .
  constants:
    begin of READ_STOPS,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '069',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of READ_STOPS .
  constants:
    begin of ROUTE_READ_STORES_LEGS,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '070',
      attr1 type scx_attrname value 'GV_ROUTE_ID',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of ROUTE_READ_STORES_LEGS .
  constants:
    begin of ROUTE_READ_STORES_STOPS,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '071',
      attr1 type scx_attrname value 'GV_ROUTE_ID',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of ROUTE_READ_STORES_STOPS .
  constants:
    begin of READ_CD_ROUTE,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '072',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of READ_CD_ROUTE .
  constants:
    begin of ROUTE_READ,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '073',
      attr1 type scx_attrname value 'GV_ROUTE_ID',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of ROUTE_READ .
  constants:
    begin of ROUTE_READ_STORES_NOT_FOUND,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '074',
      attr1 type scx_attrname value 'GV_ROUTE_ID',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of ROUTE_READ_STORES_NOT_FOUND .
  constants:
    begin of ROUTE_READ_UNIQUE,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '075',
      attr1 type scx_attrname value 'GV_ROUTE_ID',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of ROUTE_READ_UNIQUE .
  constants:
    begin of PM_GUID_NOT_FOUND,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '076',
      attr1 type scx_attrname value 'GV_NEW_PACK_MAT',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of PM_GUID_NOT_FOUND .
  constants:
    begin of HU_NOT_FOUND,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '077',
      attr1 type scx_attrname value 'GV_HU_IDENT',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of HU_NOT_FOUND .
  constants:
    begin of HU_HEADER_NOT_CHANGED,
      msgid type symsgid value 'ZEWM_BASE_DB',
      msgno type symsgno value '079',
      attr1 type scx_attrname value 'GV_HUIDENT',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of HU_HEADER_NOT_CHANGED .
  data GV_CHKPT type /SCWM/DE_CHECK_POINT .
  data GV_DOCCAT type /SCDL/DL_DOCCAT .
  data GV_DOCNO type /SCDL/DL_DOCNO .
  data GV_DOOR type /SCWM/DE_DOOR .
  data GV_FIELDN type FIELDNAME .
  data GV_FLGWHO type /SCWM/DE_FLGWHO .
  data GV_GUID_HU type /SCWM/GUID_HU .
  data GV_HUIDART type /SCWM/DE_HUIDART .
  data GV_HUIDENT type /SCWM/DE_HUIDENT .
  data GV_HU_IDENT type /SCWM/DE_IDENT .
  data GV_HU_STATUS type CRM_J_STATUS .
  data GV_LGNUM type /SCWM/LGNUM .
  data GV_KEYNAM type ZEWM_DE_BASE_PARAMS_KEYNAM .
  data GV_MATID_MDL type /SCMB/MDL_MATID .
  data GV_MATNR type /SAPAPO/MATNR .
  data GV_QUEUE type /SCWM/DE_QUEUE .
  data GV_REFDOCCAT type /SCDL/DL_REFDOCCAT .
  data GV_REFDOCNO type /SCDL/DL_REFDOCNO .
  data GV_ROUTE_ID type /SCMB/DE_ROUTE_ID .
  data GV_RSRC_TYPE type /SCWM/DE_RSRC_TYPE .
  data GV_STATUS type /SCWM/DE_WHOSTAT .
  data GV_TU_NUM_EXT type /SCWM/DE_TU_NUM_EXT .
  data GV_TU_NUM type /SCWM/DE_TU_NUM .
  data GV_WHO type /SCWM/DE_WHO .
  data GV_WRKCTR type /SCWM/DE_WORKSTATION .
  data GV_ROUTE_GUID type /SCMB/DE_GUID .
  data GV_NEW_PACK_MAT type /SCWM/DE_RF_NEW_PMATNR .

  methods CONSTRUCTOR
    importing
      !TEXTID like IF_T100_MESSAGE=>T100KEY optional
      !PREVIOUS like PREVIOUS optional
      !GV_MESSAGE type STRING optional
      !GV_DOMVAL type DOMVALUE_L optional
      !GV_CHKPT type /SCWM/DE_CHECK_POINT optional
      !GV_DOCCAT type /SCDL/DL_DOCCAT optional
      !GV_DOCNO type /SCDL/DL_DOCNO optional
      !GV_DOOR type /SCWM/DE_DOOR optional
      !GV_FIELDN type FIELDNAME optional
      !GV_FLGWHO type /SCWM/DE_FLGWHO optional
      !GV_GUID_HU type /SCWM/GUID_HU optional
      !GV_HUIDART type /SCWM/DE_HUIDART optional
      !GV_HUIDENT type /SCWM/DE_HUIDENT optional
      !GV_HU_IDENT type /SCWM/DE_IDENT optional
      !GV_HU_STATUS type CRM_J_STATUS optional
      !GV_LGNUM type /SCWM/LGNUM optional
      !GV_KEYNAM type ZEWM_DE_BASE_PARAMS_KEYNAM optional
      !GV_MATID_MDL type /SCMB/MDL_MATID optional
      !GV_MATNR type /SAPAPO/MATNR optional
      !GV_QUEUE type /SCWM/DE_QUEUE optional
      !GV_REFDOCCAT type /SCDL/DL_REFDOCCAT optional
      !GV_REFDOCNO type /SCDL/DL_REFDOCNO optional
      !GV_ROUTE_ID type /SCMB/DE_ROUTE_ID optional
      !GV_RSRC_TYPE type /SCWM/DE_RSRC_TYPE optional
      !GV_STATUS type /SCWM/DE_WHOSTAT optional
      !GV_TU_NUM_EXT type /SCWM/DE_TU_NUM_EXT optional
      !GV_TU_NUM type /SCWM/DE_TU_NUM optional
      !GV_WHO type /SCWM/DE_WHO optional
      !GV_WRKCTR type /SCWM/DE_WORKSTATION optional
      !GV_ROUTE_GUID type /SCMB/DE_GUID optional
      !GV_NEW_PACK_MAT type /SCWM/DE_RF_NEW_PMATNR optional .
  class-methods RAISE_SYST
    raising
      ZCX_EWM_BASE_DB .
  class-methods RAISE_BAPIRET
    importing
      !IV_SEVERITY type BAPI_MTYPE optional
      !IT_BAPIRET type BAPIRETTAB
    raising
      ZCX_EWM_BASE_DB .
  class-methods RAISE_LOG
    importing
      !IR_LOG type ref to /SCWM/CL_LOG
    raising
      ZCX_EWM_BASE_DB .
  class-methods RAISE_DM
    importing
      !IR_DM type ref to /SCDL/CL_DM_MESSAGE optional
      !IR_CX_DLV type ref to /SCDL/CX_DELIVERY optional
      !IT_MESSAGES type /SCDL/DM_MESSAGE_TAB optional
      !IV_DOCCAT type /SCDL/DL_DOCCAT optional
      !IV_DOCID type /SCDL/DL_DOCID optional
      !IV_ITEMID type /SCDL/DL_ITEMID optional
      !IV_HUID type /SCDL/DL_HUID optional
      !IV_LOGFNAME type /SCDL/DL_LOGFNAME optional
    raising
      ZCX_EWM_BASE_DB .
protected section.
private section.
ENDCLASS.



CLASS ZCX_EWM_BASE_DB IMPLEMENTATION.


  method CONSTRUCTOR.
CALL METHOD SUPER->CONSTRUCTOR
EXPORTING
PREVIOUS = PREVIOUS
GV_MESSAGE = GV_MESSAGE
GV_DOMVAL = GV_DOMVAL
.
me->GV_CHKPT = GV_CHKPT .
me->GV_DOCCAT = GV_DOCCAT .
me->GV_DOCNO = GV_DOCNO .
me->GV_DOOR = GV_DOOR .
me->GV_FIELDN = GV_FIELDN .
me->GV_FLGWHO = GV_FLGWHO .
me->GV_GUID_HU = GV_GUID_HU .
me->GV_HUIDART = GV_HUIDART .
me->GV_HUIDENT = GV_HUIDENT .
me->GV_HU_IDENT = GV_HU_IDENT .
me->GV_HU_STATUS = GV_HU_STATUS .
me->GV_LGNUM = GV_LGNUM .
me->GV_KEYNAM = GV_KEYNAM .
me->GV_MATID_MDL = GV_MATID_MDL .
me->GV_MATNR = GV_MATNR .
me->GV_QUEUE = GV_QUEUE .
me->GV_REFDOCCAT = GV_REFDOCCAT .
me->GV_REFDOCNO = GV_REFDOCNO .
me->GV_ROUTE_ID = GV_ROUTE_ID .
me->GV_RSRC_TYPE = GV_RSRC_TYPE .
me->GV_STATUS = GV_STATUS .
me->GV_TU_NUM_EXT = GV_TU_NUM_EXT .
me->GV_TU_NUM = GV_TU_NUM .
me->GV_WHO = GV_WHO .
me->GV_WRKCTR = GV_WRKCTR .
me->GV_ROUTE_GUID = GV_ROUTE_GUID .
me->GV_NEW_PACK_MAT = GV_NEW_PACK_MAT .
clear me->textid.
if textid is initial.
  IF_T100_MESSAGE~T100KEY = IF_T100_MESSAGE=>DEFAULT_TEXTID.
else.
  IF_T100_MESSAGE~T100KEY = TEXTID.
endif.
  endmethod.


METHOD raise_bapiret.
*----------------------------------------------------------------------*
* Title  RAISE_BAPIRET
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

  lr_cx                    TYPE REF TO zcx_ewm_base.


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* THROW sy-msg as exception
*=======================================================================

  TRY.
      zcx_ewm_base=>bapiret_raise( iv_severity = iv_severity
                                    it_bapiret  = it_bapiret ).
      RETURN.
    CATCH zcx_ewm_base INTO lr_cx.
  ENDTRY.

  RAISE EXCEPTION TYPE zcx_ewm_base_db
    EXPORTING
      previous = lr_cx.













*
ENDMETHOD.


METHOD raise_dm.
*----------------------------------------------------------------------*
* Title  RAISE_DM
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

  lr_cx                    TYPE REF TO zcx_ewm_base.


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* THROW delivery message as exception
*=======================================================================

  TRY.
      zcx_ewm_base=>dm_raise( ir_dm       = ir_dm
                               ir_cx_dlv   = ir_cx_dlv
                               it_messages = it_messages
                               iv_doccat   = iv_doccat
                               iv_docid    = iv_docid
                               iv_itemid   = iv_itemid
                               iv_huid     = iv_huid
                               iv_logfname = iv_logfname ).
      RETURN.
    CATCH zcx_ewm_base INTO lr_cx.
  ENDTRY.

  RAISE EXCEPTION TYPE zcx_ewm_base_db
    EXPORTING
      previous = lr_cx.













*
ENDMETHOD.


METHOD raise_log.
*----------------------------------------------------------------------*
* Title  RAISE_LOG
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

  lr_cx                    TYPE REF TO zcx_ewm_base.


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* THROW sy-msg as exception
*=======================================================================

  TRY.
      zcx_ewm_base=>log_raise( ir_log = ir_log ).
      RETURN.
    CATCH zcx_ewm_base INTO lr_cx.
  ENDTRY.

  RAISE EXCEPTION TYPE zcx_ewm_base_db
    EXPORTING
      previous = lr_cx.













*
ENDMETHOD.


METHOD raise_syst.
*----------------------------------------------------------------------*
* Title  RAISE_SYST
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author : David Nava
*----------------------------------------------------------------------*
* Program description:
* Raise SY message as exception
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lr_cx                    TYPE REF TO zcx_ewm_base.


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* THROW sy-msg as exception
*=======================================================================

  TRY.
      zcx_ewm_base=>syst_raise( ).
    CATCH zcx_ewm_base INTO lr_cx.
  ENDTRY.

  RAISE EXCEPTION TYPE zcx_ewm_base_db
    EXPORTING
      previous = lr_cx.













*
ENDMETHOD.
ENDCLASS.
