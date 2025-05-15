*----------------------------------------------------------------------*
* Title: 
* Copyright (c) 2024 ProLogic LA S.C. All rights reserved
*----------------------------------------------------------------------*
* Project Rel. :Indumotora
* Author : Alberto Magaña
*----------------------------------------------------------------------*
* Program description:
* 
*----------------------------------------------------------------------*
*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZEWM_V_PENH.....................................*
TABLES: ZEWM_V_PENH, *ZEWM_V_PENH. "view work areas
CONTROLS: TCTRL_ZEWM_V_PENH
TYPE TABLEVIEW USING SCREEN '0001'.
DATA: BEGIN OF STATUS_ZEWM_V_PENH. "state vector
          INCLUDE STRUCTURE VIMSTATUS.
DATA: END OF STATUS_ZEWM_V_PENH.
* Table for entries selected to show on screen
DATA: BEGIN OF ZEWM_V_PENH_EXTRACT OCCURS 0010.
INCLUDE STRUCTURE ZEWM_V_PENH.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZEWM_V_PENH_EXTRACT.
* Table for all entries loaded from database
DATA: BEGIN OF ZEWM_V_PENH_TOTAL OCCURS 0010.
INCLUDE STRUCTURE ZEWM_V_PENH.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZEWM_V_PENH_TOTAL.

*...processing: ZEWM_V_PENHVAL..................................*
TABLES: ZEWM_V_PENHVAL, *ZEWM_V_PENHVAL. "view work areas
CONTROLS: TCTRL_ZEWM_V_PENHVAL
TYPE TABLEVIEW USING SCREEN '0002'.
DATA: BEGIN OF STATUS_ZEWM_V_PENHVAL. "state vector
          INCLUDE STRUCTURE VIMSTATUS.
DATA: END OF STATUS_ZEWM_V_PENHVAL.
* Table for entries selected to show on screen
DATA: BEGIN OF ZEWM_V_PENHVAL_EXTRACT OCCURS 0010.
INCLUDE STRUCTURE ZEWM_V_PENHVAL.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZEWM_V_PENHVAL_EXTRACT.
* Table for all entries loaded from database
DATA: BEGIN OF ZEWM_V_PENHVAL_TOTAL OCCURS 0010.
INCLUDE STRUCTURE ZEWM_V_PENHVAL.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZEWM_V_PENHVAL_TOTAL.

*...processing: ZEWM_V_PKEY.....................................*
TABLES: ZEWM_V_PKEY, *ZEWM_V_PKEY. "view work areas
CONTROLS: TCTRL_ZEWM_V_PKEY
TYPE TABLEVIEW USING SCREEN '0003'.
DATA: BEGIN OF STATUS_ZEWM_V_PKEY. "state vector
          INCLUDE STRUCTURE VIMSTATUS.
DATA: END OF STATUS_ZEWM_V_PKEY.
* Table for entries selected to show on screen
DATA: BEGIN OF ZEWM_V_PKEY_EXTRACT OCCURS 0010.
INCLUDE STRUCTURE ZEWM_V_PKEY.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZEWM_V_PKEY_EXTRACT.
* Table for all entries loaded from database
DATA: BEGIN OF ZEWM_V_PKEY_TOTAL OCCURS 0010.
INCLUDE STRUCTURE ZEWM_V_PKEY.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZEWM_V_PKEY_TOTAL.

*...processing: ZEWM_V_PKEY00...................................*
TABLES: ZEWM_V_PKEY00, *ZEWM_V_PKEY00. "view work areas
CONTROLS: TCTRL_ZEWM_V_PKEY00
TYPE TABLEVIEW USING SCREEN '0005'.
DATA: BEGIN OF STATUS_ZEWM_V_PKEY00. "state vector
          INCLUDE STRUCTURE VIMSTATUS.
DATA: END OF STATUS_ZEWM_V_PKEY00.
* Table for entries selected to show on screen
DATA: BEGIN OF ZEWM_V_PKEY00_EXTRACT OCCURS 0010.
INCLUDE STRUCTURE ZEWM_V_PKEY00.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZEWM_V_PKEY00_EXTRACT.
* Table for all entries loaded from database
DATA: BEGIN OF ZEWM_V_PKEY00_TOTAL OCCURS 0010.
INCLUDE STRUCTURE ZEWM_V_PKEY00.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZEWM_V_PKEY00_TOTAL.

*...processing: ZEWM_V_PKFIL....................................*
TABLES: ZEWM_V_PKFIL, *ZEWM_V_PKFIL. "view work areas
CONTROLS: TCTRL_ZEWM_V_PKFIL
TYPE TABLEVIEW USING SCREEN '0004'.
DATA: BEGIN OF STATUS_ZEWM_V_PKFIL. "state vector
          INCLUDE STRUCTURE VIMSTATUS.
DATA: END OF STATUS_ZEWM_V_PKFIL.
* Table for entries selected to show on screen
DATA: BEGIN OF ZEWM_V_PKFIL_EXTRACT OCCURS 0010.
INCLUDE STRUCTURE ZEWM_V_PKFIL.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZEWM_V_PKFIL_EXTRACT.
* Table for all entries loaded from database
DATA: BEGIN OF ZEWM_V_PKFIL_TOTAL OCCURS 0010.
INCLUDE STRUCTURE ZEWM_V_PKFIL.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZEWM_V_PKFIL_TOTAL.

*...processing: ZEWM_V_PVAL.....................................*
TABLES: ZEWM_V_PVAL, *ZEWM_V_PVAL. "view work areas
CONTROLS: TCTRL_ZEWM_V_PVAL
TYPE TABLEVIEW USING SCREEN '0006'.
DATA: BEGIN OF STATUS_ZEWM_V_PVAL. "state vector
          INCLUDE STRUCTURE VIMSTATUS.
DATA: END OF STATUS_ZEWM_V_PVAL.
* Table for entries selected to show on screen
DATA: BEGIN OF ZEWM_V_PVAL_EXTRACT OCCURS 0010.
INCLUDE STRUCTURE ZEWM_V_PVAL.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZEWM_V_PVAL_EXTRACT.
* Table for all entries loaded from database
DATA: BEGIN OF ZEWM_V_PVAL_TOTAL OCCURS 0010.
INCLUDE STRUCTURE ZEWM_V_PVAL.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZEWM_V_PVAL_TOTAL.

*...processing: ZEWM_V_T300.....................................*
TABLES: ZEWM_V_T300, *ZEWM_V_T300. "view work areas
CONTROLS: TCTRL_ZEWM_V_T300
TYPE TABLEVIEW USING SCREEN '0007'.
DATA: BEGIN OF STATUS_ZEWM_V_T300. "state vector
          INCLUDE STRUCTURE VIMSTATUS.
DATA: END OF STATUS_ZEWM_V_T300.
* Table for entries selected to show on screen
DATA: BEGIN OF ZEWM_V_T300_EXTRACT OCCURS 0010.
INCLUDE STRUCTURE ZEWM_V_T300.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZEWM_V_T300_EXTRACT.
* Table for all entries loaded from database
DATA: BEGIN OF ZEWM_V_T300_TOTAL OCCURS 0010.
INCLUDE STRUCTURE ZEWM_V_T300.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZEWM_V_T300_TOTAL.

*.........table declarations:.................................*
TABLES: /SCWM/T300                     .
TABLES: /SCWM/T300T                    .
TABLES: ZEWM_T_PENH                    .
TABLES: ZEWM_T_PENHT                   .
TABLES: ZEWM_T_PKEY                    .
TABLES: ZEWM_T_PKEYENH                 .
TABLES: ZEWM_T_PKEYT                   .
TABLES: ZEWM_T_PKEYT300                .
TABLES: ZEWM_T_PKFILENH                .
TABLES: ZEWM_T_PVAL                    .
