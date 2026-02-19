CLASS zcl_lab_27_antmu_factory DEFINITION ABSTRACT
  PUBLIC
*  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: get_merchandise_output RETURNING VALUE(rv_merchendise) TYPE string,

      get_production_line ABSTRACT RETURNING VALUE(rv_production) TYPE string,
      get_input_products  ABSTRACT RETURNING VALUE(rv_input) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_27_antmu_factory IMPLEMENTATION.
  METHOD get_merchandise_output.
    rv_merchendise = 'GET_MERCHANDISE_OUTPUT'.
  ENDMETHOD.

ENDCLASS.
