CLASS zcl_lab_15_antmu_price DEFINITION
  PUBLIC
*  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: mt_flights TYPE STANDARD TABLE OF /dmo/flight.

    METHODS add_price IMPORTING lwa_flights TYPE /dmo/flight.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_15_antmu_price IMPLEMENTATION.
  METHOD add_price.
    CLEAR: me->mt_flights, me->mt_flights[].
    APPEND lwa_flights TO me->mt_flights.
  ENDMETHOD.
ENDCLASS.
