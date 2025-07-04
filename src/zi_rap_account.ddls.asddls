@AbapCatalog.sqlViewName: 'ZIRAPACCOUNT'
@AbapCatalog.compiler.compareFilter: true
/*@AbapCatalog.preserveKey: true */
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Account table view'
@Metadata.ignorePropagatedAnnotations: true
define root view zi_rap_account as select from ztab_account
{
  key contract_int as ContractInt,
  bankland as BankLand,
  bankkey as BankKey,
  acnum as AccNum,
  ac_currency as AccCurr,
  iban as Iban,
  swift as Swift,
  crusr as CrUsr,
  timestamp_create as TmstmpCr
    
}
