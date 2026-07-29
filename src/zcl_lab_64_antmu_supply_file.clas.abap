CLASS zcl_lab_64_antmu_supply_file DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES zif_lab_06_antmu_file.
    ALIASES get_file_type FOR zif_lab_06_antmu_file~get_file_type.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_64_antmu_supply_file IMPLEMENTATION.

  METHOD get_file_type.
    rv_file_type = 'SUPPLY FILE'.
  ENDMETHOD.
ENDCLASS.
