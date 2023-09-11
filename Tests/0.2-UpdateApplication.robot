*** Settings ***
Documentation  Update Application This suite is designed to verify that user can update/select the effective date to be able to complete the flow
Resource    ../Resources/Objects/API_Preferences.robot
Resource    ../Resources/Keyword/Keywords_UpdateApplication.robot
#Resource    ../Resources/Keyword/Keywords_Common_Purchaseflow.robot
Resource    ../Resources/Database/Assertions.robot
Resource    ../Resources/Keyword/Common.robot





*** Keywords ***

*** Variables ***
${URI-invalidAR}   /Applications/8eff212d-32fd-45cc-b2f9-5b6fa2be9039/Profession
${URI-invalid-Null}   /Applications/None/Profession
${invalidtoken}      "Bearer TLDnOh5KpuHyWlXrfLZgZMzC0y2gVEk"
${NUlltoken}        ""
${identityNumber}     1121603326
${borderNumber}      3100933328
${sponserNumber}      7029140709
*** Test Cases ***


Testcase 7173- API service - Update Application - Check response when send valid Update application request for logged in visitor
    [Tags]    regression    smoke
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    Get token
    Create API session
    Create_Date_Today+2
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"11-02-2023","effectiveEndDate":"11-02-2023","effectiveDate":"${TodayDate+2}","specialityId":1,"subSpecialityId":None,"isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response   ${Valid-token}    ${sessionName}      /Applications/${DB_Application_ref}/Profession        ${Payload}      200
    Verify API Response when send valid data - Update application      ${actualResult}     ${TodayDate+2}


Testcase 7194-API service - Update Application - Check response when send PUT request with "effectiveDate" contains spaces for logged in visitor
     [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
     Get token
     Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"1 1-09-2 022","specialityId":1,"subSpecialityId":None,"isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response     ${Valid-token}     ${sessionName}    /Applications/${DB_Application_ref}/Profession     ${Payload}      400
    Keywords_UpdateApplication.Verify API Response when send null/invalid values1          ${actualResult}


Testcase 7198-API service - Update Application - Check response when send PUT request with "specialityId" contains special charactersfor logged in visitor
        [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":"$","subSpecialityId":None,"isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response     ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      422
    Keywords_UpdateApplication.Verify API Response when send null/invalid values         ${actualResult}

Testcase 7204-API service - Update Application - Check response when send PUT request with "subSpecialityId" contains spaces for logged in visitor
      [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
      Get token
      Create API session
     ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":1,"subSpecialityId":"1 1","isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
     put request and check response   ${Valid-token}    ${sessionName}    /Applications/${DB_Application_ref}/Profession     ${Payload}      422
     Keywords_UpdateApplication.Verify API Response when send null/invalid values           ${actualResult}


Testcase 7210-API service - Update Application - Check response when send PUT request with "yearsOfExceperienceId" contains special characters for logged in visitor
     [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
     Get token
     Create API session
     ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":1,"subSpecialityId":None,"isSergery":True,"yearsOfExceperienceId":"$1","regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
     put request and check response    ${Valid-token}    ${sessionName}    /Applications/${DB_Application_ref}/Profession     ${Payload}      422
      Keywords_UpdateApplication.Verify API Response when send null/invalid values           ${actualResult}
Testcase 7206-API service - Update Application - Check response when send PUT request with invalid "isSergery" for logged in visitor
      [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
      Get token
      Create API session
     ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":1,"subSpecialityId":None,"isSergery":"TRUE","yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
     put request and check response     ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      422
      Keywords_UpdateApplication.Verify API Response when send null/invalid values           ${actualResult}

Testcase 7224-API service - Update Application - Check response when send PUT request with "applicationReference" contains spaces for logged in visitor
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    Get token
    Create API session
     ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":1,"subSpecialityId":None,"isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
     put request and check response   ${Valid-token}     ${sessionName}    ${URI-invalidAR}      ${Payload}      404
      Keywords_UpdateApplication.Verify API Response when send invalid Application reference       ${actualResult}


Testcase 7410-API service - Update Application - Check response when send PUT request with "effectiveDate" contains special characters for logged in visitor
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    Get token
     Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"@${TodayDate+2}","specialityId":1,"subSpecialityId":1,"isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response    ${Valid-token}    ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      400
    Keywords_UpdateApplication.Verify API Response when send null/invalid values1        ${actualResult}
Testcase 7411-API service - Update Application - Check response when send PUT request with "effectiveDate" contains EN letters for logged in visitor
   [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"L${TodayDate+2}","specialityId":1,"subSpecialityId":1,"isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response   ${Valid-token}    ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      400
    Keywords_UpdateApplication.Verify API Response when send null/invalid values1        ${actualResult}
Testcase 7412-API service - Update Application - Check response when send PUT request with "effectiveDate" contains AR letters for logged in visitor
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"ك${TodayDate+2}","specialityId":1,"subSpecialityId":1,"isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response   ${Valid-token}    ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      400
    Keywords_UpdateApplication.Verify API Response when send null/invalid values1       ${actualResult}


Testcase 7214-API service - Update Application - Check response when send PUT request with "regionId" contains spaces for logged in visitor
     [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
     Get token
     Create API session
     ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":1,"subSpecialityId":None,"isSergery":True,"yearsOfExceperienceId":1,"regionId":"2 1","schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
     put request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      422
      Keywords_UpdateApplication.Verify API Response when send null/invalid values           ${actualResult}

Testcase 7413-API service - Update Application - Check response when send PUT request with null "effectiveDate" for logged in visitor
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":None,"specialityId":1,"subSpecialityId":None,"isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response    ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      400
    Keywords_UpdateApplication.Verify API Response when send null/invalid values1      ${actualResult}
Testcase 7422-API service - Update Application - Check response when send PUT request with "specialityId" contains EN letters for logged in visitor
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    Get token
     Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":"l1","subSpecialityId":1,"isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response    ${Valid-token}     ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      422
    Keywords_UpdateApplication.Verify API Response when send null/invalid values         ${actualResult}
Testcase 7423-API service - Update Application - Check response when send PUT request with "specialityId" contains AR letters for logged in visitor
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":"م1","subSpecialityId":1,"isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response    ${Valid-token}    ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      422
    Keywords_UpdateApplication.Verify API Response when send null/invalid values         ${actualResult}
Testcase 7424-API service - Update Application - Check response when send PUT request with "specialityId" contains spaces for logged in visitor
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":" 1","subSpecialityId":1,"isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      422
    Keywords_UpdateApplication.Verify API Response when send null/invalid values         ${actualResult}
Testcase 7425-API service - Update Application - Check response when send PUT request with null "specialityId" for logged in visitor
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":None,"subSpecialityId":None,"isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response    ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      422
    Keywords_UpdateApplication.Verify API Response when send null/invalid values         ${actualResult}

Testcase 7474-API service - Update Application - Check response when send PUT request with yearsOfExceperienceId contains EN letters for logged in visitor
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":1,"subSpecialityId":1,"isSergery":True,"yearsOfExceperienceId":"l1","regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response    ${Valid-token}  ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      422
    Keywords_UpdateApplication.Verify API Response when send null/invalid values      ${actualResult}
Testcase 7475-API service - Update Application - Check response when send PUT request with "yearsOfExceperienceId" contains AR letters for logged in visitor
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    Get token
     Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":1,"subSpecialityId":1,"isSergery":True,"yearsOfExceperienceId":"ك1","regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response    ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      422
    Keywords_UpdateApplication.Verify API Response when send null/invalid values      ${actualResult}
Testcase 7476-API service - Update Application - Check response when send PUT request with "yearsOfExceperienceId" contains spaces for logged in visitor
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":1,"subSpecialityId":1,"isSergery":True,"yearsOfExceperienceId":" 1","regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response     ${Valid-token}     ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      422
    Keywords_UpdateApplication.Verify API Response when send null/invalid values      ${actualResult}
Testcase 7477-API service - Update Application - Check response when send PUT request with null "yearsOfExceperienceId" for logged in visitor
   [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":1,"subSpecialityId":1,"isSergery":True,"yearsOfExceperienceId":None,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response     ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      422
    Keywords_UpdateApplication.Verify API Response when send null/invalid values      ${actualResult}
Testcase 7486-API service - Update Application - Check response when send PUT request with "subSpecialityId" contains special characters for logged in visitor
     [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
     Get token
     Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":1,"subSpecialityId":"@1","isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response     ${Valid-token}    ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      422
    Keywords_UpdateApplication.Verify API Response when send null/invalid values      ${actualResult}
Testcase 7487-API service - Update Application - Check response when send PUT request with "subSpecialityId" contains EN letters for logged in visitor
   [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
   Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":1,"subSpecialityId":"l1","isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response   ${Valid-token}     ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      422
    Keywords_UpdateApplication.Verify API Response when send null/invalid values      ${actualResult}
Testcase 7488-API service - Update Application - Check response when send PUT request with "subSpecialityId" contains AR letters for logged in visitor
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":1,"subSpecialityId":"ك1","isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response     ${Valid-token}  ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      422
    Keywords_UpdateApplication.Verify API Response when send null/invalid values      ${actualResult}
Testcase 7489-API service - Update Application - Check response when send PUT request with null "subSpecialityId" for logged in visitor
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":1,"subSpecialityId":None,"isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response    ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      200
    Verify API Response when send valid data - Update application      ${actualResult}     ${TodayDate+2}



Testcase 7518-API service - Update Application - Check response when send PUT request with null "regionId" for logged in visitor
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":1,"subSpecialityId":None,"isSergery":True,"yearsOfExceperienceId":None,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response    ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      422
    Keywords_UpdateApplication.Verify API Response when send null/invalid values      ${actualResult}


Testcase 7519-API service - Update Application - Check response when send PUT request with "regionId" contains spaces for logged in visitor
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":1,"subSpecialityId":1,"isSergery":True,"yearsOfExceperienceId":1,"regionId":" 1","schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response     ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      422
    Keywords_UpdateApplication.Verify API Response when send null/invalid values      ${actualResult}
Testcase 7520-API service - Update Application - Check response when send PUT request with "regionId" contains EN letters for logged in visitor
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":1,"subSpecialityId":1,"isSergery":True,"yearsOfExceperienceId":1,"regionId":"l1","schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response    ${Valid-token}    ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      422
    Keywords_UpdateApplication.Verify API Response when send null/invalid values      ${actualResult}
Testcase 7521-API service - Update Application - Check response when send PUT request with "regionId" contains AR letters for logged in visitor
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":1,"subSpecialityId":1,"isSergery":True,"yearsOfExceperienceId":1,"regionId":"ن1","schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response     ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      422
    Keywords_UpdateApplication.Verify API Response when send null/invalid values      ${actualResult}


Testcase 7537-API service - Update Application - Check response when send PUT request with null "applicationReference" for logged in visitor
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":4,"subSpecialityId":74,"isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 1,"placeType":1,"places":[ "string"]}]}})
    put request and check response     ${Valid-token}   ${sessionName}    ${URI-invalid-Null}      ${Payload}      422
    Keywords_UpdateApplication.Verify API Response when send null/invalid values      ${actualResult}


Testcase 7174- API service - Update Application - Check response when send valid Update application request for logged in Saudi/iqama
    [Tags]    regression    smoke
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"08-09-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":4,"subSpecialityId":70,"isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 1,"placeType":1,"places":[ "string"]}]}})
    put request and check response   ${Valid-token}    ${sessionName}      /Applications/${DB_Application_ref}/Profession        ${Payload}      200
    Verify API Response when send valid data - Update application      ${actualResult}     ${TodayDate+2}


Testcase 7184- API service - Update Application - Check response when send PUT request with null values
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":None,"effectiveEndDate":None,"effectiveDate":None,"specialityId":None,"subSpecialityId":None,"isSergery":None,"yearsOfExceperienceId":None,"regionId":None,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response    ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      422
    Keywords_UpdateApplication.Verify API Response when send null/invalid values       ${actualResult}

Testcase 7185-API service - Update Application - Check response when send PUT request with empty body
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num   ${identityNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({ })
    put request and check response    ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Profession     ${Payload}      400
    Keywords_UpdateApplication.Verify API Response when send null/invalid values1        ${actualResult}


Testcase 7196-API service - Update Application - Check response when send PUT request with "effectiveDate" contains EN letters for logged Saudi/iqaman
     [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
     Get token
     Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"11-L9-2022","specialityId":1,"subSpecialityId":None,"isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response  ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      400
    Keywords_UpdateApplication.Verify API Response when send null/invalid values1           ${actualResult}





Testcase 7200-API service - Update Application - Check response when send PUT request with "specialityId" contains special characters for logged in Saudi/iqama
      [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
      Get token
       Create API session
        ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":"%1","subSpecialityId":None,"isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
        put request and check response   ${Valid-token}    ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      422
        Keywords_UpdateApplication.Verify API Response when send null/invalid values          ${actualResult}




Testcase 7202-API service - Update Application - Check response when send PUT request with "subSpecialityId" contains special characters for logged in Saudi/iqama
      [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num   ${identityNumber}
      Get token
      Create API session
     ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":1,"subSpecialityId":"%1","isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
     put request and check response    ${Valid-token}    ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      422
     Keywords_UpdateApplication.Verify API Response when send null/invalid values          ${actualResult}

Testcase 7208-API service - Update Application - Check response when send PUT request with invalid "isSergery" for logged in Saudi/iqama
      [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
      Get token
      Create API session
     ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":1,"subSpecialityId":None,"isSergery":"TRUE","yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
     put request and check response    ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Profession     ${Payload}      422
      Keywords_UpdateApplication.Verify API Response when send null/invalid values           ${actualResult}



Testcase 7212-API service - Update Application - Check response when send PUT request with "yearsOfExceperienceId" contains special characters for logged in Saudi/iqama
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    Get token
    Create API session
     ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":1,"subSpecialityId":None,"isSergery":True,"yearsOfExceperienceId":"$1","regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
     put request and check response   ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Profession     ${Payload}      422
      Keywords_UpdateApplication.Verify API Response when send null/invalid values           ${actualResult}

Testcase 7216-API service - Update Application - Check response when send PUT request with "regionId" contains spaces for logged in Saudi/iqama
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    Get token
    Create API session
     ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":1,"subSpecialityId":None,"isSergery":True,"yearsOfExceperienceId":1,"regionId":"2 1","schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
     put request and check response     ${Valid-token}  ${sessionName}    /Applications/${DB_Application_ref}/Profession     ${Payload}      422
      Keywords_UpdateApplication.Verify API Response when send null/invalid values           ${actualResult}


Testcase 7222-API service - Update Application - Check response when send PUT request with "applicationReference" contains spaces for logged in Saudi/iqama
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    Get token
    Create API session
     ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":1,"subSpecialityId":None,"isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
     put request and check response    ${Valid-token}      ${sessionName}    ${URI-invalidAR}      ${Payload}      404
     Keywords_UpdateApplication.Verify API Response when send invalid Application reference       ${actualResult}


Testcase 7414-API service - Update Application - Check response when send PUT request with "effectiveDate" contains special characters for logged Saudi/iqaman
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"@${TodayDate+2}","specialityId":1,"subSpecialityId":1,"isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response    ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      400
    Keywords_UpdateApplication.Verify API Response when send null/invalid values1         ${actualResult}
Testcase 7415-API service - Update Application - Check response when send PUT request with "effectiveDate" contains AR letters for logged Saudi/iqaman
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num   ${identityNumber}
    Get token
     Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"م${TodayDate+2}","specialityId":1,"subSpecialityId":1,"isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response    ${Valid-token}    ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      400
    Keywords_UpdateApplication.Verify API Response when send null/invalid values1         ${actualResult}
Testcase 7416-API service - Update Application - Check response when send PUT request with "effectiveDate" contains spaces for logged Saudi/iqaman
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
     Get token
     Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"1 1-08 -20 22","specialityId":1,"subSpecialityId":1,"isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response    ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      400
    Keywords_UpdateApplication.Verify API Response when send null/invalid values1         ${actualResult}

Testcase 7417-API service - Update Application - Check response when send PUT request with null "effectiveDate" for logged Saudi/iqaman
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":None,"specialityId":1,"subSpecialityId":None,"isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response     ${Valid-token}    ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      400
    Keywords_UpdateApplication.Verify API Response when send null/invalid values1         ${actualResult}


Testcase 7430-API service - Update Application - Check response when send PUT request with "specialityId" contains EN letters for logged in Saudi/iqama
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":"l1","subSpecialityId":1,"isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response    ${Valid-token}    ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      422
    Keywords_UpdateApplication.Verify API Response when send null/invalid values         ${actualResult}
Testcase 7431-API service - Update Application - Check response when send PUT request with "specialityId" contains AR letters for logged in Saudi/iqama
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":"م1","subSpecialityId":1,"isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response    ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      422
    Keywords_UpdateApplication.Verify API Response when send null/invalid values         ${actualResult}
Testcase 7432-API service - Update Application - Check response when send PUT request with "specialityId" contains spaces for logged in Saudi/iqama
     [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
     Get token
     Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":" 1","subSpecialityId":1,"isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response    ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      422
    Keywords_UpdateApplication.Verify API Response when send null/invalid values     ${actualResult}
Testcase 7433-API service - Update Application - Check response when send PUT request with null "specialityId" for logged in Saudi/iqama
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":None,"subSpecialityId":1,"isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response     ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      422
    Keywords_UpdateApplication.Verify API Response when send null/invalid values      ${actualResult}
Testcase 7442-API service - Update Application - Check response when send PUT request with "subSpecialityId" contains EN letters for logged in Saudi/iqama
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":1,"subSpecialityId":"l1","isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response     ${Valid-token}    ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      422
    Keywords_UpdateApplication.Verify API Response when send null/invalid values      ${actualResult}
Testcase 7443-API service - Update Application - Check response when send PUT request with "subSpecialityId" contains AR letters for logged in Saudi/iqama
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":1,"subSpecialityId":"م1","isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response   ${Valid-token}     ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      422
    Keywords_UpdateApplication.Verify API Response when send null/invalid values      ${actualResult}
Testcase 7444-API service - Update Application - Check response when send PUT request with "subSpecialityId" contains spaces for logged in Saudi/iqama
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":1,"subSpecialityId":" 1","isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response    ${Valid-token}    ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      422
    Keywords_UpdateApplication.Verify API Response when send null/invalid values      ${actualResult}
Testcase 7445-API service - Update Application - Check response when send PUT request with null "subSpecialityId" for logged in Saudi/iqama
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":1,"subSpecialityId":None,"isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response     ${Valid-token}    ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      200
    Verify API Response when send valid data - Update application      ${actualResult}     ${TodayDate+2}

Testcase 7525-API service - Update Application - Check response when send PUT request with null "regionId" for logged in Saudi/iqama
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":1,"subSpecialityId":None,"isSergery":True,"yearsOfExceperienceId":1,"regionId":None,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response    ${Valid-token}      ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      422
    Keywords_UpdateApplication.Verify API Response when send null/invalid values      ${actualResult}
Testcase 7541-API service - Update Application - Check response when send PUT request with null "applicationReference" for logged in Saudi/iqama
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":1,"subSpecialityId":None,"isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response     ${Valid-token}   ${sessionName}    ${URI-invalid-Null}      ${Payload}      422
    Keywords_UpdateApplication.Verify API Response when send null/invalid values      ${actualResult}


Testcase 7522-API service - Update Application - Check response when send PUT request with "regionId" contains special characters for logged in Saudi/iqama
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":1,"subSpecialityId":1,"isSergery":True,"yearsOfExceperienceId":1,"regionId":"$1","schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response     ${Valid-token}  ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      422
    Keywords_UpdateApplication.Verify API Response when send null/invalid values      ${actualResult}
Testcase 7523-API service - Update Application - Check response when send PUT request with "regionId" contains EN letters for logged in Saudi/iqama
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":1,"subSpecialityId":1,"isSergery":True,"yearsOfExceperienceId":1,"regionId":"L1","schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response     ${Valid-token}   ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      422
    Keywords_UpdateApplication.Verify API Response when send null/invalid values    ${actualResult}
Testcase 7524-API service - Update Application - Check response when send PUT request with "regionId" contains AR letters for logged in Saudi/iqama
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":1,"subSpecialityId":1,"isSergery":True,"yearsOfExceperienceId":1,"regionId":"ن1","schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response    ${Valid-token}    ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      422
    Keywords_UpdateApplication.Verify API Response when send null/invalid values      ${actualResult}


Testcase 7538-API service - Update Application - Check response when send PUT request with applicationReference contains special characters for logged in Saudi/iqama
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":1,"subSpecialityId":None,"isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response   ${Valid-token}     ${sessionName}    ${URI-invalidAR}      ${Payload}      404
    Keywords_UpdateApplication.Verify API Response when send invalid Application reference      ${actualResult}



Testcase 7187-API service - Update Application - Check response when send Update application request with wrong Authentication token for logged in visitor
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":1,"subSpecialityId":None,"isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response   ${invalidtoken}    ${sessionName}    /Applications/${DB_Application_ref}/Profession       ${Payload}      401
    Keywords_UpdateApplication.Verify API Response when send invalid Authentication token     ${actualResult}

Testcase 7375-API service - Update Application - Check response when send Update application request with Authentication token contains AR letters for logged in visitor
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":1,"subSpecialityId":1,"isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response  ${invalidtoken}    ${sessionName}    /Applications/${DB_Application_ref}/Profession       ${Payload}      401
    Keywords_UpdateApplication.Verify API Response when send invalid Authentication token     ${actualResult}

Testcase 7376-API service - Update Application - Check response when send Update application request with Authentication token contains spaces for logged in visitor
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":1,"subSpecialityId":None,"isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response  ${invalidtoken}   ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      401
    Keywords_UpdateApplication.Verify API Response when send invalid Authentication token     ${actualResult}
Testcase 7377-API service - Update Application - Check response when send Update application request with Authentication token with null value for logged in visitor
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":1,"subSpecialityId":None,"isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
   put request and check response  ${NUlltoken}   ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      401
    Keywords_UpdateApplication.Verify API Response when send invalid Authentication token     ${actualResult}

Testcase 7186-API service - Update Application - Check response when send Update application request with wrong Authentication token for logged in Saudi/iqama
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":1,"subSpecialityId":1,"isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response    ${invalidtoken}    ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      401
    Keywords_UpdateApplication.Verify API Response when send invalid Authentication token     ${actualResult}

Testcase 7378-API service - Update Application - Check response when send Update application request with Authentication token contains letters for logged in Saudi/iqama
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":1,"subSpecialityId":None,"isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response  ${invalidtoken}  ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      401
    Keywords_UpdateApplication.Verify API Response when send invalid Authentication token     ${actualResult}
Testcase 7379-API service - Update Application - Check response when send Update application request with Authentication token contains AR letters for logged in Saudi/iqama
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":1,"subSpecialityId":None,"isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response   ${invalidtoken}   ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      401
    Keywords_UpdateApplication.Verify API Response when send invalid Authentication token     ${actualResult}
Testcase 7380-API service - Update Application - Check response when send Update application request with Authentication token contains spaces for logged in Saudi/iqama
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":1,"subSpecialityId":None,"isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response   ${invalidtoken}  ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      401
    Keywords_UpdateApplication.Verify API Response when send invalid Authentication token     ${actualResult}
Testcase 7381-API service - Update Application - Check response when send Update application request with Authentication token with null values for logged in Saudi/iqama
    [Tags]    regression
    DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"10-08-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":1,"subSpecialityId":None,"isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails": {"practiceOfRegionID":[0],"facility":[{"number": 0,"placeType":1,"places":[ "string"]}]}})
    put request and check response  ${invalidtoken}    ${sessionName}    /Applications/${DB_Application_ref}/Profession      ${Payload}      401
    Keywords_UpdateApplication.Verify API Response when send invalid Authentication token     ${actualResult}

