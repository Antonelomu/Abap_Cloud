CLASS zcl_lab_45_antmu_chrome DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS on_close_windows FOR EVENT close_windows OF zif_lab_05_antmu_brouser.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_45_antmu_chrome IMPLEMENTATION.
  METHOD on_close_windows.
    zcl_lab_44_antmu_operat_sistem=>log = |Cierra Windows|.
  ENDMETHOD.

ENDCLASS.
