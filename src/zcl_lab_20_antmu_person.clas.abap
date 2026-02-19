CLASS zcl_lab_20_antmu_person DEFINITION INHERITING FROM zcl_lab_19_antmu_lion
  PUBLIC
*  FINAL " Ejerciio 7 - Método final
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS get_walk REDEFINITION.
  PROTECTED SECTION.
    METHODS set_name FINAL IMPORTING VALUE(iv_name) TYPE string.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_20_antmu_person IMPLEMENTATION.
  METHOD get_walk.
    rv_walk = ' Clase final'.
  ENDMETHOD.

  METHOD set_name.
    DATA(lv_name) = iv_name.
  ENDMETHOD.

ENDCLASS.
