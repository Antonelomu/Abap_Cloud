CLASS zcl_lab_53_antmu_check_user DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS: check_user IMPORTING iv_user TYPE syuname
                        RAISING   zcx_lab_antmu_52_operations.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_53_antmu_check_user IMPLEMENTATION.
  METHOD check_user.

    IF sy-uname EQ 'CB9980000350'.

       raISE exCEPTION type zcx_lab_antmu_52_operations
         EXPORTING
           textid   = zcx_lab_antmu_52_operations=>no_access
*           previous =
           msgv1    = |{ sy-uname }|
*           msgv2    =
*           msgv3    =
*           msgv4    =
       .
    ELSE.

    ENDIF.
  ENDMETHOD.

ENDCLASS.
