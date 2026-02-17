CLASS zcl_lab_08_antmu_work_record DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: set_open_new_record IMPORTING VALUE(iv_date)       TYPE zdate
                                           VALUE(iv_first_name) TYPE string
                                           VALUE(iv_last_name)  TYPE string
                                           VALUE(iv_surname)    TYPE string OPTIONAL,

      get_open_new_record EXPORTING VALUE(ev_date)       TYPE zdate
                                    VALUE(ev_first_name) TYPE string
                                    VALUE(ev_last_name)  TYPE string
                                    VALUE(ev_surname)    TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: date       TYPE zdate,
          first_name TYPE string,
          last_name  TYPE string,
          surname    TYPE string.
ENDCLASS.



CLASS zcl_lab_08_antmu_work_record IMPLEMENTATION.
  METHOD set_open_new_record.
    date = iv_date.
    first_name = iv_first_name.
    last_name = iv_last_name.
    surname = iv_surname.
  ENDMETHOD.

  METHOD get_open_new_record.
    ev_date = date.
    ev_first_name = first_name.
    ev_last_name = last_name.
    ev_surname = surname.
  ENDMETHOD.

ENDCLASS.
