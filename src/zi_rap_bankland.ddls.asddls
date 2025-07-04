@AbapCatalog.sqlViewName: 'ZIRAPBANKLAND'
@AbapCatalog.compiler.compareFilter: true
/*@AbapCatalog.preserveKey: true*/
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View for Bankland Value Help'
@Metadata.ignorePropagatedAnnotations: true
define view zi_rap_bankland as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name: 'ZDOM_BANKLAND') 
{ 
    key domain_name,
    key value_position,
    @Semantics.language: true
    key language,
    value_low,
    @Semantics.text: true
    text
}
