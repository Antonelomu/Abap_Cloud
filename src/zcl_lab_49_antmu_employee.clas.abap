CLASS zcl_lab_49_antmu_employee DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

   METHODS on_payroll_paid
      FOR EVENT payroll_paid OF zcl_lab_48_antmu_admin_dep
*     for all instances
      IMPORTING
        employee_id.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_49_antmu_employee IMPLEMENTATION.

  METHOD on_payroll_paid.
*    WRITE: / |Empleado { employee_id }: nómina registrada correctamente.| .
  ENDMETHOD.

ENDCLASS.
