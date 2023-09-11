*** Settings ***
Library     RequestsLibrary
Library     BuiltIn
Library     Collections
Library     String
Library    JSONLibrary
Library          DateTime
Resource    ../Database/Assertions.robot

*** Variables ***




*** Keywords ***




Verify API Response when send valid data - select quotation
    [Documentation]    veriy actual resutls when send valid data
    [Arguments]           ${actualResult}
    DB_Get_QuoteID_from_Quotation_By_ApplicationRef      ${actualResult['applicationReference']}
    DB_Get_QuoteID_from_application_By_ApplicationRef       ${actualResult['applicationReference']}
    should be equal as strings       ${DB_QuoteIDquotation}        ${DB_QuoteIDapplication}



Verify API Response when send null/invalid values
    [Documentation]    veriy actual resutlsv when send valid data
    [Arguments]           ${actualResult}
    should be equal as strings        ${actualResult['errorCode']}    ValidationErrorCode

Verify API Response when send null/invalid values1
    [Documentation]    veriy actual resutls when send invalid data
    [Arguments]           ${actualResult}
    should be equal as strings        ${actualResult['errorCode']}    MP004

Verify API Response when send invalid Application reference
    [Documentation]    veriy actual resutls
    [Arguments]           ${actualResult}
    should be equal as strings        ${actualResult['errors']}    ['Application not found']

Verify API Response when send invalid Authentication token
    [Documentation]    veriy actual resutls
    [Arguments]           ${actualResult}
    should be equal as strings        ${actualResult['errors']}       ['UnAuthorized user']

