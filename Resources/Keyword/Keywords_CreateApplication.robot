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




Verify API Response when send valid data - Create application- visitor
    [Documentation]    veriy actual resutls when send valid data
    [Arguments]           ${actualResult}        ${Identity_num}      ${Sponser_num}
    DB_Get_PolicyHolder_details_By_ApplicationRef    ${actualResult['applicationReference']}
    should be equal as strings      ${DB_Identity_number}         ${Identity_num}
    should be equal as strings      ${SponserNumber}         ${Sponser_num}

Verify API Response when send valid data - Create application- saudi/iqama
    [Documentation]    veriy actual resutls when send valid data
    [Arguments]           ${actualResult}        ${Identity_num}
    DB_Get_PolicyHolder_details_By_ApplicationRef    ${actualResult['applicationReference']}
    should be equal as strings      ${DB_Identity_number}         ${Identity_num}

#    EffectiveStartDate
#    should be equal as strings        ${actualResult['model']['effectiveStartDate']}       ${effectiveStartDate}


Verify API Response when send invalid data not matched with NIC - create application
    [Documentation]    veriy actual resutls when send data not matched with NIC
    [Arguments]           ${actualResult}
    should be equal as strings        ${actualResult['errorCode']}    MP022
    should be equal as strings      ${actualResult['errors']}     ['The input entered aren’t matching with the data at the National Information Center, kindly check the input and try again']




Verify API Response when send null/invalid values2
    [Documentation]    veriy actual resutls
    [Arguments]           ${actualResult}
    should be equal as strings        ${actualResult['errorCode']}   ValidationErrorCode
#    should be equal as strings        ${actualResult['errors']}    ['The ID entered is invalid, kindly check the input and try again']

Verify API Response when send null/invalid values
    [Documentation]    veriy actual resutls
    [Arguments]           ${actualResult}
    should be equal as strings        ${actualResult['errorCode']}    MP021

Verify API Response when send null/invalid values3
    [Documentation]    veriy actual resutls
    [Arguments]           ${actualResult}
    should be equal as strings        ${actualResult['errorCode']}    MP022

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

EffectiveStartDate
     ${CurrentTime}     get time      hour
     ${check_time}    run keyword and return status    SHOULD BE TRUE    ${CurrentTime} > 12
     run keyword if  "${check_time}" == "False"  run keywords    Getcurrent date +1d
     ...  ELSE IF  "${check_time}" =="True"     Getcurrent date +2d

Getcurrent date +1d
   ${effectiveStartDate}    get current date    increment=24h    result_format=%d-%m-%Y
   set test variable     ${effectiveStartDate}
Getcurrent date +2d
   ${effectiveStartDate}    get current date    increment=48h    result_format=%d-%m-%Y
   set test variable     ${effectiveStartDate}