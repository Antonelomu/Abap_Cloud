CLASS zcl_lab_40_antmu_actual_budget DEFINITION  INHERITING FROM zcl_lab_39_antmu_budget
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    class-data: lv_text type string.
    METHODS: get_budget REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_40_antmu_actual_budget IMPLEMENTATION.
  METHOD get_budget.
   ev_budget = me->lv_text.
  ENDMETHOD.

ENDCLASS.
