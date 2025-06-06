CLASS lsc_zr_fmb_video DEFINITION INHERITING FROM cl_abap_behavior_saver.

  PROTECTED SECTION.

    METHODS save_modified REDEFINITION.



ENDCLASS.

CLASS lsc_zr_fmb_video IMPLEMENTATION.

  METHOD save_modified.

    IF zbp_r_fmb_video=>gv_videouuid IS NOT INITIAL.

      DATA lo_operation       TYPE REF TO if_bgmc_op_single.

      DATA lo_process         TYPE REF TO if_bgmc_process_single_op.

      DATA lo_process_factory TYPE REF TO if_bgmc_process_factory.

      DATA lo_process_monitor TYPE REF TO if_bgmc_process_monitor.

      DATA lx_bgmc            TYPE REF TO cx_bgmc.

      DATA lv_videouuid TYPE sysuuid_x16.

      lv_videouuid = zbp_r_fmb_video=>gv_videouuid.
      lo_operation = NEW zcl_fmb_bgpf_assign_ulr( iv_videouuid = lv_videouuid ).

      TRY.

          lo_process_factory = cl_bgmc_process_factory=>get_default( ).



          lo_process = lo_process_factory->create( ).



          lo_process->set_name( 'Test process 1'

                   )->set_operation( lo_operation ).



          lo_process_monitor = lo_process->save_for_execution( ).

          CLEAR zbp_r_fmb_video=>gv_videouuid.

        CATCH cx_bgmc INTO lx_bgmc.

      ENDTRY.

    ENDIF.

  ENDMETHOD.

ENDCLASS.

CLASS lhc_zr_fmb_video DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR ZrFmbVideo
        RESULT result,
      PopUpConfirm FOR MODIFY
        IMPORTING keys FOR ACTION ZrFmbVideo~PopUpConfirm,
      AssignUrl FOR MODIFY
        IMPORTING keys FOR ACTION ZrFmbVideo~AssignUrl,
      AssignUrlFinish FOR MODIFY
        IMPORTING keys FOR ACTION ZrFmbVideo~AssignUrlFinish.
ENDCLASS.

CLASS lhc_zr_fmb_video IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.
  METHOD PopUpConfirm.

    reported-zrfmbvideo = VALUE #( (  %msg =  me->new_message_with_text(
                                      severity = if_abap_behv_message=>severity-information
                                      text     = 'PopUp Message'
                                           ) ) ).

  ENDMETHOD.

  METHOD AssignUrl.

    mapped-zrfmbvideo = VALUE #( ( VideoUuid = keys[ 1 ]-VideoUuid ) ).
    zbp_r_fmb_video=>gv_videouuid = keys[ 1 ]-VideoUuid.

*    DATA lo_operation       TYPE REF TO if_bgmc_op_single.
*
*    DATA lo_process         TYPE REF TO if_bgmc_process_single_op.
*
*    DATA lo_process_factory TYPE REF TO if_bgmc_process_factory.
*
*    DATA lo_process_monitor TYPE REF TO if_bgmc_process_monitor.
*
*    DATA lx_bgmc            TYPE REF TO cx_bgmc.
*
*    DATA lv_videouuid TYPE sysuuid_x16.
*
*    LOOP AT keys ASSIGNING FIELD-SYMBOL(<fs_keys>).
*
*      lv_videouuid = <fs_keys>-VideoUuid.
*      lo_operation = NEW zcl_fmb_bgpf_assign_ulr( iv_videouuid = lv_videouuid ).
*
*      TRY.
*
*          lo_process_factory = cl_bgmc_process_factory=>get_default( ).
*
*
*
*          lo_process = lo_process_factory->create( ).
*
*
*
*          lo_process->set_name( 'Test process 1'
*
*                   )->set_operation( lo_operation ).
*
*
*
*          lo_process_monitor = lo_process->save_for_execution( ).
*
*
*        CATCH cx_bgmc INTO lx_bgmc.
*
*
*      ENDTRY.
*
*  ENDLOOP.

  ENDMETHOD.

  METHOD AssignUrlFinish.
    RAISE ENTITY EVENT zr_fmb_video~AssignUrlFinished
       FROM VALUE #( ( %key   = keys[ 1 ]-%key ) ).
  ENDMETHOD.

ENDCLASS.

CLASS lcl_event_handler DEFINITION FRIENDS zbp_r_fmb_video.

  PUBLIC SECTION.
    CLASS-METHODS on_assign_url_finished
      IMPORTING video_events TYPE zbp_r_fmb_video=>video_events.
ENDCLASS.

CLASS lcl_event_handler IMPLEMENTATION.

  METHOD on_assign_url_finished.
    RAISE ENTITY EVENT zr_fmb_video~AssignUrlFinished
      FROM video_events.
  ENDMETHOD.
ENDCLASS.
