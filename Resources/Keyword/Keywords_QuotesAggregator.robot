*** Settings ***
Library     RequestsLibrary
Library     BuiltIn
Library     Collections
Library     String
Library    JSONLibrary
Library          DateTime


*** Variables ***




*** Keywords ***



Verify API Response when send valid data - QuotesAggregator
    [Documentation]    veriy actual resutls when send valid data
    [Arguments]           ${resp.status_code}
    should be equal as strings        ${resp.status_code}    200




