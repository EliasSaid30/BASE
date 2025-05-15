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
class ZCL_EWM_BASE_DB_TO definition
  public
  final
  create public .

public section.

  interfaces /SCWM/IF_TM_APPL .
  interfaces ZIF_EWM_BASE_TM_APPL .
  interfaces IF_DRF_CONST .

  class-methods CANCEL_TO_MULTI
    importing
      !IT_ORDIM_O type /SCWM/TT_ORDIM_O optional
      !IT_TANUM type /SCWM/TT_TANUM optional
      !IV_TANUM type /SCWM/TANUM optional
      !IV_LGNUM type /SCWM/LGNUM
      !IV_UPDATETASK type ABAP_BOOL
      !IV_COMMIT type ABAP_BOOL
    exporting
      !ET_BAPIRET type BAPIRETTAB
    raising
      ZCX_EWM_BASE_DB .
  class-methods CHANGE_ATT_MULTI
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_UPDATE_TASK type /SCWM/RL03AVERBU
      !IV_COMMIT_WORK type /SCWM/RL03ACOMIT optional
      !IT_CHANGE_ATT type /SCWM/TT_TO_CHANGE_ATT
    exporting
      !EV_SEVERITY type BAPI_MTYPE
      !EV_LOGNR type BALOGNR
    changing
      !CT_BAPIRET type BAPIRETTAB .
  class-methods CREATE_MOVE_HU .
  class-methods GET
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_TANUM type /SCWM/TANUM
      !IV_REFRESH type XFELD default ABAP_FALSE
    exporting
      !ES_ORDIM_C type /SCWM/ORDIM_C
      !ES_ORDIM_O type /SCWM/ORDIM_O
    raising
      ZCX_EWM_BASE_DB .
  class-methods GET_CONF_HU
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_SRC type XFELD default ABAP_TRUE
      !IV_DES type XFELD
      !IV_HUIDENT type /SCWM/DE_HUIDENT
      !IV_GUID_HU type /SCWM/GUID_HU
      !IV_NOBUF type /SCWM/LVS_NOBUF default ABAP_FALSE
    exporting
      !ET_ORDIM_C type /SCWM/TT_ORDIM_C
    raising
      ZCX_EWM_BASE_DB .
  class-methods GET_CONF_HUS_BY_DATE
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_SRC type XFELD default ABAP_TRUE
      !IV_DES type XFELD default ABAP_TRUE
      !IT_PROCTY_R type RSELOPTION
      !IT_HUIDENT_R type RSELOPTION
      !IT_CONF_AT_R type RSELOPTION
      !IV_NOBUF type /SCWM/LVS_NOBUF default ABAP_FALSE
    exporting
      !ET_TO type /SCWM/TT_TO_DET_MON
    raising
      ZCX_EWM_BASE_DB .
  class-methods GET_CONF_WHO
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IT_WHOID type /SCWM/TT_WHOID
    returning
      value(RT_ORDIM_C) type /SCWM/TT_ORDIM_C
    raising
      ZCX_EWM_BASE_DB .
  class-methods GET_INSTANCE
    returning
      value(RR_SINGLETON) type ref to ZCL_EWM_BASE_DB_TO .
  class-methods GET_OPEN_HU
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_HUIDENT type /SCWM/DE_HUIDENT
      !IV_NOBUF type /SCWM/LVS_NOBUF default ABAP_FALSE
    exporting
      !ES_ORDIM_O type /SCWM/ORDIM_O
      !ES_ORDIM_I type /SCWM/ORDIM_O
      !ET_ORDIM_O type /SCWM/TT_ORDIM_O
    raising
      ZCX_EWM_BASE_DB .
  class-methods GET_OPEN_HUID
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_HUID type /SCWM/DE_WHOHUID optional
      !IV_SHIPHUID type /SCWM/DE_WHOHUID optional
    exporting
      !ET_ORDIM_O type /SCWM/TT_ORDIM_O
    raising
      ZCX_EWM_BASE_DB .
  class-methods GET_OPEN_HU_MULTI
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IT_HUHDR_INT type /SCWM/TT_HUHDR_INT
      !IT_HUIDENT type /SCWM/TT_HUIDENT
      !IV_NOBUF type /SCWM/LVS_NOBUF default ABAP_FALSE
    returning
      value(RT_ORDIM_O) type /SCWM/TT_ORDIM_O
    raising
      ZCX_EWM_BASE_DB .
  class-methods GET_OPEN_LGTYP_DEST
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_LGTYP type /SCWM/LGTYP
    returning
      value(RT_ORDIM_O) type /SCWM/TT_ORDIM_O
    raising
      ZCX_EWM_BASE_DB .
  class-methods GET_OPEN_MAT
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_MATID type /SCWM/DE_MATID
    returning
      value(RT_ORDIM_O) type /SCWM/TT_ORDIM_O
    raising
      ZCX_EWM_BASE_DB .
  class-methods GET_OPEN_WHO
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IT_WHOID type /SCWM/TT_WHOID
    returning
      value(RT_ORDIM_O) type /SCWM/TT_ORDIM_O
    raising
      ZCX_EWM_BASE_DB .
  class-methods GET_OPEN_WT
    importing
      !IT_LGTYP_R type RSELOPTION
      !IT_MATID_R type RSELOPTION
      !IT_LGPLA_R type RSELOPTION
      !IT_TOSTAT_R type RSELOPTION optional
      !IV_LGNUM type /SCWM/LGNUM
    exporting
      !ET_TO type /SCWM/TT_TO_DET_MON .
  class-methods READ
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_TANUM type /SCWM/TANUM
      !IV_ADD_TO_MEMORY type XFELD default ABAP_TRUE
      !IV_READ_FROM_DB type XFELD default ABAP_TRUE
    exporting
      !ES_ORDIM_O type /SCWM/ORDIM_O
    raising
      ZCX_EWM_BASE_DB .
  class-methods READ_BY_STOCK_ID
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_STOCK_ID type /SCWM/DE_IDPLATE_WT
    exporting
      !ET_WT_OPEN type /SCWM/TT_ORDIM_O
    raising
      ZCX_EWM_BASE_DB .
  class-methods READ_MULTI_WHR
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_DOCID type /SCWM/DE_DOCID optional
      !IT_DOCID type /SCWM/DLV_DOCID_ITEM_TAB optional
      !IT_DLV_I type /SCWM/DLV_ITEM_OUT_PRD_TAB optional
      !IV_HUWT type XFELD optional
      !IV_MATID type /SCWM/DE_MATID optional
      !IV_NLPLA type /SCWM/DE_LGPLA optional
      !IV_TRART type /SCWM/LVS_TRART optional
    exporting
      !ET_ORDIM_O type /SCWM/TT_ORDIM_O
      !ET_ORDIM_C type /SCWM/TT_ORDIM_C
      !ET_ORDIM_A type /SCWM/TT_ORDIM_C
    raising
      ZCX_EWM_BASE_DB .
  class-methods UPDATE_OPEN_WT
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IT_CHANGE type /SCWM/TT_TO_CHANGE_ATT_INT .
  class-methods SET_STOCK_ID
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_TANUM type /SCWM/TANUM
      !IV_STOCK_ID type /SCWM/DE_IDPLATE_WT
    raising
      ZCX_EWM_BASE_DB .
protected section.
private section.

  aliases GC_ASTERISK
    for IF_DRF_CONST~ASTERISK .

  constants GC_READ_WHR_FLGHUTO type CHAR1 value '2' ##NO_TEXT.
  constants GC_READ_WHR_FLGPRDTO type CHAR1 value '1' ##NO_TEXT.
  class-data SR_SINGLETON type ref to ZCL_EWM_BASE_DB_TO .
  constants GC_FIELDNAME_IDPLATE type /SCWM/DE_IDPLATE_WT value 'IDPLATE' ##NO_TEXT.
ENDCLASS.



CLASS ZCL_EWM_BASE_DB_TO IMPLEMENTATION.


  method /SCWM/IF_TM_APPL~CHECK_SAVE.
  endmethod.


  method /SCWM/IF_TM_APPL~CLEANUP.
  endmethod.


METHOD cancel_to_multi.
*----------------------------------------------------------------------*
* Title MTDH CANCEL_TO_MULTI
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*---------------------------------------------------------------------*
* Project Rel. : Indumotora
* Autor        : David Nava
*----------------------------------------------------------------------*
* Program description:
* Cancel warehouse tasks
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lt_cancel_inact          TYPE /scwm/tt_cancl,
  lt_cancel_active         TYPE /scwm/tt_cancl,

  ls_cancel                TYPE /scwm/cancl,

  lv_severity              TYPE bapi_mtype.

  FIELD-SYMBOLS:

  <ls_ordim_o>             TYPE /scwm/ordim_o,
  <lv_tanum>               TYPE /scwm/tanum.


*=======================================================================
* Input
*=======================================================================

  REFRESH: et_bapiret.


*=======================================================================
* PREP Warehouse Task Cancellation
*=======================================================================

  IF ( iv_tanum IS NOT INITIAL ).
    ls_cancel-tanum = iv_tanum.
    APPEND ls_cancel TO lt_cancel_active.
  ENDIF.

  LOOP AT it_ordim_o ASSIGNING <ls_ordim_o>
    WHERE tanum IS NOT INITIAL.
    CLEAR ls_cancel.
    ls_cancel-tanum = <ls_ordim_o>-tanum.
    IF ( <ls_ordim_o>-tostat EQ wmegc_to_inactiv ).
*     .inactive WTs
      APPEND ls_cancel TO lt_cancel_inact.
    ELSE.
*     .active WTs
      APPEND ls_cancel TO lt_cancel_active.
    ENDIF.
  ENDLOOP.

  LOOP AT it_tanum ASSIGNING <lv_tanum>.
    CLEAR ls_cancel.
    ls_cancel-tanum = <lv_tanum>.
    APPEND ls_cancel TO lt_cancel_active.
  ENDLOOP.

  ASSERT ID zewm_base_error
    CONDITION lines( lt_cancel_inact )  > 0 OR
              lines( lt_cancel_active ) > 0.

  IF ( lines( lt_cancel_inact ) = 0 AND lines( lt_cancel_active ) = 0 ).
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid = zcx_ewm_base_db=>parameter_invalid.
  ENDIF.


*=======================================================================
* EXEC Warehouse Task Cancellation for active WTs
*=======================================================================

  IF ( lines( lt_cancel_active ) > 0 ).

    CALL FUNCTION '/SCWM/TO_CANCEL'
      EXPORTING
        iv_lgnum       = iv_lgnum
        iv_update_task = iv_updatetask
        iv_commit_work = abap_false
        it_cancl       = lt_cancel_active
      IMPORTING
        et_bapiret     = et_bapiret
        ev_severity    = lv_severity.

    IF ( zcx_ewm_base_db=>is_error_severity( lv_severity )
         = abap_true ).
      IF ( iv_commit = abap_true ).
        ROLLBACK WORK.
      ENDIF.
      zcx_ewm_base_db=>raise_bapiret( iv_severity = lv_severity
                                      it_bapiret  = et_bapiret ).
    ENDIF.

    IF ( iv_commit = abap_true ).
      COMMIT WORK AND WAIT.
    ENDIF.

  ENDIF.


*=======================================================================
* EXEC Warehouse Task Cancellation for inactive WTs
*=======================================================================

  IF ( lines( lt_cancel_inact ) > 0 ).

    CALL FUNCTION '/SCWM/TO_CANCEL'
      EXPORTING
        iv_lgnum       = iv_lgnum
        iv_update_task = iv_updatetask
        iv_commit_work = abap_false
        it_cancl       = lt_cancel_inact
      IMPORTING
        et_bapiret     = et_bapiret
        ev_severity    = lv_severity.

    IF ( zcx_ewm_base_db=>is_error_severity( lv_severity )
         = abap_true ).
      IF ( iv_commit = abap_true ).
        ROLLBACK WORK.
      ENDIF.
      zcx_ewm_base_db=>raise_bapiret( iv_severity = lv_severity
                                      it_bapiret  = et_bapiret ).
    ENDIF.

    IF ( iv_commit = abap_true ).
      COMMIT WORK AND WAIT.
    ENDIF.

  ENDIF.













*
ENDMETHOD.


METHOD change_att_multi.
*----------------------------------------------------------------------
* Title  MTHD CHANGE_ATT_MULTI
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------
* Project Rel. : Indumotora
* Author       : Alaedhin Díaz
*----------------------------------------------------------------------
* Program description:
* Change WT Attributes
*----------------------------------------------------------------------

*=======================================================================
* Declaration/Initialization
*=======================================================================


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* Change Attributes
*=======================================================================

  CALL FUNCTION 'ZEWM_FM_BASE_TO_CHANGE_ATT'
    EXPORTING
      iv_lgnum       = iv_lgnum
      iv_log_init    = abap_false
      iv_update_task = iv_update_task
      iv_commit_work = iv_commit_work
      it_change_att  = it_change_att
    IMPORTING
      et_bapiret     = ct_bapiret
      ev_severity    = ev_severity
      ev_lognr       = ev_lognr.











*
ENDMETHOD.


  method CREATE_MOVE_HU.
  endmethod.


METHOD get.
*----------------------------------------------------------------------*
* Title  MTHD GET
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Gets open warehouse task
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:
    lv_read_from_db           TYPE xfeld.


*=======================================================================
* Input
*=======================================================================

  CLEAR: es_ordim_c, es_ordim_o.

  IF iv_refresh = abap_true.
    lv_read_from_db = abap_true.
  ELSE.
    lv_read_from_db = abap_false.
  ENDIF.

*=======================================================================
* Read warehouse task
*=======================================================================

  CALL FUNCTION '/SCWM/TO_READ_SINGLE'
    EXPORTING
      iv_lgnum        = iv_lgnum
      iv_tanum        = iv_tanum
      iv_read_from_db = lv_read_from_db
    IMPORTING
      es_ordim_o      = es_ordim_o
    EXCEPTIONS
      wrong_input     = 1
      not_found       = 2
      foreign_lock    = 3
      error           = 4
      OTHERS          = 5.

  IF sy-subrc <> 0.
    zcx_ewm_base_db=>raise_syst( ).
  ENDIF.










*
ENDMETHOD.


METHOD get_conf_hu.
*----------------------------------------------------------------------*
* Title  MTHD GET_CONF_HU
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Return all open Warehouse Tasks of a Handling Unit
*
* Note: FM /SCWM/TO_READ_HU is bad for the performance because
* it is reading all data for the HU and we only need the warehouse
* task data
*----------------------------------------------------------------------*


*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:
    lt_ordim_c_src TYPE /scwm/tt_ordim_c,
    lt_ordim_c_des TYPE /scwm/tt_ordim_c,

    lt_ordim_c     TYPE /scwm/tt_ordim_c,
    ls_ordim_c     TYPE /scwm/ordim_c.

*=======================================================================
* Input
*=======================================================================

  REFRESH: et_ordim_c.


*=======================================================================
* READ Warehouse Tasks (with Source Data)
*=======================================================================

  IF iv_src = abap_true.
    CALL FUNCTION '/SCWM/TO_READ_SRC'
      EXPORTING
        iv_lgnum         = iv_lgnum
        iv_huident       = iv_huident
        iv_nobuf         = iv_nobuf
        iv_add_to_memory = abap_true
      IMPORTING
        et_ordim_c       = lt_ordim_c_src
      EXCEPTIONS
        wrong_input      = 1
        not_found        = 2
        foreign_lock     = 3
        OTHERS           = 4.

    IF ( sy-subrc = 0 ).
      et_ordim_c = lt_ordim_c_src.
    ENDIF.

  ENDIF.


*=======================================================================
* READ Warehouse Tasks (with Destination Data)
*=======================================================================

  IF iv_des = abap_true.
    CALL FUNCTION '/SCWM/TO_READ_DES'
      EXPORTING
        iv_lgnum         = iv_lgnum
        iv_huident       = iv_huident
        iv_nobuf         = iv_nobuf
        iv_add_to_memory = abap_true
      IMPORTING
        et_ordim_c       = lt_ordim_c_des
      EXCEPTIONS
        wrong_input      = 1
        not_found        = 2
        foreign_lock     = 3
        OTHERS           = 4.

    IF sy-subrc = 0.
      LOOP AT lt_ordim_c_des INTO ls_ordim_c.

        READ TABLE et_ordim_c TRANSPORTING NO FIELDS
          WITH KEY lgnum = iv_lgnum
                   tanum = ls_ordim_c-tanum.

        IF sy-subrc <> 0.
          APPEND ls_ordim_c TO lt_ordim_c.
        ENDIF.
      ENDLOOP.
    ENDIF.

  ENDIF.


*=======================================================================
* FILTER Warehouse Tasks only GUID_HU
* Problem: SAP Standard have no Function to read WTs with GUIDs!
*=======================================================================

  IF iv_guid_hu IS INITIAL.

    APPEND LINES OF lt_ordim_c TO et_ordim_c.

  ELSE.
    CLEAR: ls_ordim_c.

    LOOP AT lt_ordim_c INTO ls_ordim_c
      WHERE sguid_hu = iv_guid_hu OR
            dguid_hu = iv_guid_hu.

      APPEND ls_ordim_c TO et_ordim_c.

    ENDLOOP.
  ENDIF.

*=======================================================================
* Raise Error if no confirmed Warehouse Task was found.
*=======================================================================

  IF ( lines( et_ordim_c ) = 0 ).
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid     = zcx_ewm_base_db=>to_get_conf_hu
        gv_huident = iv_huident.
  ENDIF.
















*
ENDMETHOD.


METHOD GET_CONF_HUS_BY_DATE.
*----------------------------------------------------------------------*
* Title  MTHD GET_CONF_HU
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Return all confirmed Warehouse Tasks of a Handling Unit
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lt_huident_r             TYPE rseloption,
  lt_guid_hu_r             TYPE rseloption,

  ls_selcrit               TYPE /scwm/s_to_selcrit_mon,
  ls_bapiret               TYPE bapiret2.


*=======================================================================
* Input
*=======================================================================

  REFRESH: et_to.


*=======================================================================
* GET Confirmed WT to Storage Type
*=======================================================================
  IF iv_src = abap_true.
    ls_selcrit-r_vlenr = it_huident_r.
  ENDIF.
  IF iv_des = abap_true.
    ls_selcrit-r_nlenr = it_huident_r.
  ENDIF.
  zcl_ewm_base=>range_append_eq(
    EXPORTING
      iv_value = wmegc_to_confirmed
    changing
      ct_range = ls_selcrit-r_tostat ).
  ls_selcrit-r_confirmed_at  = it_conf_at_r.
  ls_selcrit-r_procty        = it_procty_r.


  CALL FUNCTION '/SCWM/TO_GET_WIP'
    EXPORTING
      iv_lgnum             = iv_lgnum
      iv_conf              = abap_true
      iv_srcdata           = iv_src
      iv_dstdata           = iv_des
      is_selcrit           = ls_selcrit
   IMPORTING
     et_to                = et_to.
















*
ENDMETHOD.


METHOD GET_CONF_WHO.
*----------------------------------------------------------------------*
* Title  GET_OPEN_WHO
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Read Warehouse Tasks of warehouse orders
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================


*=======================================================================
* Input
*=======================================================================

  REFRESH:
    rt_ordim_c.


*=======================================================================
* READ Warehouse Tasks
*=======================================================================

  CALL FUNCTION '/SCWM/TO_READ_WHO_MULT'
    EXPORTING
      iv_lgnum    = iv_lgnum
      it_whoid    = it_whoid
    IMPORTING
      et_ordim_c  = rt_ordim_c
    EXCEPTIONS
      wrong_input = 1
      not_found   = 2
      error       = 3
      OTHERS      = 4.

  IF ( sy-subrc <> 0 ).                                     "#EC NEEDED
  ENDIF.

  IF ( lines( rt_ordim_c ) = 0 ).
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid     = zcx_ewm_base_db=>to_get_open_who.
  ENDIF.
















*
ENDMETHOD.


METHOD get_instance.
*----------------------------------------------------------------------*
* Title  MTHD GET_INSTANCE
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Returns the active instance
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* CREATE instance
*=======================================================================

  IF ( sr_singleton IS NOT BOUND ).
    CREATE OBJECT sr_singleton.
  ENDIF.


*=======================================================================
* Output
*=======================================================================

  rr_singleton = sr_singleton.










*
ENDMETHOD.


METHOD get_open_hu.
*----------------------------------------------------------------------*
* Title  GET_OPEN_HU
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Return all open Warehouse Tasks of a Handling Unit
*
* Note: FM /SCWM/TO_READ_HU is bad for the performance because
* it is reading all data for the HU and we only need the warehouse
* task data
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================


*=======================================================================
* Input
*=======================================================================

  REFRESH: et_ordim_o.

  CLEAR: es_ordim_o, es_ordim_i.


*=======================================================================
* READ Warehouse Tasks
*=======================================================================

  CALL FUNCTION '/SCWM/TO_READ_SRC'
    EXPORTING
      iv_lgnum         = iv_lgnum
      iv_huident       = iv_huident
      iv_nobuf         = iv_nobuf
      iv_add_to_memory = abap_true
    IMPORTING
      et_ordim_o       = et_ordim_o
    EXCEPTIONS
      wrong_input      = 1
      not_found        = 2
      foreign_lock     = 3
      OTHERS           = 4.

  IF ( sy-subrc <> 0 ).                                     "#EC NEEDED
  ENDIF.

  IF ( LINES( et_ordim_o ) = 0 ).
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid     = zcx_ewm_base_db=>to_get_open_hu
        gv_huident = iv_huident.
  ENDIF.


*=======================================================================
* READ Warehouse Tasks
*=======================================================================

* .open Warehouse Task (only HU-WT)
  IF ( es_ordim_o IS REQUESTED ).
    READ TABLE et_ordim_o INTO es_ordim_o
      WITH KEY tostat  = wmegc_to_open
               flghuto = abap_true.
    IF ( sy-subrc <> 0 ).                                   "#EC NEEDED
    ENDIF.
  ENDIF.

* .inactive Warehouse Task (only HU-WT)
  IF ( es_ordim_i IS REQUESTED ).
    READ TABLE et_ordim_o INTO es_ordim_i
      WITH KEY tostat  = wmegc_to_inactiv
               flghuto = abap_true.
    IF ( sy-subrc <> 0 ).                                   "#EC NEEDED
    ENDIF.
  ENDIF.
















*
ENDMETHOD.


METHOD GET_OPEN_HUID.
*----------------------------------------------------------------------*
* Title  GET_OPEN_HU
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Return all open Warehouse Tasks of a Handling Unit ID for picking
* or Shipping
*
* NOTE: There is no standard FM or class to look for HUID or SHIPHUID
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================
  DATA:

  lt_lgnum_r               TYPE /scwm/tt_lgnum_r,
  lt_huid_r                TYPE /scwm/tt_sel_guid_hu,
  lt_shiphuid_r            TYPE /scwm/tt_sel_guid_hu.


*=======================================================================
* Input
*=======================================================================

  CHECK iv_huid     IS NOT INITIAL OR
        iv_shiphuid IS NOT INITIAL.

  REFRESH: et_ordim_o.


*=======================================================================
* BUILD Selection
*=======================================================================
  zcl_ewm_base=>range_append_eq(
    EXPORTING
      iv_value = iv_lgnum
    changing
      ct_range = lt_lgnum_r ).

  IF iv_huid IS NOT INITIAL.
    zcl_ewm_base=>range_append_eq(
      EXPORTING
        iv_value = iv_huid
      changing
        ct_range = lt_huid_r ).
  ENDIF.

  IF iv_shiphuid IS NOT INITIAL.
    zcl_ewm_base=>range_append_eq(
      EXPORTING
        iv_value = iv_shiphuid
      changing
        ct_range = lt_shiphuid_r ).
  ENDIF.


*=======================================================================
* READ Warehouse Tasks
*=======================================================================

  SELECT *
    FROM /scwm/ordim_o
     APPENDING TABLE et_ordim_o
      WHERE  lgnum    IN lt_lgnum_r AND
             huid     IN lt_huid_r AND
             shiphuid IN lt_shiphuid_r.

  IF ( LINES( et_ordim_o ) = 0 ).
    IF iv_huid IS NOT INITIAL.
      RAISE EXCEPTION TYPE zcx_ewm_base_db
        EXPORTING
          textid     = zcx_ewm_base_db=>to_get_open_hu
          gv_guid_hu = iv_huid.
    ELSE.
      RAISE EXCEPTION TYPE zcx_ewm_base_db
        EXPORTING
          textid     = zcx_ewm_base_db=>to_get_open_hu
          gv_guid_hu = iv_shiphuid.
    ENDIF.
  ENDIF.
















*
ENDMETHOD.


METHOD get_open_hu_multi.
*----------------------------------------------------------------------*
* Title  MTHD GET_OPEN_HU_MULTI
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Read all open warehouse tasks of these Handling Units
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  FIELD-SYMBOLS:

  <lt_huident>             TYPE /scwm/tt_huident.


  DATA:

  lt_huident               TYPE /scwm/tt_huident,

  ls_huident               TYPE /scwm/s_huident,
  ls_huhdr_int             TYPE /scwm/s_huhdr_int.


*=======================================================================
* Input
*=======================================================================

  ASSIGN it_huident TO <lt_huident>.
  IF ( lines( it_huhdr_int ) > 0 ).
    ASSIGN lt_huident TO <lt_huident>.
    <lt_huident> = it_huident[].
    LOOP AT it_huhdr_int INTO ls_huhdr_int.
      READ TABLE <lt_huident> TRANSPORTING NO FIELDS
        WITH KEY huident = ls_huhdr_int-huident.
      CHECK sy-subrc <> 0.
      ls_huident-huident = ls_huhdr_int-huident.
      APPEND ls_huident TO <lt_huident>.
    ENDLOOP.
  ENDIF.


*=======================================================================
* GET warehouse tasks
*=======================================================================

  CALL FUNCTION '/SCWM/TO_READ_SRC'
    EXPORTING
      iv_lgnum         = iv_lgnum
      it_huident       = <lt_huident>
      iv_nobuf         = iv_nobuf
      iv_add_to_memory = abap_true
    IMPORTING
      et_ordim_o       = rt_ordim_o
    EXCEPTIONS
      wrong_input      = 1
      not_found        = 2
      foreign_lock     = 3
      OTHERS           = 4.

  IF ( sy-subrc <> 0 ).
    zcx_ewm_base_db=>raise_syst( ).
  ENDIF.











*
ENDMETHOD.


METHOD get_open_lgtyp_dest.
*----------------------------------------------------------------------*
* Title  MTHD GET_OPEN_LGTYP_DEST
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* GET open WT to Destination ST
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================
  DATA:

  lt_ordim_o               TYPE /scwm/tt_ordim_o.

*=======================================================================
* Input
*=======================================================================


*=======================================================================
* Prepare Selection
*=======================================================================


*=======================================================================
* GET Open WT
*=======================================================================
  CALL FUNCTION '/SCWM/TO_READ_DES'
    EXPORTING
      iv_lgnum               = iv_lgnum
      iv_lgtyp               = iv_lgtyp
      iv_nobuf               = abap_true
      iv_add_to_memory       = abap_false
    IMPORTING
      et_ordim_o             = lt_ordim_o
    EXCEPTIONS
      WRONG_INPUT            = 1
      NOT_FOUND              = 2
      FOREIGN_LOCK           = 3
      OTHERS                 = 4.
  IF sy-subrc <> 0.
    zcx_ewm_base_db=>raise_syst( ).
  ENDIF.


*=======================================================================
* Output
*=======================================================================
  rt_ordim_o = lt_ordim_o.











*
ENDMETHOD.


METHOD GET_OPEN_MAT.
*----------------------------------------------------------------------*
* Title  MTHD GET_OPEN_MAT
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* GET open WT for related product
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================
  DATA:

  lt_ordim_o               TYPE /scwm/tt_ordim_o,

  ls_stock                 TYPE /scwm/s_stock.

*=======================================================================
* Input
*=======================================================================


*=======================================================================
* Prepare Selection
*=======================================================================
  ls_stock-matid          = iv_matid.
  ls_stock-owner          = gc_asterisk.
  ls_stock-owner_role     = gc_asterisk.
  ls_stock-cat            = gc_asterisk.
  ls_stock-stock_doccat   = gc_asterisk.
  ls_stock-stock_docno    = gc_asterisk.
  ls_stock-doccat         = gc_asterisk.
  ls_stock-stock_usage    = gc_asterisk.
  ls_stock-entitled       = gc_asterisk.
  ls_stock-entitled_role  = gc_asterisk.


*=======================================================================
* GET Open WT
*=======================================================================
  CALL FUNCTION '/SCWM/TO_READ_MAT'
    EXPORTING
      iv_lgnum               = iv_lgnum
      is_stock               = ls_stock
      iv_nobuf               = abap_true
      iv_add_to_memory       = abap_false
    IMPORTING
      et_ordim_o             = lt_ordim_o
*     ET_ORDIM_C             =
*     ET_ORDIM_L             =
*     ET_ORDIM_E             =
*     ET_ORDIM_H             =
*     ET_ORDIM_OS            =
*     ET_ORDIM_CS            =
*     ET_ORDIM_LS            =
*     ET_ORDIM_HS            =
    EXCEPTIONS
      WRONG_INPUT            = 1
      NOT_FOUND              = 2
      OTHERS                 = 3.
  IF sy-subrc <> 0.
    zcx_ewm_base_db=>raise_syst( ).
  ENDIF.


*=======================================================================
* Output
*=======================================================================
  rt_ordim_o = lt_ordim_o.











*
ENDMETHOD.


METHOD get_open_who.
*----------------------------------------------------------------------*
* Title  GET_OPEN_WHO
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Read Warehouse Tasks of warehouse orders
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================


*=======================================================================
* Input
*=======================================================================

  REFRESH:
    rt_ordim_o.


*=======================================================================
* READ Warehouse Tasks
*=======================================================================

  CALL FUNCTION '/SCWM/TO_READ_WHO_MULT'
    EXPORTING
      iv_lgnum    = iv_lgnum
      it_whoid    = it_whoid
    IMPORTING
      et_ordim_o  = rt_ordim_o
    EXCEPTIONS
      wrong_input = 1
      not_found   = 2
      error       = 3
      OTHERS      = 4.

  IF ( sy-subrc <> 0 ).                                     "#EC NEEDED
  ENDIF.

  IF ( lines( rt_ordim_o ) = 0 ).
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid     = zcx_ewm_base_db=>to_get_open_who.
  ENDIF.
















*
ENDMETHOD.


METHOD GET_OPEN_WT.
*----------------------------------------------------------------------*
* Title  Method GET_OPEN_WT
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author : David Nava
*----------------------------------------------------------------------*
* Program description:
* GET Open WT per Destination Storage Type and product
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  ls_selcrit               TYPE /scwm/s_to_selcrit_mon,
  ls_bapiret               TYPE bapiret2.


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* GET Open WT to Storage Type
*=======================================================================

  ls_selcrit-r_lgtyp  = it_lgtyp_r.
  ls_selcrit-r_matid  = it_matid_r.
  ls_selcrit-r_tostat = it_tostat_r.
  ls_selcrit-r_nlpla  = it_lgpla_r.

  CALL FUNCTION '/SCWM/TO_GET_WIP'
    EXPORTING
      iv_lgnum             = iv_lgnum
      IV_OPEN              = abap_true
      IV_DSTDATA           = abap_true
      is_selcrit           = ls_selcrit
   IMPORTING
     ET_TO                = et_to.










*
endmethod.


METHOD read.
*----------------------------------------------------------------------*
* Title  MTHD READ
* Copyright (c) 2021 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Reads open warehouse tasks from db
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================


*=======================================================================
* Input
*=======================================================================

  CLEAR: es_ordim_o.


*=======================================================================
* Read warehouse task
*=======================================================================

  CALL FUNCTION '/SCWM/TO_READ_SINGLE'
    EXPORTING
      iv_lgnum         = iv_lgnum
      iv_tanum         = iv_tanum
      iv_read_from_db  = iv_read_from_db
      iv_add_to_memory = iv_add_to_memory
    IMPORTING
      es_ordim_o       = es_ordim_o
    EXCEPTIONS
      wrong_input      = 1
      not_found        = 2
      foreign_lock     = 3
      error            = 4
      OTHERS           = 5.

  IF sy-subrc <> 0.
    zcx_ewm_base_db=>raise_syst( ).
  ENDIF.









*
ENDMETHOD.


METHOD READ_BY_STOCK_ID.
*----------------------------------------------------------------------*
* Title READ_BY_STOCK_ID.
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*--------------------------------------_-------------------------------*
* Project Rel. : Indumotora
* Autor        : Elias Hernandez
*----------------------------------------------------------------------*
* Program description:
* Read WT by Stock ID
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:
    lt_lgnum_r             TYPE /scwm/tt_lgnum_r,
    lt_stockid_r           TYPE RANGE OF /scwm/de_idplate_wt,

    ls_stockid_r           TYPE rsdsselopt,
    ls_lgnum_r             TYPE /scwm/s_lgnum_r.


*=======================================================================
* Prepare Query
*=======================================================================

   MOVE: wmegc_sign_inclusive  TO ls_lgnum_r-sign,
         wmegc_option_eq       TO ls_lgnum_r-option,
         iv_lgnum              TO ls_lgnum_r-low,
         space                 TO ls_lgnum_r-high.
   APPEND ls_lgnum_r TO lt_lgnum_r.


   MOVE: wmegc_sign_inclusive  TO ls_stockid_r-sign,
         wmegc_option_eq       TO ls_stockid_r-option,
         iv_stock_id           TO ls_stockid_r-low,
         space                 TO ls_stockid_r-high.
   APPEND ls_stockid_r TO lt_stockid_r.


*=======================================================================
* Select in DB
*=======================================================================

  SELECT * FROM /scwm/ordim_o
      INTO TABLE et_wt_open
           WHERE lgnum IN lt_lgnum_r
             AND idplate IN lt_stockid_r.











*
ENDMETHOD.


METHOD read_multi_whr.
*----------------------------------------------------------------------*
* Title MTHD: READ_MULTI_WHR
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : David Nava
*----------------------------------------------------------------------*
* Program description:
* Read all Warehouse Task for a reference document
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:
  lt_itemwt                TYPE /scwm/tt_itemwt,
  lt_docid_selopt          TYPE rseloption,
  lt_itemid_selopt         TYPE rseloption,
  lt_huto_selopt           TYPE rseloption,
  lt_matid_selopt          TYPE rseloption,
  lt_nlpla_selopt       TYPE rseloption,
  lt_tanum_selopt       TYPE rseloption,
  lt_trart_selopt       TYPE rseloption,
  ls_itemwt             TYPE /scwm/db_itemwt,
  ls_docid              TYPE /scwm/dlv_docid_item_str,
  ls_dlv_i              TYPE /scwm/dlv_item_out_prd_str.


*=======================================================================
* Input / Clear exporting tables.
*=======================================================================

  CLEAR: et_ordim_o,
         et_ordim_c,
         et_ordim_a.


*=======================================================================
* Set Select options
*=======================================================================

  IF iv_huwt IS SUPPLIED.
    CASE iv_huwt.
      WHEN: gc_read_whr_flgprdto.                       " Material-TO
        zcl_ewm_base=>range_append_eq(
          EXPORTING
            iv_value = abap_false
          CHANGING
            ct_range = lt_huto_selopt ).
      WHEN: gc_read_whr_flghuto.                        " HU-TO
        zcl_ewm_base=>range_append_eq(
          EXPORTING
            iv_value = abap_true
          CHANGING
            ct_range = lt_huto_selopt ).
    ENDCASE.
  ENDIF.

  IF iv_matid IS NOT INITIAL.
    zcl_ewm_base=>range_append_eq(
        EXPORTING
          iv_value = iv_matid
        CHANGING
          ct_range = lt_matid_selopt ).
  ENDIF.

  IF iv_nlpla IS NOT INITIAL.
    zcl_ewm_base=>range_append_eq(
        EXPORTING
          iv_value = iv_nlpla
        CHANGING
          ct_range = lt_nlpla_selopt ).
  ENDIF.

  IF iv_trart IS NOT INITIAL.
    zcl_ewm_base=>range_append_eq(
        EXPORTING
          iv_value = iv_trart
        CHANGING
          ct_range = lt_trart_selopt ).
  ENDIF.

  LOOP AT it_dlv_i INTO ls_dlv_i
    WHERE docid IS NOT INITIAL.
    zcl_ewm_base=>range_append_eq(
        EXPORTING
          iv_value = ls_dlv_i-docid
        CHANGING
          ct_range = lt_docid_selopt ).
    IF ( ls_dlv_i-itemid IS NOT INITIAL ).
      zcl_ewm_base=>range_append_eq(
          EXPORTING
            iv_value = ls_dlv_i-itemid
          CHANGING
            ct_range = lt_itemid_selopt ).
    ENDIF.
  ENDLOOP.

  LOOP AT it_docid INTO ls_docid
    WHERE docid IS NOT INITIAL.
    zcl_ewm_base=>range_append_eq(
        EXPORTING
          iv_value = ls_docid-docid
        CHANGING
          ct_range = lt_docid_selopt ).
    IF ( ls_docid-itemid IS NOT INITIAL ).
      zcl_ewm_base=>range_append_eq(
          EXPORTING
            iv_value = ls_docid-itemid
          CHANGING
            ct_range = lt_itemid_selopt ).
    ENDIF.
  ENDLOOP.

  IF ( iv_docid IS NOT INITIAL ).
    zcl_ewm_base=>range_append_eq(
        EXPORTING
          iv_value = iv_docid
        CHANGING
          ct_range = lt_docid_selopt ).
  ENDIF.

  ASSERT ID zewm_base_error
    CONDITION lines( lt_docid_selopt ) > 0.

  IF ( lines( lt_docid_selopt ) = 0 ).
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid = zcx_ewm_base_db=>parameter_invalid.
  ENDIF.


*=======================================================================
* Get all WTS with select options: ALL, only product or only HU
*=======================================================================

  SELECT *
    FROM /scwm/db_itemwt
    INTO TABLE lt_itemwt
   WHERE docid   IN lt_docid_selopt
     AND itemid  IN lt_itemid_selopt
     AND flghuto IN lt_huto_selopt
     AND lgnum   =  iv_lgnum.

  IF ( sy-subrc <> 0 ).
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid = zcx_ewm_base_db=>to_read_multi_whr.
  ENDIF.

* Delete double entries in table
  SORT lt_itemwt BY tanum.
  DELETE ADJACENT DUPLICATES FROM lt_itemwt COMPARING tanum.
  IF sy-subrc <> 0.                                         "#EC NEEDED
  ENDIF.

  LOOP AT lt_itemwt INTO ls_itemwt.
    zcl_ewm_base=>range_append_eq(
      EXPORTING
        iv_value = ls_itemwt-tanum
      CHANGING
        ct_range = lt_tanum_selopt ).
  ENDLOOP.

*=======================================================================
* Read output
*=======================================================================

  IF et_ordim_o IS REQUESTED.
    SELECT *
      FROM /scwm/ordim_o
      INTO TABLE et_ordim_o
      WHERE lgnum = iv_lgnum
        AND tanum IN lt_tanum_selopt
        AND matid IN lt_matid_selopt
        AND nlpla IN lt_nlpla_selopt.
    IF sy-subrc <> 0.                                       "#EC NEEDED
    ENDIF.
  ENDIF.

  IF et_ordim_c IS REQUESTED.
    SELECT *
      FROM /scwm/ordim_c
      INTO TABLE et_ordim_c
      WHERE lgnum  = iv_lgnum
        AND tostat = wmegc_to_confirm
        AND tanum IN lt_tanum_selopt
        AND matid IN lt_matid_selopt
        AND nlpla IN lt_nlpla_selopt.
    IF sy-subrc <> 0.                                       "#EC NEEDED
    ENDIF.
  ENDIF.

  IF et_ordim_a IS REQUESTED.
    SELECT *
      FROM /scwm/ordim_c
      INTO TABLE et_ordim_a
      WHERE lgnum  = iv_lgnum
        AND tostat = wmegc_to_canceled
        AND trart IN lt_trart_selopt
        AND tanum IN lt_tanum_selopt
        AND matid IN lt_matid_selopt
        AND nlpla IN lt_nlpla_selopt.
    IF sy-subrc <> 0.                                       "#EC NEEDED
    ENDIF.
  ENDIF.












*
ENDMETHOD.


METHOD SET_STOCK_ID.
*----------------------------------------------------------------------*
* Title MTDH SET_STOCK_ID.
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*--------------------------------------_-------------------------------*
* Project Rel. : Indumotora
* Autor        : Elias Hernandez
*----------------------------------------------------------------------*
* Program description:
* Set Stock ID in WT
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:
    lt_to_change           TYPE /scwm/tt_to_change_att_int,

    ls_to_change           TYPE /scwm/s_to_change_att_int,
    ls_to_changed          TYPE /scwm/s_changed,

    lv_tstmp               TYPE tzntstmps.

*=======================================================================
*
*=======================================================================

  ls_to_change-tanum      = iv_tanum.
  ls_to_changed-fieldname = gc_fieldname_idplate.
  ls_to_changed-value_c   = iv_stock_id.
  INSERT ls_to_changed INTO TABLE ls_to_change-tt_changed.
  INSERT ls_to_change INTO TABLE lt_to_change.


*=======================================================================
* Set Stock ID
*=======================================================================

  CALL FUNCTION '/SCWM/TO_CHANGE_ATT_UPD'
    EXPORTING
      iv_tstmp        = lv_tstmp
      iv_lgnum        = iv_lgnum
      it_change       = lt_to_change.











*
ENDMETHOD.


METHOD UPDATE_OPEN_WT.
*----------------------------------------------------------------------*
* Title MTDH UPDATE_OPEN_WT
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*---------------------------------------------------------------------*
* Project Rel. : Indumotora
* Autor        : David Nava
*----------------------------------------------------------------------*
* Program description:
* Update open WT
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================
  DATA:

  lv_tstmp                 TYPE tzntstmps.


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* Update open WT
*=======================================================================
  CALL FUNCTION '/SCWM/TO_CHANGE_ATT_UPD'
    EXPORTING
      iv_tstmp        = lv_tstmp
      iv_lgnum        = iv_lgnum
      it_change       = it_change.











*
ENDMETHOD.


  method ZIF_EWM_BASE_TM_APPL~CLEANUP.
  endmethod.


  method ZIF_EWM_BASE_TM_APPL~CLEANUP_NOW.
  endmethod.
ENDCLASS.
