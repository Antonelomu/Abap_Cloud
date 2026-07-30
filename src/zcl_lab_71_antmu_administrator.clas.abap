CLASS zcl_lab_71_antmu_administrator DEFINITION INHERITING FROM zcl_lab_70_antmu_observer
  PUBLIC
  FINAL
  CREATE PUBLIC.


  PUBLIC SECTION.

    DATA notification TYPE string.

    METHODS on_new_article REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_71_antmu_administrator IMPLEMENTATION.
  METHOD on_new_article.
    notification = |Administrador avisado. Revisa el artículo: { ev_article }|.
  ENDMETHOD.

ENDCLASS.
