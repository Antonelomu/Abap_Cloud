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
          lv_gris     type c leNGTH '4'.

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

  ENDMETHOD.

ENDCLASS.
