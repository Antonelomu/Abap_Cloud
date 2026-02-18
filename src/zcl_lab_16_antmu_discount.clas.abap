CLASS zcl_lab_16_antmu_discount DEFINITION INHERITING FROM zcl_lab_15_antmu_PRICE
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS add_price REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_16_antmu_discount IMPLEMENTATION.
  METHOD add_price.
    DATA lv_fligths TYPE /dmo/flight.

    CLEAR: me->mt_flights, me->mt_flights[].

    lv_fligths = lwa_flights.

    lv_fligths-price = ( lv_fligths-price - ( ( lv_fligths-price * 10 ) / 100 ) ).

    APPEND  lv_fligths TO me->mt_flights.
  ENDMETHOD.

ENDCLASS.
