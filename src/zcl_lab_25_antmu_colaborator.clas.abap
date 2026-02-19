CLASS zcl_lab_25_antmu_colaborator DEFINITION INHERITING FROM zcl_lab_24_antmu_parner
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS get_capital EXPORTING VALUE(ev_capital) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_25_antmu_colaborator IMPLEMENTATION.
  METHOD get_capital.

    DATA(lo_company_capital) = NEW zcl_lab_24_antmu_parner( ).

    ev_capital = lo_company_capital->get_company_capital(  ).

  ENDMETHOD.
ENDCLASS.
