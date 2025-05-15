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
class ZCL_EWM_BASE_DB_WHNUM definition
  public
  final
  create public .

public section.

  class-methods GET_MAPPING_WHSE_BY_LS
    importing
      !IV_ERP_LOGICAL_SYSTEM type /SCWM/DE_ERP_LOGSYS
    changing
      !CT_MAPWHNUM type /SCWM/TT_TMAPWHNUM .
protected section.
private section.
ENDCLASS.



CLASS ZCL_EWM_BASE_DB_WHNUM IMPLEMENTATION.


METHOD get_mapping_whse_by_ls.
*----------------------------------------------------------------------*
* Title  MTHD GET_MAPPING_WHSE_BY_LS
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* GET Warehouse numbers assigned to Business system group using
* the logical system
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================
  DATA:

  ls_tbussys               TYPE /scmb/tbussys.

*=======================================================================
* INPUT
*=======================================================================
  CHECK iv_erp_logical_system IS NOT INITIAL.


*=======================================================================
* Get business system related to Logical System
*=======================================================================
  SELECT SINGLE *
    INTO ls_tbussys
    FROM /scmb/tbussys
    WHERE logsys = iv_erp_logical_system.
  CHECK sy-subrc = 0.

*=======================================================================
* Get warehouse mapping related to Business system
*=======================================================================
* /SCWM/TMAPWHNUM
  SELECT *
    INTO TABLE ct_mapwhnum
    FROM  /scwm/tmapwhnum
    WHERE erpbskey = ls_tbussys-bskey.











*
ENDMETHOD.
ENDCLASS.
