CLASS zcl_lab_02_antmu_product DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
*aa
  PUBLIC SECTION.
    METHODS: set_product IMPORTING iv_product TYPE matnr,
      set_creation_date IMPORTING iv_creation_date TYPE zdate.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: product       TYPE matnr,
          creation_date TYPE zdate.
ENDCLASS.



CLASS zcl_lab_02_antmu_product IMPLEMENTATION.
  METHOD set_creation_date.
    creation_date = iv_creation_date.
  ENDMETHOD.

  METHOD set_product.
    product = iv_product.
  ENDMETHOD.

ENDCLASS.
