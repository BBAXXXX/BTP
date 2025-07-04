@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Account projection view'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
@Metadata.allowExtensions: true

define root view entity zc_rap_account as projection on zi_rap_account
{
    key ContractInt,
    @Consumption.valueHelpDefinition: [{ entity: { element: 'value_low', name: 'ZI_RAP_BANKLAND' }, distinctValues: true }]    /*zle*/
    BankLand,
    BankKey,
    @Search.defaultSearchElement: true
    AccNum,
    AccCurr,
    @Search.defaultSearchElement: true
    Iban,
    Swift,
    CrUsr,
    TmstmpCr
}
