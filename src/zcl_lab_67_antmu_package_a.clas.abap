CLASS zcl_lab_67_antmu_package_a DEFINITION ABSTRACT
  PUBLIC
  FINAL
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



CLASS zcl_lab_67_antmu_package_a IMPLEMENTATION.
  METHOD day_one.
    out->write( 'PACKAGE A - Vuelo de ida' ).
  ENDMETHOD.

  METHOD day_three.
    out->write( 'PACKAGE A - Visita guiada por la ciudad' ).
  ENDMETHOD.

  METHOD day_two.
    out->write( 'PACKAGE A - Excursion a la montaña' ).
  ENDMETHOD.

  METHOD transport_oneway.
    out->write( 'PACKAGE A - Dia de playa' ).
  ENDMETHOD.

  METHOD transport_return.
    out->write( 'PACKAGE A - Vuelo de regreso' ).
  ENDMETHOD.

ENDCLASS.
