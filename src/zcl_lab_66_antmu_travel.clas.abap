CLASS zcl_lab_66_antmu_travel DEFINITION ABSTRACT
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
  PROTECTED SECTION.
    METHODS transport_oneway ABSTRACT IMPORTING out TYPE REF TO if_oo_adt_classrun_out.
    METHODS day_one ABSTRACT IMPORTING out TYPE REF TO if_oo_adt_classrun_out.
    METHODS day_two ABSTRACT IMPORTING out TYPE REF TO if_oo_adt_classrun_out.
    METHODS day_three ABSTRACT IMPORTING out TYPE REF TO if_oo_adt_classrun_out.
    METHODS transport_return  ABSTRACT IMPORTING out TYPE REF TO if_oo_adt_classrun_out.

    METHODS travel FINAL IMPORTING out TYPE REF TO if_oo_adt_classrun_out.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_66_antmu_travel IMPLEMENTATION.

  METHOD travel.
    transport_oneway( out ).
    day_one( out ).
    day_two( out ).
    day_three( out ).
    transport_return( out ).
  ENDMETHOD.
ENDCLASS.
