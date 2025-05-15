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
*----------------------------------------------------------------------*
***INCLUDE LZEWM_FG_BASE_DB_TOF01.
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Form change_att_check_custom
*&---------------------------------------------------------------------*
*& Code copied from subroutine change_att_check of include /SCWM/LL03BF15
*& Adjustments can be found using "AGDS" tag
*&---------------------------------------------------------------------*
*&      --> IV_LGNUM
*&      --> IV_SUBST
*&      --> LT_ORDIM
*&      --> IV_UPDATE_TASK
*&      --> IV_COMMIT_WORK
*&      <-- LT_CHANGE
*&---------------------------------------------------------------------*
FORM change_att_check_custom  USING   iv_lgnum  TYPE /scwm/lgnum
                                      iv_subst  TYPE /scwm/rl03tsubst
                                      it_ordim  TYPE /scwm/tt_ordim_o
                                      iv_update_task TYPE /scwm/rl03averbu
                                      iv_commit_work TYPE /scwm/rl03acomit
                             CHANGING ct_change TYPE /scwm/tt_to_change_att_int
                             RAISING  /scwm/cx_core.


  DATA: ls_changed    TYPE /scwm/s_changed.

  FIELD-SYMBOLS: <change> TYPE /scwm/s_to_change_att_int.
  FIELD-SYMBOLS: <ordim>  TYPE /scwm/ordim_o.

  LOOP AT ct_change ASSIGNING <change>.

    READ TABLE it_ordim ASSIGNING <ordim>
         WITH KEY lgnum = iv_lgnum
                  tanum = <change>-tanum.

    IF <ordim>-kzsub = wmegc_kzsub_uebergeben AND iv_subst <> 'X'.

*      PERFORM sub_conf_check USING tap
*                          CHANGING flg_qusub_rel.

*      IF NOT flg_qusub_rel IS INITIAL.
*        MESSAGE e366 WITH <ordim>-tanum INTO gv_msgtext.
*        CALL METHOD go_prot->add_message( ip_row = <change>-seqno
*          ip_field = 'TANUM' ).
*        DELETE ct_change.
*        CONTINUE.
*      ENDIF.
    ENDIF.

    LOOP AT <change>-tt_changed INTO ls_changed.
      CASE ls_changed-fieldname.
        WHEN 'WHO' OR 'HUID' OR 'WCR' OR 'WHOSEQ' OR
             'AAREA' OR 'AREAWHO' OR 'QUEUE' OR 'DIFFSRC' OR
             'KZSUB' OR 'PRIORITY' OR 'REASON' OR 'SOLPO' OR
             'ZEIEI' OR 'QITMID' OR 'RITMID' OR
             'PRSRC' OR 'WTCODE' OR 'CONF_ERROR' OR
             'ORD_CANCEL' OR 'DLOGPOS_EXT_WT'
* INI_AGDS Jun.2020 ->
             or 'DSTGRP'.
* FIN_AGDS Jun.2020 <-
        WHEN 'TOSTAT'.
          IF ls_changed-value_c <> wmegc_to_inactiv AND
             ls_changed-value_c <> wmegc_to_open.
            MESSAGE e005(/scwm/hufunctions) INTO gv_msgtext.
            DELETE <change>-tt_changed.
            CONTINUE.
          ENDIF.
        WHEN  OTHERS.
          MESSAGE e005(/scwm/hufunctions) INTO gv_msgtext.
          DELETE <change>-tt_changed.
          CONTINUE.
      ENDCASE.
    ENDLOOP.

    IF sy-subrc IS NOT INITIAL.
*     no attribute to change
      DELETE ct_change.
    ENDIF.

  ENDLOOP.

* check X-fields
  PERFORM xfeld_pruefen USING iv_subst.
  PERFORM xfeld_pruefen USING iv_update_task.
  PERFORM xfeld_pruefen USING iv_commit_work.

ENDFORM.










*
