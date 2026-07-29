CLASS zcl_lab_62_antmu_context DEFINITION
  PUBLIC
  FINAL
  CREATE PRIVATE .

  PUBLIC SECTION.
* El patron de módelo singleton no debería tener una clase amiga.

    CLASS-METHODS: get_instance
      RETURNING VALUE(ro_instance) TYPE REF TO zcl_lab_62_antmu_context.

METHODS: set_text IMPORTING iv_text TYPE string,
         get_text RETURNING VALUE(rv_text) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
    CLASS-DATA: mo_instance TYPE REF TO zcl_lab_62_antmu_context.
DATA: gv_text TYPE string.
ENDCLASS.



CLASS zcl_lab_62_antmu_context IMPLEMENTATION.
  METHOD get_instance.
    IF NOT mo_instance IS BOUND.
      mo_instance = NEW #(  ).
    ENDIF.
    ro_instance = mo_instance.

  ENDMETHOD.

  METHOD get_text.
   rv_text = gv_text.
  ENDMETHOD.

  METHOD set_text.
   gv_text = iv_text.
  ENDMETHOD.

ENDCLASS.
