CLASS zcl_lab_47_antmu_custo_service DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  class-data lv_call type string.
    CLASS-METHODS on_new_call FOR EVENT new_call OF zcl_lab_46_antmu_mob_operator
                  importing ev_phone_number.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_lab_47_antmu_custo_service IMPLEMENTATION.

  METHOD on_new_call.
    lv_call = ev_phone_number.
  ENDMETHOD.

ENDCLASS.
