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
TYPE-POOL zwmgc .

CONSTANTS:

*=======================================================================
* System Application
*=======================================================================

  zwmgc_huappl_wme          TYPE /scwm/de_huappl VALUE 'EWM',


*=======================================================================
* Status
*=======================================================================

* .Not Relevant
  zwmgc_status_not_relevant TYPE /scdl/dl_status_value VALUE '0',

* .Not Started
  zwmgc_status_not_started  TYPE /scdl/dl_status_value VALUE '1',

* .Partially Completed
  zwmgc_status_partial      TYPE /scdl/dl_status_value VALUE '2',

* .Completed
  zwmgc_status_completed    TYPE /scdl/dl_status_value VALUE '9',


*=======================================================================
* Delivey data
*=======================================================================

* // Delivery Status....................................................
* .Picking Status
  zwmgc_dlv_st_picking      TYPE /scdl/dl_status_type VALUE 'DPI',

* // Delivery Quantity Roles............................................
* .Agregated Quantity
  zwmgc_dlv_qr_aq           TYPE /scdl/dl_qty_role VALUE 'AQ',
* .Picking
  zwmgc_dlv_qr_pi           TYPE /scdl/dl_qty_role VALUE 'PI',
* .Picking Planned
  zwmgc_dlv_qr_w1           TYPE /scdl/dl_qty_role VALUE 'W1',

* // Delivery Quantity Category.........................................
* .Requested Quantity
  zwmgc_dlv_qc_req          TYPE /scdl/dl_qty_category VALUE 'REQ',
* .Open Quantity
  zwmgc_dlv_qc_open         TYPE /scdl/dl_qty_category VALUE 'OPEN',

* // Document Category..................................................
* .Picking Planned
  zwmgc_dlv_cat_pcp         TYPE /scdl/dl_doccat VALUE 'PCP',


*=======================================================================
* Message Types
*=======================================================================

*.Message Type: Information
  zwmgc_msgty_info          TYPE symsgty VALUE: 'I',

*.Message Type: Warning
  zwmgc_msgty_warning       TYPE symsgty VALUE: 'W',

*.Message Type: Status
  zwmgc_msgty_status        TYPE symsgty VALUE: 'S',

*.Message Type: Question
  zwmgc_msgty_question      TYPE symsgty VALUE: 'Q',

*.Message Type: Error
  zwmgc_msgty_error         TYPE symsgty VALUE: 'E',

*.Message Type: Abort
  zwmgc_msgty_abort         TYPE symsgty VALUE: 'A',

*.Message Type: Dump
  zwmgc_msgty_dump          TYPE symsgty VALUE: 'X',


*=======================================================================
* ENQUEUE/DEQUEUE
*=======================================================================

* // Lock mode..........................................................
*.Write Lock
  zwmgc_enqmode_write       TYPE enqmode VALUE: 'E',
*.Read Lock
  zwmgc_enqmode_read        TYPE enqmode VALUE: 'S',
*.Exclusive, not cumulative
  zwmgc_enqmode_excl        TYPE enqmode VALUE: 'X',

* // Control lock behavior when calling the update task.................
  zwmgc_enqscope_1          TYPE ddenqscope VALUE: '1',
  zwmgc_enqscope_2          TYPE ddenqscope VALUE: '2',
  zwmgc_enqscope_3          TYPE ddenqscope VALUE: '3',

* LEAR 06.09.2022
* .Master Data Queue Prefix
  zwmgc_md_queue            TYPE string  VALUE: 'ZUMT',




*=======================================================================
* HU Information
*=======================================================================

* // Type of External Handling Unit Number Assignment...................
*.Range Type SSCC
  zwmgc_type_nr_assig_sscc  TYPE /scwm/vv_nrvrg VALUE 'A',

*.Range Type Interval
  zwmgc_type_nr_assig_inter TYPE /scwm/vv_nrvrg VALUE 'B',


*.Name of number range object
  zwmgc_huid                TYPE inri-object VALUE '/SCWM/HUID',

*.Object Category
  zwmgc_hu_obj_cat_hup      TYPE j_obtyp VALUE 'HUP',


* // Identification Types...............................................
*.Ticket Number
  zwmgc_huidart_ticket      TYPE /scwm/de_huidart VALUE 'K',
  zwmgc_huidart_reason      TYPE /scwm/de_huidart VALUE 'M',


* // HU User STATUS...............................................

*.HU Status Initial
  zwmgc_hu_stat_init        TYPE j_estat VALUE: 'E0001',

*.HU Status Weight Check
  zwmgc_hu_stat_weight      TYPE j_estat VALUE: 'E0002',

*.HU Status Loop Saturation
  zwmgc_hu_stat_loop        TYPE j_estat VALUE: 'E0003',

*.HU Status Station Full
  zwmgc_hu_stat_staf        TYPE j_estat VALUE: 'E0004',

*.HU Status Station Inactive
  zwmgc_hu_stat_stain       TYPE j_estat VALUE: 'E0005',

*.HU Status Check Required
  zwmgc_hu_stat_chrq        TYPE j_estat VALUE: 'E0006',

*.HU Status Picking Pending
  zwmgc_hu_stat_pend        TYPE j_estat VALUE: 'E0007',

*.HU Status Unknown
  zwmgc_hu_stat_unkn        TYPE j_estat VALUE: 'E0008',

*.HU Status Delete
  zwmgc_hu_stat_dele        TYPE j_estat VALUE: 'E0009',

*.HU Status Used
  zwmgc_hu_stat_used        TYPE j_estat VALUE: 'E0010',


*=======================================================================
* Packaging Specifications
*=======================================================================

* // Status of a Packaging Specification................................
*.Status: Active
  zwmgc_ps_status_active    TYPE /scwm/de_ps_status VALUE: 'A',

* // Packaging Specification Level Type.................................
*.Level Type: RF-ID: Master-HU
  zwmgc_ps_lvl_type_mhu     TYPE /scwm/de_psleveltype VALUE: 'ZRF1',


*=======================================================================
* Resource
*=======================================================================

* // Resource Type......................................................

  zwmgc_rsrc_type_all       TYPE /scwm/de_rsrc_type VALUE 'ALL',

*=======================================================================
* QRFCs
*=======================================================================

* // Queue for HUs......................................................
  zwmgc_qrfc_ajust_cat      TYPE trfcqnam VALUE 'ZDLV',


*=======================================================================
* Verification Objets
*=======================================================================

* Applications
  zwmgc_valid_obj_matnr     TYPE /scwm/de_valid_obj VALUE 'MATNR',


*=======================================================================
*Rules for Storage Section
*=======================================================================

** // Storage Section Rule...............................................
*  zwmgc_add_emp_mix         TYPE zewm_de_base_ss_rule VALUE '',
*  zwmgc_add_mix_emp         TYPE zewm_de_base_ss_rule VALUE '1',


*=======================================================================
* Aplications
*=======================================================================

* Applications
  zwmgc_appl_ewm            TYPE /scmb/mdl_appl_component VALUE 'EWM',


*=======================================================================
* append field
*=======================================================================

* Applications
  zwmgc_field_sign          TYPE char10           VALUE 'SIGN',


*=======================================================================
* Exceptions Codes
*=======================================================================

* .HU's
  zwmgc_iprcode_vdhu        TYPE /scwm/de_exccode VALUE 'VDHU',
* .Route end
  zwmgc_iprcode_vder        TYPE /scwm/de_exccode VALUE 'VDER',
* .WO adjust
  zwmgc_iprcode_vddf        TYPE /scwm/de_exccode VALUE 'VDDF',


*=======================================================================
* Queues prefix
*=======================================================================

* .WO Merge
  zwmgc_queue_wo_merge      TYPE c LENGTH 3 VALUE 'WOM',

*=======================================================================
* Spots
*=======================================================================

* // Type of a Spot.................................................
*.Location
  zwmgc_spot_type_location  TYPE /scmb/de_type_spot VALUE: 'L'.










*
