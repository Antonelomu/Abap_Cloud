CLASS zcl_lab_44_antmu_operat_sistem DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.


    CLASS-DATA log TYPE string.

    INTERFACES zif_lab_05_antmu_brouser.

    METHODS mouse_movement RETURNING VALUE(rv_mouse_movement) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_lab_44_antmu_operat_sistem IMPLEMENTATION.
  METHOD mouse_movement.
    log = |El mouse se mueve|.
    rv_mouse_movement  = log.
    RAISE EVENT zif_lab_05_antmu_brouser~close_windows.
  ENDMETHOD.

ENDCLASS.
