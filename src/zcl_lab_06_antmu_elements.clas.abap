CLASS zcl_lab_06_antmu_elements DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

* 8-Constantes en clases
    CONSTANTS: BEGIN OF cs_colores,
                 color_r TYPE c LENGTH 4 VALUE 'ROJO',
                 color_v TYPE c LENGTH 5 VALUE 'VERDE',
                 color_a TYPE c LENGTH 8 VALUE 'AMARILLO',
                 color_g TYPE c LENGTH 4 VALUE 'GRIS',
               END OF cs_colores.

    CLASS-DATA: colores TYPE string.

    TYPES: BEGIN OF ty_elem_objects,
             class     TYPE string,
             instance  TYPE string,
             reference TYPE string,
           END OF ty_ELEM_OBJECTS.


    METHODS: set_object IMPORTING VALUE(iv_class)     TYPE ty_elem_objects-class
                                  VALUE(iv_instance)  TYPE ty_elem_objects-instance
                                  VALUE(iv_reference) TYPE ty_elem_objects-reference.

    METHODS: get_object RETURNING VALUE(rs_object) TYPE ty_elem_objects.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA ms_object TYPE ty_elem_objects.
ENDCLASS.



CLASS zcl_lab_06_antmu_elements IMPLEMENTATION.
  METHOD set_object.
    ms_object-class     = iv_class.
    ms_object-instance  = iv_instance.
    ms_object-reference = iv_reference.

  ENDMETHOD.

  METHOD get_object.
    rs_object = ms_object.
  ENDMETHOD.

ENDCLASS.
