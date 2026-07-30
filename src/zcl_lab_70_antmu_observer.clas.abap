CLASS zcl_lab_70_antmu_observer DEFINITION
  PUBLIC
  CREATE PUBLIC
  ABSTRACT.

  PUBLIC SECTION.

    METHODS on_new_article ABSTRACT
      FOR EVENT new_article OF zcl_lab_69_antmu_blog
      IMPORTING ev_article.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_70_antmu_observer IMPLEMENTATION.

ENDCLASS.
