*** Settings ***
Library     RequestsLibrary
Library     BuiltIn
Library     Collections
Library     String
Library    JSONLibrary
Library          DateTime

*** Variables ***


${identityNumber}     1000687028
${borderNumber}     3095602656
${sponserNumber}     7002834633
${effectiveDate}     11-02-2023
${Q1}    False
${Q2}    True
${Q3}    True
${Q4}    True
${Q5}    True
${Q6}    False
*** Keywords ***


Create_Date_Today+2
   ${TodayDate+2}    get current date    increment=48h    result_format=%d-%m-%Y
   set global variable    ${TodayDate+2}

