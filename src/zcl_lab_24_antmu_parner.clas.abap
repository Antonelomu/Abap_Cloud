CLASS zcl_lab_24_antmu_parner DEFINITION
  PUBLIC
*  FINAL
  CREATE PUBLIC
  GLOBAL FRIENDS zcl_lab_25_antmu_colaborator.

  PUBLIC SECTION.
    METHODS get_company_capital RETURNING VALUE(rv_company) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_24_antmu_parner IMPLEMENTATION.
  METHOD get_company_capital.

    DATA(lo_company) = NEW zcl_lab_23_antmu_company( ).

    rv_company = lo_company->capital.

  ENDMETHOD.
ENDCLASS.
