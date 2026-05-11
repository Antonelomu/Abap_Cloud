CLASS zcl_lab_48_antmu_admin_dep DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    EVENTS payroll_paid EXPORTING VALUE(ev_employee_id) TYPE string.

    METHODS constructor IMPORTING iv_employee_id TYPE string.

    METHODS notify_employee.



  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: employee_id TYPE string.
    CLASS-DATA: log TYPE string.
ENDCLASS.



CLASS zcl_lab_48_antmu_admin_dep IMPLEMENTATION.
  METHOD constructor.
*    SET HANDLER notify_employee for all INSTANCES.
    me->employee_id = iv_employee_id.
  ENDMETHOD.

  METHOD notify_employee.

    log = |Evento PAYROLL_PAID levantado para empleado { employee_id }|.

    RAISE EVENT payroll_paid
      EXPORTING
        ev_employee_id = me->employee_id.

  ENDMETHOD.
ENDCLASS.
