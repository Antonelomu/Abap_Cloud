CLASS zcl_lab_35_antmu_college DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: enroll_name TYPE REF TO zcl_lab_34_antmu_student.
    METHODS: enroll_student IMPORTING iv_enroll_student TYPE REF TO zcl_lab_34_antmu_student.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_35_antmu_college IMPLEMENTATION.
  METHOD enroll_student.
    me->enroll_name = iv_enroll_student.
  ENDMETHOD.

ENDCLASS.
