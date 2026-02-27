INTERFACE zif_lab_04_antmu_employee
  PUBLIC .
  METHODS: get_employees_count RETURNING VALUE(rv_employees_cont) TYPE string.
ENDINTERFACE.
