
CLASS zcl_lab_01_antmu_ejec DEFINITION
* Pruebas Logali - Antonio Muñoz Moreno.
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

* Ejercicio 2 Polimorfismo con interfase.

    DATA: gt_employee_count  TYPE TABLE OF REF TO zif_lab_04_antmu_employee,
          go_employee_count  TYPE REF TO zif_lab_04_antmu_employee,
          go_internal_empl   TYPE REF TO zcl_lab_32_antmu_internal_empl,
          go_expatriate_empl TYPE REF TO zcl_lab_33_antmu_expatriate_em.

    go_internal_empl = NEW #( ).
    APPEND go_internal_empl TO gt_employee_count.
    go_expatriate_empl = NEW #(  ).
    APPEND go_expatriate_empl TO gt_employee_count.

    LOOP AT gt_employee_count INTO go_employee_count.
      out->write( go_employee_count->get_employees_count(  ) ).
    ENDLOOP.

* Ejercicio 3 Asociación.

    DATA(lo_student1) = NEW zcl_lab_34_antmu_student( ).
    DATA(lo_college) = NEW zcl_lab_35_antmu_college(  ).

    lo_student1->set_name( 'Antonio' ).
    lo_student1->get_name(
      RECEIVING
        rv_name = DATA(lv_name) ).

    lo_college->enroll_student( iv_enroll_student = lo_student1 ).

    out->write( lo_college->student->get_name( ) ).


* Ejercicio 4 Composición.

    DATA(lo_screen) = NEW zcl_lab_37_antmu_screen(  ).
    DATA(lo_phone)  = NEW zcl_lab_36_antmu_phone( lo_screen ).

    lo_screen->set_screen( iv_screen = 'La pantalla es un modelo grande'  ).
    lo_screen->get_screen( RECEIVING rv_screen = DATA(lv_screen) ).

    out->write( lo_phone->screen->get_screen(  ) ).

* Ejercicio 5 Múltiples referencias apuntando al mismo objeto

    DATA(lo_price_1) = NEW  zcl_lab_38_antmu_prod_price(  ).
    DATA(lo_price_2) = NEW zcl_lab_38_antmu_prod_price(  ).


    lo_price_2 = lo_price_1.

    lo_price_2->price = 500.

    out->write( lo_price_1->price ).

* Ejercicio 6 Crear instancias de tipos distintos


    DATA: lo_budget TYPE REF TO zcl_lab_39_ANTMU_budget.


    lo_budget = NEW zcl_lab_40_ANTMU_actual_budget( ).

    zcl_lab_40_ANTMU_actual_budget=>lv_text = 'El presupuesto es de 1000 €'.

    out->write( lo_budget->get_budget( ) ).

* Ejercicio 7 Asignar instancias a la clase genérica Object

    DATA: lr_object TYPE REF TO object.
    DATA(go_object) = NEW zcl_lab_41_antmu_organization( ).
    DATA lv_headquarters TYPE string.

    CALL METHOD go_object->set_headquarters EXPORTING iv_headquarters = 'Sede_001'.

    CALL METHOD go_object->get_headquarters RECEIVING rv_headquarters = lv_headquarters.

    out->write( lv_headquarters ).

    CALL METHOD go_object->set_headquarters EXPORTING iv_headquarters = 'Sede_002'.

    CALL METHOD go_object->get_headquarters RECEIVING rv_headquarters = lv_headquarters.

    out->write( lv_headquarters ).

* Ejercicio 1 - 2  Eventos Definición - Levantamiento objeto - clase receptora

    DATA: lo_screen_2   TYPE REF TO zcl_lab_42_antmu_screen,
          lo_navigation TYPE REF TO zcl_lab_43_antmu_navigation.

    lo_screen_2 = NEW #( iv_screen_type = '42 Pulgadas' ).

    lo_navigation = NEW #( ).

    SET HANDLER lo_navigation->on_touch_screen FOR lo_screen_2 ACTIVATION abap_true.

    lo_screen_2->element_selected(
        iv_pos_x = 130
        iv_pos_y = 50 ).

    out->write( lo_navigation->lv_log ).

* Ejercicio 5 Definir eventos en las interfases

    DATA(go_operat_sistem)  = NEW zcl_lab_44_antmu_operat_sistem(  ).
    DATA(go_chrome) = NEW zcl_lab_45_antmu_chrome( ).


*    SET HANDLER go_chrome->on_close_windows FOR go_operat_sistem ACTIVATION abap_true.
*
*    go_operat_sistem->mouse_movement( ).
*
*
*    out->write( go_operat_sistem->log ).
*
*    out->write( go_chrome->log ).

* Ejercicio 6 Desactivar el objeto manejador.

    SET HANDLER go_chrome->on_close_windows FOR go_operat_sistem ACTIVATION abap_false.

    go_operat_sistem->mouse_movement( ).

    out->write( go_operat_sistem->log ).

    out->write( go_chrome->log ).

* Ejercicio 7  Eventos estáticos

*    data(go_operator) = new zcl_lab_46_antmu_mob_operator(  ).
    SET HANDLER zcl_lab_47_antmu_custo_service=>on_new_call.

    DATA: lv_telf1 TYPE string VALUE '123456'.
    zcl_lab_46_antmu_mob_operator=>assign_call( lv_telf1 ).
    out->write( zcl_lab_47_antmu_custo_service=>lv_call ).

* Ejercicio 8  All Instance


    DATA: lv_log TYPE string.

    DATA go_admin1 TYPE REF TO zcl_lab_48_antmu_admin_dep.
    DATA go_admin2 TYPE REF TO zcl_lab_48_antmu_admin_dep.
    DATA go_admin3 TYPE REF TO zcl_lab_48_antmu_admin_dep.

    DATA go_emp TYPE REF TO zcl_lab_49_antmu_employee.

    go_emp = NEW #(  ).

*    Registrar handler para todas las instancias
    SET HANDLER go_emp->on_payroll_paid
        FOR ALL INSTANCES.


    go_admin1 = NEW #( i_emp_id = 'Employe_1' ).
    go_emp->on_payroll_paid( ).
    out->write( go_emp->lv_log ).

    go_admin1 = NEW #( i_emp_id = 'Employe_2' ).
    go_emp->on_payroll_paid( ).
    out->write( go_emp->lv_log ).

    go_admin1 = NEW #( i_emp_id = 'Employe_3' ).
    go_emp->on_payroll_paid( ).
    out->write( go_emp->lv_log ).

* Ejercicio 3 - Componentes Locales


*    DATA: lo_work_zone TYPE REF TO zcl_lab_50_antmu_work_zone,
*          lo_friend    TYPE REF TO zcl_lab_51_antmu_wz_friend.
*
*    CREATE OBJECT lo_friend.
*    lo_friend->get_helper( ).

* Ejercicio 4 - 5 - Estructura de control TRY-CATCH-ENDTRY-RETRY

*    DATA(lo_check_user) =  NEW zcl_lab_53_antmu_check_user( ).
*
*    DATA: lv_result TYPE i,
*          lv_num1   TYPE i VALUE 10,
*          lv_num2   TYPE i.
*
*    TRY.
**        lo_check_user->check_user( iv_user = sy-uname ).
*
*        lv_result = lv_num1 / lv_num2.
*
*      CATCH zcx_lab_antmu_52_operations INTO DATA(lx_check_user).
*        out->write( lx_check_user->get_text( ) ).
*
*      CATCH cx_sy_zerodivide INTO DATA(lx_zero_divide).
*        out->write( lx_zero_divide->get_text( ) ).
*        lv_num2 = 2.
*        RETRY.
*    ENDTRY.
*
*
*    out->write( |FINISH:{ lv_result }| ).

* Ejercicio 7 - Estructura de control CLANUP

    DATA(lo_check_user) =  NEW zcl_lab_53_antmu_check_user( ).

    DATA: lv_result TYPE i,
          lv_num1   TYPE i VALUE 10,
          lv_num2   TYPE i.

    TRY.
        TRY.
            lv_result = lv_num1 / lv_num2.

          CATCH zcx_lab_antmu_52_operations INTO DATA(lx_check_user).
            out->write( lx_check_user->get_text( ) ).

          CLEANUP INTO DATA(lx_cleanup).
            out->write( |CLEANUP:{ lx_cleanup->get_text(  ) }| ).
        ENDTRY.
      CATCH cx_sy_zerodivide INTO DATA(lx_zero_divide).
        out->write( lx_zero_divide->get_text( ) ).
        lv_num2 = 2.
        RETRY.
    ENDTRY.


    out->write( |FINISH:{ lv_result }| ).

* Ejercicio 8 - Implementación de excepciones reanudables

*  1er caso IBAN correcto

    DATA: lo_bank       TYPE REF TO zcl_lab_54_antmu_bank,
          lv_log1       TYPE string,
          gcx_excepcion TYPE REF TO zcx_lab_55_antmu_auth_iban.

    CREATE OBJECT lo_bank.

    TRY.

        lo_bank->transfer(
          EXPORTING
            iv_iban = 'ES95 4329 8765 4321'
          CHANGING
            cv_log  = lv_log1
        ).

        lv_log1 = |{ lv_log1 }...{ gcx_excepcion->get_text(  ) }|.
        Out->write( lv_log1 ).

      CATCH BEFORE UNWIND zcx_lab_55_antmu_auth_iban INTO gcx_excepcion.

        IF gcx_excepcion->is_resumable EQ abap_true.
          RESUME.
        ELSE.
          lv_log1 = |{ lv_log1 }...{ gcx_excepcion->get_text(  ) }|.
          Out->write( lv_log1 ).
        ENDIF.
    ENDTRY.

*  2er caso IBAN incorrecto
    DATA: lv_log2        TYPE string.

    CREATE OBJECT lo_bank.

    TRY.
        lo_bank->transfer(
          EXPORTING
            iv_iban = 'ES95 4329 8765 3333'
          CHANGING
            cv_log  = lv_log2
        ).

        lv_log2 = |{ lv_log2 }...{ gcx_excepcion->get_text(  ) }|.
        Out->write( lv_log2 ).

      CATCH BEFORE UNWIND zcx_lab_55_antmu_auth_iban INTO gcx_excepcion.

        IF gcx_excepcion->is_resumable EQ abap_true.
          RESUME.
        ELSE.
          lv_log2 = |{ lv_log2 }...{ gcx_excepcion->get_text(  ) }|.
          Out->write( lv_log2 ).
        ENDIF.
    ENDTRY.

* Ejercicio 9 - Asignación de excepciones unas a otras

    DATA: lo_date_analyze    TYPE REF TO zcl_lab_58__antm_date_analyzer.

    CREATE OBJECT lo_date_analyze.

    TRY.
        TRY.
            lo_date_analyze->analyze_date( ).

          CATCH zcx_lab_56_antmu_no_date INTO DATA(gcx_no_date).
            lo_date_analyze->analyze_format( io_ANALYZE_FORMAT = gcx_no_date ).
        ENDTRY.

      CATCH  zcx_lab_57_antm_format_unknown INTO DATA(gcx_format_unknown).

        out->write( |{ gcx_format_unknown->get_text(  ) }\n| ).

        IF   gcx_format_unknown->previous IS BOUND.
          out->write( gcx_format_unknown->previous->get_text(  ) ).
        ENDIF.
    ENDTRY.

* Ejercicio 6 - ABAP Unit Test - Test-Injection

    DATA(lo_cut) = NEW zcl_lab_61_antmu_travel(  ).

    lo_cut->get_travel(
        IMPORTING
          es_travel = DATA(ls_travel) ).

    out->write( |{ ls_travel-travel_id }-{ ls_travel-agency_id }-{ ls_travel-customer_id  }| ).

* Ejercicio 1 - Patrón de diseño SINGLETON


    DATA: lo_context1 TYPE REF TO zcl_lab_62_antmu_context,
          lo_context2 TYPE REF TO zcl_lab_62_antmu_context,
          lv_text     TYPE string.

    lo_context1 = zcl_lab_62_antmu_context=>get_instance( ).
    lo_context2 = zcl_lab_62_antmu_context=>get_instance( ).

    lo_context1->set_text( 'Primer patrón Singleton en ABAP' ).
    lv_text = lo_context2->get_text( ).

    out->write( lv_text  ).
    out->write( lv_text  ).

    out->write( cl_abap_char_utilities=>newline ).

    lo_context1->set_text( 'Segundo patrón Singleton en ABAP' ).
    lv_text = lo_context2->get_text( ).

    out->write( lv_text  ).
    out->write( lv_text  ).

* Ejercicio 2 - Patrón de diseño FACTORY METHOD

    DATA: go_file    TYPE REF TO zif_lab_06_antmu_file,
          go_factory TYPE REF TO zcl_lab_65_antmu_factory.

    go_factory = new #(  ).

    go_file = zcl_lab_65_antmu_factory=>create_file( 'WORK' ).
    out->write( go_file->get_file_type( ) ).

    go_file = zcl_lab_65_antmu_factory=>create_file( 'SUPPLY' ).
     out->write( go_file->get_file_type( ) ).


  ENDMETHOD.

ENDCLASS.
