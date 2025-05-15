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
class ZCL_EWM_BASE_DB_WHO definition
  public
  final
  create public .

public section.

  class-methods GET_BY_QUEUE
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_QUEUE type /SCWM/DE_QUEUE
      !IV_STATUS type /SCWM/DE_WHOSTAT optional
      !IV_FLGWHO type /SCWM/DE_FLGWHO
    returning
      value(RT_WHO) type /SCWM/TT_WHOID
    raising
      ZCX_EWM_BASE_DB .
  class-methods GET_BY_QUEUE_RSRC_TY
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_QUEUE type /SCWM/DE_QUEUE
      !IV_RSRC_TYP type /SCWM/DE_RSRC_TYPE
    returning
      value(RT_WHO) type /SCWM/TT_WHOID
    raising
      ZCX_EWM_BASE_DB .
  class-methods GET_HU_ASSIGNED_BY_WHO
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IT_WHO_R type /SCWM/TT_WHO_R
    exporting
      !ET_WHOHU type /SCWM/TT_WHOHU
    raising
      ZCX_EWM_BASE_DB .
  class-methods GET_WHOS_BY_TOPWHO
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_TOPWHO type /SCWM/DE_WHO
    exporting
      !ET_WHO type /SCWM/TT_WHO
    raising
      ZCX_EWM_BASE_DB .
  class-methods GET_WHO_ASSIGNED_TO_HU
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_HUIDENT type /SCWM/DE_HUIDENT
    exporting
      !ES_TOPWHO type /SCWM/WHO
      !ET_WHO type /SCWM/TT_WHO
    raising
      ZCX_EWM_BASE_DB .
  class-methods GET_WO_RSRC_BY_WHO
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IT_WHOID type /SCWM/TT_WHOID
      !IV_RSRC_TYP type /SCWM/DE_RSRC_TYPE
    returning
      value(RT_WHO_RSRC) type /SCWM/TT_WO_RSRC_TY
    raising
      ZCX_EWM_BASE_DB .
  class-methods HU_ASSIGN
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_WHO type /SCWM/DE_WHO
      !IV_SIMULATE type XFELD optional
      !IT_HU type /SCWM/TT_WHOHU_ADD
    exporting
      !ET_WHOHU type /SCWM/TT_WHOHU_INT
    raising
      ZCX_EWM_BASE_DB .
  class-methods HU_ASSIGN_UPD
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_WHO type /SCWM/DE_WHO
      !IV_SIMULATE type XFELD optional
      !IT_HU type /SCWM/TT_WHOHU_MAINT
    exporting
      !ET_WHOHU type /SCWM/TT_WHOHU_INT
    raising
      ZCX_EWM_BASE_DB .
  class-methods READ_WHO
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_QUEUE type /SCWM/DE_QUEUE optional
      !IT_WHOSTAT_R type /SCWM/TT_WHOSTAT_R optional
      !IV_FLGWHO type /SCWM/DE_FLGWHO optional
      !IV_FLGTO type /SCWM/DE_FLGTO optional
      !IT_WHO_R type RSELOPTION optional
      !IT_TOPWHOID_R type RSELOPTION optional
    returning
      value(RT_WHO) type /SCWM/TT_WHO
    raising
      ZCX_EWM_BASE_DB .
  class-methods READ_WHOHU
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_HUIDENT type /SCWM/DE_HUIDENT optional
      !IV_WHO type /SCWM/DE_WHO optional
      !IT_WHO_R type /SCWM/TT_WHO_R optional
      !IT_HUIDENT_R type /SCWM/TT_HUIDENT_R optional
    exporting
      !ET_WHOHU type /SCWM/TT_WHOHU
    raising
      ZCX_EWM_BASE_DB .
  class-methods READ_WO_RSRC_TY
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_QUEUE type /SCWM/DE_QUEUE optional
      !IV_RSRC_TYP type /SCWM/DE_RSRC_TYPE optional
      !IT_WHOID type /SCWM/TT_WHOID optional
    returning
      value(RT_WHO) type /SCWM/TT_WO_RSRC_TY
    raising
      ZCX_EWM_BASE_DB .
  class-methods SET_RSRC_TO_WHO
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_RSRC type /SCWM/DE_RSRC
      !IT_WHOID type /SCWM/TT_WHOID
      !IV_RSRC_TYPE type /SCWM/DE_RSRC_TYPE optional
    raising
      ZCX_EWM_BASE_DB .
  class-methods SET_STATUS_WHO
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_WHOSTAT type /SCWM/DE_WHOSTAT
      !IT_WHOID type /SCWM/TT_WHOID
    raising
      ZCX_EWM_BASE_DB .
  class-methods GET_WO_BY_WAVE
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_RDOCCAT type /SCWM/DE_DOCCAT
      !IV_WAVE type /SCWM/DE_WAVE optional
      !IR_WAVE type RSELOPTION optional
      !IV_CLEANUP type BOOLEAN default ABAP_FALSE
    returning
      value(ET_WHO) type /SCWM/TT_WHO_INT
    raising
      ZCX_EWM_BASE_DB .
  class-methods HU_REPLACE
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_WHO type /SCWM/DE_WHO
      !IV_SIMULATE type XFELD
      !IV_HUID type /SCWM/DE_WHOHUID optional
    exporting
      !ET_WHOHU type /SCWM/TT_WHOHU_INT
    raising
      ZCX_EWM_BASE_DB .
  class-methods HU_UNASSIGN
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_WHO type /SCWM/DE_WHO
      !IV_SIMULATE type XFELD
      !IV_HUID type /SCWM/DE_WHOHUID optional
      !IV_HUIDENT type /SCWM/DE_HUIDENT optional
    exporting
      !ET_WHOHU type /SCWM/TT_WHOHU_INT
    raising
      ZCX_EWM_BASE_DB .
  class-methods WO_MERGE
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_WCR type /SCWM/DE_WCR optional
      !IV_REASON_CODE type CHAR4 optional
      !IV_UPDATE type XFELD default 'X'
      !IV_COMMIT type XFELD default ' '
      !IV_SIMULATE type XFELD default ' '
      !IT_WHO type /SCWM/TT_WHOID
    exporting
      !EV_SEVERITY type BAPI_MTYPE
      !ET_BAPIRET type BAPIRETTAB
      !ET_WHO type /SCWM/TT_WHO .
  class-methods GET_WHO_BY_DLV
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_DOCCAT type /SCDL/DL_DOCCAT
      !IT_DOCNO type /SCWM/DLV_DOCNO_TAB
    exporting
      !ET_WHO type /SCWM/TT_WO_DET_MON_OUT .
  class-methods READ_WHOHU_LIMITS
    importing
      !IV_WOCR type /SCWM/DE_WCR
      !IV_PACK_PROFILE type /SCWM/DE_WCRPP
    exporting
      !ET_WO_LIMIT type ZEWM_TT_BASE_WO_LIMIT .
protected section.
private section.
ENDCLASS.



CLASS ZCL_EWM_BASE_DB_WHO IMPLEMENTATION.


METHOD GET_BY_QUEUE.
*----------------------------------------------------------------------*
* Title MTHD GET_BY_QUEUE
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Company:  PROLOGIC
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* Get warehouse orders by queue from who table.
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lt_whostat_r             TYPE /scwm/tt_whostat_r,
  lt_who                   TYPE /scwm/tt_who,
  ls_who                   TYPE /scwm/who.


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* Read data from db
*=======================================================================

  TRY.
      lt_who = zcl_ewm_base_db_who=>read_who(
                      iv_lgnum        = iv_lgnum
                      iv_queue        = iv_queue
                      it_whostat_r    = lt_whostat_r
                      iv_flgwho       = iv_flgwho ).

    CATCH zcx_ewm_base_db.
      RAISE EXCEPTION TYPE zcx_ewm_base_db
        EXPORTING
          textid       = zcx_ewm_base_db=>get_by_queue
          gv_lgnum     = iv_lgnum
          gv_queue     = iv_queue
          gv_status    = iv_status
          gv_flgwho    = iv_flgwho.
  ENDTRY.



*=======================================================================
* Output
*=======================================================================

  LOOP AT lt_who INTO ls_who.
    APPEND ls_who-who TO rt_who.
  ENDLOOP.











*
ENDMETHOD.


METHOD GET_BY_QUEUE_RSRC_TY.
*----------------------------------------------------------------------*
* Title MTHD GET_BY_QUEUE
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Company:  PROLOGIC
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* Get warehouse orders by queue and ressource type
* To get queue and ressource type use ressource db class.
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* Read data from db
*=======================================================================

  SELECT DISTINCT who
    FROM /scwm/wo_rsrc_ty
    INTO TABLE rt_who
    WHERE lgnum     = iv_lgnum AND
          queue     = iv_queue AND
          rsrc_type = iv_rsrc_typ.

  IF sy-subrc <> 0.
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        gv_lgnum     = iv_lgnum
        gv_queue     = iv_queue
        gv_rsrc_type = iv_rsrc_typ.
  ENDIF.










*
ENDMETHOD.


METHOD GET_HU_ASSIGNED_BY_WHO.
*----------------------------------------------------------------------*
* Title  GET_HU_ASSIGNED_BY_WHO
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Company:  PROLOGIC
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* Gets multiple HU's assigned to who's by who's
*----------------------------------------------------------------------*


*=======================================================================
* Declaration/Initialization
*=======================================================================


*=======================================================================
* Input
*=======================================================================

  IF it_who_r IS INITIAL.
    RETURN.
  ENDIF.


*=======================================================================
* Read data from db
*=======================================================================

  TRY.
    zcl_ewm_base_db_who=>read_whohu(
      EXPORTING
        iv_lgnum        = iv_lgnum
        it_who_r        = it_who_r
      IMPORTING
        et_whohu        = et_whohu ).
      CATCH zcx_ewm_base_db.

      RAISE EXCEPTION TYPE zcx_ewm_base_db
        EXPORTING
          textid = zcx_ewm_base_db=>get_hu_assigned_by_who.
  ENDTRY.












*
ENDMETHOD.


method GET_WHOS_BY_TOPWHO.
*----------------------------------------------------------------------*
* Title  GET_WHOS_BY_TOPWHO
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Company:  PROLOGIC
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* Gets WHO's for process Pick Pack and Pass by topwho's
*----------------------------------------------------------------------*


*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lt_topwho_r              TYPE rseloption.

*=======================================================================
* Input
*=======================================================================

  IF iv_topwho IS INITIAL.
    RETURN.
  ENDIF.

  CLEAR: et_who.


  zcl_ewm_base=>range_append_eq(
    EXPORTING
      iv_value = iv_topwho
    changing
      ct_range = lt_topwho_r ).



*=======================================================================
* Read WHO from db
*=======================================================================

  TRY.
      et_who = zcl_ewm_base_db_who=>read_who(
                    iv_lgnum        = iv_lgnum
                    it_topwhoid_r   = lt_topwho_r
                    iv_flgto        = abap_true ).

    CATCH zcx_ewm_base_db.
      RAISE EXCEPTION TYPE zcx_ewm_base_db
        EXPORTING
          textid = zcx_ewm_base_db=>who_by_topwho
          gv_who = iv_topwho.
      CLEAR et_who.
  ENDTRY.











*
endmethod.


method GET_WHO_ASSIGNED_TO_HU.
*----------------------------------------------------------------------*
* Title  GET_WHO_ASSIGNED_TO_HUS
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Company:  PROLOGIC
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* Gets WHO's for process Pick Pack and Pass by HU
*----------------------------------------------------------------------*


*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lt_whohu                TYPE /scwm/tt_whohu,
  lt_topwho               TYPE /scwm/tt_who,
  lt_who_r                TYPE rseloption,
  lt_whostat_r            TYPE /scwm/tt_whostat_r,

  ls_topwho               TYPE /scwm/who,
  ls_whohu                TYPE /scwm/whohu.


*=======================================================================
* Input
*=======================================================================

  IF iv_lgnum   IS INITIAL OR
     iv_huident IS INITIAL.
    RETURN.
  ENDIF.

  CLEAR: es_topwho,
         et_who.


*=======================================================================
* Read WHO assigned to HU from db
*=======================================================================


  TRY.
      zcl_ewm_base_db_who=>read_whohu(
        EXPORTING
          iv_lgnum        = iv_lgnum
          iv_huident      = iv_huident
        IMPORTING
          et_whohu        = lt_whohu ).
    CATCH zcx_ewm_base_db.

      RAISE EXCEPTION TYPE zcx_ewm_base_db
        EXPORTING
          textid = zcx_ewm_base_db=>get_hu_assigned_by_who.
  ENDTRY.

*=======================================================================
* Read TOP WHO from db
*=======================================================================

  LOOP AT lt_whohu INTO ls_whohu.
    zcl_ewm_base=>range_append_eq(
      EXPORTING
        iv_value = ls_whohu-who
      changing
        ct_range = lt_who_r ).
  ENDLOOP.

  zcl_ewm_base=>range_append_eq(
    EXPORTING
      iv_value = wmegc_wo_open
    changing
      ct_range = lt_whostat_r ).

  TRY.
    lt_topwho = zcl_ewm_base_db_who=>read_who(
                              iv_lgnum        = iv_lgnum
                              it_whostat_r    = lt_whostat_r
                              iv_flgwho       = abap_true
                              it_who_r        = lt_who_r ).

    CATCH zcx_ewm_base_db.
      RAISE EXCEPTION TYPE zcx_ewm_base_db
        EXPORTING
          textid = zcx_ewm_base_db=>get_hu_assigned_by_who.
  ENDTRY.

*More than one Open Who for Pick-HU
  IF ( lines( lt_topwho ) <> 1 ).
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid = zcx_ewm_base_db=>get_hu_assigned_by_who.
  ENDIF.

*=======================================================================
* Read WHO assigned to TOPWHO from db
*=======================================================================

  CLEAR: lt_who_r.
  LOOP AT lt_topwho INTO ls_topwho.
    zcl_ewm_base=>range_append_eq(
      EXPORTING
        iv_value = ls_topwho-who
      changing
        ct_range = lt_who_r ).
  ENDLOOP.

  TRY.
    et_who = zcl_ewm_base_db_who=>read_who(
                          iv_lgnum        = iv_lgnum
                          iv_flgto        = abap_true
                          it_topwhoid_r   = lt_who_r ).

    CATCH zcx_ewm_base_db.
      RAISE EXCEPTION TYPE zcx_ewm_base_db
        EXPORTING
          textid = zcx_ewm_base_db=>get_hu_assigned_by_who.
  ENDTRY.


*=======================================================================
* Output
*=======================================================================

  es_topwho = ls_topwho.











*
endmethod.


METHOD get_who_by_dlv.
*----------------------------------------------------------------------*
* Title  MTHD GET_WHO_BY_DLV
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Company:  PROLOGIC
* Author :  Alaedhin Díaz
*----------------------------------------------------------------------*
* Program description:
* Get Deliveries associated Warehouse Orders (WHO)
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:
    lt_tanum              TYPE /scwm/tt_wip_wt4dlv,
    lt_wo                 TYPE /scwm/tt_wo_det_mon,
    lt_data               TYPE /scwm/tt_wo_det_mon_out,
    lt_ordim_o            TYPE zewm_tt_base_to,
    lt_ordim_c            TYPE zewm_tt_base_to,

    ls_tanum              TYPE /scwm/s_wip_wt4dlv.

  FIELD-SYMBOLS:
    <fs_wo>               TYPE /scwm/s_wo_det_mon.

  CHECK it_docno IS NOT INITIAL.


*=======================================================================
* Get Data
*=======================================================================

* .Get WT based on Deliveries
  CALL FUNCTION '/SCWM/WIP_GETWT4DLV'
    EXPORTING
      iv_lgnum  = iv_lgnum
      iv_doccat = /scdl/if_dl_doc_c=>sc_doccat_out_prd
      it_docno  = it_docno
    IMPORTING
      et_wt4dlv = lt_tanum.

  IF lt_tanum IS INITIAL.
*. In case nothing was found leave function module
    RETURN.
  ENDIF.


* select WOs of warehouse requests
  SELECT wo~who wo~wcr wo~type wo~hdr_procty wo~queue wo~wave
         wo~status wo~areawho wo~lgtyp wo~lgpla wo~created_at
         wo~created_by wo~started_at wo~confirmed_at wo~confirmed_by
         wo~processor wo~rsrc wo~man_assign wo~plandura wo~unit_t
         wo~changed_at wo~changed_by wo~topwhoid wo~refwhoid
         wo~flginv wo~flgwho wo~flgto wo~whologno
         wo~splitwhoid wo~flgsplit wo~hazmat wo~lsd wo~start_bin
         FROM /scwm/who AS wo
           INNER JOIN /scwm/ordim_o AS to
            ON wo~lgnum = to~lgnum AND
               wo~who = to~who

         INTO CORRESPONDING FIELDS OF TABLE lt_wo
         FOR ALL ENTRIES IN lt_tanum
     WHERE
         wo~lgnum      = iv_lgnum  AND
         to~tanum      = lt_tanum-tanum.

*   select WOs of warehouse requests based on ordim_c
  SELECT wo~who wo~wcr wo~type wo~hdr_procty wo~queue wo~wave
         wo~status wo~areawho wo~lgtyp wo~lgpla wo~created_at
         wo~created_by wo~started_at wo~confirmed_at wo~confirmed_by
         wo~processor wo~rsrc wo~man_assign wo~plandura wo~unit_t
         wo~changed_at wo~changed_by wo~topwhoid wo~refwhoid
         wo~flginv wo~flgwho wo~flgto wo~whologno
         wo~splitwhoid wo~flgsplit wo~hazmat wo~lsd wo~start_bin
         FROM /scwm/who AS wo
           INNER JOIN /scwm/ordim_c AS to
            ON wo~lgnum = to~lgnum AND
               wo~who = to~who

         APPENDING CORRESPONDING FIELDS OF TABLE lt_wo
         FOR ALL ENTRIES IN lt_tanum
     WHERE
         wo~lgnum      = iv_lgnum  AND
         to~tanum      = lt_tanum-tanum.

  SORT lt_wo BY who.
  DELETE ADJACENT DUPLICATES FROM lt_wo COMPARING who.

* select TOs to get sum data
  LOOP AT lt_wo ASSIGNING <fs_wo>.
    SELECT who
           COUNT( * ) AS count_to
           SUM( weight ) AS sum_weight
           unit_w AS unit_w
           SUM( volum ) AS sum_volum
           unit_v AS unit_v
           SUM( solpo ) AS sum_reachtime
           zeiei AS unit_rt
           MAX( pick_comp_dt ) AS pick_comp_dt
           FROM /scwm/ordim_o
           APPENDING TABLE lt_ordim_o
           WHERE lgnum = iv_lgnum AND
                 who   = <fs_wo>-who
           GROUP BY who unit_w unit_v zeiei.

    SELECT toc~who
           COUNT( * ) AS count_to
           SUM( toc~weight ) AS sum_weight
           toc~unit_w AS unit_w
           SUM( toc~volum ) AS sum_volum
           toc~unit_v AS unit_v
           SUM( toc~solpo ) AS sum_reachtime
           toc~zeiei AS unit_rt
           MAX( tol~pick_comp_dt ) AS pick_comp_dt
           FROM /scwm/ordim_c AS toc
           INNER JOIN /scwm/ordim_l AS tol
           ON tol~lgnum = toc~lgnum AND
              tol~tanum = toc~tanum
           APPENDING TABLE lt_ordim_c
           WHERE toc~lgnum = iv_lgnum AND
                 toc~who   = <fs_wo>-who
           GROUP BY toc~who toc~unit_w toc~unit_v toc~zeiei.
  ENDLOOP.

  SORT lt_ordim_o BY who.
  SORT lt_ordim_c BY who.

*. Move data to output structure and convert GUIDs/time stamps
  CALL FUNCTION '/SCWM/WIP_WO_OUTPUT_REFINE'
    EXPORTING
      iv_lgnum     = iv_lgnum
      iv_capa_data = abap_true
      it_wo        = lt_wo
      it_ordim_o   = lt_ordim_o
      it_ordim_c   = lt_ordim_c
    IMPORTING
      et_wo        = lt_data.


*=======================================================================
* Output
*=======================================================================

  IF lt_data IS NOT INITIAL.
    et_who = lt_data.
  ENDIF.











*
ENDMETHOD.


METHOD get_wo_by_wave.
*----------------------------------------------------------------------*
* Title MTHD: GET_WO_BY_WAVE
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Company:  PROLOGIC
* Author :  Alaedhin Díaz
*----------------------------------------------------------------------*
* Program description:
* Get WO assigned to waves.
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:
    lr_wave TYPE rseloption,
    ls_wave TYPE rsdsselopt,

    lt_who  TYPE /scwm/tt_who_int.

  lr_wave[] = ir_wave[].

*=======================================================================
* Input
*=======================================================================

  IF iv_wave IS INITIAL AND
     ir_wave IS INITIAL.
    RETURN.
  ENDIF.

  " Built range for extraction
  IF iv_wave IS NOT INITIAL.
    ls_wave-sign = 'I'.
    ls_wave-option = 'EQ'.
    ls_wave-low = iv_wave.

    APPEND ls_wave TO lr_wave.

  ENDIF.

*=======================================================================
* Set Cleanup for extraction
*=======================================================================

  IF iv_cleanup EQ abap_true.
    CALL FUNCTION '/SCWM/WAVE_CLEANUP'
      EXPORTING
        iv_lgnum   = iv_lgnum
        iv_rdoccat = iv_rdoccat.
  ENDIF.

  CALL FUNCTION '/SCWM/WAVE_SELECT'
    EXPORTING
      ir_wave = lr_wave
    IMPORTING
      et_who  = lt_who.

*=======================================================================
* Output
*=======================================================================
  IF lt_who IS INITIAL.
    " Error, no data found
    RAISE EXCEPTION TYPE zcx_ewm_base_db.

  ELSE.

    et_who[] = lt_who[].

  ENDIF.










*
ENDMETHOD.


METHOD GET_WO_RSRC_BY_WHO.
*----------------------------------------------------------------------*
* Title MTHD: GET_WO_RSRC_BY_WHO
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Company:  PROLOGIC
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* Gets multiple Warehouse Orders assigment by WO.
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================


*=======================================================================
* Input
*=======================================================================

  IF it_whoid IS INITIAL.
    RETURN.
  ENDIF.


*=======================================================================
* Read data from db
*=======================================================================

   rt_who_rsrc = zcl_ewm_base_db_who=>read_wo_rsrc_ty(
                            EXPORTING
                              iv_lgnum    = iv_lgnum
                              iv_rsrc_typ = iv_rsrc_typ
                              it_whoid    = it_whoid ).











*
ENDMETHOD.


METHOD HU_ASSIGN.
*----------------------------------------------------------------------*
* Title  HU_ASSIGN
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Company:  PROLOGIC
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* Assign a HU to a warehouse order (as pick HU)
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lt_bapiret               TYPE bapirettab,
  lv_severity              TYPE bapi_mtype.

*=======================================================================
* Input
*=======================================================================


*=======================================================================
* Assign HU
*=======================================================================

  CALL FUNCTION '/SCWM/WHO_HU_ASSIGN'
    EXPORTING
      iv_lgnum    = iv_lgnum
      iv_who      = iv_who
      iv_simulate = iv_simulate
      it_hu       = it_hu
    IMPORTING
      ev_severity = lv_severity
      et_bapiret  = lt_bapiret
      et_whohu    = et_whohu.

  zcx_ewm_base_db=>raise_bapiret( iv_severity = lv_severity
                                  it_bapiret  = lt_bapiret ).

  IF ( et_whohu IS INITIAL ).
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid = zcx_ewm_base_db=>who_hu_assign.
  ENDIF.











*
ENDMETHOD.


METHOD HU_ASSIGN_UPD.
*----------------------------------------------------------------------*
* Title  HU_ASSIGN
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Company:  PROLOGIC
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* Update Assignment HU to a warehouse order (as pick HU)
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lt_bapiret               TYPE bapirettab,
  lv_severity              TYPE bapi_mtype.

*=======================================================================
* Input
*=======================================================================


*=======================================================================
* Assign HU
*=======================================================================


  CALL FUNCTION '/SCWM/WHO_WHOHU_MAINT'
    EXPORTING
      iv_lgnum    = iv_lgnum
      iv_who      = iv_who
      iv_simulate = iv_simulate
      it_whohu    = it_hu
    IMPORTING
      ev_severity = lv_severity
      et_bapiret  = lt_bapiret
      et_whohu    = et_whohu.

  zcx_ewm_base_db=>raise_bapiret( iv_severity = lv_severity
                                  it_bapiret  = lt_bapiret ).

  IF ( et_whohu IS INITIAL ).
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid = zcx_ewm_base_db=>who_hu_assign.
  ENDIF.











*
ENDMETHOD.


METHOD hu_replace.
*----------------------------------------------------------------------*
* Title MTDH HU_REPLACE
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*---------------------------------------------------------------------*
* Project Rel. : Indumotora
* Autor        : David Nava
*----------------------------------------------------------------------*
* Program description:
* Replace HU related to WHO matking the following steps
* 1. Get actual HUID is on table /SCWM/WHOHU and WT
* 2. Create a new HUID
* 3. Change HUID on open WT if there is linked
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================
  DATA:

  lr_log                   TYPE REF TO /scwm/cl_log,

  lt_whohu                 TYPE /scwm/tt_whohu,
  lt_ordim_o               TYPE /scwm/tt_ordim_o,
  lt_whohu_int             TYPE /scwm/tt_whohu_int,
  lt_hu                    TYPE /scwm/tt_whohu_add,
  lt_huid                  TYPE /scwm/tt_whohuid,
  lt_bapiret               TYPE bapirettab,
  lt_to_change             TYPE /scwm/tt_to_change_att_int,
  lt_to_changed            TYPE /scwm/tt_changed,

  ls_whohu                 TYPE /scwm/whohu,
  ls_whohu_int             TYPE /scwm/s_whohu,
  ls_hu                    TYPE /scwm/s_whohu_add,
  ls_huid                  TYPE /scwm/s_whohuid,
  ls_ordim_o               TYPE /scwm/ordim_o,
  ls_to_change             TYPE /scwm/s_to_change_att_int,
  ls_to_changed            TYPE /scwm/s_changed,

  lv_severity              TYPE bapi_mtype,
  lv_huid                  TYPE /scwm/de_whohuid.


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* Get actual HUID is on table /SCWM/WHOHU and WT
*=======================================================================
* .Do not catch exception in order to trigger autommatically
  zcl_ewm_base_db_who=>read_whohu(
    EXPORTING
      iv_lgnum = iv_lgnum
      iv_who   = iv_who
     IMPORTING
      et_whohu = lt_whohu ).
  CHECK lt_whohu IS NOT INITIAL.
  IF iv_huid IS NOT INITIAL.
    READ TABLE lt_whohu INTO ls_whohu WITH KEY huid = iv_huid.
  ELSE.
    READ TABLE lt_whohu INTO ls_whohu INDEX 1.
  ENDIF.
  CHECK ls_whohu-huid IS NOT INITIAL.


*=======================================================================
* Get open WT related to HUID
*=======================================================================
  ls_huid-huid = ls_whohu-huid.
  INSERT ls_huid INTO TABLE lt_huid.
  TRY.
      zcl_ewm_base_db_to=>get_open_huid(
            EXPORTING
              iv_lgnum    = iv_lgnum
              iv_huid     = ls_whohu-huid
            IMPORTING
              et_ordim_o  = lt_ordim_o ).
    CATCH  zcx_ewm_base_db.
      RAISE EXCEPTION TYPE zcx_ewm_base_db
        EXPORTING
          textid     = zcx_ewm_base_db=>to_get_open_hu
          gv_guid_hu = iv_huid.

  ENDTRY.


*=======================================================================
* Create a new HUID
*=======================================================================
  ls_hu-pmat_guid = ls_whohu-pmat_guid.
  INSERT ls_hu INTO TABLE lt_hu.

  SET UPDATE TASK LOCAL.

  CALL FUNCTION '/SCWM/WHO_HU_ASSIGN'
    EXPORTING
      iv_lgnum          = iv_lgnum
      iv_who            = iv_who
      it_hu             = lt_hu
      io_log            = lr_log
    IMPORTING
      ev_severity       = lv_severity
      et_bapiret        = lt_bapiret
      et_whohu          = lt_whohu_int.

  IF lv_severity CA 'EAX'.
*    Raise exception
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid     = zcx_ewm_base_db=>hu_repl_ass.
  ENDIF.
  COMMIT WORK.
  /scwm/cl_tm=>cleanup( ).


*=======================================================================
* Change HUID on open WT if there is linked
*=======================================================================
  LOOP AT lt_whohu_int INTO ls_whohu_int.
    READ TABLE lt_whohu
      TRANSPORTING NO FIELDS
      WITH KEY huid = ls_whohu_int-huid.
    IF sy-subrc <> 0.
      CLEAR: lt_to_change.
*     .Update open WT to new HUID
      LOOP AT lt_ordim_o INTO ls_ordim_o.
        READ TABLE lt_to_change
          TRANSPORTING NO FIELDS
          WITH KEY tanum = ls_ordim_o-tanum.
        CHECK sy-subrc <> 0.
        CLEAR: ls_to_change,
               ls_to_changed.
        ls_to_change-tanum = ls_ordim_o-tanum.
        ls_to_changed-fieldname = zif_ewm_base_c=>gc_fieldname_huid.
        ls_to_changed-value_c   = ls_whohu_int-huid.
        INSERT ls_to_changed INTO TABLE ls_to_change-tt_changed.
        INSERT ls_to_change INTO TABLE lt_to_change.
      ENDLOOP.
      IF lt_to_change IS NOT INITIAL.
*       .Exception to catch in order to trigger to called method.
        zcl_ewm_base_db_to=>update_open_wt( iv_lgnum  = iv_lgnum
                                            it_change = lt_to_change ).
      ENDIF.
      EXIT.
    ENDIF.
  ENDLOOP.











*
ENDMETHOD.


METHOD HU_UNASSIGN.
*----------------------------------------------------------------------*
* Title MTDH HU_REPLACE
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*---------------------------------------------------------------------*
* Project Rel. : Indumotora
* Autor        : David Nava
*----------------------------------------------------------------------*
* Program description:
* Delete assigment of HU to WHO matking the following steps:
* 1. Get actual HUID/HUIDENT on table /SCWM/WHOHU
* 2. Check that is not more Open WT realted to HUID
* 2. Delete assigment of HU
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================
  DATA:

  lr_log                   TYPE REF TO /scwm/cl_log,

  lt_whohu                 TYPE /scwm/tt_whohu,
  lt_ordim_o               TYPE /scwm/tt_ordim_o,
  lt_huid                  TYPE /scwm/tt_whohuid,
  lt_bapiret               TYPE bapirettab,

  ls_whohu                 TYPE /scwm/whohu,
  ls_hu                    TYPE /scwm/s_whohu_add,
  ls_huid                  TYPE /scwm/s_whohuid,
  ls_ordim_o               TYPE /scwm/ordim_o,

  lv_severity              TYPE bapi_mtype,
  lv_huid                  TYPE /scwm/de_whohuid.


*=======================================================================
* Input
*=======================================================================
  CHECK iv_huid    IS NOT INITIAL OR
        iv_huident IS NOT INITIAL.


*=======================================================================
* Get actual HUID is on table /SCWM/WHOHU and WT
*=======================================================================
* .Do not catch exception in order to trigger autommatically
  zcl_ewm_base_db_who=>read_whohu(
    EXPORTING
      iv_lgnum = iv_lgnum
      iv_who   = iv_who
     IMPORTING
      et_whohu = lt_whohu ).
  CHECK lt_whohu IS NOT INITIAL.
  IF iv_huid IS NOT INITIAL.
    READ TABLE lt_whohu INTO ls_whohu WITH KEY huid = iv_huid.
  ELSEIF iv_huident IS NOT INITIAL.
    READ TABLE lt_whohu INTO ls_whohu WITH KEY huident = iv_huident.
  ENDIF.
  CHECK ls_whohu-huid IS NOT INITIAL.


*=======================================================================
* Get open WT related to HUID
*=======================================================================
  ls_huid-huid = ls_whohu-huid.
  INSERT ls_huid INTO TABLE lt_huid.
  TRY.
      zcl_ewm_base_db_to=>get_open_huid(
            EXPORTING
              iv_lgnum    = iv_lgnum
              iv_huid     = ls_whohu-huid
            IMPORTING
              et_ordim_o  = lt_ordim_o ).
    CATCH  zcx_ewm_base_db.
      RAISE EXCEPTION TYPE zcx_ewm_base_db
        EXPORTING
          textid     = zcx_ewm_base_db=>to_get_open_hu
          gv_guid_hu = iv_huid.

  ENDTRY.
  CHECK lt_ordim_o IS INITIAL.


*=======================================================================
* Unassign old HU
*=======================================================================
  CHECK lt_huid IS NOT INITIAL.
  CALL FUNCTION '/SCWM/WHO_HU_UNASSIGN'
    EXPORTING
      iv_lgnum          = iv_lgnum
      iv_who            = iv_who
      it_huid           = lt_huid
      io_log            = lr_log
    IMPORTING
      ev_severity       = lv_severity
      et_bapiret        = lt_bapiret.
  IF lv_severity CA 'EAX'.
  ENDIF.
  COMMIT WORK.
  /scwm/cl_tm=>cleanup( ).











*
ENDMETHOD.


method READ_WHO.
*----------------------------------------------------------------------*
* Title  READ_WHO
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Company:  PROLOGIC
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* Read Table /SCWM/WHO
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lt_queue_r               TYPE /scwm/tt_queue_r,
  lt_status_r              TYPE /scwm/tt_whostat_r.


*=======================================================================
* Input
*=======================================================================

  IF iv_lgnum IS INITIAL.
    RETURN.
  ENDIF.


*=======================================================================
* Prepare Data
*=======================================================================

  IF iv_queue IS NOT INITIAL.
    zcl_ewm_base=>range_append_eq(
      EXPORTING
        iv_value = iv_queue
      changing
        ct_range = lt_queue_r ).
  ENDIF.


*=======================================================================
* READ from db
*=======================================================================
*HANA CC: BEGIN OF CODE ADJUSTMENT # COARSOLARI # 25.11.2022
*  SELECT  *
*    FROM  /scwm/who
*    INTO TABLE rt_who
*    WHERE  lgnum     EQ iv_lgnum
*    AND    who       IN it_who_r
*    AND    status    IN it_whostat_r
*    AND    queue     IN lt_queue_r
*    AND    topwhoid  IN it_topwhoid_r
*    AND    flgwho    EQ iv_flgwho
*    AND    flgto     EQ iv_flgto.

  SELECT  *
    FROM  /scwm/who
    INTO TABLE rt_who
    WHERE  lgnum     EQ iv_lgnum
    AND    who       IN it_who_r
    AND    status    IN it_whostat_r
    AND    queue     IN lt_queue_r
    AND    topwhoid  IN it_topwhoid_r
    AND    flgwho    EQ iv_flgwho
    AND    flgto     EQ iv_flgto
    ORDER BY PRIMARY KEY.

*HANA CC: END OF CODE ADJUSTMENT # COARSOLARI # 25.11.2022
  IF sy-subrc <> 0.
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
          textid       = zcx_ewm_base_db=>who_select.
  ENDIF.











*
endmethod.


METHOD read_whohu.
*----------------------------------------------------------------------*
* Title MTHD READ_WHOHU
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* Read Table /SCWM/WHOHU
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lt_huident_r             TYPE /scwm/tt_huident_r,
  lt_who_r                 TYPE /scwm/tt_who_r.


*=======================================================================
* Input
*=======================================================================

  IF iv_lgnum IS INITIAL.
    RETURN.
  ENDIF.

  IF iv_huident   IS INITIAL AND
     it_who_r     IS INITIAL AND
     it_huident_r IS INITIAL AND
     iv_who       IS INITIAL.
       RAISE EXCEPTION TYPE zcx_ewm_base_db
       EXPORTING
         textid = zcx_ewm_base_db=>parameter_invalid.
  ENDIF.


*=======================================================================
* Prepare Data
*=======================================================================

  lt_huident_r = it_huident_r.
  IF iv_huident IS NOT INITIAL.
    zcl_ewm_base=>range_append_eq(
      EXPORTING
        iv_value = iv_huident
      CHANGING
        ct_range = lt_huident_r ).
  ENDIF.

  lt_who_r = it_who_r.
  IF iv_who IS NOT INITIAL.
    zcl_ewm_base=>range_append_eq(
      EXPORTING
        iv_value = iv_who
      CHANGING
        ct_range = lt_who_r ).
  ENDIF.


*=======================================================================
* READ from db
*=======================================================================

*HANA CC: BEGIN OF CODE ADJUSTMENT # COARSOLARI # 25.11.2022
*  SELECT *
*    FROM /scwm/whohu
*    INTO TABLE et_whohu
*    WHERE lgnum     EQ iv_lgnum
*    AND   who       IN lt_who_r
*    AND   huident   IN lt_huident_r.

  SELECT *
    FROM /scwm/whohu
    INTO TABLE et_whohu
    WHERE lgnum     EQ iv_lgnum
    AND   who       IN lt_who_r
    AND   huident   IN lt_huident_r
    ORDER BY PRIMARY KEY.

*HANA CC: END OF CODE ADJUSTMENT # COARSOLARI # 25.11.2022
  IF sy-subrc <> 0.
    RAISE EXCEPTION TYPE zcx_ewm_base_db.
  ENDIF.











*
ENDMETHOD.


METHOD read_whohu_limits.
*----------------------------------------------------------------------*
* Title MTHD READ_WHOHU_LIMITS
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Company:  PROLOGIC
* Author :  Luis Arcega
*----------------------------------------------------------------------*
* Program description:
* Get WO HU limits from ZEWM_WO_LIMIT table.
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================


*=======================================================================
* Main Code
*=======================================================================

*  SELECT *
*    INTO TABLE  et_wo_limit
*    FROM zewm_wo_limit
*    WHERE wocr = iv_wocr AND
*          pack_profile = iv_pack_profile.

*  HANA Correction

  SELECT *
    FROM zewm_wo_limit
    INTO TABLE et_wo_limit
    WHERE wocr = iv_wocr AND
          pack_profile = iv_pack_profile
    ORDER BY PRIMARY KEY.


    IF sy-subrc <> 0.
    ENDIF.














*
  ENDMETHOD.


METHOD  READ_WO_RSRC_TY.
*----------------------------------------------------------------------*
* Title MTHD READ_WO_RSRC_TY
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Company:  PROLOGIC
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* Get warehouse orders by queue and ressource type
* To get queue and ressource type use ressource db class.
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

  lt_queue_r               TYPE /scwm/tt_queue_r,
  lt_rsrc_type_r           TYPE rseloption,
  lt_who_r                 TYPE /scwm/tt_who_r,

  ls_whoid                 TYPE /scwm/s_whoid.

*=======================================================================
* Input
*=======================================================================

  IF iv_lgnum     IS INITIAL AND
     iv_queue     IS INITIAL AND
     iv_rsrc_typ  IS INITIAL.
    RETURN.
  ENDIF.


  IF iv_queue IS NOT INITIAL.
    zcl_ewm_base=>range_append_eq(
      EXPORTING
        iv_value = iv_queue
      changing
        ct_range = lt_queue_r ).
  ENDIF.

  IF iv_rsrc_typ IS NOT INITIAL.
    zcl_ewm_base=>range_append_eq(
      EXPORTING
        iv_value = iv_rsrc_typ
      changing
        ct_range = lt_rsrc_type_r ).
  ENDIF.

  LOOP AT it_whoid INTO ls_whoid.
    zcl_ewm_base=>range_append_eq(
      EXPORTING
        iv_value = ls_whoid-who
      changing
        ct_range = lt_who_r ).
  ENDLOOP.


*=======================================================================
* Read data from db
*=======================================================================

  SELECT *
    FROM /scwm/wo_rsrc_ty
    INTO TABLE rt_who
    WHERE lgnum     EQ iv_lgnum   AND
          who       IN lt_who_r   AND
          queue     IN lt_queue_r AND
          rsrc_type IN lt_rsrc_type_r.

  IF sy-subrc <> 0.
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        gv_lgnum     = iv_lgnum
        gv_queue     = iv_queue
        gv_rsrc_type = iv_rsrc_typ.
  ENDIF.










*
ENDMETHOD.


METHOD SET_RSRC_TO_WHO.
*----------------------------------------------------------------------*
* Title MTHD: SET_RSRS_TO_WHO
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Company:  PROLOGIC
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* Set Resourse to WHO
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:
    lt_wo_rsrc_ty          TYPE /scwm/tt_wo_rsrc_ty,
    lt_who_r               TYPE /scwm/tt_who_r,

    ls_rsrc                TYPE /scwm/rsrc,
    ls_who                 TYPE /scwm/s_whoid,
    ls_wo_rsrc_ty          TYPE /scwm/wo_rsrc_ty,
    ls_wo_att              TYPE /scwm/s_who_att.


*=======================================================================
* Input
*=======================================================================

  IF it_whoid IS INITIAL.
    RETURN.
  ENDIF.


*=======================================================================
* CHECK Resource
*=======================================================================
  IF iv_rsrc IS NOT INITIAL.
    CALL FUNCTION '/SCWM/RSRC_READ_SINGLE'
      EXPORTING
        iv_lgnum    = iv_lgnum
        iv_rsrc     = iv_rsrc
      IMPORTING
        es_rsrc     = ls_rsrc
      EXCEPTIONS
        wrong_input = 1
        not_found   = 2
        OTHERS      = 3.
    IF sy-subrc <> 0.
* Implement suitable error handling here
    ENDIF.

  ELSEIF iv_rsrc_type IS NOT INITIAL.
    ls_rsrc-rsrc_type = iv_rsrc_type.
  ELSE.
*    RAISE
  ENDIF.

*=======================================================================
* GET Who to change Resource
*=======================================================================

  lt_wo_rsrc_ty = zcl_ewm_base_db_who=>get_wo_rsrc_by_who(
                      iv_lgnum     =  iv_lgnum
                      it_whoid     =  it_whoid
                      iv_rsrc_typ  =  ls_rsrc-rsrc_type ).


*=======================================================================
* SET Resource
*=======================================================================

  LOOP AT it_whoid INTO ls_who.
    READ TABLE lt_wo_rsrc_ty INTO ls_wo_rsrc_ty
      WITH KEY who = ls_who-who.

    CHECK sy-subrc = 0.

    MOVE-CORRESPONDING ls_wo_rsrc_ty TO ls_wo_att.

    ls_wo_att-rsrc = iv_rsrc.

    CALL FUNCTION '/SCWM/WHO_UPDATE'
      EXPORTING
        iv_lgnum      = iv_lgnum
        iv_db_update  = abap_true
        iv_who        = ls_who-who
        is_attributes = ls_wo_att
      EXCEPTIONS
        read_error    = 1
        attributes    = 2
        OTHERS        = 3.
    IF sy-subrc <> 0.
* Implement suitable error handling here
    ENDIF.

  ENDLOOP.

  COMMIT WORK.










*
ENDMETHOD.


method SET_STATUS_WHO.
*----------------------------------------------------------------------*
* Title MTHD: SET_STATUS_WHO
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*---------------------------------------------------------------------*
* Project Rel. : Indumotora
* Company:  PROLOGIC
* Author :  David Nava
*----------------------------------------------------------------------*
* Program description:
* Set Status of WO to "Waiting" or "Open"
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:

    lo_log                 TYPE REF TO /scwm/cl_log,

    lt_bapiret             TYPE bapirettab,

    ls_bapiret             TYPE bapiret2,

    lv_hold                TYPE xfeld,
    lv_unhold              TYPE xfeld.


*=======================================================================
* Input
*=======================================================================

  IF it_whoid IS INITIAL.
    RETURN.
  ENDIF.


  CASE iv_whostat.
    WHEN wmegc_wo_open.
      lv_hold    = abap_false.
      lv_unhold  = abap_true.
    WHEN wmegc_wo_on_hold.
      lv_hold    = abap_true.
      lv_unhold  = abap_false.
    WHEN OTHERS.
      RETURN.
  ENDCASE.

  CREATE OBJECT lo_log.

*=======================================================================
* Change Status for WHO
*=======================================================================


  CALL FUNCTION '/SCWM/WHO_HOLD_UNHOLD'
    EXPORTING
      iv_lgnum        = iv_lgnum
      iv_hold         = lv_hold
      iv_unhold       = lv_unhold
      it_who          = it_whoid
      io_log          = lo_log.

  IF ( lo_log->get_severity( ) CA wmegc_severity_eax ).
    lt_bapiret = lo_log->get_prot( ).

    zcx_ewm_base_db=>raise_bapiret( iv_severity = lo_log->get_severity( )
                                    it_bapiret  = lt_bapiret ).
  ENDIF.











*
endmethod.


METHOD wo_merge.
*----------------------------------------------------------------------*
* Title  MTHD ZCL_EWM_BASE_DB_WHO-WO_MERGE
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : Alaedhin Díaz
*----------------------------------------------------------------------*
* Program description:
* Release WO based on Delivery number
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================

  DATA:
    ls_who                TYPE /scwm/s_whoid,
    ls_bapiret            TYPE bapiret2,

    lv_message            TYPE string.


*=======================================================================
* Validations
*=======================================================================

  ". Read and block WO

  LOOP AT it_who INTO ls_who.
    CALL FUNCTION '/SCWM/TO_READ_WHO'
      EXPORTING
        iv_lgnum         = iv_lgnum
        iv_who           = ls_who-who
        iv_flglock       = abap_true
        iv_flglock_who   = abap_true
*       IV_TOTYP         = ' '
        iv_nobuf         = abap_true
        iv_add_to_memory = 'X'
*       IV_FLGLOCKWAIT   = ' '
*   IMPORTING
*       ET_ORDIM_O       =
*       ET_ORDIM_C       =
*       ET_ORDIM_L       =
*       ET_ORDIM_E       =
*       ET_ORDIM_H       =
*       ET_TAP           =
*       ET_ORDIM_OS      =
*       ET_ORDIM_CS      =
*       ET_ORDIM_LS      =
*       ET_ORDIM_HS      =
      EXCEPTIONS
        wrong_input      = 1
        not_found        = 2
        foreign_lock     = 3
        error            = 4
        OTHERS           = 5.

    IF sy-subrc <> 0.
      ". Error, Merge process not possible.
      ev_severity = zwmgc_msgty_error.

      ". ERROR Message: WO &1 couln´t be read/blocked. Merge not possible
      MESSAGE e080(zewm_base_db) INTO lv_message
                                WITH ls_who-who.

      ls_bapiret-type = sy-msgty.
      ls_bapiret-id = sy-msgid.
      ls_bapiret-number = sy-msgno.
      ls_bapiret-message = lv_message.
      ls_bapiret-message_v1 = sy-msgv1.
      APPEND ls_bapiret TO et_bapiret.
      RETURN.
    ENDIF.

  ENDLOOP.


*=======================================================================
* Input
*=======================================================================

  CALL FUNCTION '/SCWM/WHO_INIT'.

  CALL FUNCTION '/SCWM/WHO_MERGE'
    EXPORTING
      iv_lgnum       = iv_lgnum
      iv_wcr         = iv_wcr
      iv_reason_code = iv_reason_code
      iv_update      = iv_update
      iv_commit      = iv_commit
      iv_simulate    = iv_simulate
      it_who         = it_who
    IMPORTING
      ev_severity    = ev_severity
      et_bapiret     = et_bapiret
      et_who         = et_who.


*=======================================================================
* Output
*=======================================================================











*
ENDMETHOD.
ENDCLASS.
