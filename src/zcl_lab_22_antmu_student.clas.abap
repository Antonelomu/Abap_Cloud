CLASS zcl_lab_22_antmu_student DEFINITION INHERITING FROM zcl_lab_21_antmu_classroom
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS assing_student.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_22_antmu_student IMPLEMENTATION.
  METHOD assing_student.
    data lo_student type ref TO zcl_lab_21_antmu_classroom.

    create object lo_student.

  ENDMETHOD.

ENDCLASS.
