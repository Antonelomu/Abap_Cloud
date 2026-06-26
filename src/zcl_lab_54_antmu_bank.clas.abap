CLASS zcl_lab_54_antmu_bank DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS: transfer IMPORTING iv_iban          TYPE string
                                iv_amount        TYPE i
                                iv_saving_acount TYPE abap_bool OPTIONAL
                      CHANGING  cv_log           TYPE string
                      RAISING
                                RESUMABLE(zcx_lab_55_antmu_auth_iban).


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_54_antmu_bank IMPLEMENTATION.
  METHOD transfer.
    cv_log = |{ cv_log } ... verificación iban{ cl_abap_char_utilities=>newline }|.

    IF iv_iban EQ 'ES95 4329 8765 4321' .
      cv_log = |{ cv_log } ... IBAN correcto{ cl_abap_char_utilities=>newline }|.

    ELSE.
      RAISE EXCEPTION TYPE zcx_lab_55_antmu_auth_iban
        EXPORTING
          textid = zcx_lab_55_antmu_auth_iban=>iban_incorrecto.
    ENDIF.

    cv_log = |{ cv_log } ... verificar saldo cuenta{ cl_abap_char_utilities=>newline }|.

    IF iv_amount > 1000.

      IF iv_saving_acount EQ abap_true.

        cv_log = |{ cv_log } ... Resumable excepción saldo insuficiente{ cl_abap_char_utilities=>newline }|.
        RAISE RESUMABLE EXCEPTION TYPE zcx_lab_55_antmu_auth_iban
          EXPORTING
            textid = zcx_lab_55_antmu_auth_iban=>saldo_insuficiente.

      ELSE.

*        cv_log = |{ cv_log } ... Excepción saldo insuficiente{ cl_abap_char_utilities=>newline }|.
        RAISE EXCEPTION TYPE zcx_lab_55_antmu_auth_iban
          EXPORTING
            textid = zcx_lab_55_antmu_auth_iban=>saldo_insuficiente.
      ENDIF.
    ELSE.
      RAISE EXCEPTION TYPE zcx_lab_55_antmu_auth_iban
        EXPORTING
          textid = zcx_lab_55_antmu_auth_iban=>saldo_insuficiente.
     eNDIF.


  ENDMETHOD.

ENDCLASS.
