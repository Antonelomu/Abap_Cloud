CLASS zcl_lab_05_antmu_flight DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: it_flight TYPE STANDARD TABLE OF /dmo/flight.

    METHODS: get_flight IMPORTING VALUE(iv_codigo) TYPE /dmo/flight-carrier_id
                                  VALUE(iv_numero) TYPE /dmo/flight-connection_id
                        RETURNING VALUE(rv_status) TYPE abap_boolean.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: lv_codigo TYPE /dmo/flight-carrier_id,
          lv_numero TYPE /dmo/flight-carrier_id.

ENDCLASS.



CLASS zcl_lab_05_antmu_flight IMPLEMENTATION.
  METHOD get_flight.

    DATA: lt_flight TYPE /dmo/flight.

    SELECT * FROM /dmo/flight INTO TABLE @it_flight.

    READ TABLE it_flight INTO lt_flight WITH KEY carrier_id = iv_codigo
                                              connection_id = iv_numero.

    IF sy-subrc = 0.
      rv_status = 'V'.
    ELSE.
      rv_status = 'F'.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
