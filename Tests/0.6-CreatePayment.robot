*** Settings ***
Documentation    Create payment suite is designed to verify that user to pay the quote from the selected IC
Resource    ../Resources/Keyword/Keywords_CreatePayment.robot
Resource    ../Resources/Keyword/Keywords_Common_Purchaseflow.robot
Resource    ../Resources/Database/Query.robot
Resource    ../Resources/Database/Assertions.robot






*** Keywords ***


*** Variables ***

${URI-invalidAR}   /Applications/8eff212d-32fd-45cc-b2f9-5b6fa2be9039/Payment
${paymentMethod}     Visa
${email}        basem2060@yahoo.com
${mobile}      0525478965
${qualificationId}    1
${qualification}
${employmentTypeId}    1
${schsRegistrationNumber}    11AA1234467
${schsExpiryDate}     01-03-2023
${iban}      SA1115781144220000422336
${paymentReturnURL}      https://mmpuat.gettameeni.com/Payment/PaymentSuccess
${token_Invalid}    Bearer eyJhbGciOiJIUzICJ9.eyJodHRwOi81LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6Ijc0NzUzZDdlLTUyYmItNDViYS1hNTk2LWRjYjc3YmFlNTY4YyIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWUiOiJNTVAgVXNlciIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL2VtYWlsYWRkcmVzcyI6Im1tcFVzZXJAbW1wLmNvbSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL21vYmlsZXBob25lIjoiOTY2NTI0NTI1NjY2NTYiLCJVc2VyTmFtZSI6Im1tcFVzZXJAbW1wLmNvbSIsImV4cCI6MTY2MTUyMTEyMywiaXNzIjoiaHR0cDovL0luc3VyZVRlY2guTU1QLklzc3Vlci5jb20ifQ.E7m_CH1__kpZTLDnOh5KpuHyWlXrfLZgZMzC0y2gVEk

${identityNumber}     1121603326
${borderNumber}      3100933328
${sponserNumber}      7029140709




*** Test Cases ***

Testcase 7650 - API service - Create paym9ent - Check response when send valid Create payment request for logged in visitor

   [Tags]    regression     smoke
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
   Get token
   Create API session
     ${Payload}  evaluate    json.dumps({ "paymentMethod": "Visa", "email": "basem2060@yahoo.com", "mobile": "0525478965", "qualificationId": 1, "qualification": "", "employmentTypeId": 1, "schsRegistrationNumber": "11AA1234467", "schsExpiryDate": "01-03-2023", "iban": "SA1115781144220000422336", "paymentReturnURL": "https://mmpuat.gettameeni.com/Payment/PaymentSuccess" })

#   ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId":${qualificationId},"qualification":"${qualification}","employmentTypeId":${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
   Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      200
   Verify API Response when send valid data - Create Payment    ${actualResult}
#
#Testcase 7651 - API service - Create payment - Check response when send valid Create payment request for logged in Saudi/iqama
#
#    [Tags]    regression     smoke
#    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
#   Get token
#    Create API session
#   ${Payload}  evaluate    json.dumps({"paymentMethod":"${paymentMethod}","email":"${email}","mobile":"${mobile}","qualificationId":"${qualificationId}","qualification":"${qualification}","employmentTypeId":"${employmentTypeId}","schsRegistrationNumber":"${schsRegistrationNumber}","schsExpiryDate":"${schsExpiryDate}","iban":"${iban}","paymentReturnURL":"${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      200
#    Verify API Response when send valid data - Create Payment    ${actualResult}
#
#Testcase 7652 - API service - Create payment - Check response when send post request with null values
#
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "None","email": "None","mobile": "None","qualificationId": None,"qualification":None,"employmentTypeId": None,"schsRegistrationNumber": "None","schsExpiryDate": "None","iban": "None","paymentReturnURL": "None"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#     Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7653 - API service - Create payment - Check response when send post request with empty body
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#   Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      400
#     Keywords_CreatePayment.Verify API Response when send null/invalid values4    ${actualResult}
#Testcase 7654 - API service - Create payment - Check response when send Create payment request with wrong Authentication token for logged in Saudi/iqama
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${token_Invalid}    ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      400
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7655 - API service - Create payment - Check response when send Create payment request with null Authentication token for logged in visitor
#
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response    ${token_Invalid}     ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      400
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#
#Testcase 7656 - API service - Create payment - Check response when send post request with paymentMethod contains special characters for visitor
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}@","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7657 - API service - Create payment - Check response when send post request with paymentMethod contains letters for visitor
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}l","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7658 - API service - Create payment - Check response when send post request with paymentMethod contains Arabic letters for visitor
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#        Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "ت${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#
#Testcase 7659 - API service - Create payment - Check response when send post request with paymentMethod contains spaces for visitor
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#        Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": " ${paymentMethod} ","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7660 - API service - Create payment - Check response when send post request with null value paymentMethod for visitor
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#        Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "None","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7661 - API service - Create payment - Check response when send post request with wrong paymentMethod for logged in Saudi/iqama
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
#     Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "Fawry","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7662 - API service - Create payment - Check response when send post request with paymentMethod contains special characters for Saudi/iqama
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num   ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}@","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7663 - API service - Create payment - Check response when send post request with paymentMethod contains letters for Saudi/iqama
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}l","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7664 - API service - Create payment - Check response when send post request with paymentMethod contains Arabic letters for Saudi/iqama
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "م${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}     422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7665 - API service - Create payment - Check response when send post request with paymentMethod contains spaces for Saudi/iqama
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": " ${paymentMethod} ","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7666 - API service - Create payment - Check response when send post request with null value paymentMethod for Saudi/iqama
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "None","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7667 - API service - Create payment - Check response when send Create payment request with null Authentication token for logged in Saudi/iqama
#
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${token_Invalid}    ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7668 - API service - Create payment - Check response when send post request with email contains special characters for visitor
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#        Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "/${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#
#Testcase 7670 - API service -Create payment - Check response when send post request with email contains Arabic letters for visitor
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#        Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "م${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7671 - API service - Create payment - Check response when send post request with email contains spaces for visitor
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#        Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": " ${email} ","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7672 - API service - Create payment - Check response when send post request with null value email for visitor
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#        Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "None","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7673 - API service - Create payment - Check response when send post request with wrong email for logged in Saudi/iqama
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}mmmmmmmmm","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7674 - API service - Create payment - Check response when send post request with email contains special characters for Saudi/iqama
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}/","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#
#Testcase 7676 - API service - Create payment - Check response when send post request with email contains Arabic letters for Saudi/iqama
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num   ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "ا${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7677 - API service - Create payment - Check response when send post request with email contains spaces for Saudi/iqama
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": " ${email} ","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7678 - API service - Create payment - Check response when send post request with null value email for Saudi/iqama
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "None","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}     422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7679 - API service - Create payment -Check response when send post request with mobile contains special characters for visitor
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#        Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}@","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7680 - API service - Create payment - Check response when send post request with mobile contains letters for visitor
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#        Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}l","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7681 - API service - Create payment - Check response when send post request with mobile contains Arabic letters for visitor
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#        Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "ط${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7682 - API service - Create payment - Check response when send post request with mobile contains spaces for visitor
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#        Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": " ${mobile} ","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7683 - API service - Create payment - Check response when send post request with null value mobile for visitor
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#       Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "None","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7684 - API service - Create payment - Check response when send post request with wrong mobile for logged in Saudi/iqama
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}4","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7685 - API service - Create payment - Check response when send post request with mobile contains special characters for Saudi/iqama
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}/","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7686 - API service - Create payment - Check response when send post request with mobile contains letters for Saudi/iqama
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}g","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#
#Testcase 7688 - API service - Create payment - Check response when send post request with mobile contains spaces for Saudi/iqama
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num   ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7689 - API service - Create payment - Check response when send post request with null value mobile for Saudi/iqama
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num   ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "None","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7690 - API service - Create payment - Check response when send post request with wrong mobile for logged in visitor
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#     Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}7","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7691 - API service - Create payment - Check response when send post request with qualificationId contains special characters for visitor
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#       Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": "${qualificationId}/","qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7692 - API service - Create payment - Check response when send post request with qualificationId contains letters for visitor
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#     Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": "${qualificationId}l","qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#
#Testcase 7693 - API service - Create payment - Check response when send post request with qualificationId contains Arabic letters for visitor
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#     Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": "ك${qualificationId}","qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7694 - API service - Create payment - Check response when send post request with qualificationId contains spaces for visitor
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#   Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId":" ${qualificationId} ","qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7695 - API service - Create payment - Check response when send post request with null value qualificationId for visitor
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#       Get token
#     Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": None,"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7696 - API service - Create payment - Check response when send post request with wrong qualificationId for logged in Saudi/iqama
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": 122,"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7697 - API service - Create payment - Check response when send post request with qualificationId contains special characters for Saudi/iqama
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": "${qualificationId}/","qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7698 - API service - Create payment - Check response when send post request with qualificationId contains letters for Saudi/iqama
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": "${qualificationId}l","qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7699 - API service - Create payment - Check response when send post request with qualificationId contains Arabic letters for Saudi/iqama
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": "ج${qualificationId}","qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7700 - API service - Create payment - Check response when send post request with qualificationId contains spaces for Saudi/iqama
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId":" ${qualificationId} ","qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7701 - API service - Create payment - Check response when send post request with null value qualificationId for Saudi/iqama
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": None,"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7702 - API service - Create payment - Check response when send post request with wrong qualificationId for logged in visitor
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#     Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": 144,"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7703 - API service - Create payment - Check response when send post request with employmentTypeId contains special characters for visitor
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#     Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": "${employmentTypeId}@","schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7704 - API service - Create payment - Check response when send post request with employmentTypeId contains letters for visitor
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#     Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": "${employmentTypeId}k","schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}    ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#
#Testcase 7705 - API service - Create payment - Check response when send post request with employmentTypeId contains Arabic letters for visitor
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#     Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": "م${employmentTypeId}","schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7706 - API service - Create payment - Check response when send post request with employmentTypeId contains spaces for visitor
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#     Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId":" ${employmentTypeId} ","schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7707 - API service - Create payment - Check response when send post request with null value employmentTypeId for visitor
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#     Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": None,"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7708 - API service - Create payment - Check response when send post request with wrong employmentTypeId for logged in Saudi/iqama
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": 123,"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7709 - API service - Create payment - Check response when send post request with employmentTypeId contains special characters for Saudi/iqama
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num   ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": "@${employmentTypeId}","schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7710 - API service - Create payment - Check response when send post request with employmentTypeId contains letters for Saudi/iqama
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": "l${employmentTypeId}","schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7711 - API service - Create payment - Check response when send post request with employmentTypeId contains Arabic letters for Saudi/iqama
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": "م${employmentTypeId}","schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7712 - API service - Create payment - Check response when send post request with employmentTypeId contains spaces for Saudi/iqama
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId":" ${employmentTypeId} ","schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7713 - API service - Create payment - Check response when send post request with null value employmentTypeId for Saudi/iqama
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": None,"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}     422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7714 - API service - Create payment - Check response when send post request with wrong employmentTypeId for logged in visitor
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#     Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": 122,"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7715 - API service - Create payment - Check response when send post request with schsRegistrationNumber contains special characters for visitor
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#     Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}@","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7716 - API service - Create payment - Check response when send post request with schsRegistrationNumber contains letters for visitor
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#     Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}l","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7717 - API service - Create payment - Check response when send post request with schsRegistrationNumber contains Arabic letters for visitor
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#     Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "م${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7718 - API service - Create payment - Check response when send post request with schsRegistrationNumber contains spaces for visitor
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#     Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": " ${schsRegistrationNumber} ","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7719 - API service - Create payment - Check response when send post request with null value schsRegistrationNumber for visitor
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#     Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "None","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7720 - API service - Create payment - Check response when send post request with wrong schsRegistrationNumber for logged in Saudi/iqama
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "5622","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7721 - API service - Create payment - Check response when send post request with schsRegistrationNumber contains special characters for Saudi/iqama
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num  ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "@${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7722 - API service - Create payment - Check response when send post request with schsRegistrationNumber contains letters for Saudi/iqama
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num   ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "j${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7723 - API service - Create payment - Check response when send post request with schsRegistrationNumber contains Arabic letters for Saudi/iqama
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "ن${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7724 - API service - Create payment - Check response when send post request with schsRegistrationNumber contains spaces for Saudi/iqama
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": " ${schsRegistrationNumber} ","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7725 - API service - Create payment - Check response when send post request with null value schsRegistrationNumber for Saudi/iqama
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "None","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7726 - API service - Create payment - Check response when send post request with wrong schsRegistrationNumber for logged in visitor
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#     Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "125","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7727 - API service - Create payment - Check response when send post request with schsExpiryDate contains special characters for visitor
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#     Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "@${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7728 - API service - Create payment - Check response when send post request with schsExpiryDate contains letters for visitor
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#     Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "f${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7729 - API service - Create payment - Check response when send post request with schsExpiryDate contains Arabic letters for visitor
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#     Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "ب${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}     422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7730 - API service - Create payment - Check response when send post request with schsExpiryDate contains spaces for visitor
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#     Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": " ${schsExpiryDate} ","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7731 - API service - Create payment - Check response when send post request with null value schsExpiryDate for visitor
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#     Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "None","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#
#Testcase 7732 - API service - Create payment - Check response when send post request with wrong schsExpiryDate for logged in Saudi/iqama
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "01/01/2022","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7733 - API service - Create payment - Check response when send post request with schsExpiryDate contains special characters for Saudi/iqama
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "@${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7734 - API service - Create payment - Check response when send post request with schsExpiryDate contains letters for Saudi/iqama
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "c${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7735 - API service - Create payment - Check response when send post request with schsExpiryDate contains Arabic letters for Saudi/iqama
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "ب${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7736 - API service - Create payment - Check response when send post request with schsExpiryDate contains spaces for Saudi/iqama
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num   ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": " ${schsExpiryDate} ","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7737 - API service - Create payment - Check response when send post request with null value schsExpiryDate for Saudi/iqama
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "None","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7738 - API service - Create payment - Check response when send post request with wrong schsExpiryDate for logged in visitor
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#     Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "01/01/2022","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7739 - API service - Create payment - Check response when send post request with iban contains special characters for visitor
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#     Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "@${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}    ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7740 - API service - Create payment - Check response when send post request with iban contains letters for visitor
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "k${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7741 - API service - Create payment - Check response when send post request with iban contains Arabic letters for visitor
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "ي${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7742 - API service - Create payment - Check response when send post request with iban contains spaces for visitor
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": " ${iban} ","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}     422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#
#Testcase 7743 - API service - Create payment - Check response when send post request with null value iban for visitor
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "None","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7744 - API service - Create payment - Check response when send post request with wrong iban for logged in Saudi/iqama
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "sa2538383838855","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7745 - API service - Create payment - Check response when send post request with iban contains special characters for Saudi/iqama
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "@${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7746 - API service - Create payment - Check response when send post request with iban contains letters for Saudi/iqama
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
#        Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "H${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7747 - API service - Create payment - Check response when send post request with iban contains Arabic letters for Saudi/iqama
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "ت${iban}","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7748 - API service - Create payment - Check response when send post request with iban contains spaces for Saudi/iqama
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": " ${iban} ","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7749 - API service - Create payment - Check response when send post request with null value iban for Saudi/iqama
#    [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "None","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}     /Applications/${DB_Application_ref}/Payment        ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}
#Testcase 7750 - API service - Create payment - Check response when send post request with wrong iban for logged in visitor
#   [Tags]    regression
#    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId": ${qualificationId},"qualification":${qualification},"employmentTypeId": ${employmentTypeId},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "SA1533737373437437","paymentReturnURL": "${paymentReturnURL}"})
#    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Payment       ${Payload}      422
#    Keywords_CreatePayment.Verify API Response when send null/invalid values    ${actualResult}