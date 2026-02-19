CLASS zcl_lab_28_antmu_logistic DEFINITION INHERITING FROM zcl_lab_27_antmu_factory
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: get_production_line REDEFINITION,
      get_input_products REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_28_antmu_logistic IMPLEMENTATION.
  METHOD get_production_line.
    rv_production = 'GET_PROCUCTION_LINE'.
  ENDMETHOD.

  METHOD get_input_products.
    rv_input = 'GET_INPUT_PRODUCTS'.
  ENDMETHOD.
ENDCLASS.
