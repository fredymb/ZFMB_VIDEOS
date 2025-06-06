FUNCTION zfmb_assign_url.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IV_VIDEOUUID) TYPE  SYSUUID_X16
*"----------------------------------------------------------------------
  " You can use the template 'functionModuleParameter' to add here the signature!
  .

  UPDATE zfmb_video
  SET url = 'New URL'
  WHERE video_uuid = @iv_videouuid.

*  WAIT UP TO 5 SECONDS.
*----------------------------------------------------------------------*
* Change Log:                                                          *
*                                                                      *
* Who                 Date         Text                                *
* Fredy Moncada      19-May-2025  1100261938 Initial version           *
*&---------------------------------------------------------------------*
  DATA: lv_start TYPE timestampl,
        lv_end   TYPE timestampl.
  GET TIME STAMP FIELD lv_start.
  DO.
    GET TIME STAMP FIELD lv_end.
    IF lv_end - lv_start >= 5. " 1 second in floating point
      EXIT.
    ENDIF.
  ENDDO.

  zbp_r_fmb_video=>raise_assign_url_finished( video_events = VALUE #( ( VideoUuid = iv_videouuid ) ) ).

*  DATA lt_fmb_video TYPE STANDARD TABLE OF zr_fmb_video.
*
*  lt_fmb_video = VALUE #( ( videouuid = iv_videouuid ) ).
*
*  MODIFY ENTITIES OF zr_fmb_video "IN LOCAL MODE
*        ENTITY ZrFmbVideo
*          EXECUTE AssignUrlFinish
*            FROM CORRESPONDING  #( lt_fmb_video ).
*  COMMIT ENTITIES.

ENDFUNCTION.
