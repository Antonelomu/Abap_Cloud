*"* use this source file for your ABAP unit test classes
CLASS ltcl_test_inj DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PUBLIC SECTION.

    INTERFACES if_abap_db_writer PARTIALLY IMPLEMENTED.

  PRIVATE SECTION.
    METHODS:
      get_travel_test FOR TESTING RAISING cx_static_check.

    CLASS-METHODS class_setup.
    CLASS-METHODS class_teardown.

    METHODS setup.
    METHODS teardown.

    DATA mo_cut TYPE REF TO zcl_lab_61_antmu_travel.
ENDCLASS.


CLASS ltcl_test_inj IMPLEMENTATION.

  METHOD get_travel_test.

    me->mo_cut->get_travel(
      IMPORTING
        es_travel = DATA(ls_travel) ).


    IF cl_abap_unit_assert=>assert_equals(
     EXPORTING act = |{ ls_travel-travel_id }-{ ls_travel-agency_id }-{ ls_travel-customer_id  }|
               exp = '00000010-070016-000697' ) EQ abap_true.
      cl_abap_unit_assert=>fail( 'Get Travel process failed---ZCL_LAB_61_ANTMU_TRAVEL->get_travel' ).
    ENDIF.
  ENDMETHOD.

  METHOD class_setup.

  ENDMETHOD.

  METHOD class_teardown.

  ENDMETHOD.

  METHOD setup.
    me->mo_cut = NEW zcl_lab_61_antmu_travel(  ).

    TEST-INJECTION select_data.
      lv_travel = '00000010'.
      ls_travel-travel_id = lv_travel.
      ls_travel-agency_id = '070016'.
      ls_travel-customer_id = '000697'.
    END-TEST-INJECTION.
  ENDMETHOD.

  METHOD teardown.
    CLEAR me->mo_cut.
  ENDMETHOD.

  METHOD if_abap_close_resource~close.

  ENDMETHOD.


ENDCLASS.
