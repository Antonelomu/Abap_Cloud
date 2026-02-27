CLASS zcl_lab_32_antmu_internal_empl DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: zif_lab_04_antmu_employee.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_32_antmu_internal_empl IMPLEMENTATION.

  METHOD zif_lab_04_antmu_employee~get_employees_count.
    rv_employees_cont = 'Number employee internal = 25'.
  ENDMETHOD.

ENDCLASS.
