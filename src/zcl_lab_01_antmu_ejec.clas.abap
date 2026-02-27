CLASS zcl_lab_01_antmu_ejec DEFINITION
* Pruebas Logali - Antonio Muñoz Moreno
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
* OO       -> Object oriented
* ADT -     > ABAP Development Tools
* ClASSRUN -> Permite implementar el método MAIN

    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_01_antmu_ejec IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

*    DATA: lo_age TYPE REF TO zcl_lab_04_antmu_person.
*
**    create oBJECT lo_age.
*
*    lo_age = new #( ).

    DATA(lo_age) = NEW zcl_lab_04_antmu_person(   ).

    IF lo_age IS BOUND.

      lo_age->set_age( iv_age =  '25' ).

      lo_age->get_age(
        IMPORTING
          ev_age = DATA(lv_age)
      ).

      out->write( lv_age ).

    ENDIF.

    DATA: lo_flight TYPE REF TO zcl_lab_05_antmu_flight.

    CREATE OBJECT lo_flight.

*    if lo_flight is bound.
*      lo_flight->get_flight(
*        EXPORTING
*          iv_codigo = 'AZ'
*          iv_numero = '0788'
*        RECEIVING
*          rv_status = data(lr_status)
*      ).

    out->write( lo_flight->get_flight(
                  iv_codigo = 'AZ'
                  iv_numero = '0788'
                ) ).

*    endif.

*  Ejercicio 7 - Utilizar tipos de datos en clases.

    DATA:
*         lt_elem_objects type zcl_lab_06_antmu_elements=>itt_elem_objects,
          ls_elem_objects TYPE zcl_lab_06_antmu_elements=>ty_elem_objects.

    DATA: lo_elem TYPE REF TO zcl_lab_06_antmu_elements.

    CREATE OBJECT lo_elem.

    lo_elem->set_object(
      iv_class     = 'ZCL_LAB_06_ANTMU_ELEMENTS'
      iv_instance  = 'LO_ELEM'
      iv_reference = 'REF TP ZCL_LAB_06_ANTMU_ELEMENTS'
    ).

    ls_elem_objects = lo_elem->get_object( ).

    out->write( |{ ls_elem_objects-class }-{ ls_elem_objects-instance }-{ ls_elem_objects-reference }| ).

* Ejercicio 8 - Constantes
    DATA: lo_elem1 TYPE REF TO zcl_lab_06_antmu_elements.

    DATA: lv_amarillo TYPE c LENGTH 8,
          lv_rojo     TYPE c LENGTH '4',
          lv_verde    TYPE c LENGTH '5',
          lv_gris     TYPE c LENGTH '4'.

    CREATE OBJECT: lo_elem1.

    lo_elem1->colores = lo_elem1->cs_colores-color_a.
    lv_amarillo =  lo_elem1->colores.

    lo_elem1->colores = lo_elem1->cs_colores-color_r.
    lv_rojo =  lo_elem1->colores.

    lo_elem1->colores = lo_elem1->cs_colores-color_v.
    lv_verde =  lo_elem1->colores.

    lo_elem1->colores = lo_elem1->cs_colores-color_g.
    lv_gris =  lo_elem1->colores.

    out->write( |{ lv_rojo }-{ lv_amarillo }-{ lv_verde }-{ lv_gris }| ).

* Ejercicio 9 - Read-Only

    DATA: lo_student TYPE REF TO zcl_lab_07_antmu_student.
    CREATE OBJECT lo_student.

    DATA: fecha TYPE zdate.

*  lo_student->birth_date = '20001201'. " Con el atributo Read-only no se puede modificar.
    fecha = lo_student->birth_date.

    out->write( fecha ).

*Ejercicio constructor

*contructor estático

    out->write( zcl_lab_10_antmu_constructor=>log ).
    DATA(log1) = NEW zcl_lab_10_antmu_constructor( iv_log = 'Log1' ).

    out->write( zcl_lab_10_antmu_constructor=>log ).
    DATA log2 TYPE REF TO zcl_lab_10_antmu_constructor.
    CREATE OBJECT log2
      EXPORTING
        iv_log = 'Log2'.

    out->write( zcl_lab_10_antmu_constructor=>log  ).

* Ejercicio 1 - Herencia

    DATA(lo_linux) = NEW zcl_lab_12_antmu_linux(  ).

    lo_linux->get_architecture( IMPORTING ev_architecture = DATA(lv_architecture) ).

    out->write( lv_architecture  ).

* Ejercicio 2 - Constructores con herencia.

    DATA: lv_view_type TYPE string VALUE 'VIEW_1',
          lv_box       TYPE string VALUE 'BOX_1'.

    DATA(lo_view) = NEW zcl_lab_13_antmu_view( iv_view_type = 'VIEW1' ).
    DATA(lo_grid) = NEW zcl_lab_14_antmu_grid(
      iv_view_type = lv_view_type
      iv_box       = lv_box ).

    out->write( |{ lv_view_type }-{ lv_box }| ).

* Ejercicio 3 - Redifinición de métodos

    DATA: it_flight TYPE STANDARD TABLE OF /dmo/flight.
    DATA: ls_flight TYPE /dmo/flight,
          lt_flight TYPE /dmo/flight.

    DATA(lo_price1) = NEW zcl_lab_15_antmu_price(  ).
    DATA(lo_price2) = NEW zcl_lab_16_antmu_discount(  ).
    DATA(lo_price3) = NEW zcl_lab_17_antmu_sup_discount(  ).

    SELECT * FROM /dmo/flight INTO TABLE @it_flight.

    READ TABLE it_flight INTO ls_flight INDEX 1.

    IF sy-subrc = 0.
      lo_price1->add_price( ls_flight ).
      READ TABLE lo_price1->mt_flights INTO lt_flight INDEX 1.
      IF sy-subrc = 0.
        out->write( lt_flight-price ).
      ENDIF.
      lo_price2->add_price( ls_flight ).
      READ TABLE lo_price2->mt_flights INTO lt_flight INDEX 1.
      IF sy-subrc = 0.
        out->write( lt_flight-price ).
      ENDIF.
      lo_price3->add_price( ls_flight ).
      READ TABLE lo_price3->mt_flights INTO lt_flight INDEX 1.
      IF sy-subrc = 0.
        out->write( lt_flight-price ).
      ENDIF.
    ENDIF.

* Ejercicio 4-5 - Narrowing Cast

    DATA(lo_animal) = NEW zcl_lab_18_antmu_animal( ).
    DATA(lo_lion)   = NEW zcl_lab_19_antmu_lion( ).

    out->write( lo_animal->get_walk( ) ).
    out->write( lo_lion->get_walk( ) ).

*    lo_animal = lo_lion. " Narrowing cast(UP Cast)

    out->write( lo_animal->get_walk( ) ).
    out->write( lo_lion->get_walk( ) ).

    TRY.
        lo_lion ?= lo_animal. " Widening Cast(Down Cast)
      CATCH cx_sy_move_cast_error.
        out->write( 'Casting error' ).
*        RETURN.
        " Quito el RETURN para poder seguir ejecutando.

    ENDTRY.

    out->write( lo_animal->get_walk( ) ).
    out->write( lo_lion->get_walk( ) ).

* Ejercicio 8 - encapsulación de instancias

    DATA(go_student) = NEW zcl_lab_21_antmu_classroom(  ).
* Si en la clase ZLC_LAB_21_ANTMU_CLASSROOM
*   create public     -  NO da error
*   create protected  -  SI da error al instanciar objeto.
*   create private    -  SI da error al instanciar objeto.

* Ejercicio 9 - Clase amiga.

    DATA(lo_capital) = NEW zcl_lab_24_antmu_parner(  ).

    lo_capital->get_company_capital(
      RECEIVING
        rv_company = DATA(lv_capital)
    ).

    out->write( lv_capital ).

* Ejercicio 10 Herencia con clase amiga

    DATA(lo_capital2) = NEW zcl_lab_25_antmu_colaborator(  ).

    lo_capital2->get_company_capital(
      RECEIVING
        rv_company = DATA(lv_company_capital) ).

    out->write( lv_company_capital ).

* Ejerccio 2 - Llamada a métodos de interfaz.

    DATA(lo_flights) = NEW zcl_lab_26_antmu_flights(  ).

    lo_flights->zif_lab_01_antmu_flight~set_conn_id( iv_conn_id = 'Vuelo 1' ).
    out->write( lo_flights->zif_lab_01_antmu_flight~get_conn_id(  ) ).

* Ejerccio 3 - Implementación de multiples interfaces.

*    DATA(lo_customer) = NEW zcl_lab_26_antmu_flights(  ).
*
*    DATA: lwa_customer TYPE lo_customer->zif_lab_02_antmu_customer~ty_cust_address.
*
*    lo_customer->zif_lab_02_antmu_customer~get_customer(
*      EXPORTING
*        iv_customer = '000043'
*      RECEIVING
*        rv_customer = lwa_customer
*    ).
*
*    out->write( lwa_customer ).

* Ejerccio 4 - Interfaces anidadas.

*    DATA(lo_airport) = NEW zcl_lab_26_antmu_flights(  ).
*
*    DATA: lwa_airport TYPE /dmo/airport.
*
*    lo_airport->zif_lab_03_antmu_airports~get_airports(
*      EXPORTING
*        iv_airport_id = 'FRA'
*      RECEIVING
*        rv_airport_id = lwa_airport
*    ).
*
*    out->write( lwa_airport ).

* Ejerccio 5 - Alias.

    DATA(lo_customer) = NEW zcl_lab_26_antmu_flights(  ).

    DATA: lwa_customer TYPE lo_customer->als_ty_cust_address. " zif_lab_02_antmu_customer~ty_cust_address.

    lo_customer->als_get_customer(                            " zif_lab_02_antmu_customer~get_customer(
      EXPORTING
        iv_customer = '000043'
      RECEIVING
        rv_customer = lwa_customer
    ).

    out->write( lwa_customer ).

    DATA(lo_airport) = NEW zcl_lab_26_antmu_flights(  ).

    DATA: lwa_airport TYPE /dmo/airport.

    lo_airport->als_get_airports(                              " zif_lab_03_antmu_airports~get_airports(
      EXPORTING
        iv_airport_id = 'FRA'
      RECEIVING
        rv_airport_id = lwa_airport
    ).

    out->write( lwa_airport ).


* Ejerccio 6 - Clase abstracta.

    DATA(lo_logistic) = NEW zcl_lab_28_antmu_logistic(  ).

    DATA: lv_merchandise    TYPE string,
          lv_production_lin TYPE string,
          lv_input_products TYPE string.

    out->write( lo_logistic->get_merchandise_output(  ) ).
    out->write( lo_logistic->get_production_line(  ) ).
    out->write( lo_logistic->get_input_products( ) ).

* Polimorfismo, asociación y composición.

* Ejercicio 1 Polimorfismo con clases.

    DATA: gt_Organization TYPE STANDARD TABLE OF REF TO zcl_lab_29_antmu_organization,
          go_Organization TYPE REF TO zcl_lab_29_antmu_organization,
          go_germany      TYPE REF TO zcl_lab_30_antmu_org_germany,
          go_france       TYPE REF TO zcl_lab_31_antmu_org_france.

    go_germany = NEW #( ).
    APPEND go_germany TO gt_organization.
    go_france = NEW #(  ).
    APPEND go_france TO gt_organization.

    LOOP AT gt_organization INTO go_Organization.
      out->write( go_organization->get_location(  ) ).
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
