CLASS zcl_lab_44_antmu_operat_sistem DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_lab_05_antmu_brouser.
    DATA log TYPE string.
    METHODS mouse_movement.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_lab_44_antmu_operat_sistem IMPLEMENTATION.
  METHOD mouse_movement.

    RAISE EVENT zif_lab_05_antmu_brouser~close_windows.

    log = |El mouse se mueve|.
  ENDMETHOD.

ENDCLASS.
