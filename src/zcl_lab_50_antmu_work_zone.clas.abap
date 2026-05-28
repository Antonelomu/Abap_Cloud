CLASS zcl_lab_50_antmu_work_zone DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC
  gloBAL FRIENDS zcl_lab_51_antmu_wz_friend.


  PUBLIC SECTION.
  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA: gs_work_zone TYPE ty_work_zone,
          go_helper    TYPE REF TO lcl_helper.

    METHODS: set_work_zone IMPORTING iv_launchpad TYPE string
                                     iv_dashboard TYPE string
                                     iv_spaces    TYPE string.
ENDCLASS.



CLASS zcl_lab_50_antmu_work_zone IMPLEMENTATION.
  METHOD set_work_zone.

    me->gs_work_zone-launchpad = iv_launchpad.
    me->gs_work_zone-dashboard = iv_dashboard.
    me->gs_work_zone-spaces    = iv_spaces.


  ENDMETHOD.

ENDCLASS.
