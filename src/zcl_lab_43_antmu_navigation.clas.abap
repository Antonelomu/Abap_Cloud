CLASS zcl_lab_43_antmu_navigation DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA: lv_log TYPE string.

    METHODS on_touch_screen FOR EVENT touch_screen OF zcl_lab_42_antmu_screen
      IMPORTING
        iv_pos_x
        iv_pos_y
        sender.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_43_antmu_navigation IMPLEMENTATION.
  METHOD on_touch_screen.
  clear: me->lv_log.
    LV_LOG = |Pantalla: { sender->screen_type } |
          && |Línea horizontal: { iv_pos_x } Línea vertical: { iv_pos_y }|.
  ENDMETHOD.

ENDCLASS.
