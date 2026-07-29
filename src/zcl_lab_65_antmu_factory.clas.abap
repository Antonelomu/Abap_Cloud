CLASS zcl_lab_65_antmu_factory DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS create_file IMPORTING iv_type        TYPE string
                        RETURNING VALUE(ro_file) TYPE REF TO zif_lab_06_antmu_file.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_65_antmu_factory IMPLEMENTATION.

  METHOD create_file.

    CASE iv_type.
      WHEN 'WORK'.
        ro_file = NEW zcl_lab_63_antmu_work_file(  ).
      WHEN 'SUPPLY'.
        ro_file = NEW zcl_lab_64_antmu_supply_file(  ).
    ENDCASE.

  ENDMETHOD.

ENDCLASS.
