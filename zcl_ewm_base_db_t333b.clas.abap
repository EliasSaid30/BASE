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
class ZCL_EWM_BASE_DB_T333B definition
  public
  final
  create public .

public section.

  class-methods GET
    importing
      !IV_TRART type /SCWM/LVS_TRART
      !IV_LANGU type SYST_LANGU default SY-LANGU
    returning
      value(RS_T333B) type /SCWM/T333B
    raising
      ZCX_EWM_BASE_DB .
  class-methods GET_INSTANCE
    returning
      value(RR_T333B) type ref to ZCL_EWM_BASE_DB_T333B .
  class-methods GET_MULTI
    importing
      !IT_TRART type /SCWM/TT_SEL_TRART
      !IV_LANGU type SYST_LANGU default SY-LANGU
    returning
      value(RT_T333B) type ZEWM_TT_T333B
    raising
      ZCX_EWM_BASE_DB .
  class-methods READ
    importing
      !IT_TRART type /SCWM/TT_SEL_TRART
      !IV_LANGU type SYST_LANGU default SY-LANGU
    returning
      value(RT_T333B) type ZEWM_TT_T333B
    raising
      ZCX_EWM_BASE_DB .
protected section.
private section.

  data GT_TRART type ZEWM_TT_T333B .
  class-data SR_T333B type ref to ZCL_EWM_BASE_DB_T333B .
ENDCLASS.



CLASS ZCL_EWM_BASE_DB_T333B IMPLEMENTATION.


 METHOD get.
*----------------------------------------------------------------------*
* Title  MTHD GET
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : Alaedhin Díaz
*----------------------------------------------------------------------*
* Program description:
* Get single process category
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================
  DATA:
    lr_buffer              TYPE REF TO zcl_ewm_base_db_t333b,

    lt_trart               TYPE /scwm/tt_sel_trart,
    lt_t333b               TYPE zewm_tt_t333b,

    ls_t333b               TYPE /scwm/t333b.


*=======================================================================
* Input
*=======================================================================
  lr_buffer = get_instance( ).


*=======================================================================
* CHECK If the data is already local buffered?
*=======================================================================
   READ TABLE  lr_buffer->gt_trart
    INTO rs_t333b
    WITH KEY trart = iv_trart
             spras = iv_langu.
   IF sy-subrc = 0.
     RETURN.
   ENDIF.


*=======================================================================
* READ data
*=======================================================================
    zcl_ewm_base=>range_append_eq(
         EXPORTING
             iv_value = iv_trart
         CHANGING
             ct_range   = lt_trart ).


   lt_t333b = zcl_ewm_base_db_t333b=>read(
                          it_trart = lt_trart
                          iv_langu = iv_langu ).


*=======================================================================
* ADD data to the local Buffer
*=======================================================================
  READ TABLE lt_t333b INTO ls_t333b INDEX 1.

  APPEND ls_t333b TO lr_buffer->gt_trart.


*=======================================================================
* OUTPUT
*=======================================================================
  rs_t333b = ls_t333b.












*
 ENDMETHOD.


METHOD get_instance.
*----------------------------------------------------------------------*
* Title  MTHD GET_INSTANCE
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : Alaedhin Díaz
*----------------------------------------------------------------------*
* Program description:
* Return stored instance, otherwise creates a new one.
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
  IF ( sr_t333b IS NOT BOUND ).
    CREATE OBJECT rr_t333b.
  ENDIF.


*=======================================================================
* GET memorized instance
*=======================================================================

  sr_t333b = rr_t333b.












*
ENDMETHOD.


METHOD get_multi.
*----------------------------------------------------------------------*
* Title  MTHD GET_MULTI
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : Alaedhin Díaz
*----------------------------------------------------------------------*
* Program description:
* Return all process categories description
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================



*=======================================================================
* Input
*=======================================================================

  REFRESH: rt_t333b.


*=======================================================================
* READ data from DB
*=======================================================================
   rt_t333b = read( it_trart = it_trart
                    iv_langu = iv_langu ).













*
ENDMETHOD.


METHOD READ.
*----------------------------------------------------------------------*
* Title MTHD READ
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : Alaedhin Díaz
*----------------------------------------------------------------------*
* Program description:
* Read process category descriptions.
* This method is a copy of WT_TRART_GET_DETAIL from /SCWM/CL_DLV_CHECKDATA
*----------------------------------------------------------------------*

*=======================================================================
* Declaration/Initialization
*=======================================================================
  DATA:
    lt_t333b               TYPE zewm_tt_t333b.


*=======================================================================
* Input
*=======================================================================


*=======================================================================
* READ process category descriptions
*=======================================================================
*HANA CC: BEGIN OF CODE ADJUSTMENT # COARSOLARI # 25.11.2022
*  SELECT *
*    FROM /scwm/t333b
*    INTO TABLE lt_t333b
*          WHERE spras = iv_langu
*    AND trart IN it_trart.

  SELECT *
    FROM /scwm/t333b
    INTO TABLE lt_t333b
          WHERE spras = iv_langu
    AND trart IN it_trart
    ORDER BY PRIMARY KEY.

*HANA CC: END OF CODE ADJUSTMENT # COARSOLARI # 25.11.2022




  IF sy-subrc <> 0 .
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
          textid       = zcx_ewm_base_db=>read_trart.
  ENDIF.


*=======================================================================
* Output
*=======================================================================
  rt_t333b = lt_t333b.












*
ENDMETHOD.
ENDCLASS.
