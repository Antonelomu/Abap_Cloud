CLASS zcl_lab_54_antmu_bank DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS: transfer IMPORTING iv_iban TYPE string
                      CHANGING  cv_log  TYPE string
                      RAISING   RESUMABLE(zcx_lab_55_antmu_auth_iban).


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_54_antmu_bank IMPLEMENTATION.
  METHOD transfer.
    cv_log = |{ cv_log } ... Verificación iban{ cl_abap_char_utilities=>newline }|.

    IF iv_iban EQ 'ES95 4329 8765 4321' .
      RAISE RESUMABLE EXCEPTION TYPE zcx_lab_55_antmu_auth_iban
        EXPORTING
          textid = zcx_lab_55_antmu_auth_iban=>iban_correcto.
    ELSE.
      RAISE EXCEPTION TYPE zcx_lab_55_antmu_auth_iban
        EXPORTING
          textid = zcx_lab_55_antmu_auth_iban=>iban_incorrecto.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
