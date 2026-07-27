*"* use this source file for your ABAP unit test classes
CLASS ltcl_Calculator DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      calculator_local_test FOR TESTING RAISING cx_static_check.

    CLASS-METHODS class_setup.
    CLASS-METHODS class_teardown.

    METHODS setup.
    METHODS teardown.

    DATA mo_cut TYPE REF TO zcl_lab_59_antmu_calculator. " CUT - Class Under Test
ENDCLASS.


CLASS ltcl_calculator IMPLEMENTATION.

  METHOD calculator_local_test.

    "Given
    DATA(lv_number_1) = 4.
    DATA(lv_number_2) = 6.
    DATA lv_result TYPE i.

    "When
    mo_cut->sum_up(
      EXPORTING
        iv_num_1   = lv_number_1
        iv_num_2   = lv_number_2
      RECEIVING
        rv_result = lv_result
    ).

    "Then
    IF cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lv_result
        exp                  = 10 ) EQ abap_true.

      cl_abap_unit_assert=>fail( 'Calculator process failed' ).
    ENDIF.
  ENDMETHOD.

  METHOD class_setup.

  ENDMETHOD.

  METHOD class_teardown.

  ENDMETHOD.

  METHOD setup.
    mo_cut = NEW zcl_lab_59_antmu_calculator(  ).
  ENDMETHOD.

  METHOD teardown.
    CLEAR mo_cut.
  ENDMETHOD.

ENDCLASS.
