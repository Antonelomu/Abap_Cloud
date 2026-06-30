CLASS zcx_lab_55_antmu_auth_iban DEFINITION
  PUBLIC
    INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

    CONSTANTS:

      BEGIN OF iban_incorrecto,
        msgid TYPE symsgid VALUE 'ZMC_LAB_01_MESAGE',
        msgno TYPE symsgno VALUE '003',
        attr1 TYPE scx_attrname VALUE 'mv_msgv1',
        attr2 TYPE scx_attrname VALUE 'mv_msgv2',
        attr3 TYPE scx_attrname VALUE 'mv_msgv3',
        attr4 TYPE scx_attrname VALUE 'mv_msgv4',
      END OF iban_incorrecto,

      BEGIN OF iban_correcto,
        msgid TYPE symsgid VALUE 'ZMC_LAB_01_MESAGE',
        msgno TYPE symsgno VALUE '004',
        attr1 TYPE scx_attrname VALUE 'mv_msgv1',
        attr2 TYPE scx_attrname VALUE 'mv_msgv2',
        attr3 TYPE scx_attrname VALUE 'mv_msgv3',
        attr4 TYPE scx_attrname VALUE 'mv_msgv4',
      END OF iban_correcto.

    DATA: mv_msgv1 TYPE msgv1,
          mv_msgv2 TYPE msgv1,
          mv_msgv3 TYPE msgv1,
          mv_msgv4 TYPE msgv1.

    METHODS constructor
      IMPORTING
        !textid   LIKE if_t100_message=>t100key OPTIONAL
        !previous LIKE previous OPTIONAL
        msgv1     TYPE msgv1 OPTIONAL
        msgv2     TYPE msgv1 OPTIONAL
        msgv3     TYPE msgv1 OPTIONAL
        msgv4     TYPE msgv1 OPTIONAL.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcx_lab_55_antmu_auth_iban IMPLEMENTATION.
  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor(
     previous = previous
     ).
    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.

    me->mv_msgv1 = msgv1.
    me->mv_msgv2 = msgv2.
    me->mv_msgv3 = msgv3.
    me->mv_msgv4 = msgv4.
  ENDMETHOD.

ENDCLASS.
