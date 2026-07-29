CLASS zcl_lab_63_antmu_work_file DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_lab_06_antmu_file.
    ALIASES get_file_type for zif_lab_06_antmu_file~get_file_type.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_63_antmu_work_file IMPLEMENTATION.

  METHOD get_file_type.
   rv_file_type = 'WORK FILE'.
  ENDMETHOD.

ENDCLASS.
