CLASS zcl_lab_49_antmu_employee DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

  DATA: lv_log TYPE string.

  METHODS:
      on_payroll_paid
        FOR EVENT payroll_paid OF zcl_lab_48_administrative_dep.


  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_lab_49_antmu_employee IMPLEMENTATION.


 METHOD on_payroll_paid.
    me->lv_log = |'Evento PAYROLL_PAID capturado por EMPLOYEE' { zcl_lab_48_antmu_admin_dep=>emp_id } |.
  ENDMETHOD.

ENDCLASS.
