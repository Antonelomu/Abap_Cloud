CLASS zcl_lab_30_antmu_org_germany DEFINITION INHERITING FROM zcl_lab_29_antmu_organization
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: get_location REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_30_antmu_org_germany IMPLEMENTATION.
  METHOD get_location.
    rv_location = 'Location Germany'.
  ENDMETHOD.

ENDCLASS.
