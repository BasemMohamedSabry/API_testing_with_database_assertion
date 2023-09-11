*** Settings ***
Documentation    Get All quotation list suite is designed to test and verify that user can get and display the quotes
Resource    ../Resources/Objects/API_Preferences.robot
Resource    ../Resources/Keyword/Keywords_GetAllQuotationlist.robot
Resource    ../Resources/Keyword/Keywords_Common_Purchaseflow.robot





*** Keywords ***

*** Variables ***
${URI-invalidAR}   /Applications/8eff212d-32fd-45cc-b2f9-5b6fa2be9039/Quotations
${identityNumber}     1121603326
${borderNumber}      3100933328
${sponserNumber}      7029140709
*** Test Cases ***



Testcase 7560 API service - Get All quotation list - Check response when send valid Get All quotation list request for logged in visitor
   [Tags]    regression     smoke
   DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
   QuotesAggregator - visitor
   Get token
   Create API session
   sleep    60s
   get request and check response    ${Valid-token}     ${sessionName}     /Applications/${DB_Application_ref}/Quotations          200
   Verify API Response when send valid data - get all quotations       ${actualResult}


Testcase 7561 API service - Get All quotation list - Check response when send valid Get All quotation list request for logged in Saudi/iqama
   [Tags]    regression     smoke
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    QuotesAggregator - Saudi/iqama
   Get token
   Create API session
   sleep    15s
   get request and check response    ${Valid-token}     ${sessionName}     /Applications/${DB_Application_ref}/Quotations          200
   Verify API Response when send valid data - get all quotations       ${actualResult}

Testcase 7563 API service - Get All quotation list -Check response when send Get request with invalid "applicationReference" for logged in visitor
   [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
     QuotesAggregator - Saudi/iqama
   Get token
   Create API session
   sleep    15s
   get request and check response   ${Valid-token}     ${sessionName}     ${URI-invalidAR}         404
   Keywords_GetAllQuotationlist.Verify API Response when send invalid Application reference       ${actualResult}
Testcase 7564 API service - Get All quotation list -Check response when send Get request with invalid "applicationReference" for logged in Saudi/iqama
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
     QuotesAggregator - Saudi/iqama
   Get token
   Create API session
   sleep    15s
   get request and check response   ${Valid-token}     ${sessionName}     ${URI-invalidAR}          404
   Keywords_GetAllQuotationlist.Verify API Response when send invalid Application reference       ${actualResult}



Testcase 7568 API service - Get All quotation list -Check response when send Get request with NULL value for logged in Saudi/iqama
   [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
     QuotesAggregator - Saudi/iqama
   Get token
   Create API session
   sleep    15s
  get request and check response   ${Valid-token}     ${sessionName}     ${URI-invalidAR}          404
  Keywords_GetAllQuotationlist.Verify API Response when send null/invalid values2       ${actualResult}

Testcase 7569 API service - Get All quotation list -Check response when send Get request with NULL value for logged in visitor

   [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
     QuotesAggregator - Saudi/iqama
   Get token
   Create API session
   sleep    15s
   get request and check response   ${Valid-token}     ${sessionName}     ${URI-invalidAR}          404
   Keywords_GetAllQuotationlist.Verify API Response when send null/invalid values2       ${actualResult}

Testcase 7571 API service - Get All quotation list - Check response when send Get All quotation list request with invalid Authentication token for logged in Saudi/iqama
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
     QuotesAggregator - Saudi/iqama
   Create API session
   sleep    15s
   get request and check response       ${token_Invalid}    ${sessionName}     /Applications/${DB_Application_ref}/Quotations          400
   Keywords_GetAllQuotationlist.Verify API Response when send invalid Authentication token       ${actualResult}

Testcase 7572 API service - Get All quotation list - Check response when send Get All quotation list request with invalid Authentication token for logged in visitor
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
     QuotesAggregator - Saudi/iqama
   Create API session
   sleep    15s
   get request and check response    ${token_Invalid}     ${sessionName}     /Applications/${DB_Application_ref}/Quotations          400
   Keywords_GetAllQuotationlist.Verify API Response when send invalid Authentication token       ${actualResult}