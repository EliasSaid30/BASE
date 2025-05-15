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
class ZCL_EWM_BASE_DB_PMAT_STG definition
  public
  final
  create public .

public section.

  class-methods READ
    importing
      !IV_LGNUM type /SCWM/LGNUM
      !IT_STG_R type RSELOPTION optional
      !IT_PMAT_R type RSELOPTION optional
      !IM_PMAT_RECEP type BOOLEAN optional
    exporting
      value(ET_PMAT_STG) type RSELOPTION
    raising
      ZCX_EWM_BASE_DB .
protected section.
private section.
ENDCLASS.



CLASS ZCL_EWM_BASE_DB_PMAT_STG IMPLEMENTATION.


METHOD read.
*----------------------------------------------------------------------*
* Title MTHD READ
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. : Indumotora
* Author       : Elias Hernandez
*----------------------------------------------------------------------*
* Program description:
* Read the informacion from table Packing Material in STG
*----------------------------------------------------------------------*
*=======================================================================
* Declaration/Initialization
*=======================================================================
  DATA:
    lt_pmat_stg          TYPE STANDARD TABLE OF zewm_t_pmat_stg.


*=======================================================================
* Input
*=======================================================================
  IF iv_lgnum IS INITIAL AND
     it_stg_r IS INITIAL AND
     it_pmat_r IS INITIAL.
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid = zcx_ewm_base_db=>empty_fields.
  ENDIF.

*=======================================================================
* READ process category
*=======================================================================

  IF im_pmat_recep IS INITIAL.
    SELECT * FROM zewm_t_pmat_stg INTO TABLE lt_pmat_stg
      WHERE  lgnum EQ iv_lgnum    AND
             stg   IN it_stg_r    AND
             pmat  IN it_pmat_r.
  ELSE.
    SELECT * FROM zewm_t_pmat_stg INTO TABLE lt_pmat_stg
      WHERE  lgnum EQ iv_lgnum    AND
             stg   IN it_stg_r    AND
             pmat  IN it_pmat_r   AND
             pmat_recep = im_pmat_recep.
  ENDIF.

  IF sy-subrc <> 0.
    RAISE EXCEPTION TYPE zcx_ewm_base_db
      EXPORTING
        textid = zcx_ewm_base_db=>no_found.
  ENDIF.

  et_pmat_stg = lt_pmat_stg.








*
ENDMETHOD.
ENDCLASS.
