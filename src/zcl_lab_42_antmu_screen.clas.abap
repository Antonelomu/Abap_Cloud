CLASS zcl_lab_42_antmu_screen DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    EVENTS touch_screen EXPORTING VALUE(ev_poshor) TYPE i
                                  VALUE(ev_posver) TYPE i.

    METHODS element_selected IMPORTING iv_element_ph TYPE i
                                       iv_element_pv TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_42_antmu_screen IMPLEMENTATION.

  METHOD element_selected.

    me->element_selected(
      iv_element_ph = 1
      iv_element_pv = 2
    ).
    RAISE EVENT touch_screen
      EXPORTING
        ev_poshor =  iv_element_ph
        ev_posver = iv_element_pv.
  ENDMETHOD.

ENDCLASS.
