CLASS zcl_lab_37_antmu_screen DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: set_screen IMPORTING iv_screen TYPE string,
      get_screen RETURNING VALUE(rv_screen) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: screen_type TYPE string.
ENDCLASS.



CLASS zcl_lab_37_antmu_screen IMPLEMENTATION.
  METHOD set_screen.
    me->screen_type = iv_screen.
  ENDMETHOD.

  METHOD get_screen.
    rv_screen = me->screen_type.
  ENDMETHOD.

ENDCLASS.
