CLASS zcl_lab_54_antmu_bank DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS: transfer IMPORTING iv_iban      TYPE string
                                iv_saving_acount TYPE abap_bool OPTIONAL
                      CHANGING  cv_log           TYPE string
                      RAISING   zcx_lab_55_antmu_auth_iban.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_54_antmu_bank IMPLEMENTATION.
  METHOD transfer.

  ENDMETHOD.

ENDCLASS.
