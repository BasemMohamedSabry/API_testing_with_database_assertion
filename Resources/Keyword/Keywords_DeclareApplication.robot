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




Verify API Response when send valid data - declare application
    [Documentation]    veriy actual resutls when send valid data
    [Arguments]           ${actualResult}     ${Q1}     ${Q2}    ${Q3}    ${Q4}    ${Q5}    ${Q6}

    DB_Get_QuestionsAnswer_from_Declaration_table_By_ApplicationRef     ${actualResult['applicationReference']}

    should be equal as strings      ${DB_QuestionsAnswers_1}      ${Q1}
    should be equal as strings      ${DB_QuestionsAnswers_2}      ${Q2}
    should be equal as strings      ${DB_QuestionsAnswers_3}      ${Q3}
    should be equal as strings      ${DB_QuestionsAnswers_4}      ${Q4}
    should be equal as strings      ${DB_QuestionsAnswers_5}      ${Q5}
    should be equal as strings      ${DB_QuestionsAnswers_6}      ${Q6}




Verify API Response when send null/invalid values
    [Documentation]    veriy actual resutls when send invalid data
    [Arguments]           ${actualResult}
    should be equal as strings        ${actualResult['errorCode']}    ValidationErrorCode

Verify API Response when send null/invalid values1
    [Documentation]    veriy actual resutls when send invalid data
    [Arguments]           ${actualResult}
    should be equal as strings        ${actualResult['errorCode']}    MP004

Verify API Response when send null/invalid values3
    [Documentation]    veriy actual resutls when send invalid data
    [Arguments]           ${actualResult}
    should be equal as strings        ${actualResult['errorCode']}    MP026

Verify API Response when send invalid Application reference
    [Documentation]    veriy actual resutls
    [Arguments]           ${actualResult}
    should be equal as strings        ${actualResult['errors']}    ['Application not found']

Verify API Response when send invalid Authentication token
    [Documentation]    veriy actual resutls
    [Arguments]           ${actualResult}
    should be equal as strings        ${actualResult['errors']}       ['UnAuthorized user']

