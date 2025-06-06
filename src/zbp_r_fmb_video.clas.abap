CLASS zbp_r_fmb_video DEFINITION
  PUBLIC
  ABSTRACT
  FINAL
  FOR BEHAVIOR OF zr_fmb_video .

  PUBLIC SECTION.

    TYPES  video_events TYPE TABLE FOR EVENT zr_fmb_video~AssignUrlFinished.
    CLASS-METHODS raise_assign_url_finished
      IMPORTING video_events TYPE  video_events.

    CLASS-DATA gv_videouuid TYPE sysuuid_x16.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zbp_r_fmb_video IMPLEMENTATION.

  METHOD raise_assign_url_finished.

    lcl_event_handler=>on_assign_url_finished( video_events = video_events ).


  ENDMETHOD.

ENDCLASS.
