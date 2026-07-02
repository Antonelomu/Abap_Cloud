CLASS zcl_lab_58__antm_date_analyzer DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS analyze_date IMPORTING io_ANALYZE_DATE TYPE REF TO cx_root OPTIONAL
                         RAISING   zcx_lab_56_antmu_no_date.

    METHODS analyze_format IMPORTING io_ANALYZE_FORMAT TYPE REF TO cx_root OPTIONAL
                           RAISING   zcx_lab_57_antm_format_unknown.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_58__antm_date_analyzer IMPLEMENTATION.
  METHOD analyze_date.
    RAISE EXCEPTION TYPE zcx_lab_56_antmu_no_date
      EXPORTING
         previous = io_ANALYZE_DATE.
  ENDMETHOD.

  METHOD analyze_format.
    RAISE EXCEPTION TYPE zcx_lab_57_antm_format_unknown
      EXPORTING
        previous = io_ANALYZE_FORMAT.
  ENDMETHOD.

ENDCLASS.
