INTERFACE zif_lab_02_antmu_customer
  PUBLIC .
  TYPES: BEGIN OF ty_cust_address,
           first_name TYPE string,
           last_names TYPE string,
         END OF ty_cust_address.

  METHODS: get_customer IMPORTING VALUE(iv_customer) TYPE string
                        RETURNING VALUE(rv_customer) TYPE ty_cust_address.


ENDINTERFACE.
