CLASS zcl_lab_50_antmu_work_zone DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  PROTECTED SECTION.
  PRIVATE SECTION.
  data: gs_work_zone type ty_work_zone.

  metHODS: set_work_zone iMPORTING iv_launchpad type string
                                   iv_dashboard type string
                                   iv_spaces    type string.
ENDCLASS.



CLASS zcl_lab_50_antmu_work_zone IMPLEMENTATION.
  METHOD set_work_zone.

    me->gs_work_zone-launchpad = iv_launchpad.
    me->gs_work_zone-dashboard = iv_dashboard.
    me->gs_work_zone-spaces    = iv_spaces.

  ENDMETHOD.

ENDCLASS.
