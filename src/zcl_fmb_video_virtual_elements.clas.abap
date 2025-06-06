CLASS zcl_fmb_video_virtual_elements DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_sadl_exit_calc_element_read .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_fmb_video_virtual_elements IMPLEMENTATION.


  METHOD if_sadl_exit_calc_element_read~calculate.

    DATA videos TYPE STANDARD TABLE OF zc_fmb_video WITH DEFAULT KEY.
    videos = CORRESPONDING #( it_original_data ).

    LOOP AT videos ASSIGNING FIELD-SYMBOL(<videos>).

      TRY.
          DATA(video_id) = segment( val = <videos>-url index = 4 sep = '/'  ).
          <videos>-Thumbnail = 'https://img.youtube.com/vi/' && video_id && '/hqdefault.jpg'.
        CATCH cx_root.
      ENDTRY.

    ENDLOOP.

    ct_calculated_data = CORRESPONDING #(  videos ).

  ENDMETHOD.


  METHOD if_sadl_exit_calc_element_read~get_calculation_info.
  ENDMETHOD.
ENDCLASS.
