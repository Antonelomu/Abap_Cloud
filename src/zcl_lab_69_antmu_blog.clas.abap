CLASS zcl_lab_69_antmu_blog DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    METHODS publish_article IMPORTING iv_article TYPE string.

    METHODS get_title RETURNING VALUE(rv_title) TYPE string.

    EVENTS new_article EXPORTING VALUE(ev_article) TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA gv_title TYPE string.
ENDCLASS.



CLASS zcl_lab_69_antmu_blog IMPLEMENTATION.

  METHOD publish_article.
    gv_title = iv_article.
    RAISE EVENT new_article EXPORTING ev_article = iv_article.
  ENDMETHOD.

  METHOD get_title.
    rv_title = gv_title.
  ENDMETHOD.

ENDCLASS.
