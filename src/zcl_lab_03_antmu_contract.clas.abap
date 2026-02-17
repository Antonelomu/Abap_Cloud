CLASS zcl_lab_03_antmu_contract DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
* Una declaración de un atributo en la encapsulación pública es accesible para todas las instancias.
    DATA: cntr_type TYPE c LENGTH 2.

    METHODS: set_creaation_date IMPORTING iv_creation_date TYPE zdate.

  PROTECTED SECTION.
* Una declaración de un atributo en la encapsulación protegida esta disponible de la misma clase y de las clases hijas
    DATA: creation_date TYPE zdate.
  PRIVATE SECTION.
* Una declaración de un atributo en la encapsulación privada es un atributo de instancia accesible de la clase
    DATA: client TYPE string.
ENDCLASS.



CLASS zcl_lab_03_antmu_contract IMPLEMENTATION.
  METHOD set_creaation_date.
    creation_date  = iv_creation_date.
  ENDMETHOD.

ENDCLASS.
