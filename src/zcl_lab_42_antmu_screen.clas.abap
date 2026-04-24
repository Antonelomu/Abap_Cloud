CLASS zcl_lab_42_antmu_screen DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA screen_type TYPE string.


    EVENTS touch_screen EXPORTING VALUE(iv_pos_x) TYPE i
                                  VALUE(iv_pos_y) TYPE i.

    METHODS constructor IMPORTING iv_screen_type TYPE string.

    METHODS element_selected IMPORTING iv_pos_x TYPE i
                                       iv_pos_y TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: LV_element_ph TYPE i,
          LV_element_pv TYPE i.
ENDCLASS.



CLASS zcl_lab_42_antmu_screen IMPLEMENTATION.

  METHOD element_selected.

    RAISE EVENT touch_screen
      EXPORTING
        iv_pos_x = iv_pos_x
        iv_pos_y = iv_pos_y.
  ENDMETHOD.

  METHOD constructor.
    screen_type = iv_screen_type.
  ENDMETHOD.

ENDCLASS.
