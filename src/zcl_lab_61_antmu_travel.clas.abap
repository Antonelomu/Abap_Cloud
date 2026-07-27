CLASS zcl_lab_61_antmu_travel DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS get_travel EXPORTING es_travel TYPE /dmo/travel.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_61_antmu_travel IMPLEMENTATION.
  METHOD get_travel.
    DATA: ls_travel TYPE /dmo/travel,
          lv_travel TYPE /dmo/travel_id.

    lv_travel = '00000005'.

    SELECT SINGLE FROM /dmo/travel
           FIELDS *
           WHERE travel_id EQ @lv_travel
           INTO @es_travel.

    TEST-SEAM select_data.
      SELECT SINGLE FROM /dmo/travel
             FIELDS *
             WHERE travel_id EQ @lv_travel
             INTO @ls_travel.
    END-TEST-SEAM.

    IF lv_travel EQ '00000010'.
      es_travel = CORRESPONDING #(  ls_travel ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.
