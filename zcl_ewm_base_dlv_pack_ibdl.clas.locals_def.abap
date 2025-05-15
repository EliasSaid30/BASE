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
*"* use this source file for any type declarations (class
*"* definitions, interfaces or data types) you need for method
*"* implementation or private method's signature
types: begin of gtype_s_matidx,
         stock type /scwm/s_pack_stock,
         prd_no type /SCDL/DL_DOCNO,
         item_no type /SCDL/DL_ITEMNO,
         guid_stock type /LIME/GUID_STOCK,
         prd_id type /SCDL/DL_DOCID,
         item_id type /SCDL/DL_ITEMID,
       end of gtype_s_matidx,

       gtype_t_matidx type table of gtype_s_matidx.

types: begin of gtype_s_read_dlv,
         docid type /scwm/de_docid,
         locked type xfeld,
       end of gtype_s_read_dlv,

       gtype_t_read_dlv type table of gtype_s_read_dlv.
