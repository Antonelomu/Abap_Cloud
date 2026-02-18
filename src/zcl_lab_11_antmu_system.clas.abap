CLASS zcl_lab_11_antmu_system DEFINITION
  PUBLIC
*  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: architecture TYPE string VALUE '64BITS'.

    METHODS get_architecture EXPORTING VALUE(ev_architecture) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_11_antmu_system IMPLEMENTATION.
  METHOD get_architecture.
    ev_architecture = me->architecture.
  ENDMETHOD.
ENDCLASS.
