CLASS zcl_lab_10_antmu_constructor DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor IMPORTING iv_log TYPE string.

    CLASS-METHODS class_constructor.

    CLASS-DATA log TYPE string READ-ONLY.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_10_antmu_constructor IMPLEMENTATION.
  METHOD constructor.
    log = |{ log }-Instance Constructor { iv_log } -->|.
  ENDMETHOD.

  METHOD class_constructor.
    log = |{ log }-Static  Constructor  -->|.
  ENDMETHOD.
ENDCLASS.
