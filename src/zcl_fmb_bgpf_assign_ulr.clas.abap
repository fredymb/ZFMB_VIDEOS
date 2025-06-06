CLASS zcl_fmb_bgpf_assign_ulr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_serializable_object .
    INTERFACES if_bgmc_operation .
    INTERFACES if_bgmc_op_single .

    METHODS constructor
      IMPORTING
        iv_videouuid TYPE sysuuid_x16.

  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA mv_videouuid TYPE sysuuid_x16.

    METHODS save.

ENDCLASS.



CLASS zcl_fmb_bgpf_assign_ulr IMPLEMENTATION.


  METHOD if_bgmc_op_single~execute.

    cl_abap_tx=>save( ).

    save( ).

  ENDMETHOD.

  METHOD constructor.
    mv_videouuid = iv_videouuid.
  ENDMETHOD.

  METHOD save.

    CALL FUNCTION 'ZFMB_ASSIGN_URL'
      EXPORTING
        iv_videouuid = mv_videouuid.

  ENDMETHOD.

ENDCLASS.
