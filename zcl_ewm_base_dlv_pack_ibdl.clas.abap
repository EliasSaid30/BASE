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
class ZCL_EWM_BASE_DLV_PACK_IBDL definition
  public
  inheriting from /SCWM/CL_HU_PACKING
  final
  create public .

public section.

  class-data GT_ITMP type /SCWM/DLV_HU_PRD_TAB read-only .
  class-data GV_DOCCAT type /SCWM/DE_DOCCAT .
  class-data GV_PACK_FREE_SN type /SCWM/DE_PACK_FREE_SN value 'X' ##NO_TEXT.
  class-data GV_REPACK type BOOLEAN .
  class-data GV_ONLINE type BOOLE_D .
  class-data GV_PRCES_REPACK type /SCWM/DE_PRCES .

  methods PACK_PROPOSAL
    importing
      !IT_FREE type /SCWM/DLV_HU_PRD_TAB
    exporting
      !ET_HU_PROP_HDR type /SCWM/T_HU_PROPOSAL_HDR
      !ES_PACKSPEC_HEADER type /SCWM/S_PS_HEADER_INT
      !ES_LEVEL type /SCWM/S_PS_LEVEL_INT
      !ET_HU_PROP type /SCWM/T_HU_PROPOSAL
      !EV_ALTME type /SCDL/DL_UOM
    exceptions
      ERROR .
  methods PACK_BY_ITEM_NO
    importing
      !IS_QUANTITY type /SCWM/S_QUAN
      !IV_DOCNO type /SCDL/DL_DOCNO
      !IV_ITMNO type /SCDL/DL_ITEMNO
      !IV_DEST_HU type /SCWM/GUID_HU
    exporting
      !ES_QUANTITY type /SCWM/S_QUAN
    exceptions
      ERROR .
  methods INIT
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IT_DOCID type /SCWM/TT_DOCID optional
      !IV_DOCCAT type /SCWM/DE_DOCCAT optional
      !IV_NO_REFRESH type XFELD optional
      !IV_LOCK_DLV type XFELD optional
      !IV_NO_QUAN_CHECK type CHAR1 optional
      !IV_PARTIAL type XFELD optional
    exporting
      !EV_FOREIGN_LOCK type XFELD
      !EV_BATCH_INITIAL type XFELD
      !ET_DOC_LOCK type /SCWM/TT_DOCNO
      !EV_TW_ITEMS type BOOLE_D .
  methods INIT_RF
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IT_DOCID type /SCWM/DLV_DOCID_ITEM_TAB
      !IV_DOCCAT type /SCWM/DE_DOCCAT optional
      !IV_NO_REFRESH type XFELD optional
      !IV_LOCK_DLV type XFELD optional
      !IV_NO_QUAN_CHECK type CHAR1 optional
      !IV_PARTIAL type XFELD optional
    exporting
      !EV_FOREIGN_LOCK type XFELD
      !EV_BATCH_INITIAL type XFELD
      !ET_DOC_LOCK type /SCWM/TT_DOCNO
      !EV_DOCU_BATCH type XFELD .
  class-methods GET_FREE
    importing
      !IV_DOCID type /SCWM/DE_DOCID optional
      !IV_ITMID type /SCWM/DE_ITMID optional
      !IV_ONLY_LOCKED type XFELD optional
    exporting
      !ET_FREE type /SCWM/DLV_HU_PRD_TAB
      !ES_FREE type /SCWM/DLV_HU_PRD_STR .
  class-methods GET_HUS_FOR_DELIVERY
    importing
      !IV_DOCCAT type /SCWM/DE_DOCCAT optional
      !IT_DOCID type /SCWM/TT_DOCID
      !IV_LGNUM type /SCWM/LGNUM
    exporting
      !ET_HIGH type /SCWM/TT_HUHDR_INT
      !ET_HUREF type /SCWM/TT_HUREF_INT
      !ET_IDENT type /SCWM/TT_IDENT_INT
      !ET_HUHDR type /SCWM/TT_HUHDR_INT
      !ET_HUITM type /SCWM/TT_HUITM_INT
      !ET_HUTREE type /SCWM/TT_HUTREE
    exceptions
      ERROR .
  class-methods REFRESH_GM .
  methods UPDATE_QSAMPLE
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_DOCCAT type /SCWM/DE_DOCCAT
      !IT_DOCID type /SCWM/TT_DOCID
    exceptions
      ERROR .
  methods AUTOPACK
    importing
      !IT_ITMP type /SCWM/DLV_HU_PRD_TAB optional
      !IV_PRDI type /SCWM/DE_DOCID optional
    exceptions
      ERROR .
  methods READ_DELIVERY
    importing
      !IT_DOCID type /SCWM/TT_DOCID
      !IV_DOCCAT type /SCWM/DE_DOCCAT
      !IV_LOCK type XFELD
      !IV_LGNUM type /SCWM/LGNUM
    exporting
      !EV_FOREIGN_LOCK type XFELD
      !ET_DOC_LOCK type /SCWM/TT_DOCNO .
  methods READ_DELIVERY_RF
    importing
      !IT_DOCID type /SCWM/DLV_DOCID_ITEM_TAB
      !IV_DOCCAT type /SCWM/DE_DOCCAT
      !IV_LOCK type XFELD
      !IV_LGNUM type /SCWM/LGNUM
    exporting
      !EV_FOREIGN_LOCK type XFELD
      !ET_DOC_LOCK type /SCWM/TT_DOCNO .
  class-methods GET_INSTANCE_DLV
    exporting
      !EO_INSTANCE type ref to /SCWM/CL_DLV_PACK_IBDL .
  methods PREPARE_HU_FOR_REJECT
    importing
      !IV_LGNUM type /SCWM/LGNUM optional
      !IT_DOCID type /SCWM/TT_DOCID
      !IV_DOCCAT type /SCWM/DE_DOCCAT optional .
  methods CREATE_HU_UKC
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IV_PMAT_LOGHU type /SCWM/DE_MATID optional
      !IV_HUIDENT_LOGHU type /SCWM/HUIDENT optional
      !IV_NOSAVE type BOOLE_D optional
      !IT_ITEM_QTY_LOGHU type /SCWM/T_DLV_DOCID_ITEM_QTY
      !IT_GR_PMAT_HU_UKC type /SCWM/TT_GR_PMAT_HU
    exporting
      !ES_HUHDR_LOGHU type /SCWM/S_HUHDR_INT
      !ET_HUHDR_GR_UKC type /SCWM/TT_HUHDR_INT
    exceptions
      ERROR .
  methods SET_REPACK_COLLECTIVE_HU
    importing
      !IV_REPACK type BOOLE_D .

  methods /SCWM/IF_PACK_BAS~CHANGE_HUHDR
    redefinition .
  methods /SCWM/IF_PACK_BAS~CHANGE_HUITM
    redefinition .
  methods /SCWM/IF_PACK_BAS~CHANGE_STATUS_FOR_ACTIVITY
    redefinition .
  methods /SCWM/IF_PACK_BAS~CREATE_HU
    redefinition .
  methods /SCWM/IF_PACK_BAS~DELETE_HU
    redefinition .
  methods /SCWM/IF_PACK_BAS~HU_IDENT_REMOVE
    redefinition .
  methods /SCWM/IF_PACK_BAS~HU_IDENT_SET
    redefinition .
  methods /SCWM/IF_PACK_BAS~MOVE_HU
    redefinition .
  methods /SCWM/IF_PACK_BAS~PACK_AUXMAT
    redefinition .
  methods /SCWM/IF_PACK_BAS~PACK_HU
    redefinition .
  methods /SCWM/IF_PACK_BAS~PACK_STOCK
    redefinition .
  methods /SCWM/IF_PACK_BAS~REPACK_STOCK
    redefinition .
  methods /SCWM/IF_PACK_BAS~SAVE
    redefinition .
  methods /SCWM/IF_PACK_BAS~STATUS_SET_DIRECT
    redefinition .
  methods /SCWM/IF_PACK_BAS~UNPACK_AUXMAT
    redefinition .
  methods /SCWM/IF_PACK_BAS~UNPACK_STOCK
    redefinition .
  methods /SCWM/IF_PACK_BAS~USER_STATUS_MAINTAIN
    redefinition .
  methods /SCWM/IF_PACK~PRINT_HU_LABEL
    redefinition .
  methods REFRESH_AND_INIT
    redefinition .
protected section.

  class-data GT_READ_DLV type GTYPE_T_READ_DLV .
  class-data GO_SINGLETON_DLV type ref to /SCWM/CL_DLV_PACK_IBDL .

  class-methods CHECK_CHANGABLE
    importing
      !IV_GUID_HU type /SCWM/GUID_HU
      !IV_DOCID type /SCWM/DE_DOCID optional
      !IV_ITMID type /SCWM/DE_ITMID optional
    exceptions
      ERROR
      NOT_CHANGABLE .
private section.

  class-data SV_BADI_PRCES_CHECK type CHAR1 .
  class-data GV_DR2PRD type CHAR1 .
  class-data GV_NO_QUAN_CHECK type CHAR1 .
  class-data GV_SET_AUM type BOOLE_D .
  class-data GS_REPACK_REQUEST type /SCWM/S_PACK_REQUEST .
  data GV_ALLOW_REPACK_COLLECTIVE_HU type BOOLE_D .

  methods PRCES_SET
    importing
      !IV_SOURCE type /SCWM/GUID_HU optional
      !IV_DEST type /SCWM/GUID_HU
      !IV_PRCES type /SCWM/DE_PRCES
      !IS_REQUEST type /SCWM/S_PACK_REQUEST optional .
  methods PRCES_GET
    importing
      !IV_SOURCE type /SCWM/GUID_HU
    exporting
      !EV_PRCES type /SCWM/DE_PRCES .
ENDCLASS.



CLASS ZCL_EWM_BASE_DLV_PACK_IBDL IMPLEMENTATION.


METHOD /SCWM/IF_PACK_BAS~CHANGE_HUHDR.

  DATA: ls_huhdr TYPE /scwm/s_huhdr_int,
        ls_guid_hu TYPE /scwm/s_guid_hu,
        lt_guid_hu TYPE /scwm/tt_guid_hu,
        lt_ordim_o TYPE /scwm/tt_ordim_o,
        lt_ordim_c TYPE /scwm/tt_ordim_c,
        lt_process TYPE /scwm/tt_tprcesa,
        ls_process TYPE /scwm/tprcesa,
        ls_step TYPE /scwm/s_tprocs,
        lt_huitm TYPE /scwm/tt_huitm_int,
        lo_bom   TYPE REF TO /scdl/cl_bo_management,
        lo_bo    TYPE REF TO /scdl/if_bo,
        lo_header TYPE REF TO /scdl/cl_dl_header,
        lv_docid TYPE /scwm/de_docid,
        lo_item  TYPE REF TO /scdl/cl_dl_item,
        ls_item_ext       TYPE /scwm/dlv_item_ext_common_str,
        ls_item_ext_1     TYPE /scwm/dlv_item_ext_common_str,
        ls_lagp           TYPE /scwm/lagp,
        ls_t331           TYPE /scwm/t331,
        ls_read_options_prd TYPE /scwm/dlv_query_contr_str,
        ls_include_data TYPE /scwm/dlv_query_incl_str_prd,
        lt_itm_prd  TYPE /scwm/dlv_item_out_prd_tab,
        ls_docid        TYPE /scwm/dlv_docid_item_str,
        lt_docid        TYPE /scwm/dlv_docid_item_tab,
        lo_msg_dlv TYPE REF TO /scwm/cl_dm_message_no,
        lo_prd_man      TYPE REF TO /scwm/cl_dlv_management_prd.

  FIELD-SYMBOLS: <huitm> TYPE /scwm/s_huitm_int,
                 <itm_prd> TYPE /scwm/dlv_item_out_prd_str.

  CREATE OBJECT lo_prd_man.

  CALL METHOD check_changable
    EXPORTING
      iv_guid_hu    = is_huhdr-guid_hu
    EXCEPTIONS
      error         = 1
      not_changable = 2
      OTHERS        = 3.
  IF sy-subrc <> 0.
    RAISE error.
  ENDIF.

  CALL FUNCTION '/SCWM/HU_READ'
    EXPORTING
      iv_guid_hu = is_huhdr-guid_hu
    IMPORTING
      es_huhdr   = ls_huhdr
      et_huitm   = lt_huitm
    EXCEPTIONS
      error      = 1
      OTHERS     = 2.
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
            WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4
            INTO gs_message.
    go_log->add_message( ).
    RAISE error.
  ENDIF.

  IF ls_huhdr-prces NE is_huhdr-prces AND
     NOT is_huhdr-prces IS INITIAL.
*   check open TOs.
    ls_guid_hu-guid_hu = ls_huhdr-guid_hu.
    APPEND ls_guid_hu TO lt_guid_hu.
    CALL FUNCTION '/SCWM/READ_TO_INT_DB'
      EXPORTING
        it_hus     = lt_guid_hu
        iv_lgnum   = gv_lgnum
      IMPORTING
        et_ordim_o = lt_ordim_o.
*        ET_ORDIM_C         = lt_ordim_c .
    IF NOT lt_ordim_o IS INITIAL.
      MESSAGE e131(/scwm/ui_packing) with ls_huhdr-huident INTO gs_message.
      go_log->add_message( ).
      RAISE error.
    ENDIF.
*   If the storage process has the step 'unloading' and in the
*   delivery the GI-bin is a staging-bin this dose not fit
*   together.
    CALL FUNCTION '/SCWM/TPRCESA_READ_SINGLE'
      EXPORTING
        iv_lgnum   = gv_lgnum
        iv_prces   = is_huhdr-prces
      IMPORTING
        et_tprcesa = lt_process
      EXCEPTIONS
        OTHERS     = 3.
    IF sy-subrc <> 0.
      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
            WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4 INTO gs_message.
      go_log->add_message( ).
      RAISE error.
    ENDIF.
    SORT lt_process BY seqnr.
    READ TABLE lt_process INTO ls_process INDEX 1.
    IF NOT ls_process IS INITIAL.
      CALL FUNCTION '/SCWM/TPROCS_READ_SINGLE'
        EXPORTING
          iv_procs  = ls_process-procs
        IMPORTING
          es_tprocs = ls_step
        EXCEPTIONS
          not_found = 1
          OTHERS    = 2.
      IF sy-subrc <> 0.
        MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
              WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4 INTO gs_message.
        go_log->add_message( ).
        RAISE error.
      ENDIF.
      IF ls_step-iproc = wmegc_iproc_unlo.
*     read the delivery.
        lo_bom = /scdl/cl_bo_management=>get_instance( ).
        SORT lt_huitm BY qdocid qitmid.
        DELETE ADJACENT DUPLICATES FROM lt_huitm COMPARING qdocid qitmid.
        loop at lt_huitm assigning <huitm> where vsi <> gchu_vsi_phm.
          IF <huitm>-qdocid NE lv_docid.
            lv_docid = <huitm>-qdocid.
            CLEAR lo_bo.
            lo_bo = lo_bom->get_bo_by_id( iv_docid = lv_docid ).
            IF NOT lo_bo IS INITIAL.
              lo_header = lo_bo->get_header( ).
            ELSE.
              CLEAR: lt_itm_prd, lt_docid.
              ls_read_options_prd-data_retrival_only = abap_true.
              ls_read_options_prd-mix_in_object_instances = abap_true.
              ls_include_data-item_product_ext = abap_true.
              ls_docid-docid = <huitm>-qdocid.
              APPEND ls_docid TO lt_docid.
              TRY.
                  CALL METHOD lo_prd_man->query
                    EXPORTING
                      iv_doccat       = <huitm>-qdoccat
                      it_docid        = lt_docid
                      is_read_options = ls_read_options_prd
                      is_include_data = ls_include_data
                    IMPORTING
                      et_items        = lt_itm_prd
                      eo_message      = lo_msg_dlv.
                  sort lt_itm_prd by itemid.
                CATCH /scdl/cx_delivery .
                  CALL FUNCTION '/SCWM/GET_MESSAGE_DLV_SP'
                    EXPORTING
                      io_dlvmsg = lo_msg_dlv
                    EXCEPTIONS
                      error     = 0
                      OTHERS    = 0.
                  MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
                       WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4 INTO gs_message.
                  go_log->add_message( ).
                  RAISE error.
              ENDTRY.
            ENDIF.
          ENDIF.
          IF NOT lo_bo IS INITIAL.
          lo_item = lo_bo->get_item( iv_itemid = <huitm>-qitmid ).
          ls_item_ext = /scwm/cl_dlv_field_det=>get_wm_extension(
                       io_header = lo_header io_item = lo_item ).
          ELSE.
            read table lt_itm_prd assigning <itm_prd> with key
                         itemid = <huitm>-qitmid
                         binary search.
            if sy-subrc is initial.
              move-corresponding <itm_prd>-sapext to ls_item_ext.
            else.
              message E049(/scwm/ui_packing) into gs_message.
              go_log->add_message( ).
              RAISE error.
            endif.
          ENDIF.
          IF ls_item_ext-/scwm/gmbin IS INITIAL.
            CONTINUE.
          ENDIF.
          CALL FUNCTION '/SCWM/LAGP_READ_SINGLE'
            EXPORTING
              iv_lgnum = gv_lgnum
              iv_lgpla = ls_item_ext-/scwm/gmbin
            IMPORTING
              es_lagp  = ls_lagp
            EXCEPTIONS
              OTHERS   = 4.
          IF sy-subrc <> 0.
            MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
               WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4 INTO gs_message.
            go_log->add_message( ).
            RAISE error.
          ENDIF.
          CALL FUNCTION '/SCWM/T331_READ_SINGLE'
            EXPORTING
              iv_lgnum  = gv_lgnum
              iv_lgtyp  = ls_lagp-lgtyp
            IMPORTING
              es_t331   = ls_t331
            EXCEPTIONS
              not_found = 1
              OTHERS    = 2.
          IF sy-subrc <> 0.
            MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
              WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4 INTO gs_message.
            go_log->add_message( ).
            RAISE error.
          ENDIF.
          IF ls_t331-st_role = wmegc_strole_stgarea.
            MESSAGE e132(/scwm/ui_packing) with ' ' INTO gs_message.
            go_log->add_message( ).
            RAISE error.
          ENDIF.
        ENDLOOP.
      ENDIF.
    ENDIF.
  ENDIF.


  CALL METHOD super->/scwm/if_pack_bas~change_huhdr
    EXPORTING
      is_huhdr = is_huhdr
      iv_check = iv_check
    IMPORTING
      es_huhdr = es_huhdr
    EXCEPTIONS
      error    = 1
      OTHERS   = 2.
  IF sy-subrc <> 0.
    RAISE error.
  ENDIF.
ENDMETHOD.


METHOD /SCWM/IF_PACK_BAS~CHANGE_HUITM.

  CALL METHOD check_changable
    EXPORTING
      iv_guid_hu    = is_huitm-guid_parent
    EXCEPTIONS
      error         = 1
      not_changable = 2
      OTHERS        = 3.
  IF sy-subrc <> 0.
    RAISe exception type /scwm/cx_basics.
  ENDIF.

  TRY.
      CALL METHOD super->/scwm/if_pack_bas~change_huitm
        EXPORTING
          is_huitm = is_huitm
        IMPORTING
          es_huitm = es_huitm.
    CATCH /scwm/cx_basics .
  ENDTRY.
ENDMETHOD.


METHOD /SCWM/IF_PACK_BAS~CHANGE_STATUS_FOR_ACTIVITY.

  CALL METHOD check_changable
    EXPORTING
      iv_guid_hu    = iv_hu
    EXCEPTIONS
      error         = 1
      not_changable = 2
      OTHERS        = 3.
  IF sy-subrc <> 0.
    RAISE not_possible.
  ENDIF.

  CALL METHOD super->/scwm/if_pack_bas~change_status_for_activity
    EXPORTING
      if_activity   = if_activity
      iv_hu         = iv_hu
      iv_check_only = iv_check_only
    EXCEPTIONS
      not_possible  = 1
      OTHERS        = 2.
  IF sy-subrc <> 0.
    RAISE not_possible.
  ENDIF.
ENDMETHOD.


METHOD /SCWM/IF_PACK_BAS~CREATE_HU.

  DATA: ls_huhdr_upd TYPE /scwm/s_huhdr_int.
  DATA: ls_symsg     TYPE symsg.

* If an event is triggered and afterwards a error-message
* is raised, this error message is not displayed =>
* raise- event at the end

  gv_no_event = abap_true.

  CALL METHOD super->/scwm/if_pack_bas~create_hu
    EXPORTING
      iv_pmat      = iv_pmat
      iv_huident   = iv_huident
      is_hu_create = is_hu_create
      iv_nohuident = iv_nohuident
      i_location   = i_location
      iv_loghu     = iv_loghu
    RECEIVING
      es_huhdr     = es_huhdr
    EXCEPTIONS
      error        = 1
      OTHERS       = 2.
  IF sy-subrc <> 0.
    gv_no_event = abap_false.
    RAISE error.
  ENDIF.

* reference to logical HU.
  IF NOT iv_loghu IS INITIAL.
    CALL METHOD /scwm/cl_pack_help=>update_logical_physical_create
      EXPORTING
        io_model      = me
        iv_log_hu     = iv_loghu
      IMPORTING
        es_huhdr_upd  = ls_huhdr_upd
      CHANGING
        cs_huhdr_phys = es_huhdr
      EXCEPTIONS
        error         = 1
        OTHERS        = 2.
    IF sy-subrc <> 0.
      MOVE-CORRESPONDING sy TO ls_symsg.
* delete the created HU
      /scwm/cl_pack_help=>gv_check_pack_logphys = abap_false.
      CALL METHOD delete_hu
        EXPORTING
          iv_hu  = es_huhdr-guid_hu
        EXCEPTIONS
          error  = 1
          OTHERS = 2.
      IF sy-subrc <> 0.
        MESSAGE ID sy-msgid TYPE 'A' NUMBER sy-msgno
                   WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
      ENDIF.
      /scwm/cl_pack_help=>gv_check_pack_logphys = abap_true.
      gv_no_event = abap_false.
      CLEAR es_huhdr.
      MOVE-CORRESPONDING ls_symsg TO sy.
      RAISE error.
    ENDIF.
  ENDIF.

  gv_no_event = abap_false.
  RAISE EVENT hu_created    EXPORTING huhdr = es_huhdr.
  IF NOT ls_huhdr_upd IS INITIAL.
    RAISE EVENT huhdr_changed EXPORTING huhdr = ls_huhdr_upd.
  ENDIF.

ENDMETHOD.


METHOD /SCWM/IF_PACK_BAS~DELETE_HU.

  DATA: ls_hu_coll   TYPE /scwm/s_huhdr_int,
        ls_guid_hu   TYPE /scwm/s_guid_hu.

  DATA: lt_hu_ukcon  TYPE /scwm/tt_guid_hu.

  CALL METHOD /scwm/cl_pack_help=>update_log_phys_upd_det
    EXPORTING
      io_model    = me
      iv_guid_hu  = iv_hu
    IMPORTING
      es_hu_coll  = ls_hu_coll
      et_hu_ukcon = lt_hu_ukcon
    EXCEPTIONS
      error       = 1
      OTHERS      = 2.
  IF sy-subrc <> 0.
    RAISE error.
  ENDIF.

  CALL METHOD super->/scwm/if_pack_bas~delete_hu
    EXPORTING
      iv_hu  = iv_hu
    EXCEPTIONS
      error  = 1
      OTHERS = 2.
  IF sy-subrc <> 0.
    RAISE error.
  ENDIF.

  DATA: lv_check_pack_logphys TYPE boole_d.
  lv_check_pack_logphys = /scwm/cl_pack_help=>gv_check_pack_logphys.

  /scwm/cl_pack_help=>gv_check_pack_logphys = abap_false.
  CALL METHOD /scwm/cl_pack_help=>update_log_phys_upd_exec
    EXPORTING
      io_model    = me
      is_hu_coll  = ls_hu_coll
      it_hu_ukcon = lt_hu_ukcon
    EXCEPTIONS
      error       = 1
      OTHERS      = 2.
  IF sy-subrc <> 0.
    /scwm/cl_pack_help=>gv_check_pack_logphys = abap_true.
    RAISE error.
  ENDIF.

* It could be possible that the caller already has set the flag
* to abap_false. Then it must be reset to that value.
  /scwm/cl_pack_help=>gv_check_pack_logphys =
    lv_check_pack_logphys.

ENDMETHOD.


METHOD /SCWM/IF_PACK_BAS~HU_IDENT_REMOVE.

  CALL METHOD check_changable
    EXPORTING
      iv_guid_hu    = iv_guid_hu
    EXCEPTIONS
      error         = 1
      not_changable = 2
      OTHERS        = 3.
  IF sy-subrc <> 0.
    RAISE error.
  ENDIF.

  CALL METHOD super->/scwm/if_pack_bas~hu_ident_remove
    EXPORTING
      iv_guid_hu = iv_guid_hu
      iv_idart   = iv_idart
    EXCEPTIONS
      error      = 1
      OTHERS     = 2.
  IF sy-subrc <> 0.
    RAISE error.
  ENDIF.
ENDMETHOD.


METHOD /SCWM/IF_PACK_BAS~HU_IDENT_SET.

  CALL METHOD check_changable
    EXPORTING
      iv_guid_hu    = iv_guid_hu
    EXCEPTIONS
      error         = 1
      not_changable = 2
      OTHERS        = 3.
  IF sy-subrc <> 0.
    RAISE error.
  ENDIF.

  CALL METHOD super->/scwm/if_pack_bas~hu_ident_set
    EXPORTING
      iv_guid_hu = iv_guid_hu
      iv_huident = iv_huident
      iv_idart   = iv_idart
    EXCEPTIONS
      error      = 1
      OTHERS     = 2.
  IF sy-subrc <> 0.
    RAISE error.
  ENDIF.

ENDMETHOD.


METHOD /SCWM/IF_PACK_BAS~MOVE_HU.
  DATA: ls_huhdr_top  TYPE /scwm/s_huhdr_int,
        ls_huhdr_move TYPE /scwm/s_huhdr_int.

  CALL FUNCTION '/SCWM/HU_READ'
    EXPORTING
      iv_top             = 'X'
      iv_guid_hu         = iv_hu
    IMPORTING
      es_huhdr           = ls_huhdr_top
*     ET_HUHDR           =
    EXCEPTIONS
      error              = 1
      OTHERS             = 2
            .
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
           WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4
           INTO gs_message.
    go_log->add_message( ).
    RAISE error.
  ENDIF.

  CALL METHOD super->/scwm/if_pack_bas~move_hu
    EXPORTING
      iv_hu  = iv_hu
      iv_bin = iv_bin
    EXCEPTIONS
      error  = 1
      OTHERS = 2.
  IF sy-subrc <> 0.
    RAISE error.
  ENDIF.

  CALL FUNCTION '/SCWM/HUHEADER_READ'
    EXPORTING
      iv_guid_hu  = iv_hu
    IMPORTING
      es_huheader = ls_huhdr_move
    EXCEPTIONS
      not_found   = 1
      input       = 2
      error       = 3
      OTHERS      = 4.
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
           WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4
           INTO gs_message.
    go_log->add_message( ).
    RAISE error.
  ENDIF.

  IF NOT ls_huhdr_top-prces IS INITIAL.
    ls_huhdr_move-prces = ls_huhdr_top-prces.
    CALL METHOD change_huhdr
      EXPORTING
        is_huhdr = ls_huhdr_move
      EXCEPTIONS
        error    = 1.
    IF NOT sy-subrc IS INITIAL.
      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
             WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4
             INTO gs_message.
      go_log->add_message( ).
      RAISE error.
    ENDIF.
  ENDIF.
ENDMETHOD.


METHOD /SCWM/IF_PACK_BAS~PACK_AUXMAT.

  CALL METHOD check_changable
    EXPORTING
      iv_guid_hu    = iv_dest_hu
    EXCEPTIONS
      error         = 1
      not_changable = 2
      OTHERS        = 3.
  IF sy-subrc <> 0.
    RAISE error.
  ENDIF.


  CALL METHOD super->/scwm/if_pack_bas~pack_auxmat
    EXPORTING
      iv_dest_hu  = iv_dest_hu
      is_material = is_material
      is_quantity = is_quantity
      iv_matid    = iv_matid
    IMPORTING
      es_quantity = es_quantity
    exceptions
      error       = 1
      OTHERS      = 2.
  IF sy-subrc <> 0.
    RAISE error.
  ENDIF.
ENDMETHOD.


METHOD /SCWM/IF_PACK_BAS~PACK_HU.
  DATA: lv_prces TYPE /scwm/de_prces,
        lv_allowed TYPE boole_d.

  CALL METHOD check_changable
    EXPORTING
      iv_guid_hu    = iv_source_hu
    EXCEPTIONS
      error         = 1
      not_changable = 2
      OTHERS        = 3.
  IF sy-subrc <> 0.
    RAISE error.
  ENDIF.

  CALL METHOD check_changable
    EXPORTING
      iv_guid_hu    = iv_dest_hu
    EXCEPTIONS
      error         = 1
      not_changable = 2
      OTHERS        = 3.
  IF sy-subrc <> 0.
    RAISE error.
  ENDIF.

* check for doors. It is not allowed to have delivery items with
* different doors in on HU lHierarchy. This check only im online.
* During activation of IDN this must work.

  IF gv_online = abap_true.
    TRY.
        CALL METHOD /scwm/cl_dlv_prd2hum=>check_door_gmbin_for_pack_hu
          EXPORTING
            iv_guid_hu_source = iv_source_hu
            iv_guid_hu_dest   = iv_dest_hu
            iv_lgnum          = gv_lgnum
          IMPORTING
            ev_pack_allowed   = lv_allowed.
      CATCH /scwm/cx_core .
        MESSAGE e119(/scwm/ui_packing) INTO gs_message.
        go_log->add_message( ).
        RAISE error.
    ENDTRY.
    IF lv_allowed = abap_false.
      MESSAGE e118(/scwm/ui_packing) INTO gs_message.
      go_log->add_message( ).
      RAISE error.
    ENDIF.
  ENDIF.

  prces_get( EXPORTING iv_source = iv_source_hu
             IMPORTING ev_prces  = lv_prces ).

  CALL METHOD /scwm/cl_pack_help=>check_pack_logphys
     EXPORTING
       iv_source_hu = iv_source_hu
       iv_dest_hu   = iv_dest_hu
     EXCEPTIONS
       error        = 1
       others       = 2 .
  IF sy-subrc <> 0.
    raise error.
  ENDIF.

  CALL METHOD super->/scwm/if_pack_bas~pack_hu
    EXPORTING
      iv_source_hu = iv_source_hu
      iv_dest_hu   = iv_dest_hu
    EXCEPTIONS
      error        = 1
      OTHERS       = 2.
  IF sy-subrc <> 0.
    RAISE error.
  ENDIF.

  CHECK NOT lv_prces IS INITIAL.
  prces_set( EXPORTING iv_source = iv_source_hu
                       iv_dest   = iv_dest_hu
                       iv_prces  = lv_prces ).

ENDMETHOD.


METHOD /SCWM/IF_PACK_BAS~PACK_STOCK.

  DATA: ls_request    TYPE /scwm/s_pack_request,
        ls_result     TYPE /scwm/s_pack_result,
        ls_itmp       TYPE /scwm/dlv_hu_prd_str,
        ls_quan       TYPE /scwm/s_quan,
        lv_itmp_tabix TYPE sytabix,
        lv_quanh      TYPE /scwm/de_quantity,
        ls_t333       TYPE /scwm/t333,
        lt_ordim_o    TYPE /scwm/tt_ordim_o,
        ls_serid      TYPE /scwm/s_serid,
        ls_serial     TYPE /scwm/s_seri_int,
        lt_serial     TYPE /scwm/tt_seri_int,
        lv_allowed    TYPE boole_d,
        lv_lines      TYPE sytabix,
        ls_quan_ser   TYPE /scwm/s_quan,
        lv_number     TYPE i,
        ls_doc        TYPE /scwm/s_docid_itmid,
        ls_serkey     TYPE /scwm/s_seri_key,
        lt_serkey     TYPE /scwm/tt_seri_key,
        ls_huhdr      TYPE /scwm/s_huhdr_int,
        lv_open_to    TYPE boole_d,
        lo_man_prd    TYPE REF TO /scwm/cl_dlv_management_prd,
        lv_lgnum      TYPE /scwm/lgnum,
        lv_char40     TYPE char40,
        lv_altuom     TYPE /scwm/de_unit,
        ls_product    TYPE /scdl/dl_product_str,
        ls_t331       TYPE /scwm/t331.
  DATA: lv_batch_required TYPE /scdl/af_batch_required,
        lv_docbatch       TYPE /scwm/de_dbatchind,
        lv_split_val      TYPE boole_d.

  DATA:
    lt_addmeas    TYPE  /scdl/dl_addmeas_tab,
    ls_addmeas    TYPE  /scdl/dl_addmeas_str,
    lv_chk_cwquan LIKE  ls_request-cwquan,
    lv_chk_quan   LIKE  ls_quan-quan.

  DATA: ls_docid_itemid TYPE /scwm/dlv_docid_item_str,
        lt_docid_itemid TYPE /scwm/dlv_docid_item_tab.

  DATA: ls_qiot4wm TYPE  /scwm/qiotwm,
        lv_error   TYPE abap_bool.

  DATA: lv_hu_wt_exists   TYPE abap_bool,
        ls_dest_huhdr   TYPE /scwm/s_huhdr_int,
        lo_item         TYPE REF TO /scdl/cl_dl_item_prd,
        ls_item_eew     TYPE /scdl/incl_eew_dlv_item_str.


  FIELD-SYMBOLS: <ordim_o> TYPE /scwm/ordim_o.

  IF is_quantity-quan IS INITIAL.
    RETURN.
  ENDIF.

  CALL METHOD check_changable
    EXPORTING
      iv_guid_hu    = iv_dest_hu
      iv_docid      = is_material-qdocid
      iv_itmid      = is_material-qitmid
    EXCEPTIONS
      error         = 1
      not_changable = 2
      OTHERS        = 3.
  IF sy-subrc <> 0.
    RAISE error.
  ENDIF.

* check for doors. It is not allowed to have delivery items with
* different doors in on HU lHierarchy. This check only im online.
* During activation of IDN this must work.

  IF gv_online = abap_true.
    TRY.
        CALL METHOD /scwm/cl_dlv_prd2hum=>check_door_gmbin_for_pack_prod
          EXPORTING
            iv_guid_hu_dest = iv_dest_hu
            iv_lgnum        = gv_lgnum
            iv_docid        = is_material-qdocid
            iv_itemid       = is_material-qitmid
          IMPORTING
            ev_pack_allowed = lv_allowed.
      CATCH /scwm/cx_core .
        MESSAGE e118(/scwm/ui_packing) INTO gs_message.
        go_log->add_message( ).
        RAISE error.
    ENDTRY.
    IF lv_allowed = abap_false.
      MESSAGE e118(/scwm/ui_packing) INTO gs_message.
      go_log->add_message( ).
      RAISE error.
    ENDIF.
  ENDIF.

  CALL METHOD /scwm/cl_hu_packing=>check_plan_hu
    EXPORTING
      iv_hu      = iv_dest_hu
    EXCEPTIONS
      error      = 1
      no_plan_hu = 2
      OTHERS     = 3.
  IF sy-subrc <> 0.
    RAISE error.
  ENDIF.

* find correct item
  READ TABLE gt_itmp INTO ls_itmp WITH KEY
                     stock-qdocid = is_material-qdocid
                     stock-qitmid = is_material-qitmid.
  ASSERT ID /scwm/ui_packing CONDITION sy-subrc = 0.
  IF sy-subrc IS NOT INITIAL.
    MESSAGE e040(/scwm/hu_wm) INTO gs_message.
    go_log->add_message( ).
    RAISE error.
  ENDIF.
  lv_itmp_tabix = sy-tabix.

* correct Warehouse-number?
  CALL METHOD /scwm/cl_dlv_management_prd=>get_instance
    RECEIVING
      eo_instance = lo_man_prd.
  CALL METHOD lo_man_prd->get_warehouse
    EXPORTING
      iv_doccat = /scdl/if_dl_doc_c=>sc_doccat_inb_prd
      iv_docid  = is_material-qdocid
    IMPORTING
      ev_whno   = lv_lgnum.
  IF lv_lgnum <> gv_lgnum.
    WRITE ls_itmp-prd_no TO lv_char40 NO-ZERO.
    MESSAGE e169(/scwm/ui_packing) WITH
            lv_char40 lv_lgnum INTO gs_message.
    go_log->add_message( ).
    RAISE error.
  ENDIF.

* Batch related check
  CALL METHOD /scwm/cl_dlv_batch_internal=>prod_get_batch_req
    EXPORTING
      iv_productid      = ls_itmp-stock-matid
      iv_lgnum          = lv_lgnum
      iv_entitled       = ls_itmp-stock-entitled
    IMPORTING
      ev_batch_required = lv_batch_required
      ev_docbatch       = lv_docbatch
      ev_split_val      = lv_split_val.

  IF lv_batch_required = abap_false AND lv_split_val = abap_false.
    IF ls_itmp-batchno IS NOT INITIAL AND lv_docbatch = abap_false. "batch provided but the product is not batch managed
      ls_product = ls_itmp-item->get_product( ).
      MESSAGE e002(/scwm/dlv_batch)
        WITH ls_product-productno INTO gs_message.
      go_log->add_message( ).
      RAISE error.
    ENDIF.
  ELSEIF lv_docbatch = abap_false.
    IF ls_itmp-batchno IS INITIAL.
      "lv_batch_required = 'X' but no batch provided
      ls_product = ls_itmp-item->get_product( ).
      MESSAGE e206(/scwm/dlv_batch)
        WITH ls_product-productno INTO gs_message.
      go_log->add_message( ).
      RAISE error.
    ELSEIF ls_itmp-stock-batchid IS INITIAL. "batch provided but does not exist in EWM
      ls_product = ls_itmp-item->get_product( ).
      MESSAGE e101(/scwm/dlv_batch)
        WITH ls_itmp-batchno ls_product-productno INTO gs_message.
      go_log->add_message( ).
      RAISE error.
    ENDIF.
  ENDIF.

  IF gv_online = abap_true.
* check GR control by QM settings
* if goods receipt is not allowed, it should also not be
* possible to pack
    CLEAR: lv_error, ls_qiot4wm, lt_docid_itemid.

    CALL METHOD /scwm/cl_qcust_sel=>qiot4wm_get
      EXPORTING
        iv_lgnum   = lv_lgnum
      IMPORTING
        es_qiot4wm = ls_qiot4wm.


    IF ls_qiot4wm-enabled  = abap_true AND
       ls_qiot4wm-gr_cntrl = abap_true.

      ls_docid_itemid-doccat = ls_itmp-doccat_prd.
      ls_docid_itemid-docid  = ls_itmp-prd_id.
      ls_docid_itemid-itemid = ls_itmp-item_id.
      APPEND ls_docid_itemid TO lt_docid_itemid.

*     Check QM CR Control
      CALL METHOD /scwm/cl_qgr_control=>check_mass
        EXPORTING
          iv_lgnum      = lv_lgnum
          it_dlvi_key   = lt_docid_itemid
          iv_action_prd = 'PACK'
          io_log        = go_log
        IMPORTING
          ev_error      = lv_error.
      IF lv_error = abap_true.
        RAISE error.
      ENDIF.
    ENDIF.
  ENDIF.

* determine uom and quantity
  ls_quan-unit =  ls_itmp-req_qty-uom.
  IF is_quantity-unit NE ls_itmp-req_qty-uom.
    TRY.
        CALL FUNCTION '/SCWM/MATERIAL_QUAN_CONVERT'
          EXPORTING
            iv_matid     = ls_itmp-stock-matid
            iv_quan      = is_quantity-quan
            iv_unit_from = is_quantity-unit
            iv_unit_to   = ls_itmp-req_qty-uom
            iv_batchid   = ls_itmp-stock-batchid
          IMPORTING
            ev_quan      = ls_quan-quan.

      CATCH /scwm/cx_md.
*       MDL Interface Error -> FM issues a message
        go_log->add_message( ).
        RAISE error.
    ENDTRY.

  ELSE.
    ls_quan-quan = is_quantity-quan.
  ENDIF.
* verify open quantity
  lv_chk_quan = ls_quan-quan - ls_itmp-open_qty-qty.
  IF ( /qos/cl_qty_aux=>round_qty( lv_chk_quan ) > 0 ) AND
       gv_no_quan_check IS INITIAL.
    MESSAGE e037(/scwm/ui_packing) INTO gs_message.
    go_log->add_message( ).
    RAISE error.
  ENDIF.

* check if open TOs exist
* if the source-HU of a TO is a bin-dummy this
* TO is relevant for unpacked items.
  IF NOT ls_itmp-to_exist IS INITIAL.
    CALL FUNCTION '/SCWM/TO_READ_WHR'
      EXPORTING
        iv_lgnum     = gv_lgnum
        iv_rdocid    = is_material-qdocid
        iv_ritmid    = is_material-qitmid
      IMPORTING
        et_ordim_o   = lt_ordim_o
      EXCEPTIONS
        wrong_input  = 1
        not_found    = 2
        foreign_lock = 3
        error        = 4
        OTHERS       = 5.
    IF sy-subrc <> 0.
      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
              WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4
              INTO gs_message.
      go_log->add_message( ).
    ENDIF.
    LOOP AT lt_ordim_o ASSIGNING <ordim_o> WHERE
            NOT gr_open IS INITIAL.
* open TOs of unpacked, not posted product have in sguid_hu
* a storage-bin-dummy.
      IF <ordim_o>-sguid_hu IS INITIAL.
        CONTINUE.
      ENDIF.
      CALL FUNCTION '/SCWM/HUHEADER_READ'
        EXPORTING
          iv_guid_hu  = <ordim_o>-sguid_hu
        IMPORTING
          es_huheader = ls_huhdr
        EXCEPTIONS
          not_found   = 1
          input       = 2
          error       = 3
          OTHERS      = 4.
      IF sy-subrc <> 0.
        CONTINUE.
      ENDIF.
*      IF ls_huhdr-vhi = wmegc_vhi_dummy.
*        lv_open_to = abap_true.
*        EXIT.                                           "#EC CI_NOORDER
*      ENDIF.
    ENDLOOP.
    IF lv_open_to = abap_true.
      MESSAGE e064(/scwm/ui_packing) INTO gs_message.
      go_log->add_message( ).
      RAISE error.
    ENDIF.
  ENDIF.

  CALL FUNCTION '/SCWM/CHECK_OPEN_TO'
    EXPORTING
      IV_HU                  = iv_dest_hu
      IV_LGNUM               = gv_lgnum
      IV_ONLY_TOP_HU         = abap_true
    IMPORTING
      EV_EXIST               = lv_hu_wt_exists
    EXCEPTIONS
      ERROR                  = 1
      OTHERS                 = 2.
  IF sy-subrc <> 0.
      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
              WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4
              INTO gs_message.
      go_log->add_message( ).
      RAISE error.
  ELSEIF NOT lv_hu_wt_exists IS INITIAL.
    CALL FUNCTION '/SCWM/HU_READ'
      EXPORTING
        IV_GUID_HU         = iv_dest_hu
        IV_TOP             = abap_true
      IMPORTING
        ES_HUHDR           = ls_dest_huhdr
      EXCEPTIONS
        OTHERS             = 1.
    MESSAGE e131(/scwm/ui_packing)
      WITH ls_dest_huhdr-huident INTO gs_message.
    go_log->add_message( ).
    RAISE error.
  ENDIF.

* prepare IS_REQUEST
  MOVE-CORRESPONDING is_quantity TO ls_request.
  MOVE-CORRESPONDING ls_itmp-stock TO ls_request.
  lo_item ?= ls_itmp-item.
  IF  lo_item IS BOUND.
    ls_item_eew = lo_item->get_eew( ).
    MOVE-CORRESPONDING ls_item_eew TO ls_request-cust.
  ENDIF.
  IF NOT is_material-idplate IS INITIAL.
    ls_request-idplate = is_material-idplate.
  ENDIF.
  ls_request-lgnum = gv_lgnum.
  ls_request-dguid_hu = iv_dest_hu.
  ls_request-qdocid = ls_itmp-prd_id.
  ls_request-vsi = gchu_vsi_plan.
  ls_request-dguid_hu = iv_dest_hu.
  IF ls_itmp-procty IS INITIAL.
    MESSAGE e066(/scwm/ui_packing) INTO gs_message.
    go_log->add_message( ).
    RAISE error.
  ENDIF.
  IF ls_itmp-procty IS NOT INITIAL.
    CALL FUNCTION '/SCWM/T333_READ_SINGLE'
      EXPORTING
        iv_lgnum  = gv_lgnum
        iv_procty = ls_itmp-procty
      IMPORTING
        es_t333   = ls_t333
      EXCEPTIONS
        OTHERS    = 99.
    IF sy-subrc <> 0.
      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
              WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4
     INTO gs_message.
      go_log->add_message( ).
      RAISE error.
    ENDIF.
    ls_request-prces = ls_t333-prces.
  ENDIF.

  ls_request-serid = it_serid.
  IF NOT ls_itmp-sn_stock IS INITIAL.
    TRY.
        CALL METHOD /scwm/cl_serial=>get_ser_quantity
          EXPORTING
            iv_lgnum = gv_lgnum
            iv_matid = ls_request-matid
            is_quan  = ls_quan
          IMPORTING
            es_quan  = ls_quan_ser.
      CATCH /scwm/cx_serial.
        RAISE error.
    ENDTRY.
  ENDIF.

* if the complete remaining quantity is packed and no
* SNs have been passed by the user take the free serial
* numbers
  IF ls_request-serid IS INITIAL AND
      NOT ls_itmp-sn_stock IS INITIAL AND
      ls_quan-quan = ls_itmp-open_qty-qty AND
      NOT gv_pack_free_sn IS INITIAL.
    TRY.
        CALL METHOD /scwm/cl_serial=>get_sn_for_object
          EXPORTING
            iv_lgnum = gv_lgnum
            iv_docid = ls_itmp-prd_id
            iv_itmid = ls_itmp-item_id
          IMPORTING
            et_seri  = lt_serial.
      CATCH /scwm/cx_serial .
        MESSAGE e049(/scwm/ui_packing) INTO
        gs_message.
        go_log->add_message( ).
        RAISE error.
    ENDTRY.
    DELETE lt_serial WHERE NOT guid_parent IS INITIAL.  "#EC CI_SORTSEQ
    DESCRIBE TABLE lt_serial LINES lv_lines.
    IF lv_lines <= ls_quan_ser-quan.
      LOOP AT lt_serial INTO ls_serial.                 "#EC CI_SORTSEQ
        ls_serid-serid = ls_serial-serid.
        INSERT ls_serid INTO TABLE ls_request-serid.
      ENDLOOP.
    ENDIF.
  ENDIF.
* add dummy-serial numbers
  IF ls_itmp-sn_stock = wmegc_serial_bin.
    DESCRIBE TABLE ls_request-serid LINES lv_lines.
    lv_number = ls_quan_ser-quan - lv_lines.
    IF lv_number > 0.
      ls_doc-doccat = ls_request-qdoccat.
      ls_doc-docid  = ls_request-qdocid.
      ls_doc-itmid  = ls_request-qitmid.
      TRY.
          CALL METHOD /scwm/cl_serial=>create_temp_sn
            EXPORTING
              iv_lgnum    = gv_lgnum
              iv_matid    = ls_request-matid
              is_doc      = ls_doc
              iv_number   = lv_number
              iv_no_check = abap_true
            IMPORTING
              et_keys     = lt_serkey.
        CATCH /scwm/cx_serial .
          RAISE error.
      ENDTRY.
      LOOP AT lt_serkey INTO ls_serkey.
        ls_serid-serid = ls_serkey-serid.
        INSERT ls_serid INTO TABLE ls_request-serid.
      ENDLOOP.
    ENDIF.
  ENDIF.

* In the next release we must try to call the super-method again
* This is not possible with this interface
* call central packing function module
  ls_request-cwexact = iv_cwexact.
  IF is_valuation-quan IS INITIAL.
    IF NOT ls_itmp-cwunit IS INITIAL
      AND NOT ls_itmp-valq_cfac IS INITIAL.
      ls_request-cwunit = ls_itmp-cwunit.

      lv_chk_cwquan = ls_quan-quan * ls_itmp-valq_cfac.
      lv_chk_cwquan = /qos/cl_qty_aux=>round_qty( lv_chk_cwquan ).

      lt_addmeas = ls_itmp-item->get_addmeas(
                    iv_nodynamic    = abap_false
                    iv_qty_role     = /scdl/if_dl_addmeas_c=>sc_qtyrole_valq
                    iv_qty_category = /scdl/if_dl_addmeas_c=>sc_qtycat_alternate ).
      READ TABLE lt_addmeas INDEX 1 INTO ls_addmeas.

      IF ls_addmeas-qty_meas_type = wmegc_cwexact_yes AND
          ls_itmp-cwquan = lv_chk_cwquan.
        ls_request-cwexact = wmegc_cwexact_yes.
      ELSE.
        ls_request-cwexact = wmegc_cwexact_no.
      ENDIF.
      ls_request-cwquan = lv_chk_cwquan.
    ENDIF.
  ELSE.
    ls_request-cwquan = is_valuation-quan.
    ls_request-cwunit = is_valuation-unit.
    IF iv_cwexact IS INITIAL.
      ls_request-cwexact = wmegc_cwexact_no.
    ENDIF.
  ENDIF.

  IF gv_allow_repack_collective_hu = abap_false.
    CALL METHOD /scwm/cl_pack_help=>check_pack_logphys
      EXPORTING
        iv_dest_hu = iv_dest_hu
      EXCEPTIONS
        error      = 1
        OTHERS     = 2.
    IF sy-subrc <> 0.
      RAISE error.
    ENDIF.
  ENDIF.

  IF gv_repack IS NOT INITIAL AND ls_request-vfdat IS INITIAL.
    ls_request-vfdat = gs_repack_request-vfdat. "restore Shelf Life Expiration Date
    CLEAR gs_repack_request.
  ENDIF.

  CALL METHOD call_pack_unpack
    EXPORTING
      is_request = ls_request
    IMPORTING
      es_result  = ls_result
    EXCEPTIONS
      OTHERS     = 99.
  IF sy-subrc <> 0.
    MOVE-CORRESPONDING ls_result TO es_quantity.
    RAISE error.
  ENDIF.
  MOVE-CORRESPONDING ls_result TO es_quantity.

  IF NOT gv_repack IS INITIAL.
*   gv_repack means:
*   a item is unpacked and almost the same item is packed again
*   This is done to write a inspection lot-id into the item.
*   ( method /SCWM/CL_DLV_PRD2HUM->UPDATE_HU_PLAN_PDI )
    ls_request-prces = gv_prces_repack.
  ENDIF.
  IF NOT ls_request-prces IS INITIAL.
    prces_set( EXPORTING iv_dest = ls_request-dguid_hu
                         iv_prces = ls_request-prces
                         is_request = ls_request ).
  ENDIF.

  IF es_quantity-unit NE ls_itmp-req_qty-uom.
    TRY.
        CALL FUNCTION '/SCWM/MATERIAL_QUAN_CONVERT'
          EXPORTING
            iv_matid     = ls_itmp-stock-matid
            iv_quan      = es_quantity-quan
            iv_unit_from = es_quantity-unit
            iv_unit_to   = ls_itmp-req_qty-uom
            iv_batchid   = ls_itmp-stock-batchid
          IMPORTING
            ev_quan      = ls_quan-quan.

      CATCH /scwm/cx_md.
*       MDL Interface Error -> FM issues a message
        go_log->add_message( ).
        RAISE error.
    ENDTRY.

  ELSE.
    ls_quan-quan = es_quantity-quan.
  ENDIF.

  ls_itmp-packed_qty-qty = ls_itmp-packed_qty-qty + ls_quan-quan.
  ls_itmp-open_qty-qty = ls_itmp-open_qty-qty - ls_quan-quan.

  IF ls_itmp-req_qty-uom NE ls_itmp-req_qty_alt-uom.
    TRY.
        CALL FUNCTION '/SCWM/MATERIAL_QUAN_CONVERT'
          EXPORTING
            iv_matid     = ls_itmp-stock-matid
            iv_quan      = ls_itmp-open_qty-qty
            iv_unit_from = ls_itmp-open_qty-uom
            iv_unit_to   = ls_itmp-open_qty_alt-uom
            iv_batchid   = ls_itmp-stock-batchid
          IMPORTING
            ev_quan      = ls_itmp-open_qty_alt-qty.

        CALL FUNCTION '/SCWM/MATERIAL_QUAN_CONVERT'
          EXPORTING
            iv_matid     = ls_itmp-stock-matid
            iv_quan      = ls_itmp-packed_qty-qty
            iv_unit_from = ls_itmp-packed_qty-uom
            iv_unit_to   = ls_itmp-packed_qty_alt-uom
            iv_batchid   = ls_itmp-stock-batchid
          IMPORTING
            ev_quan      = ls_itmp-packed_qty_alt-qty.
      CATCH /scwm/cx_md.
        go_log->add_message( ).
        RAISE error.
    ENDTRY.
  ELSE.
    ls_itmp-open_qty_alt-qty = ls_itmp-open_qty-qty.
    ls_itmp-packed_qty_alt-qty = ls_itmp-packed_qty-qty.
  ENDIF.
  ls_itmp-cwquan = ls_itmp-valq_cfac *
                   ls_itmp-open_qty-qty.

  DATA: ls_huitm TYPE /scwm/s_huitm_int.
  lv_altuom = iv_altuom.
  IF gv_set_aum = abap_true.
    lv_altuom = ls_itmp-req_qty_alt-uom.
  ENDIF.
  IF NOT lv_altuom IS INITIAL.
*     AND lv_altuom NE is_quantity-unit. "This is wrong: you can have a HU in a certain UoM on the DB and want to pack a qty in another UoM and change the HU to this other UoM
    CALL FUNCTION '/SCWM/HUITM_READ'
      EXPORTING
        iv_guid_hu    = ls_result-dguid_hu
        iv_guid_stock = ls_result-guid_stock
      IMPORTING
        es_huitm      = ls_huitm
      EXCEPTIONS
        no_item       = 1
        OTHERS        = 2.
    IF sy-subrc <> 0.
      go_log->add_message( ).
      RAISE error.
    ENDIF.

    ls_huitm-altme = lv_altuom.
    TRY.
        CALL FUNCTION '/SCWM/MATERIAL_QUAN_CONVERT'
          EXPORTING
            iv_matid     = ls_itmp-stock-matid
            iv_quan      = ls_huitm-quan
            iv_unit_from = ls_huitm-meins
            iv_unit_to   = ls_huitm-altme
            iv_batchid   = ls_itmp-stock-batchid
          IMPORTING
            ev_quan      = ls_huitm-quana.

      CATCH /scwm/cx_md.
*       MDL Interface Error -> FM issues a message
        go_log->add_message( ).
        RAISE error.
    ENDTRY.


*   recalculate quan capa based on ALTME
    TRY.
        CALL FUNCTION '/SCWM/STOCK_CAPA'
          EXPORTING
            iv_hu   = ls_result-dguid_hu
            is_t331 = ls_t331 "dummy
          CHANGING
            cs_quan = ls_huitm.
      CATCH /scwm/cx_core.
        go_log->add_message( ).
        RAISE error.
    ENDTRY.

    CALL FUNCTION '/SCWM/HUITM_INT_UPDATE'
      EXPORTING
        iv_updkz       = 'M'
        is_huitm       = ls_huitm
      EXCEPTIONS
        vepo_not_found = 1
        error          = 2
        OTHERS         = 3.
    IF sy-subrc <> 0.
      go_log->add_message( ).
      RAISE error.
    ENDIF.
  ENDIF.

  MODIFY gt_itmp FROM ls_itmp INDEX lv_itmp_tabix.
* success, inform interested listener
  gv_changed = 'X'.
  RAISE EVENT stock_packed
    EXPORTING
      hu         = iv_dest_hu
      stock0      = ls_result-guid_stock0
      quan       = es_quantity
      stock_dest = ls_result-guid_stock.

ENDMETHOD.


METHOD /SCWM/IF_PACK_BAS~REPACK_STOCK.
  DATA: ls_huitm TYPE /scwm/s_huitm_int,
        ls_itmp TYPE /scwm/dlv_hu_prd_str,
        ls_huhdr TYPE /scwm/s_huhdr_int,
        ls_t333 TYPE /scwm/t333,
        ls_request TYPE /scwm/s_pack_request,
        lv_allowed TYPE boole_d.

  CALL METHOD check_changable
    EXPORTING
      iv_guid_hu    = iv_source_hu
    EXCEPTIONS
      error         = 1
      not_changable = 2
      OTHERS        = 3.
  IF sy-subrc <> 0.
    RAISE error.
  ENDIF.

  CALL METHOD check_changable
    EXPORTING
      iv_guid_hu    = iv_dest_hu
    EXCEPTIONS
      error         = 1
      not_changable = 2
      OTHERS        = 3.
  IF sy-subrc <> 0.
    RAISE error.
  ENDIF.


  CALL FUNCTION '/SCWM/HUITM_READ'
    EXPORTING
      iv_guid_hu    = iv_source_hu
      iv_guid_stock = iv_stock_guid
    IMPORTING
      es_huitm      = ls_huitm
    EXCEPTIONS
      no_item       = 1
      OTHERS        = 2.
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
            WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4
            INTO gs_message.
    go_log->add_message( ).
  ENDIF.

  IF is_quantity-unit = ls_huitm-meins.
    IF is_quantity-quan > ls_huitm-quan.
      MESSAGE e037(/scwm/ui_packing) INTO gs_message.
      go_log->add_message( ).
      RAISE error.
    ENDIF.
  ELSEIF is_quantity-unit = ls_huitm-altme.
    IF is_quantity-quan > ls_huitm-quana.
    MESSAGE e037(/scwm/ui_packing) INTO gs_message.
    go_log->add_message( ).
    RAISE error.
    ENDIF.
  ENDIF.


* check for doors. It is not allowed to have delivery items with
* different doors in on HU lHierarchy. This check only im online.
* During activation of IDN this must work.

  IF gv_online = abap_true.
    TRY.
        CALL METHOD /scwm/cl_dlv_prd2hum=>check_door_gmbin_for_pack_prod
          EXPORTING
            iv_guid_hu_dest = iv_dest_hu
            iv_lgnum        = gv_lgnum
            iv_docid        = ls_huitm-qdocid
            iv_itemid       = ls_huitm-qitmid
          IMPORTING
            ev_pack_allowed = lv_allowed.
      CATCH /scwm/cx_core .
        MESSAGE e118(/scwm/ui_packing) INTO gs_message.
        go_log->add_message( ).
        RAISE error.
    ENDTRY.
    IF lv_allowed = abap_false.
      MESSAGE e118(/scwm/ui_packing) INTO gs_message.
      go_log->add_message( ).
      RAISE error.
    ENDIF.
  ENDIF.

  READ TABLE gt_itmp INTO ls_itmp WITH KEY
                     stock-qdocid = ls_huitm-qdocid
                     stock-qitmid = ls_huitm-qitmid.
  ASSERT ID /scwm/ui_packing CONDITION sy-subrc = 0.
  IF sy-subrc IS NOT INITIAL.
    MESSAGE e040(/scwm/hu_wm) INTO gs_message.
    go_log->add_message( ).
    RAISE error.
  ENDIF.

  IF ls_itmp-procty IS NOT INITIAL.
    CALL FUNCTION '/SCWM/T333_READ_SINGLE'
      EXPORTING
        iv_lgnum  = gv_lgnum
        iv_procty = ls_itmp-procty
      IMPORTING
        es_t333   = ls_t333
      EXCEPTIONS
        OTHERS    = 99.
    IF sy-subrc <> 0.
      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
              WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4
     INTO gs_message.
      go_log->add_message( ).
      RAISE error.
    ENDIF.
    MOVE-CORRESPONDING ls_huitm TO ls_request.
    ls_request-prces = ls_t333-prces.
  ENDIF.

  CALL FUNCTION '/SCWM/HUHEADER_READ'
    EXPORTING
      iv_guid_hu  = iv_dest_hu
    IMPORTING
      es_huheader = ls_huhdr
    EXCEPTIONS
      not_found   = 1
      input       = 2
      error       = 3
      OTHERS      = 4.
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
            WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4
            INTO gs_message.
    go_log->add_message( ).
    RAISE error.
  ENDIF.

  CALL METHOD /scwm/cl_pack_help=>check_pack_logphys
    EXPORTING
      iv_dest_hu   = iv_dest_hu
      iv_source_hu = iv_source_hu
    EXCEPTIONS
      error      = 1
      OTHERS     = 2.
  IF sy-subrc <> 0.
    RAISE error.
  ENDIF.

  CALL METHOD super->/scwm/if_pack_bas~repack_stock
    EXPORTING
      iv_dest_hu    = iv_dest_hu
      iv_source_hu  = iv_source_hu
      iv_stock_guid = iv_stock_guid
      is_quantity   = is_quantity
      is_valuation  = is_valuation
      iv_cwexact    = iv_cwexact
      it_serid      = it_serid
    IMPORTING
      es_quantity   = es_quantity
    EXCEPTIONS
      error         = 1
      OTHERS        = 2.
  IF sy-subrc <> 0.
    RAISE error.
  ENDIF.

  IF NOT ls_request-prces IS INITIAL.
    prces_set( EXPORTING iv_dest = iv_dest_hu
                         iv_prces = ls_request-prces
                         is_request = ls_request ).
  ENDIF.
ENDMETHOD.


METHOD /SCWM/IF_PACK_BAS~SAVE.
  DATA: lt_huhdr TYPE /scwm/tt_huhdr_int,
        lt_huitm TYPE /scwm/tt_huitm_int,
        lt_yhdr  TYPE /scwm/tt_huhdr_int,
        ls_yhdr     TYPE /scwm/s_huhdr_int,
        lt_huref    TYPE /scwm/tt_huref_int,
        lo_tubadi   TYPE REF TO /scwm/ex_core_tr,
        ls_huref TYPE /scwm/s_huref_int,
        ls_doc   TYPE /scdl/af_docid_doccat_str,
        lt_doc   TYPE /scdl/af_docid_doccat_tab,
        lo_prd_man TYPE REF TO /scwm/cl_dlv_management_prd,
        lv_error TYPE boole_d,
        lo_dlv_message TYPE REF TO /scdl/cl_dm_message,
        lt_dlv_message TYPE /scdl/dm_message_tab,
        lt_delhu    TYPE /scwm/tt_guid_hu,
        ls_guid_hu  TYPE /scwm/s_guid_hu,
        lv_huwt_exist TYPE xfeld,
        lo_tudlv_manager TYPE REF TO /scwm/cl_sr_tudlv,
        ls_huhdr TYPE /scwm/s_huhdr_int.


  FIELD-SYMBOLS: <huhdr> TYPE /scwm/s_huhdr_int,
                 <huitm> TYPE /scwm/s_huitm_int,
                 <dlv_message> TYPE /scdl/dm_message_str.

  CHECK gv_changed IS NOT INITIAL.

* in inbound packing empty HUs have to be deleted. They have no
* refrence to a delivery and would never be selected again.
  CHECK /scwm/cl_dlv_pack_ibdl=>gv_doccat =
        /scdl/if_dl_doc_c=>sc_doccat_inb_prd.

* also in this loop: collect al HUs that have been changed and inform
* the delivery about the changes.
* afterwards call the delivery-save.
  CALL FUNCTION '/SCWM/HUMAIN_DATA_GET'
    IMPORTING
      et_huhdr     = lt_huhdr
      et_yhdr      = lt_yhdr
      et_reference = lt_huref.
  SORT lt_huref BY guid_hu.

  LOOP AT lt_huhdr ASSIGNING <huhdr> WHERE higher_guid IS INITIAL.
    CLEAR: ls_yhdr, lv_huwt_exist.
    IF <huhdr>-updkz IS NOT INITIAL.
      READ TABLE lt_huref TRANSPORTING NO FIELDS WITH KEY
                          guid_hu = <huhdr>-guid_hu.
      IF sy-subrc IS INITIAL.
        LOOP AT lt_huref INTO ls_huref FROM sy-tabix.
          IF ls_huref-guid_hu <> <huhdr>-guid_hu.
            EXIT.
          ENDIF.
          ls_doc-doccat = ls_huref-doccat.
          ls_doc-docid  = ls_huref-docid.
          COLLECT ls_doc INTO lt_doc.
        ENDLOOP.
      ENDIF.
    ENDIF.
    READ TABLE lt_yhdr INTO ls_yhdr WITH KEY
                      guid_hu = <huhdr>-guid_hu
                      BINARY SEARCH.
    IF sy-subrc IS INITIAL AND ls_yhdr-updkz = 'D'.
      CONTINUE.
    ENDIF.
    CHECK <huhdr>-phystat = 'A'.
    REFRESH lt_huitm.
    CALL FUNCTION '/SCWM/HU_READ'
      EXPORTING
        iv_guid_hu = <huhdr>-guid_hu
      IMPORTING
        et_huitm   = lt_huitm
        es_huhdr   = ls_huhdr
      EXCEPTIONS
        error      = 1
        OTHERS     = 2.
    IF sy-subrc <> 0.
      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
               WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    ENDIF.
    LOOP AT lt_huitm ASSIGNING <huitm> WHERE vsi NE gchu_vsi_phm.
      EXIT.
    ENDLOOP.
    IF NOT sy-subrc IS INITIAL AND
      ls_huhdr-ukcon <> wmegc_ukcon_empty and
      ls_huhdr-twhutype is initial.
* check if an open warehouse task exist.
      CALL FUNCTION '/SCWM/CHECK_OPEN_TO'
        EXPORTING
          iv_hu    = <huhdr>-guid_hu
          iv_lgnum = gv_lgnum
        IMPORTING
          ev_exist = lv_huwt_exist
        EXCEPTIONS
          error    = 1
          OTHERS   = 2.
      IF sy-subrc <> 0.
        MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
                WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4
                INTO gs_message.
        go_log->add_message( ).
        RAISE error.
      ENDIF.
      IF  NOT lv_huwt_exist IS INITIAL.
        MESSAGE e166(/scwm/ui_packing) INTO gs_message.
        go_log->add_message( ).
        RAISE error.
      ENDIF.
      ls_guid_hu-guid_hu = <huhdr>-guid_hu.
      APPEND ls_guid_hu TO lt_delhu.
    ENDIF.
  ENDLOOP.

  LOOP AT lt_delhu INTO ls_guid_hu.
    CALL METHOD delete_hu
      EXPORTING
        iv_hu = ls_guid_hu-guid_hu
      EXCEPTIONS
        error = 1.
    IF NOT sy-subrc IS INITIAL.
      RAISE error.
    ENDIF.
  ENDLOOP.

* also the deleted hurefs must be considered for
* delivery update.
  LOOP AT lt_huref INTO ls_huref WHERE updkz = 'D'.
    ls_doc-doccat = ls_huref-doccat.
    ls_doc-docid  = ls_huref-docid.
    COLLECT ls_doc INTO lt_doc.
  ENDLOOP.

* update the TU
  IF NOT lt_huref IS INITIAL.
    TRY.
        GET BADI lo_tubadi
          FILTERS
            lgnum = gv_lgnum.
        IF lo_tubadi IS BOUND.
          CALL BADI lo_tubadi->hu_content_changed
            EXPORTING
              it_ref = lt_huref.
        ENDIF.
      CATCH cx_badi.
    ENDTRY.
  ENDIF.


  CALL METHOD super->/scwm/if_pack_bas~save
    EXPORTING
      iv_commit = iv_commit
      iv_wait   = iv_wait
    EXCEPTIONS
      error     = 1
      OTHERS    = 2.
  IF sy-subrc <> 0.
    RAISE error.
  ENDIF.

* Save TU-DLV data
  IF NOT lt_huref IS INITIAL.
    lo_tudlv_manager = /scwm/cl_sr_tudlv=>get_instance( ).
    lo_tudlv_manager->save( ).
  ENDIF.

* update the delivery if necessary.
  IF NOT lt_doc IS INITIAL AND
    gv_online = abap_true.

    CALL METHOD /scwm/cl_dlv_management_srv=>set_hu_change
      EXPORTING
        iv_trigger_determination = abap_true
        it_doc_redetermine       = lt_doc
      IMPORTING
        eo_message               = lo_dlv_message.

    CALL METHOD lo_dlv_message->check
      EXPORTING
        iv_msgty  = 'E'
      RECEIVING
        ev_result = lv_error.

    IF lv_error = abap_true.
      CALL METHOD lo_dlv_message->get_messages
        RECEIVING
          et_message = lt_dlv_message.
    ELSE.
      CALL METHOD /scwm/cl_dlv_management_prd=>get_instance
        RECEIVING
          eo_instance = lo_prd_man.

      CALL METHOD lo_prd_man->save
        IMPORTING
          ev_rejected = lv_error
          et_message  = lt_dlv_message.
      CALL METHOD lo_dlv_message->check
        EXPORTING
          iv_msgty  = 'E'
        RECEIVING
          ev_result = lv_error.
    ENDIF.

    IF lv_error = abap_true.
      LOOP AT lt_dlv_message ASSIGNING <dlv_message> WHERE msgty = 'E'.
        CALL METHOD go_log->add_message
          EXPORTING
            ip_msgty = <dlv_message>-msgty
            ip_msgid = <dlv_message>-msgid
            ip_msgno = <dlv_message>-msgno
            ip_msgv1 = <dlv_message>-msgv1
            ip_msgv2 = <dlv_message>-msgv2
            ip_msgv3 = <dlv_message>-msgv3
            ip_msgv4 = <dlv_message>-msgv4.
      ENDLOOP.
      RAISE error.
    ENDIF.
  ENDIF.

  CALL METHOD /scwm/cl_serial=>update_sn.
  CALL METHOD refresh_gm.
ENDMETHOD.


METHOD /SCWM/IF_PACK_BAS~STATUS_SET_DIRECT.

  CALL METHOD check_changable
    EXPORTING
      iv_guid_hu    = iv_hu
    EXCEPTIONS
      error         = 1
      not_changable = 2
      OTHERS        = 3.
  IF sy-subrc <> 0.
    RAISE error.
  ENDIF.

  CALL METHOD super->/scwm/if_pack_bas~status_set_direct
    EXPORTING
      iv_hu               = iv_hu
      iv_status           = iv_status
      iv_inactive         = iv_inactive
      iv_no_message       = iv_no_message
    EXCEPTIONS
      error               = 1
      already_set_deleted = 2
      OTHERS              = 3.
  IF sy-subrc <> 0.
    RAISE error.
  ENDIF.
ENDMETHOD.


METHOD /SCWM/IF_PACK_BAS~UNPACK_AUXMAT.

  CALL METHOD check_changable
    EXPORTING
      iv_guid_hu    = iv_source_hu
    EXCEPTIONS
      error         = 1
      not_changable = 2
      OTHERS        = 3.
  IF sy-subrc <> 0.
    RAISE error.
  ENDIF.

  CALL METHOD super->/scwm/if_pack_bas~unpack_auxmat
    EXPORTING
      iv_source_hu = iv_source_hu
      iv_matid     = iv_matid
      is_quantity  = is_quantity
    EXCEPTIONS
      error        = 1
      OTHERS       = 2.
  IF sy-subrc <> 0.
    RAISE error.
  ENDIF.
ENDMETHOD.


METHOD /SCWM/IF_PACK_BAS~UNPACK_STOCK.
  DATA: ls_request TYPE /scwm/s_pack_request,
        ls_result TYPE /scwm/s_pack_result,
        ls_huitm TYPE /scwm/s_huitm_int,
*        ls_itmguid_idx type gtype_s_matidx,
        ls_itmp TYPE /scwm/dlv_hu_prd_str,
        lv_tabix TYPE sytabix,
        ls_quan TYPE /scwm/s_quan,
        lv_quan TYPE /scwm/de_quantity,
        ls_serkey TYPE /scwm/s_seri_key,
        lt_serkey TYPE /scwm/tt_seri_key,
        lt_serkey_nd TYPE /scwm/tt_seri_key,
        ls_serid TYPE /scwm/s_serid,
        lv_altuom TYPE /scwm/de_unit,
        lt_serid TYPE /scwm/tt_serid.

* source hu
  CALL METHOD /scwm/cl_hu_packing=>check_plan_hu
    EXPORTING
      iv_hu      = iv_source_hu
    EXCEPTIONS
      error      = 1
      no_plan_hu = 2
      OTHERS     = 3.
  IF sy-subrc <> 0.
    RAISE error.
  ENDIF.

  ls_request-sguid_hu = iv_source_hu.


* validate: quantity has to be positive
  IF is_quantity-quan < 0.
* this can only happen due to a program error
    MESSAGE e049(/scwm/ui_packing) INTO gs_message.
    go_log->add_message( ).
    RAISE error.
  ENDIF.
* describe what to unpack

  IF gv_repack IS INITIAL.
*   Check open WTs
  CALL METHOD CHECK_WT
    EXPORTING
      IV_SOURCE_HU  = iv_source_hu
      IV_STOCK_GUID = iv_stock_guid
    EXCEPTIONS
      error         = 1
      OTHERS        = 2.
  IF sy-subrc <> 0.
    RAISE error.
    ENDIF.
  ENDIF.

  CALL FUNCTION '/SCWM/HUITM_READ'
    EXPORTING
      iv_guid_hu    = iv_source_hu
      iv_guid_stock = iv_stock_guid
    IMPORTING
      es_huitm      = ls_huitm
    EXCEPTIONS
      no_item       = 1
      OTHERS        = 2.
  IF sy-subrc <> 0.
    RAISE error.
  ENDIF.

  IF is_quantity-unit = ls_huitm-meins.
    IF is_quantity-quan > ls_huitm-quan.
      MESSAGE e037(/scwm/ui_packing) INTO gs_message.
      go_log->add_message( ).
      RAISE error.
    ENDIF.
  ELSEIF is_quantity-unit = ls_huitm-altme.
    IF is_quantity-quan > ls_huitm-quana.
    MESSAGE e037(/scwm/ui_packing) INTO gs_message.
    go_log->add_message( ).
    RAISE error.
    ENDIF.
  ENDIF.

  CALL METHOD check_changable
    EXPORTING
      iv_guid_hu    = iv_source_hu
      iv_docid      = ls_huitm-qdocid
      iv_itmid      = ls_huitm-qitmid
    EXCEPTIONS
      error         = 1
      not_changable = 2
      OTHERS        = 3.
  IF sy-subrc <> 0.
    RAISE error.
  ENDIF.

*  ls_request-guid_stock = iv_stock_guid.
  MOVE-CORRESPONDING ls_huitm TO ls_request.
  MOVE-CORRESPONDING is_quantity TO ls_request.
  ls_request-serid = it_serid.

  CALL METHOD serial_repack
    EXPORTING
      iv_guid_hu    = iv_source_hu
      iv_guid_stock = iv_stock_guid
      is_quan       = is_quantity
    CHANGING
      ct_serid      = ls_request-serid
    EXCEPTIONS
      error         = 1
      OTHERS        = 2.
  IF sy-subrc <> 0.
    RAISE error.
  ENDIF.

* In the next release we must try to call the super-method again
* This is not possible with this interface
* call central packing function module
  ls_request-cwquan  = is_valuation-quan.
  ls_request-cwunit  = is_valuation-unit.
  ls_request-cwexact = iv_cwexact.

  IF gv_allow_repack_collective_hu = abap_false.
    CALL METHOD /scwm/cl_pack_help=>check_pack_logphys
    EXPORTING
      iv_source_hu = iv_source_hu
    EXCEPTIONS
      error        = 1
      OTHERS       = 2.
  IF sy-subrc <> 0.
    RAISE error.
    ENDIF.
  ENDIF.

  CLEAR gs_repack_request.
  CALL METHOD call_pack_unpack
    EXPORTING
      is_request = ls_request
    IMPORTING
      es_result  = ls_result
    EXCEPTIONS
      OTHERS     = 99.
  IF sy-subrc <> 0.
    RAISE error.
  ELSEIF gv_repack IS NOT INITIAL.
    gs_repack_request = ls_request.
  ENDIF.

* if dummy-serial numbers where unpacked
* unassign them from the delivery.
  ls_serkey-lgnum = gv_lgnum.
  ls_serkey-matid = ls_request-matid.
  LOOP AT ls_request-serid INTO ls_serid.
    ls_serkey-serid = ls_serid-serid.
    IF ls_serkey-serid(1) = wmegc_serial_dummy.
      APPEND ls_serkey TO lt_serkey.
    ELSE.
      APPEND ls_serkey TO lt_serkey_nd.
    ENDIF.
  ENDLOOP.
  IF NOT lt_serkey IS INITIAL.
    TRY.
        IF gv_repack IS INITIAL.
          CALL METHOD /scwm/cl_serial=>unassign_sn_from_object
            EXPORTING
              it_serid             = lt_serkey
              iv_delete_del_assign = 'X'
              iv_delete_hu_assign  = 'X'.
        ELSE.
*    in this case the dummy SNs are unassigned from the HU but are
*    still assigned to the delivery. Hence the same SNs can
*    be used for packing. This is necessary if repacking takes
*    place during GR.
          CALL METHOD /scwm/cl_serial=>unassign_sn_from_object
            EXPORTING
              it_serid             = lt_serkey
              iv_delete_del_assign = ' '
              iv_delete_hu_assign  = 'X'.
        ENDIF.
      CATCH /scwm/cx_serial .
        RAISE error.
    ENDTRY.
  ENDIF.
* unassign (non dummy) serial numbers from the HU if unpack the stock
  IF NOT lt_serkey_nd IS INITIAL.
    TRY.
        CALL METHOD /scwm/cl_serial=>unassign_sn_from_object
          EXPORTING
            it_serid             = lt_serkey_nd
            iv_delete_del_assign = ' '
            iv_delete_hu_assign  = 'X'.

      CATCH /scwm/cx_serial .
        RAISE error.
    ENDTRY.
  ENDIF.

  es_quantity-quan = ls_result-quan.
  es_quantity-unit = ls_result-unit.
  gv_changed = 'X'.

  READ TABLE gt_itmp INTO ls_itmp WITH KEY
                     stock-qdocid = ls_huitm-qdocid
                     stock-qitmid = ls_huitm-qitmid.
  ASSERT ID /scwm/ui_packing CONDITION sy-subrc = 0.
  IF sy-subrc IS NOT INITIAL.
    MESSAGE e040(/scwm/hu_wm) INTO gs_message.
    go_log->add_message( ).
    RAISE error.
  ENDIF.

  lv_tabix = sy-tabix.
  IF es_quantity-unit NE ls_itmp-req_qty-uom.
    TRY.
        CALL FUNCTION '/SCWM/MATERIAL_QUAN_CONVERT'
          EXPORTING
            iv_matid     = ls_huitm-matid
            iv_quan      = es_quantity-quan
            iv_unit_from = es_quantity-unit
            iv_unit_to   = ls_itmp-req_qty-uom
            iv_batchid   = ls_huitm-batchid
          IMPORTING
            ev_quan      = ls_quan-quan.
      CATCH /scwm/cx_md.
*       MDL Interface Error -> FM issues a message
        go_log->add_message( ).
        RAISE error.
    ENDTRY.
  ELSE.
    ls_quan-quan = es_quantity-quan.
  ENDIF.

  ls_itmp-packed_qty-qty = ls_itmp-packed_qty-qty - ls_quan-quan.
  ls_itmp-open_qty-qty = ls_itmp-open_qty-qty + ls_quan-quan.
  IF ls_itmp-req_qty-uom NE ls_itmp-req_qty_alt-uom.
    TRY.
        CALL FUNCTION '/SCWM/MATERIAL_QUAN_CONVERT'
          EXPORTING
            iv_matid     = ls_itmp-stock-matid
            iv_quan      = ls_itmp-open_qty-qty
            iv_unit_from = ls_itmp-open_qty-uom
            iv_unit_to   = ls_itmp-open_qty_alt-uom
            iv_batchid   = ls_itmp-stock-batchid
          IMPORTING
            ev_quan      = ls_itmp-open_qty_alt-qty.
        CALL FUNCTION '/SCWM/MATERIAL_QUAN_CONVERT'
          EXPORTING
            iv_matid     = ls_itmp-stock-matid
            iv_quan      = ls_itmp-packed_qty-qty
            iv_unit_from = ls_itmp-packed_qty-uom
            iv_unit_to   = ls_itmp-packed_qty_alt-uom
            iv_batchid   = ls_itmp-stock-batchid
          IMPORTING
            ev_quan      = ls_itmp-packed_qty_alt-qty.
      CATCH /scwm/cx_md.
*       MDL Interface Error -> FM issues a message
        go_log->add_message( ).
    ENDTRY.
  ELSE.
    ls_itmp-open_qty_alt-qty = ls_itmp-open_qty-qty.
    ls_itmp-packed_qty_alt-qty = ls_itmp-packed_qty-qty.
  ENDIF.
  ls_itmp-cwquan = ls_itmp-valq_cfac *
                   ls_itmp-open_qty-qty.



***** If if given iv_altme is different from the isquanitty-unit
***** Then the altme in the HU Position has to be changed, and the alternative quantity
***** has to be converted to the new altme

  lv_altuom = iv_altuom.
  IF gv_set_aum = abap_true.
    lv_altuom = ls_itmp-req_qty_alt-uom.
  ENDIF.
  IF NOT lv_altuom IS INITIAL.
*     AND lv_altuom NE is_quantity-unit. "This is wrong: you can have a HU in a certain UoM on the DB and want to pack a qty in another UoM and change the HU to this other UoM
    CALL FUNCTION '/SCWM/HUITM_READ'
      EXPORTING
        iv_guid_hu    = iv_source_hu
        iv_guid_stock = iv_stock_guid
      IMPORTING
        es_huitm      = ls_huitm
      EXCEPTIONS
        no_item       = 1
        OTHERS        = 2.
    IF sy-subrc = 0.
*    Only a part of the item has been unpacked.
      ls_huitm-altme = lv_altuom.
      TRY.
          CALL FUNCTION '/SCWM/MATERIAL_QUAN_CONVERT'
            EXPORTING
              iv_matid     = ls_itmp-stock-matid
              iv_quan      = ls_huitm-quan
              iv_unit_from = ls_huitm-meins
              iv_unit_to   = ls_huitm-altme
              iv_batchid   = ls_itmp-stock-batchid
            IMPORTING
              ev_quan      = ls_huitm-quana.

        CATCH /scwm/cx_md.
*       MDL Interface Error -> FM issues a message
          go_log->add_message( ).
          RAISE error.
      ENDTRY.
      CALL FUNCTION '/SCWM/HUITM_INT_UPDATE'
        EXPORTING
          iv_updkz       = 'M'
          is_huitm       = ls_huitm
        EXCEPTIONS
          vepo_not_found = 1
          error          = 2
          OTHERS         = 3.
      IF sy-subrc <> 0.
        go_log->add_message( ).
        RAISE error.
      ENDIF.
    ENDIF.
  ENDIF.



  MODIFY gt_itmp FROM ls_itmp INDEX lv_tabix.

  RAISE EVENT stock_unpacked
    EXPORTING
      hu    = ls_result-sguid_hu
      stock0 = ls_huitm-guid_stock0
      stock_source = ls_huitm-guid_stock
      stock_dest = ls_result-guid_stock
      quan  = es_quantity.
* success message
  DATA: lv_matnr TYPE /scwm/de_matnr.
  CALL FUNCTION 'CONVERSION_EXIT_MDLPD_OUTPUT'
    EXPORTING
      input  = ls_huitm-matid
    IMPORTING
      output = lv_matnr.
  MESSAGE s076(/scwm/hufunctions) WITH lv_matnr INTO gs_message.
  go_log->add_message( ).
ENDMETHOD.


METHOD /SCWM/IF_PACK_BAS~USER_STATUS_MAINTAIN.

  CALL METHOD check_changable
    EXPORTING
      iv_guid_hu    = iv_guid_hu
    EXCEPTIONS
      error         = 1
      not_changable = 2
      OTHERS        = 3.
  IF sy-subrc <> 0.
    RAISE error.
  ENDIF.

  CALL METHOD super->/scwm/if_pack_bas~user_status_maintain
    EXPORTING
      iv_guid_hu    = iv_guid_hu
      iv_status     = iv_status
      iv_check_only = iv_check_only
      iv_delete     = iv_delete
    EXCEPTIONS
      error         = 1
      OTHERS        = 2.
  IF sy-subrc <> 0.
    RAISE error..
  ENDIF.
ENDMETHOD.


method /SCWM/IF_PACK~PRINT_HU_LABEL.
  DATA: lt_huitm         TYPE /scwm/tt_huitm_int,
        ls_huhdr         TYPE /scwm/s_huhdr_int,
        lt_huhdr         TYPE /scwm/tt_huhdr_int,
        lt_huref         TYPE /scwm/tt_huref_int.

  DATA: lt_protocol TYPE bal_t_logh,
        lt_contexts TYPE ppftcntxts.


  CALL METHOD get_hu
    EXPORTING
      iv_guid_hu = iv_hu
    IMPORTING
      et_huitm   = lt_huitm
      es_huhdr   = ls_huhdr
      et_huref   = lt_huref
    EXCEPTIONS
      not_found  = 1
      OTHERS     = 2.
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
            WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4 INTO gs_message.
    go_log->add_message( ).
    RAISE error.
  ENDIF.

  APPEND ls_huhdr TO lt_huhdr.

* Clear global print data
  CALL FUNCTION '/SCWM/PRINT_GLOBAL_DATA'.

  CALL FUNCTION '/SCWM/PRINT_HU'
    EXPORTING
      it_huhdr          = lt_huhdr
      iv_caller         = '1'
      iv_noexe          = ' '
      iv_nodialog       = 'X'
      iv_hustep         = 'P'
    IMPORTING
      et_protocol       = lt_protocol
      et_contexts       = lt_contexts
    EXCEPTIONS
      no_previous_print = 1
      error_on_log_save = 2
      previous_print    = 3
      OTHERS            = 4.

  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
            WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4 INTO gs_message.
    go_log->add_message( ).
    RAISE error.
  ENDIF.

* We must find out that at least one action was executed
*   with 'Immediate Processing'

* If we wrote a det. protocol we store it on the database and add a
*   message into the workcenter log. But w/o COMMIT no protocol!
  IF lt_protocol IS NOT INITIAL.
    MESSAGE s038(/scwm/print) INTO gs_message.
    go_log->add_message( ).
  ENDIF.
endmethod.


METHOD AUTOPACK.
  DATA: lt_ps_autopack      TYPE /scwm/tt_ps_autopack,
        ls_ps_autopack      TYPE /scwm/s_ps_autopack,
*        ls_header_bc        TYPE REF TO /scdl/dl_doctype_detail_str,
*        lt_header_bc        TYPE REF TO /scdl/dl_doctype_detail_tab,
        ls_header_bc        type /scdl/dl_dtype_detail_str,
        lt_header_bc        type /scdl/dl_dtype_detail_tab,
        lt_return_bapi      TYPE bapirettab,
        ls_return_bapi      TYPE bapiret2,
        lv_severity         TYPE bapi_mtype,
        lt_itmp            TYPE /scwm/dlv_hu_prd_tab,
        lv_docid           TYPE /scwm/de_docid,
        lo_saf              TYPE REF TO /scdl/cl_af_management,
        lo_bus_conf         TYPE REF TO /scdl/if_af_business_conf,
        ls_doctypekeys      TYPE /scdl/dl_doctype_extkey_str,
        lt_doctypekeys      TYPE /scdl/dl_doctype_extkey_tab,
        lo_message          TYPE REF TO /scdl/cl_dm_message_extkey,
        lv_dummymsg         TYPE  char1,
        ls_symsg            TYPE symsg,
        ls_partyloc_from    TYPE /scdl/dl_partyloc_str,
        ls_item_addin       TYPE /scwm/db_item_data,
        ls_partyloc_wh      TYPE /scdl/dl_partyloc_str,
        lt_addmeas          TYPE /scdl/dl_addmeas_tab,
        ls_addmeas          TYPE /scdl/dl_addmeas_str,
        lo_item_prd_wme     TYPE REF TO /scwm/cl_dl_item_prd.

  FIELD-SYMBOLS: <itmp> TYPE /scwm/dlv_hu_prd_str.

  IF NOT it_itmp IS INITIAL.
    lt_itmp = it_itmp.
  ELSE.
*   pack all items of the delivery
    LOOP AT /scwm/cl_dlv_pack_ibdl=>gt_itmp ASSIGNING <itmp> WHERE
                                            prd_id =  iv_prdi.
      IF <itmp>-open_qty-qty > 0.
        APPEND <itmp> TO lt_itmp.
      ENDIF.
    ENDLOOP.
  ENDIF.

  lo_saf = /scdl/cl_af_management=>get_instance( ).
  TRY.
      lo_bus_conf ?= lo_saf->get_service(
      /scdl/if_af_management_c=>sc_business_conf ).
    CATCH /scdl/cx_af_management.
  ENDTRY.


  SORT lt_itmp BY prd_id.
  LOOP AT lt_itmp ASSIGNING <itmp>.
    CLEAR: ls_ps_autopack.
    IF <itmp>-prd_id NE lv_docid.
      IF NOT lv_docid IS INITIAL.
        gv_set_aum = abap_true.
        CALL FUNCTION '/SCWM/HU_AUTOPACK_IBDLV'
          EXPORTING
            it_items     = lt_ps_autopack
            iv_procedure = ls_header_bc-dlvap
            io_pack      = me.
*          IMPORTING
*    message-handling only with log
*            et_return    = lt_return_bapi
*            ev_severity  = lv_severity.
        gv_set_aum = abap_false.
      ENDIF.
      lv_docid = <itmp>-prd_id.
      REFRESH: lt_ps_autopack, lt_doctypekeys.
      CLEAR ls_header_bc.
      ls_doctypekeys-type      = <itmp>-prd->get_doctype( ).
      ls_doctypekeys-category  = <itmp>-prd->get_doccat( ).
      APPEND ls_doctypekeys TO lt_doctypekeys.
      TRY.

* l   Customozing
          lo_bus_conf->get_header_bc_by_type_multi(
             EXPORTING it_header_extkey = lt_doctypekeys
             IMPORTING et_dtype         = lt_header_bc
                       eo_message       = lo_message ).
        CATCH /scdl/cx_af_business_conf.
*     errors handled below when processing the headers
      ENDTRY.
      READ TABLE lt_header_bc  INTO ls_header_bc WITH KEY
          type     = <itmp>-prd->mv_doctype
          category = <itmp>-prd->mv_doccat BINARY SEARCH.
      IF sy-subrc <> 0 OR ls_header_bc-dlvap IS INITIAL or
        ( not ls_header_bc-DLVAP_IND is initial and
          gv_online = abap_false ) .
        MESSAGE ID '/SCWM/DELIVERY'
*           failure within autopack should not prevent IDR
*           from beeing activated
                TYPE /scdl/cl_dm_message=>sc_msgty_warning
                NUMBER '055'
            WITH 'DLVAP' <itmp>-prd->mv_doccat <itmp>-prd->mv_doctype
                INTO lv_dummymsg.
        go_log->add_message( ).
        RETURN.
      ENDIF.
    ENDIF.

*   stock
    ls_ps_autopack-stock = <itmp>-stock.
    ls_ps_autopack-det-pak_matid = <itmp>-stock-matid.
    ls_ps_autopack-det-pak_cntry = <itmp>-stock-coo.


*   Partner ship-from
    ls_partyloc_from = /scwm/cl_dlv_field_det=>get_partyloc(
         io_header = <itmp>-prd
         io_item = <itmp>-item
         iv_party_role = ls_header_bc-pack_role ).
    ls_ps_autopack-det-pak_ship_from = ls_partyloc_from-partyno.

*   additional data
    lo_item_prd_wme ?= <itmp>-item->get_addin(
            iv_addin_id = /scwm/cl_im_dl_docdata=>sv_addin_id ).

    ls_item_addin = lo_item_prd_wme->get_data( ).
    ls_ps_autopack-det-pak_dist_group = ls_item_addin-dstgrp.

*   warehouse number
    ls_partyloc_wh = /scwm/cl_dlv_field_det=>get_partyloc(
          io_header = <itmp>-prd
          io_item = <itmp>-item
          iv_party_role = /scdl/if_dl_partyloc_c=>sc_party_role_wh ).
    ls_ps_autopack-det-pak_locid  = ls_partyloc_wh-locationid.

*   quantity
    ls_ps_autopack-cond-quantity = <itmp>-open_qty-qty.
    ls_ps_autopack-cond-unit_q   = <itmp>-open_qty-uom.

    APPEND ls_ps_autopack TO lt_ps_autopack.

  ENDLOOP.
  IF NOT lt_ps_autopack IS INITIAL.
    gv_set_aum = abap_true.
    CALL FUNCTION '/SCWM/HU_AUTOPACK_IBDLV'
      EXPORTING
        it_items     = lt_ps_autopack
        iv_procedure = ls_header_bc-dlvap
        io_pack      = me.
*     IMPORTING
*    message-handling only with log
*        et_return    = lt_return_bapi
*        ev_severity  = lv_severity.
    gv_set_aum = abap_false.
  ENDIF.
  lv_severity = go_log->get_severity( ).
  if lv_severity ca 'EAX'.
    raise error.
  endif.
ENDMETHOD.


METHOD CHECK_CHANGABLE.
  DATA: lt_huref TYPE /scwm/tt_huref_int,
        ls_huref TYPE /scwm/s_huref_int,
        ls_huhdr TYPE /scwm/s_huhdr_int,
        lt_huhdr TYPE /scwm/tt_huhdr_int,
        lo_bom   TYPE REF TO  /scdl/cl_bo_management.
  DATA:  lo_bo    TYPE REF TO /scdl/if_bo,
         lo_item  TYPE REF TO /scdl/cl_dl_item.
* delivery-query
  DATA: lt_dlv_itm TYPE /scwm/dlv_item_out_prd_tab,
        ls_include TYPE /scwm/dlv_query_incl_str_prd,
        ls_docid_itmid TYPE /scwm/dlv_docid_item_str,
        lt_docid_itmid TYPE /scwm/dlv_docid_item_tab,
        lo_prd_man TYPE REF TO /scwm/cl_dlv_management_prd,
        ls_read_options_prd TYPE /scwm/dlv_query_contr_str.


  FIELD-SYMBOLS: <dlv_itm> TYPE /scwm/dlv_item_out_prd_str.

* It may be possible that not all deliveries that are in the HU
* are locked. Then it is not allowed to change anything in the
* hierarchy.
* If the delivery item is passed it is checked if the delivery item
* can be changed (is locked).

* during activation it is not necessary to lock all deliveries
  check  gv_online = abap_true.

  IF NOT iv_itmid IS INITIAL .
    lo_bom = /scdl/cl_bo_management=>get_instance( ) .
    lo_bo = lo_bom->get_bo_by_id( iv_docid = iv_docid ) .
    IF lo_bo IS INITIAL.
* no bo. Try it without.
      CREATE OBJECT lo_prd_man.
      ls_docid_itmid-docid = iv_docid.
      ls_docid_itmid-itemid = iv_itmid.
      APPEND ls_docid_itmid TO lt_docid_itmid.
      ls_include-item_text = 'X'.
      ls_read_options_prd-data_retrival_only = abap_true.
      ls_read_options_prd-mix_in_object_instances = abap_true.
      TRY.
          CALL METHOD lo_prd_man->query
            EXPORTING
              it_docid        = lt_docid_itmid
              iv_doccat       = /scdl/if_dl_doc_c=>sc_doccat_inb_prd
              is_read_options = ls_read_options_prd
              is_include_data = ls_include
            IMPORTING
              et_items        = lt_dlv_itm.
        CATCH /scdl/cx_delivery .
          MESSAGE e134(/scwm/ui_packing) INTO gs_message.
          go_log->add_message( ).
          RAISE not_changable.
      ENDTRY.
      READ TABLE lt_dlv_itm ASSIGNING <dlv_itm> INDEX 1.
      IF NOT sy-subrc IS INITIAL.
        MESSAGE e134(/scwm/ui_packing) INTO gs_message.
        go_log->add_message( ).
        RAISE not_changable.
      ENDIF.
      IF <dlv_itm>-changeable = abap_false.
        MESSAGE e134(/scwm/ui_packing) INTO gs_message.
        go_log->add_message( ).
        RAISE not_changable.
      ENDIF.
    ELSE.
      lo_item = lo_bo->get_item( iv_itemid = iv_itmid ).
      IF lo_item IS INITIAL.
        MESSAGE e134(/scwm/ui_packing) INTO gs_message.
        go_log->add_message( ).
        RAISE not_changable.
      ENDIF.
      IF lo_item->is_changeable( iv_just_check = abap_false ) = abap_false .
        MESSAGE e134(/scwm/ui_packing) INTO gs_message.
        go_log->add_message( ).
        RAISE not_changable.
      ENDIF.
    ENDIF.
    EXIT.
  ENDIF.

  CALL FUNCTION '/SCWM/HU_READ'
    EXPORTING
      iv_top     = 'X'
      iv_guid_hu = iv_guid_hu
    IMPORTING
      et_huhdr   = lt_huhdr
      et_huref   = lt_huref
      es_huhdr   = ls_huhdr
    EXCEPTIONS
      error      = 1
      OTHERS     = 2.
* No HUREF is here also a real error.
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
            WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4
            INTO gs_message.
    go_log->add_message( ).
    RAISE error.
  ENDIF.
  IF ls_huhdr-vhi NE wmegc_vhi_plan.
    MESSAGE e065(/scwm/ui_packing) with ls_huhdr-huident INTO gs_message.
    go_log->add_message( ).
    RAISE error.
  ENDIF.
  LOOP AT lt_huref INTO ls_huref WHERE updkz NE 'D'.
    READ TABLE gt_read_dlv TRANSPORTING NO FIELDS WITH KEY
                           docid  = ls_huref-docid
                           locked = 'X'.
    IF NOT sy-subrc IS INITIAL.
      MESSAGE e095(/scwm/ui_packing) INTO gs_message.
      go_log->add_message( ).
      RAISE not_changable.
    ENDIF.
  ENDLOOP.
ENDMETHOD.


METHOD CREATE_HU_UKC.
* ----------------------------------------------------------------------
* This method creates a collective HU, packs the given inbound delivery
*  items in this collective HU and creates HUs of unknown content related
*  to the collective HU.
* If no packaging material for the colective HU is given, it is determined
*  from the entry in the settings (/SCWM/PMATCOLHU)
*  IMPORTING
*         IV_LGNUM          - Warehouse number
*         IV_PMAT_LOGHU     - Packaging material of the collective HU
*         IV_HUIDENT_LOGHU  - HU identification of the collective HU
*         IV_NOSAVE         - true: do not save created HUs
*         IT_ITEM_QTY_LOGHU - Content inbound delivery items of the col. HU
*         IT_GR_PMAT_HU_UKC - HUs with Unknown Content
*  EXPORTING
*         ET_HUHDR_LOGHU    - Header of Collective HU
*         ET_HUHDR_GR_UKC   - Headers of HUs with Unknown Content
* ----------------------------------------------------------------------

  DATA: lt_item_qty_loghu TYPE /scwm/t_dlv_docid_item_qty,
        lt_docid          TYPE /scwm/tt_docid,
        ls_items_colhu    TYPE /scwm/s_pmatcohu,
        lt_items_colhu    TYPE /scwm/t_pmatcohu,
        ls_docid          TYPE /scwm/s_docid,
        lv_doccat         TYPE /scdl/dl_doccat,
        lv_pmat_loghu     TYPE /scwm/de_matid,
        ls_huhdr          TYPE /scwm/s_huhdr_int,
        ls_huhdr_ukc      TYPE /scwm/s_huhdr_int,
        ls_material       TYPE /scwm/s_pack_stock,
        ls_quantity       TYPE /scwm/s_quan,
        ls_itmp           TYPE /scwm/dlv_hu_prd_str,
        lv_flg_suom       TYPE /scwm/de_flg_suom.

  FIELD-SYMBOLS:
    <ls_item_qty_loghu>   TYPE /scwm/s_dlv_docid_item_qty,
    <ls_gr_pmat_hu_ukc>   TYPE /scwm/s_gr_pmat_hu.


  lt_item_qty_loghu = it_item_qty_loghu.
  SORT lt_item_qty_loghu BY docid itemid.
  DELETE ADJACENT DUPLICATES FROM lt_item_qty_loghu COMPARING docid.
* collect itemids and docids of the content items
  LOOP AT lt_item_qty_loghu ASSIGNING <ls_item_qty_loghu>.
    ls_docid-docid = <ls_item_qty_loghu>-docid.
    APPEND ls_docid TO lt_docid.
    ls_items_colhu-doccat = <ls_item_qty_loghu>-doccat.
    ls_items_colhu-docid  = <ls_item_qty_loghu>-docid.
    ls_items_colhu-itemid = <ls_item_qty_loghu>-itemid.
    APPEND ls_items_colhu TO lt_items_colhu.
    lv_doccat = <ls_item_qty_loghu>-doccat.
  ENDLOOP.

* determine packaging material of the collective HU from settings
*   if not given
  IF iv_pmat_loghu IS INITIAL.

    CALL FUNCTION '/SCWM/PMAT_COLHU_READ_SINGLE'
      EXPORTING
        it_cont_cohu = lt_items_colhu
        iv_lgnum     = iv_lgnum
      IMPORTING
        ev_pmatid    = lv_pmat_loghu
      EXCEPTIONS
        wrong_input  = 1
        error        = 2
        OTHERS       = 3.
    IF sy-subrc <> 0.
      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
              WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4
              INTO gs_message.
      go_log->add_message( ).
    ENDIF.

  ELSE.
    lv_pmat_loghu = iv_pmat_loghu.
  ENDIF.

  CALL FUNCTION '/SCWM/HUMAIN_REFRESH'
    EXPORTING
      iv_restore_save = abap_true.


*delivery items are already locked
  me->init(
    EXPORTING
      iv_lgnum         = iv_lgnum
      it_docid         = lt_docid
      iv_doccat        = lv_doccat
      iv_no_refresh    = abap_true
         ).

* create the collective HU
  CLEAR ls_huhdr.
  me->/scwm/if_pack_bas~create_hu(
    EXPORTING
      iv_pmat      = lv_pmat_loghu
      iv_huident   = iv_huident_loghu
    RECEIVING
      es_huhdr     = ls_huhdr
  EXCEPTIONS
    error        = 1
    OTHERS       = 2
         ).
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
            WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4
            INTO gs_message.
    go_log->add_message( ).

    CALL FUNCTION '/SCWM/HUMAIN_REFRESH'
      EXPORTING
        iv_restore = abap_true.

    RAISE error.
  ENDIF.

* exporting parameter of the collective HU
  es_huhdr_loghu = ls_huhdr.

* Pack all items into the collective HU
  LOOP AT it_item_qty_loghu ASSIGNING <ls_item_qty_loghu>.

    ls_material-qdoccat = <ls_item_qty_loghu>-doccat.
    ls_material-qdocid  = <ls_item_qty_loghu>-docid.
    ls_material-qitmid  = <ls_item_qty_loghu>-itemid.

    BREAK-POINT ID /scwm/suom.
    READ TABLE gt_itmp INTO ls_itmp WITH KEY
                   stock-qdocid = <ls_item_qty_loghu>-docid
                   stock-qitmid = <ls_item_qty_loghu>-itemid.
    IF sy-subrc IS NOT INITIAL.
      MESSAGE e040(/scwm/hu_wm) INTO gs_message.
      go_log->add_message( ).
      CALL FUNCTION '/SCWM/HUMAIN_REFRESH'
        EXPORTING
          iv_restore = abap_true.
      RAISE error.
    ENDIF.

    CALL FUNCTION '/SCWM/SUOM_CHECK'
      EXPORTING
        iv_lgnum    = iv_lgnum
        iv_matid    = ls_itmp-stock-matid
        iv_uom      = ls_itmp-open_qty_alt-uom
      IMPORTING
        ev_flg_suom = lv_flg_suom.

    IF <ls_item_qty_loghu>-qty IS INITIAL.
*     determine the open quantity to pack
      IF lv_flg_suom IS INITIAL.
        ls_quantity-quan = ls_itmp-open_qty-qty.
        ls_quantity-unit = ls_itmp-open_qty-uom.
      ELSE.
        ls_quantity-quan = ls_itmp-open_qty_alt-qty.
        ls_quantity-unit = ls_itmp-open_qty_alt-uom.
      ENDIF.
    ELSE.
      IF lv_flg_suom IS INITIAL.
        ls_quantity-quan = <ls_item_qty_loghu>-qty.
        ls_quantity-unit = <ls_item_qty_loghu>-uom.
      ELSE.
        TRY.
            CALL FUNCTION '/SCWM/MATERIAL_QUAN_CONVERT'
              EXPORTING
                iv_matid     = ls_itmp-stock-matid
                iv_quan      = <ls_item_qty_loghu>-qty
                iv_unit_from = <ls_item_qty_loghu>-uom
                iv_unit_to   = ls_itmp-open_qty_alt-uom
                iv_batchid   = ls_itmp-stock-batchid
              IMPORTING
                ev_quan      = ls_quantity-quan.
            ls_quantity-unit = ls_itmp-open_qty_alt-uom.
          CATCH /scwm/cx_md.
            ls_quantity-quan = <ls_item_qty_loghu>-qty.
            ls_quantity-unit = <ls_item_qty_loghu>-uom.
        ENDTRY.
      ENDIF.
    ENDIF.

    me->/scwm/if_pack_bas~pack_stock(
      EXPORTING
        iv_dest_hu   = ls_huhdr-guid_hu
        is_material  = ls_material
        is_quantity  = ls_quantity
      EXCEPTIONS
        error        = 1
        OTHERS       = 2
           ).
    IF sy-subrc <> 0.
      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
              WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4
              INTO gs_message.
      go_log->add_message( ).
      CALL FUNCTION '/SCWM/HUMAIN_REFRESH'
        EXPORTING
          iv_restore = abap_true.
      me->init(
        EXPORTING
          iv_lgnum  = iv_lgnum
          it_docid  = lt_docid
          iv_doccat = lv_doccat ) .
      RAISE error.
    ENDIF.

  ENDLOOP.

* Create the HUs with unknown content
  LOOP AT it_gr_pmat_hu_ukc ASSIGNING <ls_gr_pmat_hu_ukc>.

    me->/scwm/if_pack_bas~create_hu(
  EXPORTING
    iv_pmat     = <ls_gr_pmat_hu_ukc>-pmatid
    iv_huident  = <ls_gr_pmat_hu_ukc>-huident
    iv_loghu    = ls_huhdr-huident
  RECEIVING
    es_huhdr     = ls_huhdr_ukc
  EXCEPTIONS
    error        = 1
    OTHERS       = 2
       ).
    IF sy-subrc <> 0.
      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
              WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4
              INTO gs_message.
      go_log->add_message( ).
      CALL FUNCTION '/SCWM/HUMAIN_REFRESH'
        EXPORTING
          iv_restore = abap_true.
      me->init(
        EXPORTING
          iv_lgnum         = iv_lgnum
          it_docid         = lt_docid
          iv_doccat        = lv_doccat ) .
      RAISE error.
    ENDIF.

    APPEND ls_huhdr_ukc TO et_huhdr_gr_ukc.

  ENDLOOP.

* Save HUs
  IF iv_nosave <> abap_true.  " save HU is requested
    CALL METHOD me->/scwm/if_pack_bas~save
      EXPORTING
        iv_commit = ' '
        iv_wait   = ' '
      EXCEPTIONS
        error     = 1
        OTHERS    = 2.
    IF sy-subrc <> 0.
      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
                 WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4
              INTO gs_message.
      go_log->add_message( ).
      CALL FUNCTION '/SCWM/HUMAIN_REFRESH'
        EXPORTING
          iv_restore = abap_true.
      me->init(
        EXPORTING
          iv_lgnum  = iv_lgnum
          it_docid  = lt_docid
          iv_doccat = lv_doccat ) .
      RAISE error.
    ENDIF.

  ENDIF.

  CALL FUNCTION '/SCWM/HUMAIN_REFRESH'
    EXPORTING
      iv_restore_clear = abap_true.

ENDMETHOD.


method GET_FREE.
  field-symbols: <itmp> type /scwm/dlv_hu_prd_str.

  CLEAR: es_free, et_free[].
  if iv_docid is initial and iv_itmid is initial.
    et_free = gt_itmp.
  elseif iv_itmid is initial.
    read table gt_itmp transporting no fields with key
                       stock-qdocid = iv_docid
                       binary search.
    if not sy-subrc is initial.
      loop at gt_itmp assigning <itmp> from sy-tabix.
        if <itmp>-stock-qdocid ne iv_docid.
          exit.
        endif.
        append <itmp> to et_free.
      endloop.
    endif.
  else.
    if not iv_docid is initial.
      read table gt_itmp into es_free with key
                         stock-qdocid = iv_docid
                         stock-qitmid = iv_itmid
                         binary search.
    else.
      read table gt_itmp into es_free with key
                         stock-qitmid = iv_itmid.
    endif.
    append es_free to et_free.
  endif.
* filter only deliveries that are locked.
  if not iv_only_locked is initial.
  read table gt_read_dlv transporting no fields with key locked = ' '.
  if sy-subrc is initial.
    loop at et_free assigning <itmp>.
      read table gt_read_dlv transporting no fields with key
                                    docid = <itmp>-stock-qdocid
                                   locked = 'X'.
      if not sy-subrc is initial.
        delete et_free.
      endif.
    endloop.
  endif.
  endif.

endmethod.


method GET_HUS_FOR_DELIVERY.
  CALL FUNCTION '/SCWM/DLV_GET_HUS_FOR_DELIVERY'
    EXPORTING
      IV_DOCCAT         = iv_doccat
      IT_DOCID          = it_docid
      IV_LGNUM          = iv_lgnum
    IMPORTING
      ET_HIGH           = et_high
      ET_HUREF          = et_huref
      ET_IDENT          = et_ident
      ET_HUHDR          = et_huhdr
      ET_HUITM          = et_huitm
      ET_HUTREE         = et_hutree
    EXCEPTIONS
      ERROR             = 1
      OTHERS            = 2
            .
  IF SY-SUBRC <> 0.
   MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
            WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4
            into gs_message.
   go_log->add_message( ).
   raise error.
  ENDIF.
endmethod.


method GET_INSTANCE_DLV.
  if go_singleton_dlv is not bound.
    create object go_singleton_dlv.
  endif.
  eo_instance = go_singleton_dlv.
endmethod.


METHOD INIT.
  DATA: ls_sel        TYPE rsdsselopt,
        lt_sel_docid  TYPE rseloption,
        lt_sel_doccat TYPE rseloption,
        ls_docid      TYPE /scwm/s_docid,
        ls_itmp       TYPE /scwm/dlv_hu_prd_str,
        ls_matidx     TYPE gtype_s_matidx,
        lt_huhdr      TYPE /scwm/tt_huhdr_int,
        lt_huitm      TYPE /scwm/tt_huitm_int,
        lt_dlvkey     TYPE /scdl/af_hum_data_tab,
        ls_dlvkey     TYPE /scdl/af_hum_data_str,
        lt_docid      TYPE /scwm/tt_docid,
        lt_docid_tw   TYPE /scwm/tt_docid,
        ls_read_dlv   TYPE gtype_s_read_dlv,
        ls_mat_global TYPE /scwm/s_material_global,
        ls_mat_lgnum  TYPE /scwm/s_material_lgnum,
        lt_item_hier  TYPE /scdl/dl_hierarchy_h_tab,
        lt_itmp       TYPE /scwm/dlv_hu_prd_tab,
        lv_root       TYPE /scdl/dl_itemid,
        lv_itemtype   TYPE /scdl/dl_itemtype,
        lv_dbatch_rel TYPE /scwm/dl_dbatch_rel,
        lv_appl_proc  TYPE /scwm/de_blocappl_proc,
        lo_serv_check TYPE REF TO /scwm/if_dlv_service_check,

        lt_huhdr_tw   TYPE /scwm/tt_huhdr_int,
        ls_qty        TYPE /scdl/dl_qty_str.

  FIELD-SYMBOLS: <itmp> TYPE /scwm/dlv_hu_prd_str.

  DATA: lo_prd2hum TYPE REF TO /scwm/cl_dlv_prd2hum,
        lo_tw_hu   TYPE REF TO  /scwm/if_tw_pack.

  DATA: lo_qinsp      TYPE REF TO /scwm/if_af_qinsp_int,
        lv_skip       TYPE  boolean,
        lv_qinspid    TYPE guid,
        lv_q_finished TYPE abap_bool.

  DATA  lo_dlv_service     TYPE REF TO  /scwm/cl_dlv_services.

  IF it_docid IS INITIAL.
    RETURN.
  ENDIF.

  gv_no_quan_check = iv_no_quan_check.


  CREATE OBJECT lo_prd2hum.
  CREATE OBJECT lo_dlv_service.
  lo_serv_check ?= /scwm/cl_dlv_service=>get_instance(
    /scwm/cl_dlv_service=>sc_services_check ).

  TRY.
      lo_tw_hu = /scwm/cl_tw_packing=>get_instance( ).
    CATCH /scwm/cx_core.
*todo    RAISE error.
  ENDTRY.


  CALL METHOD refresh_and_init
    EXPORTING
      iv_lgnum      = iv_lgnum
      iv_no_refresh = iv_no_refresh
    EXCEPTIONS
      OTHERS        = 99.
  IF sy-subrc <> 0.
*todo    RAISE error.
  ENDIF.
  IF iv_doccat IS INITIAL.
    gv_doccat = /scdl/if_dl_doc_c=>sc_doccat_inb_prd.
  ELSE.
    gv_doccat = iv_doccat.
  ENDIF.

  CALL METHOD read_delivery
    EXPORTING
      iv_lgnum        = iv_lgnum
      it_docid        = it_docid
      iv_doccat       = iv_doccat
      iv_lock         = iv_lock_dlv
    IMPORTING
      ev_foreign_lock = ev_foreign_lock
      et_doc_lock     = et_doc_lock.

  gv_lgnum = iv_lgnum.

  LOOP AT gt_read_dlv INTO ls_read_dlv.
    IF NOT iv_lock_dlv IS INITIAL AND
       ls_read_dlv-locked IS INITIAL.
      CONTINUE.
    ENDIF.
    ls_docid-docid = ls_read_dlv-docid.
    APPEND ls_docid TO lt_docid.
  ENDLOOP.

  IF iv_partial IS INITIAL.
    REFRESH gt_itmp.
  ENDIF.

  IF NOT lt_docid IS INITIAL.
    ls_dlvkey-doccat = iv_doccat.
    LOOP AT lt_docid INTO ls_docid.
      IF lo_serv_check->is_tw_delivery_by_id(
          iv_docid          =  ls_docid-docid
          iv_doccat         =  iv_doccat ).
        APPEND ls_docid TO lt_docid_tw.
      ELSE.
        ls_dlvkey-docid = ls_docid-docid.
        APPEND ls_dlvkey TO lt_dlvkey.
      ENDIF.
    ENDLOOP.

    IF lt_docid_tw is not initial.
      TRY.
          ev_tw_items = abap_true.
          lo_tw_hu->get_hus_by_original_dlv(
            EXPORTING
              iv_doccat =     iv_doccat
              it_docid  =     lt_docid_tw
            IMPORTING
              et_huhdr  =     lt_huhdr_tw ).
        CATCH /scwm/cx_core.
      ENDTRY.
      RETURN.
    ENDIF.


    CALL METHOD lo_prd2hum->map_hu_dlv
      EXPORTING
*       iv_docid       = ls_docid-docid
        iv_doccat      = iv_doccat
        it_dlv_data    = lt_dlvkey
        iv_with_object = abap_true
      IMPORTING
        et_hu_dlv      = lt_itmp.

*   By some customizing settings the just created inpsection document
*   decided automatically. By this, so called SKIP-documents, the
*   inspection document ID shouldn't be written into the sctock item.
*   The goods are not moved into the quality inspection workcenter and
*   the item is not disconnected from INSPID (INSPTYP) while follow-up
*   action doesn't take place. Therefore we don't write the INPSID(INSPTYP)
*   into the stock by SKIP-document.
    LOOP AT lt_itmp ASSIGNING <itmp>.
      IF <itmp>-stock-inspid IS NOT INITIAL.
        TRY.
            lo_qinsp = /scwm/cl_qdoc=>get_instance( ).

            lv_qinspid = <itmp>-stock-inspid.

            lo_qinsp->get_qinsp_is_skip(
              EXPORTING
                iv_qinspid = lv_qinspid
              IMPORTING
                ev_skip   = lv_skip ).

            lo_qinsp->get_qinsp_data(
              EXPORTING
                iv_insptyp            = <itmp>-stock-insptyp
                iv_inspid             = lv_qinspid
              IMPORTING
                ev_obsolete_4_process = lv_q_finished ).

*           only propagate insp docs that were not skipped nor finished
            IF lv_skip IS NOT INITIAL OR lv_q_finished IS NOT INITIAL.
              CLEAR <itmp>-stock-insptyp.
              CLEAR <itmp>-stock-inspid.
            ENDIF.

          CATCH /scwm/cx_qinsp .                    "#EC NO_HANDLER
        ENDTRY.
      ENDIF.
    ENDLOOP.

    IF iv_partial IS INITIAL.
      gt_itmp = lt_itmp.
    ELSE.
      LOOP AT gt_itmp ASSIGNING <itmp>.
        READ TABLE it_docid TRANSPORTING NO FIELDS WITH KEY
                           docid = <itmp>-prd_id.
        IF sy-subrc IS INITIAL.
          DELETE gt_itmp.
          CONTINUE.
        ENDIF.
      ENDLOOP.
      APPEND LINES OF lt_itmp TO gt_itmp.
    ENDIF.
    SORT gt_itmp BY stock-qdocid stock-qitmid.
    LOOP AT gt_itmp ASSIGNING <itmp>.
      <itmp>-stock-qdocid = <itmp>-prd_id.
      <itmp>-stock-qitmid = <itmp>-item_id.
* todo: Das muss von aussen eleminiert werden.
      CLEAR <itmp>-stock-doccat.

      " Batch check is redesigned here
      " as Note 2832339 delivers a check in PACK_STOCK with error messages
      " which are visible during IDN activation instead of a side effect error caused by the check here
      " also docu batch is not relevant for packing so the old check was incorrect
      CHECK ev_batch_initial IS REQUESTED. " only for the planned stock packing UI

*     check if the batch of an item is initial. This items are
*     not relevant for packing.

      ls_qty = <itmp>-item->get_qty( ).
      IF <itmp>-stock-batchid IS INITIAL AND
         <itmp>-batchno IS INITIAL AND
         NOT <itmp>-stock-matid IS INITIAL AND
         ls_qty-qty NE 0.
        TRY.
            CALL FUNCTION '/SCWM/MATERIAL_READ_SINGLE'
              EXPORTING
                iv_matid       = <itmp>-stock-matid
                iv_lgnum       = iv_lgnum
                iv_entitled    = <itmp>-stock-entitled
              IMPORTING
                es_mat_global  = ls_mat_global.

          CATCH /scwm/cx_md.
*          fatal error.
              MESSAGE x049(/scwm/ui_packing).
          ENDTRY.

*       Batch required if either batch requirement is switched on for material
*       or documentary batch switched on for material and itemtype
        IF ls_mat_global-batch_req IS NOT INITIAL.
*          if sub-items exist this is ok. Do not fill ev_batch_initial.
          CLEAR lt_item_hier.
          CALL METHOD <itmp>-item->get_hierarchy_sub_tree
            IMPORTING
              et_hierarchy = lt_item_hier.
          READ TABLE lt_item_hier TRANSPORTING NO FIELDS INDEX 2.
          IF NOT sy-subrc IS INITIAL.
*            there is no sub-item. Hence the batchid in the delivery-item
*            is missing and must be entered before packing
            ev_batch_initial = 'X'.
          ENDIF.
        ENDIF.
      ENDIF.
    ENDLOOP.

  ENDIF.

ENDMETHOD.


METHOD INIT_RF.
  DATA: ls_sel TYPE rsdsselopt,
        lt_sel_docid TYPE rseloption,
        lt_sel_doccat TYPE rseloption,
        ls_docid TYPE /scwm/dlv_docid_item_str,
        ls_itmp TYPE /scwm/dlv_hu_prd_str,
        ls_matidx TYPE gtype_s_matidx,
        lt_huhdr TYPE /scwm/tt_huhdr_int,
        lt_huitm TYPE /scwm/tt_huitm_int,
        lt_dlvkey TYPE /scdl/af_hum_data_tab,
        ls_dlvkey TYPE /scdl/af_hum_data_str,
        lt_docid TYPE /scwm/tt_docid,
        ls_read_dlv TYPE gtype_s_read_dlv,
        ls_mat_global TYPE /scwm/s_material_global,
        ls_mat_lgnum TYPE /scwm/s_material_lgnum,
        lt_item_hier TYPE /scdl/dl_hierarchy_h_tab,
        lt_itmp TYPE /scwm/dlv_hu_prd_tab,
        lv_root TYPE /scdl/dl_itemid,
        lv_itemtype TYPE /scdl/dl_itemtype,
        lv_dbatch_rel TYPE /scwm/dl_dbatch_rel,
        lv_appl_proc TYPE /scwm/de_blocappl_proc,
        lo_tm_perf         TYPE REF TO /scwm/if_tm_perf,
        lv_hu_single_item_proc  TYPE boole_d,
        lv_single_item_changed  TYPE boole_d.

  FIELD-SYMBOLS: <itmp> TYPE /scwm/dlv_hu_prd_str.

  DATA: lo_prd2hum TYPE REF TO /scwm/cl_dlv_prd2hum.

  DATA  lo_insp_manager    TYPE REF TO CL_QIE_INSPECTION_MANAGER.
  DATA  lo_insp_doc        TYPE REF TO cl_qie_inspection_document.
  DATA  lv_skip            TYPE        qie_tv_skip.
  DATA  lo_qinsp           TYPE REF TO /scwm/if_af_qinsp_int.

  IF it_docid IS INITIAL.
    RETURN.
  ENDIF.

  gv_no_quan_check = iv_no_quan_check.

  CREATE OBJECT lo_prd2hum.

  CALL METHOD refresh_and_init
    EXPORTING
      iv_lgnum      = iv_lgnum
      iv_no_refresh = iv_no_refresh
    EXCEPTIONS
      OTHERS        = 99.
  IF sy-subrc <> 0.
*todo    RAISE error.
  ENDIF.
  IF iv_doccat IS INITIAL.
    gv_doccat = /scdl/if_dl_doc_c=>sc_doccat_inb_prd.
  ELSE.
    gv_doccat = iv_doccat.
  ENDIF.

  CALL METHOD read_delivery_rf
    EXPORTING
      iv_lgnum        = iv_lgnum
      it_docid        = it_docid
      iv_doccat       = iv_doccat
      iv_lock         = iv_lock_dlv
    IMPORTING
      ev_foreign_lock = ev_foreign_lock
      et_doc_lock     = et_doc_lock.

  gv_lgnum = iv_lgnum.

  IF NOT iv_lock_dlv IS INITIAL.
   CHECK ev_foreign_lock IS INITIAL.
  ENDIF.

  IF iv_partial IS INITIAL.
    REFRESH gt_itmp.
  ENDIF.
  IF NOT it_docid IS INITIAL.
    LOOP AT it_docid INTO ls_docid.
      ls_dlvkey-doccat = ls_docid-doccat.
      ls_dlvkey-docid  = ls_docid-docid.
      ls_dlvkey-itemid = ls_docid-itemid.
      APPEND ls_dlvkey TO lt_dlvkey.
    ENDLOOP.

*   Performance improvement: only those HUs should be read for which item instances
*   exist. Even if we work with the complete document, the retrival of the HU data via
*   ITEMIDs is not worse than selecting by DOCID only
    CLEAR lv_single_item_changed.
    TRY.
      lo_tm_perf ?= /scwm/cl_tm_factory=>get_service( /scwm/cl_tm_factory=>sc_perf ).
      CATCH /scwm/cx_tm_factory. "#EC NO_HANDLER
    ENDTRY.
    IF lo_tm_perf IS BOUND.
*     remember single processing infos (to reset it at the end).
      lo_tm_perf->get_info_dlv( IMPORTING ev_single_item = lv_hu_single_item_proc ).
*     set single item processing for HU reading
      lo_tm_perf->set_info_dlv( EXPORTING iv_single_item = abap_true ).
      lv_single_item_changed = abap_true.
    ENDIF.

    CALL METHOD lo_prd2hum->map_hu_dlv
      EXPORTING
        iv_doccat      =  iv_doccat
        it_dlv_data    = lt_dlvkey
        iv_with_object = abap_true
       IMPORTING
         et_hu_dlv = lt_itmp .

    IF lv_single_item_changed = abap_true.
*     set single item processing to the previous value
      lo_tm_perf->set_info_dlv( EXPORTING iv_single_item = lv_hu_single_item_proc ).
    ENDIF.

*   By some customizing settings the just created inpsection document
*   decided automatically. By this, so called SKIP-documents, the
*   inspection document ID shouldn't be written into the sctock item.
*   The goods are not moved into the quality inspection workcenter and
*   the item is not disconnected from INSPID (INSPTYP) while follow-up
*   action doesn't take place. Therefore we don't write the INPSID(INSPTYP)
*   into the stock by SKIP-document.
    LOOP AT lt_itmp ASSIGNING <itmp>.
     IF <itmp>-stock-inspid is not initial.
        lo_qinsp = /scwm/cl_qdoc=>get_instance( ).
        TRY.
            CALL METHOD lo_qinsp->get_qinsp_is_skip
              EXPORTING
                iv_qinspid = <itmp>-stock-inspid
              IMPORTING
                ev_skip    = lv_skip.
          CATCH /scwm/cx_qinsp .
        ENDTRY.

      IF lv_skip is not initial.
       CLEAR <itmp>-stock-insptyp.
       CLEAR <itmp>-stock-inspid.
        ENDIF.
      ENDIF.
    ENDLOOP.

    IF iv_partial IS INITIAL.
      gt_itmp = lt_itmp.
    ELSE.
      LOOP AT gt_itmp ASSIGNING <itmp>.
        READ TABLE it_docid TRANSPORTING NO FIELDS WITH KEY
                           docid = <itmp>-prd_id.
        IF sy-subrc IS INITIAL.
          DELETE gt_itmp.
          CONTINUE.
        ENDIF.
      ENDLOOP.
      APPEND LINES OF lt_itmp TO gt_itmp.
    ENDIF.
    SORT gt_itmp BY stock-qdocid stock-qitmid..
    LOOP AT gt_itmp ASSIGNING <itmp>.
      <itmp>-stock-qdocid = <itmp>-prd_id.
      <itmp>-stock-qitmid = <itmp>-item_id.
* todo: Das muss von aussen eleminiert werden.
      CLEAR <itmp>-stock-doccat.
*     check if the batch of an item is initial. This items are
*     not relevant for packing.
      IF <itmp>-stock-batchid IS INITIAL AND
         <itmp>-batchno IS INITIAL AND
         NOT <itmp>-stock-matid IS INITIAL.
        TRY.
            CALL FUNCTION '/SCWM/MATERIAL_READ_SINGLE'
              EXPORTING
                iv_matid      = <itmp>-stock-matid
                iv_lgnum      = iv_lgnum
                iv_entitled    = <itmp>-stock-entitled
              IMPORTING
                es_mat_global  = ls_mat_global
                es_mat_lgnum   = ls_mat_lgnum
                ev_applic_proc = lv_appl_proc.
          CATCH /scwm/cx_md.
*          fatal error.
            MESSAGE x049(/scwm/ui_packing).
        ENDTRY.

        IF ls_mat_lgnum-docbatch IS NOT INITIAL.
*       Get delivery customizing for documentary batches
          CALL METHOD <itmp>-item->get_itemtype
            RECEIVING
              ev_itemtype = lv_itemtype.

          TRY.
              CALL METHOD /scwm/cl_dlv_batch=>check_item_dbatch
                EXPORTING
                  iv_itemtype   = lv_itemtype
                  iv_doccat     = <itmp>-doccat_prd
                RECEIVING
                  rv_dbatch_rel = lv_dbatch_rel.
            CATCH /scwm/cx_dlv_conf.
*          fatal error.
            MESSAGE x049(/scwm/ui_packing).
          ENDTRY.

        ENDIF.

        IF ls_mat_lgnum-docbatch IS NOT INITIAL AND
           lv_dbatch_rel IS NOT INITIAL.
          ev_docu_batch = abap_true.
        ENDIF.

*       Batch required if either batch requirement is switched on for material
*       or documentary batch switched on for material and itemtype
        IF ls_mat_global-batch_req IS NOT INITIAL OR
           ( ls_mat_lgnum-docbatch IS NOT INITIAL AND
             lv_dbatch_rel IS NOT INITIAL ).
*          if sub-items exist this is ok. Do not fill ev_batch_initial.
          clear lt_item_hier.
          CALL METHOD <itmp>-item->get_hierarchy_sub_tree
            IMPORTING
              et_hierarchy = lt_item_hier.
          READ TABLE lt_item_hier TRANSPORTING NO FIELDS INDEX 2.
          IF NOT sy-subrc IS INITIAL.
*            there is no sub-item. Hence the batchid in the delivery-item
*            is missing and must be entered before packing
            ev_batch_initial = 'X'.
          ENDIF.
          DELETE gt_itmp.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDIF.

ENDMETHOD.


method PACK_BY_ITEM_NO.

 DATA: ls_itmp TYPE /scwm/dlv_hu_prd_str,
       ls_pack_stock type /scwm/s_pack_stock.

 read table gt_itmp into ls_itmp with key
            prd_no = iv_docno
            item_no = iv_itmno.

 move-corresponding ls_itmp-stock to ls_pack_stock.
 ls_pack_stock-qdocid = ls_itmp-prd_id.
 call method pack_stock
   exporting
     iv_dest_hu  = iv_dest_hu
     is_material = ls_pack_stock
     is_quantity = is_quantity
   importing
     es_quantity = es_quantity
   EXCEPTIONS
     error        = 1
     OTHERS       = 2.
 IF sy-subrc <> 0.
   RAISE error.
 ENDIF.

endmethod.


  METHOD PACK_PROPOSAL.

    TYPES: BEGIN OF packitem.
             INCLUDE TYPE /scwm/s_packitem_int.
    TYPES:   cwunit TYPE /scwm/de_cwunit.
    TYPES:  END OF packitem.


    DATA: ls_dlv_item          TYPE /scwm/dlv_docid_item_str,
          ls_ps_autopack       TYPE /scwm/s_ps_autopack,
          ls_header_bc         TYPE /scdl/dl_dtype_detail_str,
          lt_header_bc         TYPE /scdl/dl_dtype_detail_tab,
          lo_saf               TYPE REF TO /scdl/cl_af_management,
          lo_bus_conf          TYPE REF TO /scdl/if_af_business_conf,
          ls_doctypekeys       TYPE /scdl/dl_doctype_extkey_str,
          lt_doctypekeys       TYPE /scdl/dl_doctype_extkey_tab,
          lv_dummymsg          TYPE  char1,
          ls_partyloc_from     TYPE /scdl/dl_partyloc_str,
          ls_item_addin        TYPE /scwm/db_item_data,
          ls_partyloc_wh       TYPE /scdl/dl_partyloc_str,
          lo_item_prd_wme      TYPE REF TO /scwm/cl_dl_item_prd,
          lt_levels            TYPE /scwm/tt_ps_level_int,
          lt_packspec          TYPE /scwm/tt_guid_ps,
          ls_pack              TYPE /scwm/s_packitem,
          ls_mat               TYPE /scwm/s_humat_int,
          ls_ps_id             TYPE /scwm/s_ps_header_key,
          ls_packen            TYPE packitem,
          lv_loguom            LIKE ls_packen-meins,
          lt_packspecification TYPE /SCWM/tt_PACKSPEC_NESTED,
          ls_packspec_header   TYPE /scwm/s_ps_header_int,
          lv_hu_counter        TYPE int8 VALUE IS INITIAL,
          ls_pack_open         TYPE packitem,

          ls_hu_prop           TYPE /scwm/s_hu_proposal,
          lo_hu_prop           TYPE REF TO /scwm/cl_dlv_hu_proposal,
          ls_hu_prop_hdr       TYPE /scwm/s_hu_proposal_hdr,
          ls_main              TYPE /scwm/s_hu_main_data.


    READ TABLE it_free INTO DATA(ls_itmp) INDEX 1.

    REFRESH: lt_doctypekeys.
    CLEAR ls_header_bc.
    ls_doctypekeys-type      = ls_itmp-prd->get_doctype( ).
    ls_doctypekeys-category  = ls_itmp-prd->get_doccat( ).
    APPEND ls_doctypekeys TO lt_doctypekeys.

    lo_saf = /scdl/cl_af_management=>get_instance( ).
    TRY.
        lo_bus_conf ?= lo_saf->get_service(
        /scdl/if_af_management_c=>sc_business_conf ).
      CATCH /scdl/cx_af_management.
        "must not happen
        ASSERT 1 = 2.
    ENDTRY.

    TRY.
* l   Customozing
        lo_bus_conf->get_header_bc_by_type_multi(
           EXPORTING it_header_extkey = lt_doctypekeys
           IMPORTING et_dtype         = lt_header_bc ).
      CATCH /scdl/cx_af_business_conf ##NO_HANDLER.
*     errors handled below when processing the headers
    ENDTRY.
    READ TABLE lt_header_bc  INTO ls_header_bc WITH KEY
      type     = ls_itmp-prd->mv_doctype
      category = ls_itmp-prd->mv_doccat BINARY SEARCH.
    IF sy-subrc <> 0 OR ls_header_bc-dlvap IS INITIAL OR
      ( NOT ls_header_bc-dlvap_ind IS INITIAL AND
        gv_online = abap_false ).
      MESSAGE ID '/SCWM/DELIVERY'
*           failure within autopack should not prevent IDR
*           from beeing activated
              TYPE /scdl/cl_dm_message=>sc_msgty_warning
              NUMBER '055'
          WITH 'DLVAP' ls_itmp-prd->mv_doccat ls_itmp-prd->mv_doctype
              INTO lv_dummymsg.
      go_log->add_message( ).
      RETURN.
    ENDIF.

*   stock
    ls_ps_autopack-stock = ls_itmp-stock.
    ls_ps_autopack-det-pak_matid = ls_itmp-stock-matid.
    ls_ps_autopack-det-pak_cntry = ls_itmp-stock-coo.


*   Partner ship-from
    ls_partyloc_from = /scwm/cl_dlv_field_det=>get_partyloc(
       io_header = ls_itmp-prd
       io_item = ls_itmp-item
       iv_party_role = ls_header_bc-pack_role ).
    ls_ps_autopack-det-pak_ship_from = ls_partyloc_from-partyno.

*   additional data
    lo_item_prd_wme ?= ls_itmp-item->get_addin(
          iv_addin_id = /scwm/cl_im_dl_docdata=>sv_addin_id ).

    ls_item_addin = lo_item_prd_wme->get_data( ).
    ls_ps_autopack-det-pak_dist_group = ls_item_addin-dstgrp.

*   warehouse number
    ls_partyloc_wh = /scwm/cl_dlv_field_det=>get_partyloc(
        io_header = ls_itmp-prd
        io_item = ls_itmp-item
        iv_party_role = /scdl/if_dl_partyloc_c=>sc_party_role_wh ).
    ls_ps_autopack-det-pak_locid  = ls_partyloc_wh-locationid.

*   quantity
    ls_ps_autopack-cond-quantity = ls_itmp-open_qty-qty.
    ls_ps_autopack-cond-unit_q   = ls_itmp-open_qty-uom.


    ls_dlv_item-docid = ls_ps_autopack-stock-qdocid.
    ls_dlv_item-doccat = ls_ps_autopack-stock-qdoccat.
    ls_dlv_item-itemid = ls_ps_autopack-stock-qitmid.

    "Get package specification
    CALL FUNCTION '/SCWM/PS_FIND_AND_EVALUATE'
      EXPORTING
        is_fields       = ls_ps_autopack-det
        iv_procedure    = ls_header_bc-dlvap
        is_condition    = ls_ps_autopack-cond
        i_data          = ls_dlv_item
      IMPORTING
        et_packspec     = lt_packspec
      EXCEPTIONS
        determine_error = 1
        read_error      = 2
        OTHERS          = 3.
    IF sy-subrc <> 0.
      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
        WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4 INTO lv_dummymsg.
      go_log->add_message( ).
      RAISE error.
    ENDIF.

    READ TABLE lt_packspec INTO ls_pack-guid_ps INDEX 1.

* prepare ls_pack
    MOVE-CORRESPONDING ls_itmp-stock TO ls_pack.
    ls_pack-quan = ls_ps_autopack-cond-quantity.
    ls_pack-unit = ls_ps_autopack-cond-unit_q.

    ls_packen = ls_pack.

* convert everything into base unit
    CLEAR ls_mat.
    CALL FUNCTION '/SCWM/HUPRODUCT_READ'
      EXPORTING
        iv_matid    = ls_packen-matid
        iv_unit     = ls_packen-unit
      IMPORTING
        es_mat_item = ls_mat
      EXCEPTIONS
        error       = 1
        OTHERS      = 2.
    IF sy-subrc <> 0.
      MESSAGE ID '/SCWM/HUFUNCTIONS'
*           failure within autopack should not prevent IDR
*           from beeing activated
              TYPE 'E'
              NUMBER '288'
              INTO lv_dummymsg.
      go_log->add_message( ).
      RAISE error.
    ENDIF.
    ls_packen-quan = ls_packen-quan * ls_mat-umrez / ls_mat-umren.
    ls_packen-meins = ls_mat-meins.
    ls_packen-open_quan = ls_packen-quan.
    ls_packen-refmatid = ls_mat-rmatp.
    ls_packen-cwunit = ls_mat-cwunit.

    ls_ps_id-aennr = /scwm/cl_ppelipak_cntl=>gc_activ_version.

    CALL FUNCTION '/SCWM/HUMAIN_DATA_GET'
      IMPORTING
        es_main_data = ls_main.

    IF ls_packen-cwunit IS NOT INITIAL AND ls_main-appl EQ gchu_appl_wme.
      lv_loguom = ls_packen-meins.
    ENDIF.

    ls_pack_open = ls_packen.

    "apply pack spec
    CALL FUNCTION '/SCWM/PS_PACKSPEC_GET'
      EXPORTING
        iv_guid_ps             = ls_packen-guid_ps
        iv_aennr               = ls_ps_id-aennr
        iv_read_elements       = 'X'
        iv_read_dyn_attributes = 'X'
        iv_no_buffer           = 'X'
        iv_loguom              = lv_loguom
      IMPORTING
        es_packspec_header     = ls_packspec_header
        et_packspec_content    = lt_packspecification
      EXCEPTIONS
        OTHERS                 = 99.
    IF sy-subrc <> 0.
      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
        WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4 INTO lv_dummymsg.
      go_log->add_message( ).
      RAISE error.
    ENDIF.

    READ TABLE lt_packspecification INTO DATA(ls_packspec) INDEX 1.
    lt_levels = ls_packspec-levels.

    "Do not allow nested HUs
    DESCRIBE TABLE lt_levels LINES DATA(lv_lines).
    IF lv_lines > 1.
      MESSAGE i770(/scwm/l3) INTO lv_dummymsg.
      go_log->add_message( ).
      RETURN.
    ENDIF.

    READ TABLE lt_levels INTO DATA(ls_level) INDEX 1.
    IF ls_level-hu_create <> 'X'.
      MESSAGE i552(/scwm/hufunctions) WITH ls_packspec_header-ps_id INTO lv_dummymsg.
      go_log->add_message( ).
      RETURN.
    ENDIF.

    IF ls_level-hu_create IS NOT INITIAL AND
     ( ls_level-elementgroup IS INITIAL OR ls_level-hu_matid IS INITIAL ).
      MESSAGE e551(/scwm/hufunctions) WITH ls_level-level_seq ls_level-level_type INTO lv_dummymsg.
      go_log->add_message( ).
      RAISE error.
    ENDIF.

    "Calculate pack qty/ set hu proposal data
    WHILE ls_pack_open-open_quan >= ls_level-trgqty AND ls_level-trgqty <> 0.
      CLEAR ls_hu_prop.
      lv_hu_counter = lv_hu_counter + 1.
      ls_hu_prop-huno = lv_hu_counter.
      ls_pack_open-open_quan = ls_pack_open-open_quan - ls_level-trgqty.
      ls_hu_prop-packqty = ls_level-trgqty.
      ls_hu_prop-buom = ls_pack_open-meins.
      ls_hu_prop-matid = ls_level-hu_matid.
      MOVE-CORRESPONDING ls_pack TO ls_hu_prop-materials.
      APPEND ls_hu_prop TO et_hu_prop.
    ENDWHILE.
    IF ls_pack_open-open_quan > 0.
      CLEAR ls_hu_prop.
      lv_hu_counter = lv_hu_counter + 1.
      ls_hu_prop-huno = lv_hu_counter.
      ls_hu_prop-packqty = ls_pack_open-open_quan.
      ls_hu_prop-buom = ls_pack_open-meins.
      ls_hu_prop-matid = ls_level-hu_matid.
      MOVE-CORRESPONDING ls_pack TO ls_hu_prop-materials.
      APPEND ls_hu_prop TO et_hu_prop.
    ENDIF.

*  "Hu proposal header data (Open qty is 0 as complete qty is packed in proposal)
    ls_hu_prop_hdr-open_quan = 0.
    ls_hu_prop_hdr-uom = ls_itmp-open_qty-uom.
    ls_hu_prop_hdr-hutyp = ls_level-hutyp.
    ls_hu_prop_hdr-hu_mat_text = ls_level-hu_mat_text.
    ls_hu_prop_hdr-hu_mat = ls_level-hu_mat.
    APPEND ls_hu_prop_hdr TO et_hu_prop_hdr.

    es_level = ls_level.
    es_packspec_header = ls_packspec_header.
    ev_altme = ls_itmp-packed_qty_alt-uom.

  ENDMETHOD.


method PRCES_GET.
  data: ls_top type /Scwm/s_huhdr_int.

  CALL FUNCTION '/SCWM/HU_READ'
    EXPORTING
      iv_top     = 'X'
      iv_guid_hu = iv_source
    IMPORTING
      es_huhdr   = ls_top
    EXCEPTIONS
      error      = 1
      OTHERS     = 2.
  if sy-subrc is not initial.
  endif.

  ev_prces = ls_top-prces.

endmethod.


METHOD PRCES_SET.
  DATA: ls_dtop   TYPE /scwm/s_huhdr_int,
        ls_source TYPE /scwm/s_huhdr_int,
        ls_req    TYPE /scwm/s_pack_request.
  DATA: lv_prces  TYPE /scwm/de_prces.
  DATA: lo_badi_ref TYPE REF TO /SCWM/EX_CORE_PSC_PRCES .

  CHECK NOT iv_prces IS INITIAL.

*Step1) read destination top hu
CALL FUNCTION '/SCWM/HU_READ'
    EXPORTING
      iv_top     = 'X'
      iv_guid_hu = iv_dest
    IMPORTING
      es_huhdr   = ls_dtop
    EXCEPTIONS
      error      = 1
      OTHERS     = 2.

  IF sy-subrc IS NOT INITIAL.
* ignore
  ENDIF.

*Step2) badi to determine process
  lv_prces = iv_prces.
  IF NOT ls_dtop-prces IS INITIAL.
    IF NOT iv_source IS INITIAL.
      ls_req-sguid_hu = iv_source.
      ls_req-dguid_hu = iv_dest.
*      ls_req-flghuto   = 'X'.
    ELSE.
      ls_req = is_request.
    ENDIF.
    ls_req-prces = iv_prces.

    TRY.
        GET BADI lo_badi_ref
          FILTERS
            lgnum = gv_lgnum.
        CALL BADI lo_badi_ref->huhdr_prces
          EXPORTING
            is_request = ls_req
            is_huhdr   = ls_dtop
          IMPORTING
            ev_prces   = lv_prces.
      catch cx_badi.
    ENDTRY.
  ENDIF.
*Step 3) set process  in destination hu
  IF lv_prces <> ls_dtop-prces.
    ls_dtop-prces = lv_prces.
    CALL METHOD change_huhdr
      EXPORTING
        is_huhdr = ls_dtop
      EXCEPTIONS
        error    = 1.
    if not sy-subrc is initial.
*    why do we ignore in this method the errors???
    endif.
  ENDIF.

  CHECK NOT iv_source IS INITIAL.
* step 4) delete process in source hu
  CALL FUNCTION '/SCWM/HUHEADER_READ'
    EXPORTING
      iv_guid_hu  = iv_source
    IMPORTING
      es_huheader = ls_source
    EXCEPTIONS
      OTHERS      = 99.
  IF sy-subrc IS NOT INITIAL.
* ignore
  ENDIF.

  CHECK NOT ls_source-prces IS INITIAL.
  CLEAR: ls_source-prces.
  CALL METHOD change_huhdr
    EXPORTING
      is_huhdr = ls_source
    EXCEPTIONS
      error    = 1.
  if not sy-subrc is initial.
*    why do we ignore in this method the errors???
  endif.
ENDMETHOD.


METHOD PREPARE_HU_FOR_REJECT.
  DATA:
          lt_huhdr        TYPE /scwm/tt_huhdr_int,
          lt_huhdr2       TYPE /scwm/tt_huhdr_int,
          lt_huitm        TYPE /scwm/tt_huitm_int,
          ls_huhdr        TYPE /scwm/s_huhdr_int,
          ls_huhdr2       TYPE /scwm/s_huhdr_int,
          ls_huitm        TYPE /scwm/s_huitm_int,
          lv_guidhu       TYPE /scwm/guid_hu,
          lv_success      TYPE abap_bool.

  CONSTANTS: incompletion_status TYPE crm_j_status VALUE 'IHUS6'. "SPCD- uncomplete and cross-delivery

* Get all HU-s for the processed deliveries, and lock them all
  CALL FUNCTION '/SCWM/DLV_GET_HUS_FOR_DELIVERY'
    EXPORTING
      iv_doccat  = iv_doccat
      it_docid   = it_docid
      iv_lgnum   = iv_lgnum
      iv_lock_hu = abap_true
    IMPORTING
      et_huhdr   = lt_huhdr
      et_huitm   = lt_huitm
    EXCEPTIONS
      error      = 1
      OTHERS     = 2.

  IF sy-subrc EQ 0.
    SORT lt_huhdr BY top DESCENDING bottom ASCENDING.

    LOOP AT lt_huhdr INTO ls_huhdr.
* Process all HU-s and check whether they have IHUS6 status set
      CALL FUNCTION 'CRM_STATUS_CHECK'
        EXPORTING
          objnr             = ls_huhdr-guid_hu
          status            = incompletion_status
        EXCEPTIONS
          object_not_found  = 1
          status_not_active = 2
          OTHERS            = 3.

      CHECK sy-subrc IS INITIAL.
* If they have the status, make it inactive, so the HU can be prcessed
      CALL METHOD me->/scwm/if_pack_bas~status_set_direct
        EXPORTING
          iv_hu               = ls_huhdr-guid_hu
          iv_status           = incompletion_status
          iv_inactive         = 'X'
        EXCEPTIONS
          error               = 1
          already_set_deleted = 2
          OTHERS              = 3
              .

      CHECK sy-subrc IS INITIAL.
      APPEND ls_huhdr TO lt_huhdr2. "collect the HU-s processed
    ENDLOOP.

    IF lt_huhdr2 IS NOT INITIAL.
*     It is not enough to set the status, I have to update global table GT_XHUHDR of function group /SCWM/HUMAIN as well,
*      since fields NO_QUAN_CHANGES, NO_ATTR_CHANGES, NO_MOVE are already set based on the incompletion status
      LOOP AT lt_huhdr INTO ls_huhdr.
        CLEAR lv_success.
        ls_huhdr2 = ls_huhdr.
*       Here I have an assumption, that perhaps not all the HU-s in the nested hierarchy has the incompletion status set
*           but if the higher level HU has the incompletion status set, the lower level ones inside also cannot be processed
*           therefore GT_XHUHDR should be updated for the lower level HU as well
        DO 300 TIMES. "300 level nesting should be enough
          READ TABLE lt_huhdr2 WITH KEY guid_hu = ls_huhdr2-guid_hu TRANSPORTING NO FIELDS.
          IF sy-subrc EQ 0.
            lv_success = abap_true.
            EXIT.
          ENDIF.
          lv_guidhu = ls_huhdr2-higher_guid.
          IF lv_guidhu = ls_huhdr-guid_hu.
            lv_success = abap_false. " it should not happen
            EXIT.
          ENDIF.
          IF lv_guidhu IS NOT INITIAL.
            READ TABLE lt_huhdr INTO ls_huhdr2 WITH KEY guid_hu = lv_guidhu.
            IF sy-subrc NE 0.
              lv_success = abap_false.
              EXIT.
            ENDIF.
            CONTINUE. "check whether the higher level HU has the incompletion status
          ELSE.
            lv_success = abap_false.
            EXIT.
          ENDIF.
        ENDDO.

        CHECK lv_success IS NOT INITIAL.

        CLEAR: ls_huhdr-no_quan_changes, ls_huhdr-no_attr_changes, ls_huhdr-no_move.

        CALL FUNCTION '/SCWM/HUHDR_INT_UPDATE'
          EXPORTING
            is_huhdr  = ls_huhdr
          EXCEPTIONS
            not_found = 1
            error     = 2
            OTHERS    = 3.

        CHECK sy-subrc IS INITIAL.
      ENDLOOP.
    ENDIF.
  ENDIF.
ENDMETHOD.


METHOD READ_DELIVERY.
  DATA: lt_dockey TYPE /scwm/dlv_docid_item_tab,
        ls_dockey TYPE /scwm/dlv_docid_item_str,
        ls_docid TYPE /scwm/s_docid,
        ls_read_options TYPE /scwm/dlv_query_contr_str,
        lo_prd TYPE REF TO /scwm/cl_dlv_management_prd,
        ls_exclude TYPE /scwm/dlv_query_excl_str.

  DATA: lt_dlv_hdr TYPE /scwm/dlv_header_out_prd_tab,
        lo_message TYPE REF TO /scwm/cl_dm_message_no,
        lt_message TYPE /scdl/dm_message_tab,
        ls_message TYPE /scdl/dm_message_str,
        ls_read_dlv TYPE gtype_s_read_dlv,
        lv_request TYPE sytabix,
        lv_result TYPE sytabix,
        lv_sev TYPE char1,
        lx_filter type /scwm/s_pack_view_filter.

  DATA: lt_dlv_sel TYPE /scwm/dlv_selection_tab,
        ls_dlv_sel TYPE /scwm/dlv_selection_str,
        ls_doc_lock type /SCWM/S_DOCNO.


  FIELD-SYMBOLS: <dlv_hdr> TYPE /scwm/dlv_header_out_prd_str.

  refresh: gt_read_dlv.

  ls_read_options-lock_result = iv_lock.

  ls_exclude-head_partyloc     = abap_true.
  ls_exclude-head_date         = abap_true.
  ls_exclude-head_addmeas      = abap_true.
  ls_exclude-head_status       = abap_true.
  ls_exclude-head_refdoc       = abap_true.
  ls_exclude-head_transport    = abap_true.
  ls_exclude-head_text         = abap_true.
  ls_exclude-head_textline     = abap_true.
  ls_exclude-item_partyloc     = abap_true.
  ls_exclude-item_dates        = abap_true.
  ls_exclude-item_status       = abap_true.
  ls_exclude-item_refdoc       = abap_true.
  ls_exclude-item_splittab     = abap_true.
  ls_exclude-item_docflow      = abap_true.
  ls_exclude-item_text         = abap_true.
  ls_exclude-item_textline     = abap_true.
  ls_exclude-item_hierarchy    = abap_true.
  ls_exclude-item_serialn      = abap_true.

  ls_dockey-doccat = iv_doccat.
  LOOP AT it_docid INTO ls_docid.
    ls_dockey-docid = ls_docid-docid.
    APPEND ls_dockey TO lt_dockey.
  ENDLOOP.

  TRY.
      CREATE OBJECT lo_prd.
      CALL METHOD lo_prd->query
        EXPORTING
          it_docid        = lt_dockey
          it_selection    = lt_dlv_sel
          is_read_options = ls_read_options
          IS_EXCLUDE_DATA = ls_exclude
        IMPORTING
          et_headers      = lt_dlv_hdr
          eo_message      = lo_message.
    CATCH /scdl/cx_delivery .
      lt_message = lo_message->get_messages( ).
      LOOP AT lt_message INTO ls_message.
        IF ls_message-msgty = 'E'.
          lv_sev = 'E'.
        ENDIF.
        CALL METHOD go_log->add_message
          EXPORTING
            ip_msgty = ls_message-msgty
            ip_msgid = ls_message-msgid
            ip_msgno = ls_message-msgno
            ip_msgv1 = ls_message-msgv1
            ip_msgv2 = ls_message-msgv2
            ip_msgv3 = ls_message-msgv3
            ip_msgv4 = ls_message-msgv4.
      ENDLOOP.
      IF lv_sev = 'E'.
        EXIT.
      ENDIF.
  ENDTRY.

  LOOP AT lt_dlv_hdr ASSIGNING <dlv_hdr>.
    ls_read_dlv-docid = <dlv_hdr>-docid.
    ls_read_dlv-locked = <dlv_hdr>-changeable.
    if not iv_lock is initial and <dlv_hdr>-changeable is initial.
      ev_foreign_lock = 'X'.
      message I098(/scwm/ui_packing) with <dlv_hdr>-docno
               into gs_message.
      go_log->add_message( ).
      ls_doc_lock = <dlv_hdr>-docno.
      append ls_doc_lock to et_doc_lock.
    else.
      ls_docid-docid = <dlv_hdr>-docid.
      append ls_docid to lx_filter-t_docid.
    endif.
    APPEND ls_read_dlv TO gt_read_dlv.
  ENDLOOP.

* fill filter of the view.
  lx_filter-fltr_docid = 'X'.
  call method /scwm/cl_pack_view=>set_filter
    exporting
      ix_filter = lx_filter.

ENDMETHOD.


METHOD READ_DELIVERY_RF.
  DATA: lt_dlv_hdr      TYPE /scwm/dlv_header_out_prd_tab,
        lt_message      TYPE /scdl/dm_message_tab,
        lt_dlv_sel      TYPE /scwm/dlv_selection_tab,
        lt_dlv_items    TYPE /scwm/dlv_item_out_prd_tab.

  DATA: ls_docid        TYPE /scwm/s_docid,
        ls_read_options TYPE /scwm/dlv_query_contr_str,
        ls_message      TYPE /scdl/dm_message_str,
        ls_read_dlv     TYPE gtype_s_read_dlv,
        ls_dlv_sel      TYPE /scwm/dlv_selection_str,
        ls_filter       TYPE /scwm/s_pack_view_filter,
        ls_doc_lock     TYPE /scwm/s_docno.

  DATA: lv_sev          TYPE char1.

  DATA: lo_prd          TYPE REF TO /scwm/cl_dlv_management_prd,
        lo_message      TYPE REF TO /scwm/cl_dm_message_no.

  FIELD-SYMBOLS: <dlv_hdr>        TYPE /scwm/dlv_header_out_prd_str.

  REFRESH: gt_read_dlv.

  ls_read_options-lock_result = iv_lock.
  ls_read_options-keys_only   = abap_true.
  ls_read_options-item_part_select = abap_true.

  TRY.
      CREATE OBJECT lo_prd.
      CALL METHOD lo_prd->query
        EXPORTING
          it_docid        = it_docid
          it_selection    = lt_dlv_sel
          is_read_options = ls_read_options
        IMPORTING
          et_headers      = lt_dlv_hdr
          et_items        = lt_dlv_items
          eo_message      = lo_message.
    CATCH /scdl/cx_delivery .
      lt_message = lo_message->get_messages( ).
      LOOP AT lt_message INTO ls_message.
        IF ls_message-msgty = 'E'.
          lv_sev = 'E'.
        ENDIF.
        CALL METHOD go_log->add_message
          EXPORTING
            ip_msgty = ls_message-msgty
            ip_msgid = ls_message-msgid
            ip_msgno = ls_message-msgno
            ip_msgv1 = ls_message-msgv1
            ip_msgv2 = ls_message-msgv2
            ip_msgv3 = ls_message-msgv3
            ip_msgv4 = ls_message-msgv4.
      ENDLOOP.
      IF lv_sev = 'E'.
        EXIT.
      ENDIF.
  ENDTRY.

  LOOP AT lt_dlv_hdr ASSIGNING <dlv_hdr>.
    ls_read_dlv-docid = <dlv_hdr>-docid.
    ls_read_dlv-locked = <dlv_hdr>-changeable.
    IF NOT iv_lock IS INITIAL AND <dlv_hdr>-changeable IS INITIAL.
      ls_doc_lock = <dlv_hdr>-docno.
      APPEND ls_doc_lock TO et_doc_lock.
    ELSE.
      ls_docid-docid = <dlv_hdr>-docid.
      APPEND ls_docid TO ls_filter-t_docid.
    ENDIF.
    APPEND ls_read_dlv TO gt_read_dlv.
  ENDLOOP.

  CLEAR ev_foreign_lock.
  IF NOT iv_lock IS INITIAL.
    READ TABLE lt_dlv_items WITH KEY changeable = '' TRANSPORTING NO FIELDS.
    IF sy-subrc IS INITIAL.
      ev_foreign_lock = abap_true.
    ENDIF.
  ENDIF.

* fill filter of the view.
  ls_filter-fltr_docid = 'X'.
  CALL METHOD /scwm/cl_pack_view=>set_filter
    EXPORTING
      ix_filter = ls_filter.

ENDMETHOD.


method REFRESH_AND_INIT.
  if iv_no_refresh is initial.
    refresh: GT_ITMP.
  endif.
  clear: gv_doccat, gv_lgnum.
  if iv_no_refresh is initial.
    CALL FUNCTION '/SCWM/DLV_GET_HUS_FOR_DELIVERY'
      EXPORTING
        IV_INIT = 'X'
      EXCEPTIONS
        ERROR   = 1
        OTHERS  = 2.
    IF SY-SUBRC <> 0.
*  cannot happen in this case.
    ENDIF.
  endif.

  CALL METHOD SUPER->REFRESH_AND_INIT
    EXPORTING
      IV_LGNUM      = iv_lgnum
      IT_GUID_HU    = it_guid_hu
      iv_no_refresh = iv_no_refresh
    IMPORTING
      ET_HUTREE     = et_hutree
      ET_HUHDR      = et_huhdr
      ET_HUITM      = et_huitm
    EXCEPTIONS
      ERROR         = 1
      others        = 2.
  IF SY-SUBRC <> 0.
    raise error.
  ENDIF.
endmethod.


method REFRESH_GM.
 refresh: GT_READ_DLV,
          GT_ITMP.
 clear: gv_doccat, gv_lgnum.
  CALL FUNCTION '/SCWM/DLV_GET_HUS_FOR_DELIVERY'
    EXPORTING
      IV_INIT           = 'X'
    EXCEPTIONS
      ERROR             = 1
      OTHERS            = 2
            .
  IF SY-SUBRC <> 0.
*  cannot happen in this case.
  ENDIF.

endmethod.


  METHOD SET_REPACK_COLLECTIVE_HU.

    gv_allow_repack_collective_hu = iv_repack.

  ENDMETHOD.


method UPDATE_QSAMPLE.
  data: lt_huhdr type /scwm/tt_huhdr_int,
        lt_huitm type /scwm/tt_huitm_int.
  CALL METHOD /scwm/cl_dlv_pack_ibdl=>get_hus_for_delivery
    EXPORTING
      IV_DOCCAT = iv_doccat
      it_docid  = it_docid
      iv_lgnum  = iv_lgnum
    IMPORTING
      ET_HUHDR  = lt_huhdr
      ET_HUITM  = lt_huitm
    EXCEPTIONS
      ERROR     = 1
      others    = 2.
  IF sy-subrc <> 0.
    MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
               WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4
               into gs_message.
    go_log->add_message( ).
    raise error.
  ENDIF.


  CALL METHOD /SCWM/CL_QDOC=>INSP_DOCS_SET_CONTAINER
    EXPORTING
      IT_HUITEMS = lt_huitm.


endmethod.
ENDCLASS.
