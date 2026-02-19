INTERFACE zif_lab_03_antmu_airports
  PUBLIC .
  METHODS: get_airports IMPORTING VALUE(iv_airport_id) TYPE string
                        RETURNING VALUE(rv_airport_id) TYPE /dmo/airport.

ENDINTERFACE.
