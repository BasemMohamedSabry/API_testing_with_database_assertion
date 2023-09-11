*** Settings ***
Documentation   Declare Application suite is designed to test and verify that user can answer the decleration questions to complete the flow
Resource    ../Resources/Objects/API_Preferences.robot
Resource    ../Resources/keyword/Keywords_DeclareApplication.robot
Resource    ../Resources/Database/Assertions.robot




*** Keywords ***

*** Variables ***

${URI-invalidAR}   /Applications/8eff212d-32fd-45cc-b2f9-5b6fa2be9039/Declaration
${Q1}    True
${Q2}    True
${Q3}    False
${Q4}    True
${Q5}    True
${Q6}    False
${identityNumber}     1121603326
${borderNumber}      3100933328
${sponserNumber}      7029140709
${invalidtoken}      "Bearer TLDnOh5KpuHyWlXrfLZgZMzC0y2gVEk"
${NUlltoken}        ""

*** Test Cases ***


Testcase 7227 - API service - Declare Application - Check response when send valid Declare application request for logged in visitor
    [Tags]    regression    smoke
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"questionsAnswers": [{"questionId": 1,"answer":${Q1}},{"questionId": 2,"answer":${Q2}},{"questionId": 3,"answer": ${Q3}},{"questionId": 4,"answer":${Q4}},{"questionId": 5,"answer":${Q5}},{"questionId": 6,"answer":${Q6}}],"previousPolicy":{ "number": "1234567891","insuaranceCompanyId": "128","effectiveDate":"02-03-2022","expirationDate": "15-03-2023","retroactiveDate":None, "unInterruptedDuration": 10}})
    put request and check response     ${Valid-token}    ${sessionName}    /Applications/${DB_Application_ref}/Declaration       ${Payload}      200
    Verify API Response when send valid data - declare application       ${actualResult}     ${Q1}     ${Q2}    ${Q3}    ${Q4}    ${Q5}    ${Q6}




Testcase 7228- API service - Declare Application - Check response when send valid Declare application request for logged in Saudi/iqama
    [Tags]    regression     smoke
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"questionsAnswers": [{"questionId": 1,"answer":${Q1}},{"questionId": 2,"answer":${Q2}},{"questionId": 3,"answer": ${Q3}},{"questionId": 4,"answer":${Q4}},{"questionId": 5,"answer":${Q5}},{"questionId": 6,"answer":${Q6}}],"previousPolicy":{ "number": "1234567891","insuaranceCompanyId": "128","effectiveDate":"02-03-2022","expirationDate": "15-03-2023","retroactiveDate":None, "unInterruptedDuration": 10}})
    put request and check response     ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Declaration       ${Payload}      200
    Verify API Response when send valid data - declare application       ${actualResult}     ${Q1}     ${Q2}    ${Q3}    ${Q4}    ${Q5}    ${Q6}

Testcase 7230 API service - Declare Application - Check response when send PUT request with invalid "insuaranceCompanyId" for logged in Saudi/iqama
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"questionsAnswers": [{"questionId": 1,"answer":${Q1}},{"questionId": 2,"answer":${Q2}},{"questionId": 3,"answer": ${Q3}},{"questionId": 4,"answer":${Q4}},{"questionId": 5,"answer":${Q5}},{"questionId": 6,"answer":${Q6}}],"previousPolicy":{ "number": "1234567891","insuaranceCompanyId": "0","effectiveDate":"02-03-2022","expirationDate": "15-03-2023","retroactiveDate":None, "unInterruptedDuration": 10}})
    put request and check response   ${Valid-token}      ${sessionName}    /Applications/${DB_Application_ref}/Declaration       ${Payload}      400
    Verify API Response when send null/invalid values           ${actualResult}

Testcase 7232 API service - Declare Application - Check response when send PUT request with null values
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"questionsAnswers": [{"questionId": None,"answer":${Q1}},{"questionId": 2,"answer":${Q2}},{"questionId": 3,"answer": ${Q3}},{"questionId": 4,"answer":${Q4}},{"questionId": 5,"answer":${Q5}},{"questionId": 6,"answer":${Q6}}],"previousPolicy":{ "number": "None","insuaranceCompanyId": "None","effectiveDate":"02-03-2022","expirationDate": "15-03-2023","retroactiveDate":None, "unInterruptedDuration": None}})
    put request and check response   ${Valid-token}     ${sessionName}    /Applications/${DB_Application_ref}/Declaration       ${Payload}      422
    Keywords_DeclareApplication.Verify API Response when send null/invalid values     ${actualResult}

Testcase 7233 API service - Declare Application - Check response when send PUT request with empty body
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({})
    put request and check response   ${Valid-token}      ${sessionName}    /Applications/${DB_Application_ref}/Declaration       ${Payload}      400
   Verify API Response when send null/invalid values3       ${actualResult}

Testcase 7234 API service - Declare Application - Check response when send Declare application request with invalid Authentication token for logged in Saudi/iqama
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    Create API session
    ${Payload}  evaluate    json.dumps({"questionsAnswers": [{"questionId": 1,"answer":${Q1}},{"questionId": 2,"answer":${Q2}},{"questionId": 3,"answer": ${Q3}},{"questionId": 4,"answer":${Q4}},{"questionId": 5,"answer":${Q5}},{"questionId": 6,"answer":${Q6}}],"previousPolicy":{ "number": "1234567891","insuaranceCompanyId": "128","effectiveDate":"02-03-2022","expirationDate": "15-03-2023","retroactiveDate":None, "unInterruptedDuration": 10}})
    put request and check response  ${invalidtoken}   ${sessionName}    /Applications/${DB_Application_ref}/Declaration       ${Payload}      401
    Verify API Response when send null/invalid values       ${actualResult}

Testcase 7235 API service - Declare Application - Check response when send Declare application request with invalid Authentication token for logged in visitor
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    Create API session
    ${Payload}  evaluate    json.dumps({"questionsAnswers": [{"questionId": 1,"answer":${Q1}},{"questionId": 2,"answer":${Q2}},{"questionId": 3,"answer": ${Q3}},{"questionId": 4,"answer":${Q4}},{"questionId": 5,"answer":${Q5}},{"questionId": 6,"answer":${Q6}}],"previousPolicy":{ "number": "1234567891","insuaranceCompanyId": "128","effectiveDate":"02-03-2022","expirationDate": "15-03-2023","retroactiveDate":None, "unInterruptedDuration": 10}})
    put request and check response    ${invalidtoken}    ${sessionName}    /Applications/${DB_Application_ref}/Declaration      ${Payload}      401
    Verify API Response when send null/invalid values       ${actualResult}


Testcase 7240 API service - Declare Application - Check response when send PUT request with invalid "insuaranceCompanyId" for logged in visitor
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"questionsAnswers": [{"questionId": 1,"answer":${Q1}},{"questionId": 2,"answer":${Q2}},{"questionId": 3,"answer": ${Q3}},{"questionId": 4,"answer":${Q4}},{"questionId": 5,"answer":${Q5}},{"questionId": 6,"answer":${Q6}}],"previousPolicy":{ "number": "1234567891","insuaranceCompanyId": "0","effectiveDate":"02-03-2022","expirationDate": "15-03-2023","retroactiveDate":None, "unInterruptedDuration": 10}})
    put request and check response   ${Valid-token}      ${sessionName}    /Applications/${DB_Application_ref}/Declaration       ${Payload}      400
    Verify API Response when send null/invalid values       ${actualResult}

Testcase 7242 API service - Declare Application - Check response when send PUT request with invalid ""number"" for logged in visitor"
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"questionsAnswers": [{"questionId": 1,"answer":${Q1}},{"questionId": 2,"answer":${Q2}},{"questionId": 3,"answer": ${Q3}},{"questionId": 4,"answer":${Q4}},{"questionId": 5,"answer":${Q5}},{"questionId": 6,"answer":${Q6}}],"previousPolicy":{ "number": "012","insuaranceCompanyId": "128","effectiveDate":"02-03-2022","expirationDate": "15-03-2023","retroactiveDate":None, "unInterruptedDuration": 10}})
    put request and check response   ${Valid-token}     ${sessionName}    /Applications/${DB_Application_ref}/Declaration       ${Payload}      422
    Verify API Response when send null/invalid values       ${actualResult}

Testcase 7244 API service - Declare Application - Check response when send PUT request with invalid "number" for logged Saudi/iqaman
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"questionsAnswers": [{"questionId": 1,"answer":${Q1}},{"questionId": 2,"answer":${Q2}},{"questionId": 3,"answer": ${Q3}},{"questionId": 4,"answer":${Q4}},{"questionId": 5,"answer":${Q5}},{"questionId": 6,"answer":${Q6}}],"previousPolicy":{ "number": "012","insuaranceCompanyId": "128","effectiveDate":"02-03-2022","expirationDate": "15-03-2023","retroactiveDate":None, "unInterruptedDuration": 10}})
    put request and check response   ${Valid-token}      ${sessionName}    /Applications/${DB_Application_ref}/Declaration       ${Payload}      422
    Verify API Response when send null/invalid values      ${actualResult}


Testcase 7258 API service - Declare Application - Check response when send PUT request with invalid "questionId" for logged in visitor
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"questionsAnswers": [{"questionId": 25,"answer":${Q1}},{"questionId": 20,"answer":${Q2}},{"questionId": 3,"answer": ${Q3}},{"questionId": 4,"answer":${Q4}},{"questionId": 5,"answer":${Q5}},{"questionId": 6,"answer":${Q6}}],"previousPolicy":{ "number": "1234567891","insuaranceCompanyId": "128","effectiveDate":"02-03-2022","expirationDate": "15-03-2023","retroactiveDate":None, "unInterruptedDuration": 10}})
    put request and check response   ${Valid-token}      ${sessionName}    /Applications/${DB_Application_ref}/Declaration       ${Payload}      422
    Verify API Response when send null/invalid values       ${actualResult}

Testcase 7260 API service - Declare Application - Check response when send PUT request with invalid "questionId" for logged in Saudi/iqama
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"questionsAnswers": [{"questionId": 20,"answer":${Q1}},{"questionId": 25,"answer":${Q2}},{"questionId": 3,"answer": ${Q3}},{"questionId": 4,"answer":${Q4}},{"questionId": 5,"answer":${Q5}},{"questionId": 6,"answer":${Q6}}],"previousPolicy":{ "number": "1234567891","insuaranceCompanyId": "128","effectiveDate":"02-03-2022","expirationDate": "15-03-2023","retroactiveDate":None, "unInterruptedDuration": 10}})
    put request and check response   ${Valid-token}      ${sessionName}    /Applications/${DB_Application_ref}/Declaration       ${Payload}      422
    Verify API Response when send null/invalid values       ${actualResult}

Testcase 7262 API service - Declare Application - Check response when send PUT request with invalid "expirationDate" for logged in visitor
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"questionsAnswers": [{"questionId": 1,"answer":${Q1}},{"questionId": 2,"answer":${Q2}},{"questionId": 3,"answer": ${Q3}},{"questionId": 4,"answer":${Q4}},{"questionId": 5,"answer":${Q5}},{"questionId": 6,"answer":${Q6}}],"previousPolicy":{ "number": "1234567891","insuaranceCompanyId": "128","effectiveDate":"02-03-2022","expirationDate": "15-03-2021","retroactiveDate":None, "unInterruptedDuration": None}})
    put request and check response   ${Valid-token}     ${sessionName}    /Applications/${DB_Application_ref}/Declaration       ${Payload}      422
    Verify API Response when send null/invalid values      ${actualResult}

Testcase 7264 API service - Declare Application - Check response when send PUT request with invalid "expirationDate" for logged in Saudi/iqama
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"questionsAnswers": [{"questionId": 1,"answer":${Q1}},{"questionId": 2,"answer":${Q2}},{"questionId": 3,"answer": ${Q3}},{"questionId": 4,"answer":${Q4}},{"questionId": 5,"answer":${Q5}},{"questionId": 6,"answer":${Q6}}],"previousPolicy":{ "number": "1234567891","insuaranceCompanyId": "128","effectiveDate":"02-03-2022","expirationDate": "15-03-2021","retroactiveDate":None, "unInterruptedDuration": None}})
    put request and check response   ${Valid-token}      ${sessionName}    /Applications/${DB_Application_ref}/Declaration       ${Payload}      422
    Verify API Response when send null/invalid values       ${actualResult}

Testcase 7270 API service - Declare Application - Check response when send PUT request with invalid "applicationReference" for logged in Saudi/iqama
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"questionsAnswers": [{"questionId": 1,"answer":${Q1}},{"questionId": 2,"answer":${Q2}},{"questionId": 3,"answer": ${Q3}},{"questionId": 4,"answer":${Q4}},{"questionId": 5,"answer":${Q5}},{"questionId": 6,"answer":${Q6}}],"previousPolicy":{ "number": "1234567891","insuaranceCompanyId": "128","effectiveDate":"02-03-2022","expirationDate": "15-03-2023","retroactiveDate":None, "unInterruptedDuration": 10}})
    put request and check response   ${Valid-token}     ${sessionName}    /Applications/@${DB_Application_ref}/Declaration       ${Payload}      422
    Verify API Response when send null/invalid values       ${actualResult}

Testcase 7272 API service - Declare Application - Check response when send PUT request with invalid "applicationReference" for logged in visitor
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"questionsAnswers": [{"questionId": 1,"answer":${Q1}},{"questionId": 2,"answer":${Q2}},{"questionId": 3,"answer": ${Q3}},{"questionId": 4,"answer":${Q4}},{"questionId": 5,"answer":${Q5}},{"questionId": 6,"answer":${Q6}}],"previousPolicy":{ "number": "1234567891","insuaranceCompanyId": "128","effectiveDate":"02-03-2022","expirationDate": "15-03-2023","retroactiveDate":None, "unInterruptedDuration": 10}})
    put request and check response   ${Valid-token}     ${sessionName}    /Applications/${DB_Application_ref}4/Declaration      ${Payload}      422
    Verify API Response when send null/invalid values       ${actualResult}




