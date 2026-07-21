CLASS zcl_lab_59_antmu_calculator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS sum_up IMPORTING iv_num1          TYPE i
                             iv_num2          TYPE i
                   RETURNING VALUE(rv_result) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_59_antmu_calculator IMPLEMENTATION.
  METHOD sum_up.
    rv_result = iv_num1 + iv_num2.
  ENDMETHOD.

ENDCLASS.
