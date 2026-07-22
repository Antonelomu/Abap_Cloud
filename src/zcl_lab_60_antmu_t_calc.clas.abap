CLASS zcl_lab_60_antmu_t_calc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC
  FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.


  PUBLIC SECTION.
    "! @testing zcl_lab_59_antmu_calculator
    METHODS test_sum_up FOR TESTING. " UTM - Unit Test Method
  PROTECTED SECTION.
  PRIVATE SECTION.

    CLASS-METHODS class_setup.
    CLASS-METHODS class_teardown.

    METHODS setup.
    METHODS teardown.

    DATA mo_cut TYPE REF TO zcl_lab_59_antmu_calculator.
ENDCLASS.



CLASS zcl_lab_60_antmu_t_calc IMPLEMENTATION.

  METHOD setup.
    mo_cut = NEW zcl_lab_59_antmu_calculator(  ).
  ENDMETHOD.

  METHOD test_sum_up.

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
    cl_abap_unit_assert=>assert_equals(
      EXPORTING
        act                  = lv_result
        exp                  = 10

    ).

  ENDMETHOD.



  METHOD teardown.
    CLEAR mo_cut.
  ENDMETHOD.

  METHOD class_setup.

  ENDMETHOD.

  METHOD class_teardown.

  ENDMETHOD.

ENDCLASS.
