CLASS zcl_lab_48_antmu_admin_dep DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-DATA: emp_id TYPE string.

    EVENTS payroll_paid.

    METHODS constructor IMPORTING i_emp_id TYPE string.

    METHODS notify_employee.

    CLASS-DATA:log    TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_lab_48_antmu_admin_dep IMPLEMENTATION.

  METHOD constructor.
    emp_id = i_emp_id.
  ENDMETHOD.


  METHOD notify_employee.

    " Guardamos en el log
*  log = |Payroll pagado para empleado { emp_id }|.
    " Lanzar evento
    RAISE EVENT payroll_paid.
  ENDMETHOD.
ENDCLASS.
