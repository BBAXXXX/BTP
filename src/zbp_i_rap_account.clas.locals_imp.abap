CLASS lhc_zi_rap_account DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zi_rap_account RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR zi_rap_account RESULT result.
    METHODS determineiban FOR DETERMINE ON SAVE
      IMPORTING keys FOR zi_rap_account~determineiban.

ENDCLASS.

CLASS lhc_zi_rap_account IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD determineIban.
    READ ENTITIES OF zi_rap_account IN LOCAL MODE
      ENTITY zi_rap_account
      FIELDS ( BankLand AccNum BankKey Iban ) WITH CORRESPONDING #( keys )
      RESULT DATA(accounts).

    DATA(lv_cid) = '72849372937569'."cl_system_uuid=>create_uuid_x16_static( ).
    DATA(lv_control1) = lv_cid(2).
    DATA(lv_control2) = lv_cid+2(12).
    " Determine IBAN
    MODIFY ENTITIES OF zi_rap_account IN LOCAL MODE
        ENTITY zi_rap_account
        UPDATE
        FIELDS ( Iban )
        WITH VALUE #( FOR acc IN accounts
                        ( %tky = acc-%tky
                          Iban = |{ acc-BankLand }{ lv_control1 }{ acc-BankKey }{ lv_control2 }{  acc-AccNum }| ) )
    REPORTED DATA(update_reported).



  ENDMETHOD.

ENDCLASS.
