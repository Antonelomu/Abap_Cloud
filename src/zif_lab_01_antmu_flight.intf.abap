INTERFACE zif_lab_01_antmu_flight
  PUBLIC .

  CLASS-DATA comp_id TYPE string.

  DATA conn_id TYPE string.

  METHODS: set_conn_id IMPORTING VALUE(iv_conn_id) TYPE string,
    get_conn_id RETURNING VALUE(ev_conn_id) TYPE string.

  INTERFACES zif_lab_03_antmu_airports.

  ALIASES ALS_get_AIRPORTS FOR zif_lab_03_antmu_airports~get_airports.

ENDINTERFACE.
