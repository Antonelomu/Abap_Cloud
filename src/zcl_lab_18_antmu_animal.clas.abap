CLASS zcl_lab_18_antmu_animal DEFINITION
  PUBLIC
*  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS get_walk RETURNING VALUE(rv_walk) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_18_antmu_animal IMPLEMENTATION.
  METHOD get_walk.
    rv_walk = 'The animal Walk'.
  ENDMETHOD.
ENDCLASS.
