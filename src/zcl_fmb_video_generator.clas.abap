CLASS zcl_fmb_video_generator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_fmb_video_generator IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: itab    TYPE TABLE OF zfmb_video,
          lv_cont TYPE c LENGTH 2.


    GET TIME STAMP FIELD DATA(tsl).

    DO 3 TIMES.

      DATA(lv_video_uuid) = cl_system_uuid=>create_uuid_x16_static( ).

      ADD 1 TO lv_cont.

      tsl = cl_abap_tstmp=>add(
          tstmp = tsl
          secs  = 60
        ).

      itab = VALUE #( BASE itab
                    (  video_uuid = lv_video_uuid
                       title = | { lv_cont } 'Let''s code ABAP RESTful Application Programming Model (RAP) CDS Virtual Elements' |
                       url = 'https://youtu.be/BEbztssJlg8'
                       description = 'In this video we build a SAP YouTube Tutorials App with ABAP and the ABAP RESTful Application Programming Model (RAP). You learn how to insert data into a table through an executable ABAP class and how to create a' &&
                                     'll required artifacts to build a Business Service. We customize the UI with metadata extensions and we extend the projection view with a Virtual Element to display thumbnails.'
                       active = abap_true
                       last_changed_at = tsl
                       local_last_changed_at = tsl
                       local_created_by = sy-uname
                       local_created_at = tsl )

      ).

    ENDDO.

    DELETE FROM zfmb_video.
    INSERT zfmb_video FROM TABLE @itab.

    out->write( | { sy-dbcnt } entries inserted successfully!| ).

*    CALL FUNCTION 'ZFMB_ASSIGN_URL'
*      EXPORTING
*        iv_videouuid = lv_video_uuid.

  ENDMETHOD.
ENDCLASS.
