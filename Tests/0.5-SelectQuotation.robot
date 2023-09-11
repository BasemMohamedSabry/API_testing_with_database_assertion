*** Settings ***
Documentation    Select Quotation suite is designed to test and verify that user can select quotes
Resource    ../Resources/Objects/API_Preferences.robot
Resource    ../Resources/Keyword/Keywords_SelectQuotation.robot
Resource    ../Resources/Database/Query.robot
Resource    ../Resources/Keyword/Keywords_Common_Purchaseflow.robot
Resource    ../Resources/Database/Assertions.robot




*** Keywords ***

*** Variables ***

${URI-invalidAR}   /Applications/8eff212d-32fd-45cc-b2f9-5b6fa2be9039/Quotations/None
${URI-invalidAPPref}      /Applications/None/Quotations/8febe8eb-f8de-49f0-9f97-08883c89b721
${Quotationref}     8febe8eb-f8de-49f0-9f97-08883c89b721
${token_Invalid}    Bearer eyJhbGciOiJIUzICJ9.eyJodHRwOi81LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6Ijc0NzUzZDdlLTUyYmItNDViYS1hNTk2LWRjYjc3YmFlNTY4YyIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWUiOiJNTVAgVXNlciIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL2VtYWlsYWRkcmVzcyI6Im1tcFVzZXJAbW1wLmNvbSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL21vYmlsZXBob25lIjoiOTY2NTI0NTI1NjY2NTYiLCJVc2VyTmFtZSI6Im1tcFVzZXJAbW1wLmNvbSIsImV4cCI6MTY2MTUyMTEyMywiaXNzIjoiaHR0cDovL0luc3VyZVRlY2guTU1QLklzc3Vlci5jb20ifQ.E7m_CH1__kpZTLDnOh5KpuHyWlXrfLZgZMzC0y2gVEk
${identityNumber}     1121603326
${borderNumber}      3100933328
${sponserNumber}      7029140709


*** Test Cases ***




Testcase 7596 API service - Select Quotation - Check response when send valid Select Quotation request for logged in visitor
   [Tags]    regression     smoke
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    DB_Get_QuoteREF_details_By_Identity_num     ${borderNumber}
   Get_CoverPlan_ref_By_QouteRef     ${QUOTEref}
   Get token
   Create API session
   ${Payload}  evaluate    json.dumps({"coverPlanReference": "${coverplan}","retroactivePeriodReference": None,"extendedReportingPeriodReference": None,"selectedDeductableId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"})
   Post Request and check response    ${Valid-token}    ${sessionName}    /Applications/${DB_Application_ref}/Quotations/${QUOTEref}      ${Payload}      200
   Verify API Response when send valid data - select quotation   ${actualResult}



Testcase 7597 API service - Select Quotation - Check response when send valid Select Quotation request for logged in Saudi/iqama
    [Tags]    regression     smoke
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    DB_Get_QuoteREF_details_By_Identity_num     ${identityNumber}
   Get_CoverPlan_ref_By_QouteRef    ${QUOTEref}
   Get token
   Create API session
   ${Payload}  evaluate    json.dumps({"coverPlanReference": "${coverplan}","retroactivePeriodReference": None,"extendedReportingPeriodReference": None,"selectedDeductableId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"})
   Post Request and check response    ${Valid-token}    ${sessionName}    /Applications/${DB_Application_ref}/Quotations/${QUOTEref}      ${Payload}      200
   Verify API Response when send valid data - select quotation   ${actualResult}


Testcase 7598 API service - Select Quotation - Check response when send post request with null values
   [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    DB_Get_QuoteREF_details_By_Identity_num     ${identityNumber}
    Get_CoverPlan_ref_By_QouteRef    ${QUOTEref}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"coverPlanReference": "None","retroactivePeriodReference": None,"extendedReportingPeriodReference": None,"selectedDeductableId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"})
    Post Request and check response    ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Quotations/None      ${Payload}      422
    Keywords_CreatePayment.Verify API Response when send null/invalid values   ${actualResult}


Testcase 7599 API service - Select Quotation - Check response when send post request with empty body
   [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    DB_Get_QuoteREF_details_By_Identity_num     ${identityNumber}
    Get_CoverPlan_ref_By_QouteRef    ${QUOTEref}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({})
    Post Request and check response   ${Valid-token}    ${sessionName}    /Applications/${DB_Application_ref}/Quotations/${QUOTEref}     ${Payload}      404
    Keywords_CreatePayment.Verify API Response when send null/invalid values5    ${actualResult}
Testcase 7600 API service - Select Quotation - Check response when send Select Quotation request with wrong Authentication token for logged in Saudi/iqama
     [Tags]    regression
     DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    DB_Get_QuoteREF_details_By_Identity_num     ${identityNumber}
    Get_CoverPlan_ref_By_QouteRef    ${QUOTEref}
    Create API session
   ${Payload}  evaluate    json.dumps({"coverPlanReference": "${coverplan}","retroactivePeriodReference": None,"extendedReportingPeriodReference": None,"selectedDeductableId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"})
    Post Request and check response  ${token_Invalid}     ${sessionName}     /Applications/${DB_Application_ref}/Quotations/${QUOTEref}     ${Payload}      422
    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
Testcase 7601 API service - Select Quotation - Check response when send Select Quotation request with null Authentication token for logged in visitor
    [Tags]    regression
     DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    DB_Get_QuoteREF_details_By_Identity_num     ${borderNumber}
    Get_CoverPlan_ref_By_QouteRef    ${QUOTEref}
    Create API session
   ${Payload}  evaluate    json.dumps({"coverPlanReference": "${coverplan}","retroactivePeriodReference": None,"extendedReportingPeriodReference": None,"selectedDeductableId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"})
    Post Request and check response   "None"    ${sessionName}    /Applications/${DB_Application_ref}/Quotations/${QUOTEref}     ${Payload}      422
    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
Testcase 7602 API service - Select Quotation - Check response when send post request with coverPlanReference contains special characters for visitor
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    DB_Get_QuoteREF_details_By_Identity_num     ${borderNumber}
    Get_CoverPlan_ref_By_QouteRef    ${QUOTEref}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"coverPlanReference": "${coverplan}@","retroactivePeriodReference": None,"extendedReportingPeriodReference": None,"selectedDeductableId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"})
    Post Request and check response  ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Quotations/${QUOTEref}    ${Payload}      422
    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}


Testcase 7603 API service - Select Quotation - Check response when send post request with coverPlanReference contains letters for visitor
   [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    DB_Get_QuoteREF_details_By_Identity_num     ${borderNumber}
    Get_CoverPlan_ref_By_QouteRef    ${QUOTEref}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"coverPlanReference": "L${coverplan}","retroactivePeriodReference": None,"extendedReportingPeriodReference": None,"selectedDeductableId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"})
    Post Request and check response    ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Quotations/${QUOTEref}      ${Payload}      422
    Keywords_CreatePayment.Verify API Response when send null/invalid values   ${actualResult}


Testcase 7604 API service - Select Quotation - Check response when send post request with coverPlanReference contains Arabic letters for visitor
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    DB_Get_QuoteREF_details_By_Identity_num     ${borderNumber}
    Get_CoverPlan_ref_By_QouteRef    ${QUOTEref}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"coverPlanReference": "ت${coverplan}","retroactivePeriodReference": None,"extendedReportingPeriodReference": None,"selectedDeductableId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"})
    Post Request and check response    ${Valid-token}   ${sessionName}   /Applications/${DB_Application_ref}/Quotations/${QUOTEref}      ${Payload}      422
    Keywords_CreatePayment.Verify API Response when send null/invalid values   ${actualResult}

Testcase 7605 API service - Select Quotation - Check response when send post request with coverPlanReference contains spaces for visitor
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    DB_Get_QuoteREF_details_By_Identity_num     ${borderNumber}
    Get_CoverPlan_ref_By_QouteRef    ${QUOTEref}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"coverPlanReference": " ${coverplan} ","retroactivePeriodReference": None,"extendedReportingPeriodReference": None,"selectedDeductableId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"})
    Post Request and check response    ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Quotations/${QUOTEref}      ${Payload}      422
    Keywords_CreatePayment.Verify API Response when send null/invalid values   ${actualResult}

Testcase 7606 API service - Select Quotation - Check response when send post request with null value coverPlanReference for visitor
     [Tags]    regression
     DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    DB_Get_QuoteREF_details_By_Identity_num     ${borderNumber}
    Get_CoverPlan_ref_By_QouteRef    ${QUOTEref}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"coverPlanReference": "None","retroactivePeriodReference": None,"extendedReportingPeriodReference": None,"selectedDeductableId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"})
    Post Request and check response    ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Quotations/${QUOTEref}      ${Payload}      422
    Keywords_CreatePayment.Verify API Response when send null/invalid values   ${actualResult}
Testcase 7607 API service - Select Quotation - Check response when send post request with wrong coverPlanReference for logged in Saudi/iqama
   [Tags]    regression
     DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    DB_Get_QuoteREF_details_By_Identity_num     ${identityNumber}
    Get_CoverPlan_ref_By_QouteRef    ${QUOTEref}
     Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"coverPlanReference": "fdfb45-486d-4473-9e-53faeb646c75","retroactivePeriodReference": None,"extendedReportingPeriodReference": None,"selectedDeductableId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"})
    Post Request and check response  ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Quotations/${QUOTEref}     ${Payload}      422
    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
Testcase 7608 API service - Select Quotation - Check response when send post request with coverPlanReference contains special characters for Saudi/iqama
     [Tags]    regression
     DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    DB_Get_QuoteREF_details_By_Identity_num     ${identityNumber}
    Get_CoverPlan_ref_By_QouteRef    ${QUOTEref}
   Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"coverPlanReference": "${coverplan}$","retroactivePeriodReference": None,"extendedReportingPeriodReference": None,"selectedDeductableId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"})
    Post Request and check response  ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Quotations/${QUOTEref}     ${Payload}      422
    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}

Testcase 7610 API service - Select Quotation - Check response when send post request with coverPlanReference contains Arabic letters for Saudi/iqama
     [Tags]    regression
     DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    DB_Get_QuoteREF_details_By_Identity_num     ${identityNumber}
    Get_CoverPlan_ref_By_QouteRef    ${QUOTEref}
   Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"coverPlanReference": "ن${coverplan}","retroactivePeriodReference": None,"extendedReportingPeriodReference": None,"selectedDeductableId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"})
    Post Request and check response  ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Quotations/${QUOTEref}     ${Payload}      422
    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
Testcase 7611 API service - Select Quotation - Check response when send post request with coverPlanReference contains spaces for Saudi/iqama
     [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    DB_Get_QuoteREF_details_By_Identity_num     ${identityNumber}
    Get_CoverPlan_ref_By_QouteRef    ${QUOTEref}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"coverPlanReference": " ${coverplan} ","retroactivePeriodReference": None,"extendedReportingPeriodReference": None,"selectedDeductableId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"})
    Post Request and check response  ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Quotations/${QUOTEref}     ${Payload}      422
    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
Testcase 7612 API service - Select Quotation - Check response when send post request with null value coverPlanReference for Saudi/iqama
     [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    DB_Get_QuoteREF_details_By_Identity_num     ${identityNumber}
    Get_CoverPlan_ref_By_QouteRef    ${QUOTEref}
   Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"coverPlanReference": None,"retroactivePeriodReference": None,"extendedReportingPeriodReference": None,"selectedDeductableId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"})
    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Quotations/${QUOTEref}     ${Payload}      422
    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
Testcase 7613 API service - Select Quotation - Check response when send Select Quotation request with null Authentication token for logged in Saudi/iqama
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    DB_Get_QuoteREF_details_By_Identity_num     ${identityNumber}
    Get_CoverPlan_ref_By_QouteRef    ${QUOTEref}
    Create API session
   ${Payload}  evaluate    json.dumps({"coverPlanReference": "${coverplan}","retroactivePeriodReference": None,"extendedReportingPeriodReference": None,"selectedDeductableId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"})
    Post Request and check response   "None"   ${sessionName}    /Applications/${DB_Application_ref}/Quotations/${QUOTEref}     ${Payload}      422
    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
Testcase 7614 API service - Select Quotation - Check response when send post request with applicationReference contains special characters for visitor
    [Tags]    regression
     DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    DB_Get_QuoteREF_details_By_Identity_num     ${borderNumber}
    Get_CoverPlan_ref_By_QouteRef    ${QUOTEref}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"coverPlanReference": "${coverplan}","retroactivePeriodReference": None,"extendedReportingPeriodReference": None,"selectedDeductableId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"})
    Post Request and check response    ${Valid-token}   ${sessionName}    /Applications/"@${DB_Application_ref}"/Quotations/${QUOTEref}      ${Payload}      422
    Keywords_CreatePayment.Verify API Response when send null/invalid values   ${actualResult}
Testcase 7615 API service - Select Quotation - Check response when send post request with applicationReference contains letters for visitor
   [Tags]    regression
     DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    DB_Get_QuoteREF_details_By_Identity_num     ${borderNumber}
    Get_CoverPlan_ref_By_QouteRef    ${QUOTEref}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"coverPlanReference": "${coverplan}","retroactivePeriodReference": None,"extendedReportingPeriodReference": None,"selectedDeductableId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"})
    Post Request and check response    ${Valid-token}   ${sessionName}    /Applications/"l${DB_Application_ref}"/Quotations/${QUOTEref}      ${Payload}      422
    Keywords_CreatePayment.Verify API Response when send null/invalid values   ${actualResult}
Testcase 7616 API service - Select Quotation - Check response when send post request with applicationReference contains Arabic letters for visitor
     [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    DB_Get_QuoteREF_details_By_Identity_num     ${borderNumber}
    Get_CoverPlan_ref_By_QouteRef    ${QUOTEref}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"coverPlanReference": "${coverplan}","retroactivePeriodReference": None,"extendedReportingPeriodReference": None,"selectedDeductableId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"})
    Post Request and check response    ${Valid-token}    ${sessionName}     /Applications/"ت${DB_Application_ref}"/Quotations/${QUOTEref}      ${Payload}      422
    Keywords_CreatePayment.Verify API Response when send null/invalid values   ${actualResult}

Testcase 7617 API service - Select Quotation - Check response when send post request with applicationReference contains spaces for visitor
     [Tags]    regression
   DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    DB_Get_QuoteREF_details_By_Identity_num     ${borderNumber}
    Get_CoverPlan_ref_By_QouteRef    ${QUOTEref}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"coverPlanReference": "${coverplan}","retroactivePeriodReference": None,"extendedReportingPeriodReference": None,"selectedDeductableId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"})
    Post Request and check response    ${Valid-token}   ${sessionName}    /Applications/" ${DB_Application_ref} "/Quotations/${QUOTEref}      ${Payload}      422
    Keywords_CreatePayment.Verify API Response when send null/invalid values   ${actualResult}
Testcase 7618 API service - Select Quotation - Check response when send post request with null value applicationReference for visitor
     [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    DB_Get_QuoteREF_details_By_Identity_num     ${borderNumber}
    Get_CoverPlan_ref_By_QouteRef    ${QUOTEref}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"coverPlanReference": "${coverplan}","retroactivePeriodReference": None,"extendedReportingPeriodReference": None,"selectedDeductableId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"})
    Post Request and check response    ${Valid-token}   ${sessionName}    /Applications/None/Quotations/${QUOTEref}      ${Payload}      422
    Keywords_CreatePayment.Verify API Response when send null/invalid values   ${actualResult}
Testcase 7619 API service - Select Quotation - Check response when send post request with wrong applicationReference for logged in Saudi/iqama
      [Tags]    regression
     DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    DB_Get_QuoteREF_details_By_Identity_num     ${identityNumber}
    Get_CoverPlan_ref_By_QouteRef    ${QUOTEref}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"coverPlanReference": "${coverplan}","retroactivePeriodReference": None,"extendedReportingPeriodReference": None,"selectedDeductableId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"})
    Post Request and check response    ${Valid-token}   ${sessionName}    /Applications/"2${DB_Application_ref}"/Quotations/${QUOTEref}      ${Payload}      422
    Keywords_CreatePayment.Verify API Response when send null/invalid values   ${actualResult}
Testcase 7620 API service - Select Quotation - Check response when send post request with applicationReference contains special characters for Saudi/iqama
      [Tags]    regression
     DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    DB_Get_QuoteREF_details_By_Identity_num     ${identityNumber}
    Get_CoverPlan_ref_By_QouteRef    ${QUOTEref}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"coverPlanReference": "${coverplan}","retroactivePeriodReference": None,"extendedReportingPeriodReference": None,"selectedDeductableId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"})
    Post Request and check response    ${Valid-token}    ${sessionName}     /Applications/"%${DB_Application_ref}"/Quotations/${QUOTEref}      ${Payload}      422
    Keywords_CreatePayment.Verify API Response when send null/invalid values   ${actualResult}
Testcase 7621 API service - Select Quotation - Check response when send post request with applicationReference contains letters for Saudi/iqama
      [Tags]    regression
     DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    DB_Get_QuoteREF_details_By_Identity_num     ${identityNumber}
    Get_CoverPlan_ref_By_QouteRef    ${QUOTEref}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"coverPlanReference": "${coverplan}","retroactivePeriodReference": None,"extendedReportingPeriodReference": None,"selectedDeductableId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"})
    Post Request and check response    ${Valid-token}   ${sessionName}    /Applications/"l${DB_Application_ref}"/Quotations/${QUOTEref}       ${Payload}      422
    Keywords_CreatePayment.Verify API Response when send null/invalid values   ${actualResult}
Testcase 7622 API service - Select Quotation - Check response when send post request with applicationReference contains Arabic letters for Saudi/iqama
      [Tags]    regression
     DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    DB_Get_QuoteREF_details_By_Identity_num     ${identityNumber}
    Get_CoverPlan_ref_By_QouteRef    ${QUOTEref}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"coverPlanReference": "${coverplan}","retroactivePeriodReference": None,"extendedReportingPeriodReference": None,"selectedDeductableId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"})
    Post Request and check response    ${Valid-token}   ${sessionName}    /Applications/"ت${DB_Application_ref}"/Quotations/${QUOTEref}      ${Payload}      422
    Keywords_CreatePayment.Verify API Response when send null/invalid values   ${actualResult}
Testcase 7623 API service - Select Quotation - Check response when send post request with applicationReference contains spaces for Saudi/iqama
     [Tags]    regression
     DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    DB_Get_QuoteREF_details_By_Identity_num     ${identityNumber}
    Get_CoverPlan_ref_By_QouteRef    ${QUOTEref}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"coverPlanReference": "${coverplan}","retroactivePeriodReference": None,"extendedReportingPeriodReference": None,"selectedDeductableId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"})
    Post Request and check response    ${Valid-token}   ${sessionName}    /Applications/" ${DB_Application_ref} "/Quotations/${QUOTEref}      ${Payload}      422
    Keywords_CreatePayment.Verify API Response when send null/invalid values   ${actualResult}
Testcase 7624 API service - Select Quotation - Check response when send post request with null value applicationReference for Saudi/iqama
     [Tags]    regression
     DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    DB_Get_QuoteREF_details_By_Identity_num     ${identityNumber}
    Get_CoverPlan_ref_By_QouteRef    ${QUOTEref}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"coverPlanReference": "${coverplan}","retroactivePeriodReference": None,"extendedReportingPeriodReference": None,"selectedDeductableId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"})
    Post Request and check response    ${Valid-token}   ${sessionName}    /Applications/None/Quotations/${QUOTEref}     ${Payload}      422
    Keywords_CreatePayment.Verify API Response when send null/invalid values   ${actualResult}
Testcase 7625 API service - Select Quotation - Check response when send post request with QuotationReference contains special characters for visitor
     [Tags]    regression
        DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    DB_Get_QuoteREF_details_By_Identity_num     ${borderNumber}
    Get_CoverPlan_ref_By_QouteRef    ${QUOTEref}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"coverPlanReference": "${coverplan}","retroactivePeriodReference": None,"extendedReportingPeriodReference": None,"selectedDeductableId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"})
    Post Request and check response    ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Quotations/"#${QUOTEref}"     ${Payload}      422
    Keywords_CreatePayment.Verify API Response when send null/invalid values   ${actualResult}
Testcase 7626 API service - Select Quotation - Check response when send post request with QuotationReference contains letters for visitor
   [Tags]    regression
      DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    DB_Get_QuoteREF_details_By_Identity_num     ${borderNumber}
    Get_CoverPlan_ref_By_QouteRef    ${QUOTEref}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"coverPlanReference": "${coverplan}","retroactivePeriodReference": None,"extendedReportingPeriodReference": None,"selectedDeductableId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"})
    Post Request and check response    ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Quotations/"l${QUOTEref}"      ${Payload}      422
    Keywords_CreatePayment.Verify API Response when send null/invalid values   ${actualResult}
Testcase 7627 API service - Select Quotation - Check response when send post request with QuotationReference contains Arabic letters for visitor
      [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    DB_Get_QuoteREF_details_By_Identity_num     ${borderNumber}
    Get_CoverPlan_ref_By_QouteRef    ${QUOTEref}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"coverPlanReference": "${coverplan}","retroactivePeriodReference": None,"extendedReportingPeriodReference": None,"selectedDeductableId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"})
    Post Request and check response    ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Quotations/"ت${QUOTEref}"       ${Payload}      422
    Keywords_CreatePayment.Verify API Response when send null/invalid values   ${actualResult}
Testcase 7628 API service - Select Quotation - Check response when send post request with QuotationReference contains spaces for visitor
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    DB_Get_QuoteREF_details_By_Identity_num     ${borderNumber}
    Get_CoverPlan_ref_By_QouteRef    ${QUOTEref}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"coverPlanReference": "${coverplan}","retroactivePeriodReference": None,"extendedReportingPeriodReference": None,"selectedDeductableId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"})
    Post Request and check response    ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Quotations/" ${QUOTEref} "     ${Payload}      422
    Keywords_CreatePayment.Verify API Response when send null/invalid values   ${actualResult}
Testcase 7629 API service - Select Quotation - Check response when send post request with null value QuotationReference for visitor
      [Tags]    regression
     DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    DB_Get_QuoteREF_details_By_Identity_num     ${borderNumber}
    Get_CoverPlan_ref_By_QouteRef    ${QUOTEref}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"coverPlanReference": "${coverplan}","retroactivePeriodReference": None,"extendedReportingPeriodReference": None,"selectedDeductableId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"})
    Post Request and check response    ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Quotations/None      ${Payload}      422
    Keywords_CreatePayment.Verify API Response when send null/invalid values   ${actualResult}
Testcase 7630 API service - Select Quotation - Check response when send post request with wrong QuotationReference for logged in Saudi/iqama
      [Tags]    regression
     DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    DB_Get_QuoteREF_details_By_Identity_num     ${identityNumber}
    Get_CoverPlan_ref_By_QouteRef    ${QUOTEref}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"coverPlanReference": "${coverplan}","retroactivePeriodReference": None,"extendedReportingPeriodReference": None,"selectedDeductableId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"})
    Post Request and check response    ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Quotations/"4${QUOTEref}"      ${Payload}      422
    Keywords_CreatePayment.Verify API Response when send null/invalid values   ${actualResult}
Testcase 7631 API service - Select Quotation - Check response when send post request with QuotationReference contains special characters for Saudi/iqama
     [Tags]    regression
     DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    DB_Get_QuoteREF_details_By_Identity_num     ${identityNumber}
    Get_CoverPlan_ref_By_QouteRef    ${QUOTEref}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"coverPlanReference": "L${coverplan}","retroactivePeriodReference": None,"extendedReportingPeriodReference": None,"selectedDeductableId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"})
    Post Request and check response    ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Quotations/"%${QUOTEref}"       ${Payload}      422
    Keywords_CreatePayment.Verify API Response when send null/invalid values   ${actualResult}
Testcase 7632 API service - Select Quotation - Check response when send post request with QuotationReference contains letters for Saudi/iqama
     [Tags]    regression
     DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    DB_Get_QuoteREF_details_By_Identity_num     ${identityNumber}
    Get_CoverPlan_ref_By_QouteRef    ${QUOTEref}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"coverPlanReference": "${coverplan}","retroactivePeriodReference": None,"extendedReportingPeriodReference": None,"selectedDeductableId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"})
    Post Request and check response    ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Quotations/"l${QUOTEref}"      ${Payload}      422
    Keywords_CreatePayment.Verify API Response when send null/invalid values   ${actualResult}
Testcase 7633 API service - Select Quotation - Check response when send post request with QuotationReference contains Arabic letters for Saudi/iqama
    [Tags]    regression
     DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    DB_Get_QuoteREF_details_By_Identity_num     ${identityNumber}
    Get_CoverPlan_ref_By_QouteRef    ${QUOTEref}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"coverPlanReference": "L${coverplan}","retroactivePeriodReference": None,"extendedReportingPeriodReference": None,"selectedDeductableId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"})
    Post Request and check response    ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Quotations/"ت${QUOTEref}"       ${Payload}      422
    Keywords_CreatePayment.Verify API Response when send null/invalid values   ${actualResult}
Testcase 7634 API service - Select Quotation - Check response when send post request with QuotationReference contains spaces for Saudi/iqama
      [Tags]    regression
     DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    DB_Get_QuoteREF_details_By_Identity_num     ${identityNumber}
    Get_CoverPlan_ref_By_QouteRef    ${QUOTEref}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"coverPlanReference": "L${coverplan}","retroactivePeriodReference": None,"extendedReportingPeriodReference": None,"selectedDeductableId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"})
    Post Request and check response    ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Quotations/" ${QUOTEref} "       ${Payload}      422
    Keywords_CreatePayment.Verify API Response when send null/invalid values   ${actualResult}
Testcase 7635 API service - Select Quotation - Check response when send post request with null value QuotationReference for Saudi/iqama
     [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    DB_Get_QuoteREF_details_By_Identity_num     ${identityNumber}
    Get_CoverPlan_ref_By_QouteRef    ${QUOTEref}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"coverPlanReference": "L${coverplan}","retroactivePeriodReference": None,"extendedReportingPeriodReference": None,"selectedDeductableId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"})
    Post Request and check response    ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Quotations/None       ${Payload}      422
    Keywords_CreatePayment.Verify API Response when send null/invalid values   ${actualResult}



