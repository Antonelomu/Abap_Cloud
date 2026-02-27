CLASS zcl_lab_33_antmu_expatriate_em DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: zif_lab_04_antmu_employee.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_33_antmu_expatriate_em IMPLEMENTATION.
  METHOD zif_lab_04_antmu_employee~get_employees_count.
    rv_employees_cont = 'Number employee expatriate = 10'.
  ENDMETHOD.
ENDCLASS.
