CLASS zcl_lab_72_antmu_users DEFINITION INHERITING FROM zcl_lab_70_antmu_observer
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    DATA notification TYPE string.

    METHODS on_new_article REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_72_antmu_users IMPLEMENTATION.
  METHOD on_new_article.

    notification = |Usuarios avisados. Nuevo artículo disponible: { ev_article }|.
  ENDMETHOD.

ENDCLASS.
