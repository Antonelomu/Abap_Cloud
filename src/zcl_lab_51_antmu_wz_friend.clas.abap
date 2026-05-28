CLASS zcl_lab_51_antmu_wz_friend DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS get_helper.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_lab_51_antmu_wz_friend IMPLEMENTATION.
  METHOD get_helper.


    DATA: lo_work_zone TYPE REF TO zcl_lab_50_antmu_work_zone.
*          ls_wz        TYPE zcl_lab_50_antmu_work_zone->
    CREATE OBJECT lo_work_zone.

  ENDMETHOD.

ENDCLASS.
