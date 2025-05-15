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
class ZCL_EWM_BASE_DB_RSRC definition
  public
  final
  create public .

public section.

  class-methods GET_RSGRP_QUEUE
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_RSRC_GRP type /SCWM/DE_RSRC_GRP
    exporting
      !ET_RSGRP_QUEUE type /SCWM/TT_RSGR_Q_SQ .
  class-methods GET_QUEUE_ON_RSGRP
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_RSRC_GRP type /SCWM/DE_RSRC_GRP
      !IV_QUEUE type /SCWM/DE_QUEUE
    exporting
      !ES_TRSGR_Q_SQ type /SCWM/TRSGR_Q_SQ .
  class-methods GET_ADDATA_RSRC
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_RSRC_TYPE type /SCWM/DE_RSRC_TYPE
    returning
      value(RS_RSRC_TYP) type ZEWM_T_RSRC_TYP
    raising
      ZCX_EWM_BASE_DB .
protected section.
private section.

  class-data ST_RSGRP_QUEUE type /SCWM/TT_RSGR_Q_SQ .
  class-data ST_RSRC_TYPE type ZEWM_TT_RSRC_TYP .
ENDCLASS.



CLASS ZCL_EWM_BASE_DB_RSRC IMPLEMENTATION.


method GET_ADDATA_RSRC.
*----------------------------------------------------------------------*
* Title  GET_ADDATA_RSRC
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Company:  PROLOGIC
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* Get Additional Data from Resource
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  ls_rsrc_typ              TYPE zewm_t_rsrc_typ.


*=======================================================================
* Input
*=======================================================================

  CHECK iv_lgnum     IS NOT INITIAL AND
        iv_rsrc_type IS NOT INITIAL.

  CLEAR: ls_rsrc_typ.


*=======================================================================
* READ from Buffer
*=======================================================================

  READ TABLE st_rsrc_type
    INTO ls_rsrc_typ
    WITH KEY lgnum     = iv_lgnum
             rsrc_type = iv_rsrc_type.


*=======================================================================
* READ data from DB
*=======================================================================

  IF ls_rsrc_typ IS INITIAL.
    SELECT SINGLE *
      FROM zewm_t_rsrc_typ
      INTO ls_rsrc_typ
      WHERE lgnum     = iv_lgnum AND
            rsrc_type = iv_rsrc_type.

    APPEND ls_rsrc_typ TO st_rsrc_type.

  ENDIF.


*=======================================================================
* Output
*=======================================================================

  rs_rsrc_typ = ls_rsrc_typ.












*
endmethod.


method GET_QUEUE_ON_RSGRP.
*----------------------------------------------------------------------*
* Title  GET_QUEUE_ON_RSGRP
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Company:  PROLOGIC
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* Get queue from resource group
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lt_rsgrp_queue          TYPE /scwm/tt_rsgr_q_sq,

  ls_rsgrp_queue          TYPE /scwm/trsgr_q_sq.


*=======================================================================
* Input
*=======================================================================

  CHECK iv_lgnum    IS NOT INITIAL AND
        iv_rsrc_grp IS NOT INITIAL AND
        iv_queue    IS NOT INITIAL.

  CLEAR: ls_rsgrp_queue,
         es_trsgr_q_sq.


*=======================================================================
* GET queues assigned to Resource group
*=======================================================================

  zcl_ewm_base_db_rsrc=>get_rsgrp_queue(
    EXPORTING
      iv_lgnum       = iv_lgnum
      iv_rsrc_grp    = iv_rsrc_grp
    IMPORTING
      et_rsgrp_queue = lt_rsgrp_queue ).

  IF lt_rsgrp_queue IS INITIAL.
    RETURN.
  ENDIF.

*=======================================================================
* READ
*=======================================================================

  READ TABLE lt_rsgrp_queue
    INTO ls_rsgrp_queue
    WITH KEY queue = iv_queue.

  IF sy-subrc = 0.
    es_trsgr_q_sq = ls_rsgrp_queue.
  ENDIF.











*
endmethod.


METHOD get_rsgrp_queue.
*----------------------------------------------------------------------*
* Title  GET_RSGRP_QUEUE
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Company:  PROLOGIC
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* Get queues defined for resource group using buffer
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lt_rsgrp_queue          TYPE /scwm/tt_rsgr_q_sq.


*=======================================================================
* Input
*=======================================================================

  CHECK iv_lgnum    IS NOT INITIAL AND
        iv_rsrc_grp IS NOT INITIAL.

  CLEAR: lt_rsgrp_queue[].


*=======================================================================
* READ from Buffer
*=======================================================================

  READ TABLE st_rsgrp_queue
    TRANSPORTING NO FIELDS
    WITH KEY lgnum    = iv_lgnum
             rsrc_grp = iv_rsrc_grp.

  IF sy-subrc = 0.
    lt_rsgrp_queue = st_rsgrp_queue.
  ENDIF.


*=======================================================================
* READ data from DB
*=======================================================================

  IF lt_rsgrp_queue IS INITIAL.
    SELECT *
      FROM /scwm/trsgr_q_sq
      INTO TABLE lt_rsgrp_queue
      WHERE lgnum    = iv_lgnum AND
            rsrc_grp = iv_rsrc_grp.

    st_rsgrp_queue = lt_rsgrp_queue.

  ENDIF.


*=======================================================================
* Output
*=======================================================================

  et_rsgrp_queue = lt_rsgrp_queue.











*
ENDMETHOD.
ENDCLASS.
