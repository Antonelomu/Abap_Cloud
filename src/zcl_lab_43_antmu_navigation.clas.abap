CLASS zcl_lab_43_antmu_navigation DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA: lv_log TYPE string.

    METHODS on_touch_screen FOR EVENT touch_screen OF zcl_lab_42_antmu_screen
      IMPORTING
         ev_poshor
         ev_posver.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_43_antmu_navigation IMPLEMENTATION.
  METHOD on_touch_screen.
  clear: me->lv_log.
  me->lv_log = |Línea horizontal: { ev_poshor } Línea vertical: { ev_posver }|.
  ENDMETHOD.

ENDCLASS.
