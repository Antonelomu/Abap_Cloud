CLASS zcl_lab_31_antmu_org_france DEFINITION INHERITING FROM zcl_lab_29_antmu_organization
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: get_location REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_31_antmu_org_france IMPLEMENTATION.
  METHOD get_location.
    rv_location = 'France'.
  ENDMETHOD.

ENDCLASS.
