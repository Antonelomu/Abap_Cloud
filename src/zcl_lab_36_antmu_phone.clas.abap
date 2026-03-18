CLASS zcl_lab_36_antmu_phone DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: screen  TYPE REF TO zcl_lab_37_antmu_screen.
    METHODS: constructor IMPORTING io_screen TYPE REF TO zcl_lab_37_antmu_screen.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_lab_36_antmu_phone IMPLEMENTATION.
  METHOD constructor.
    me->screen = io_screen.
  ENDMETHOD.

ENDCLASS.
