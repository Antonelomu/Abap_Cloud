CLASS zcl_lab_68_antmu_package_b DEFINITION
  PUBLIC
  CREATE PUBLIC
  INHERITING FROM zcl_lab_66_antmu_travel.

  PUBLIC SECTION.
  PROTECTED SECTION.
    METHODS transport_oneway REDEFINITION.
    METHODS day_one REDEFINITION.
    METHODS day_two REDEFINITION.
    METHODS day_three REDEFINITION.
    METHODS transport_return REDEFINITION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_68_antmu_package_b IMPLEMENTATION.

  METHOD transport_oneway.
    out->write( 'PACKAGE B - Tren de ida' ).
  ENDMETHOD.

  METHOD day_one.
    out->write( 'PACKAGE B - Compras y tiempo libre'  ).
  ENDMETHOD.

  METHOD day_two.
    out->write( 'PACKAGE B - Visita a museos' ).
  ENDMETHOD.

  METHOD day_three.
    out->write( 'PACKAGE B - Tour gastronomico' ).
  ENDMETHOD.

  METHOD transport_return.
    out->write( 'PACKAGE B - Tren de regreso' ).
  ENDMETHOD.

ENDCLASS.
