CLASS zcl_lab_07_antmu_student DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-DATA birth_date TYPE zdate VALUE '20260107' READ-ONLY.

    METHODS: set_birth_date IMPORTING VALUE(iv_birth_date) TYPE zdate.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: fecha TYPE zdate.
ENDCLASS.



CLASS zcl_lab_07_antmu_student IMPLEMENTATION.
  METHOD set_birth_date.
    iv_birth_date = fecha.
  ENDMETHOD.
ENDCLASS.
