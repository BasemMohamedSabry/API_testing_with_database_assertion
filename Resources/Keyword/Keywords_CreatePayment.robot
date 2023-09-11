*** Settings ***
Library     RequestsLibrary
Library     BuiltIn
Library     Collections
Library     String
Library    JSONLibrary
Library          DateTime
Resource     ../Objects/API_Preferences.robot
Resource    ../Database/Assertions.robot

*** Variables ***




*** Keywords ***



Verify API Response when send valid data - Create Payment
    [Documentation]    veriy actual resutls when send valid data
    [Arguments]           ${actualResult}
    DB_Get_ApplicationID_from_Invoice_table_By_ApplicationRef     ${actualResult['applicationReference']}
    should not be equal      ${DB_ApplicationID}         None


Verify API Response when send null/invalid values
    [Documentation]    veriy actual resutls when send null or invalid data
    [Arguments]           ${actualResult}
    should be equal as strings        ${actualResult['errorCode']}    ValidationErrorCode

Verify API Response when send null/invalid values4
    [Documentation]    veriy actual resutls when send null or invalid data
    [Arguments]           ${actualResult}
    should be equal as strings        ${actualResult['errorCode']}    MP011

Verify API Response when send null/invalid values5
    [Documentation]    veriy actual resutls when send null or invalid data
    [Arguments]           ${actualResult}
    should be equal as strings        ${actualResult['errorCode']}   MP005
Verify API Response when send null/invalid values1
    [Documentation]    veriy actual resutls
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

