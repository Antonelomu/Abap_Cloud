CLASS zcl_lab_09_antmu_account DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: set_iban IMPORTING VALUE(iv_iban) TYPE string,
      get_iban EXPORTING  VALUE(ev_iban) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: iban TYPE string.
ENDCLASS.



CLASS zcl_lab_09_antmu_account IMPLEMENTATION.
  METHOD get_iban.
    ev_iban = me->iban.
  ENDMETHOD.

  METHOD set_iban.
    me->iban = iv_iban.
  ENDMETHOD.
ENDCLASS.
