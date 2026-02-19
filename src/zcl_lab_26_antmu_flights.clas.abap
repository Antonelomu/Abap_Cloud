CLASS zcl_lab_26_antmu_flights DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: zif_lab_01_antmu_flight,
      zif_lab_02_antmu_customer,
      zif_lab_03_antmu_airports.

    ALIASES  als_set_flight FOR zif_lab_01_antmu_flight~set_conn_id.
    ALIASES  als_CONN_ID    FOR zif_lab_01_antmu_flight~conn_id.
    ALIASES  als_get_flight FOR zif_lab_01_antmu_flight~get_conn_id.

    ALIASES  als_get_customer    FOR zif_lab_02_antmu_customer~get_customer.
    ALIASES  als_ty_cust_address FOR zif_lab_02_antmu_customer~ty_cust_address.

    ALIASES  als_get_airports FOR  zif_lab_01_antmu_flight~als_get_airports.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_26_antmu_flights IMPLEMENTATION.

  METHOD als_set_flight.          " zif_lab_01_antmu_flight~set_conn_id.
    me->als_CONN_ID = iv_conn_id. " me->zif_lab_01_antmu_flight~conn_id = iv_conn_id.
  ENDMETHOD.

  METHOD als_get_flight.          " zif_lab_01_antmu_flight~get_conn_id.
    ev_conn_id = me->als_conn_id. " ev_conn_id = me->zif_lab_01_antmu_flight~conn_id.
  ENDMETHOD.

  METHOD als_get_customer. " zif_lab_02_antmu_customer~get_customer.

    TYPES: itt_cust_address TYPE TABLE OF /dmo/customer.

    DATA: it_cust_address TYPE itt_cust_address,
          wa_cust_address TYPE /dmo/customer.

    CLEAR: it_cust_address, it_cust_address[].

    SELECT * FROM /dmo/customer
             INTO CORRESPONDING FIELDS OF TABLE @it_cust_address.


    READ TABLE it_cust_address INTO wa_cust_address WITH KEY customer_id = iv_customer.

    IF sy-subrc = 0.
      rv_customer-first_name = wa_cust_address-first_name.
      rv_customer-last_names = wa_cust_address-last_name.
    ENDIF.

  ENDMETHOD.

  METHOD  als_get_airports. "zif_lab_03_antmu_airports~get_airports.

    TYPES: itt_airport TYPE TABLE OF /dmo/airport.

    DATA: it_airport TYPE itt_airport,
          wa_airport TYPE /dmo/airport.

    CLEAR: it_airport, it_airport[].

    SELECT * FROM /dmo/airport
             INTO CORRESPONDING FIELDS OF TABLE @it_airport.

    READ TABLE it_airport INTO wa_airport WITH KEY airport_id = iv_airport_id.

    IF sy-subrc = 0.
      MOVE-CORRESPONDING wa_airport TO rv_airport_id.
    ENDIF.
  ENDMETHOD.



ENDCLASS.
