*** Settings ***
Documentation    Create application suite is designed for test and verify that application created successfully with its application reference
Resource    ../Resources/Objects/API_Preferences.robot
Resource    ../Resources/Keyword/Keywords_CreateApplication.robot

*** Variables ***
${URI}      /Applications
${identityNumber}     1000687028
${borderNumber}     3095602656
${sponserNumber}     7002834633
${dateOfBirthMonthSaudi/iqama}     7
${dateOfBirthYearSaudi/iqama}      1368
${dateOfBirthMonthVisitor}     11
${dateOfBirthYearVisitor}      1419


*** Test Cases ***


Testcase 7113- API service - Create Application - Check response when send valid create application request for logged in visitor

    [Tags]    regression   smoke
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": ${borderNumber},"sponsorNumber":${sponserNumber},"dateOfBirthMonth": 11,"dateOfBirthYear": 1419,"token": None,"captchaCode": None})
    Post Request and check response   ${Valid-token}   ${sessionName}    ${URI}      ${Payload}      200
    Verify API Response when send valid data - Create application- visitor    ${actualResult}      ${borderNumber}     ${sponserNumber}


Testcase 7114- API service - Create Application - Check response when send valid create application request for logged in Saudi/iqama

    [Tags]    regression   smoke
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber},"sponsorNumber": None,"dateOfBirthMonth": ${dateOfBirthMonthSaudi/iqama},"dateOfBirthYear": ${dateOfBirthYearSaudi/iqama},"token": "","captchaCode": ""})
    Post Request and check response   ${Valid-token}   ${sessionName}    ${URI}      ${Payload}      200
    Verify API Response when send valid data - Create application- saudi/iqama    ${actualResult}    ${identityNumber}


Testcase 7117- API service - Create Application - Check response when send post request with "sponsorNumber" contains special characters for visitor
    [Tags]    regression
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": 3095603656,"sponsorNumber": "700283#633","dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
    Post Request and check response    ${Valid-token}   ${sessionName}    ${URI}      ${Payload}      422
    Verify API Response when send null/invalid values2    ${actualResult}

Testcase 8367- API service - Create Application - Check response when send create application request with identityNumber not equal 1 ,2 or 3 for logged in visitor
     Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": 4095603656,"sponsorNumber": "${sponserNumber}","dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
    Post Request and check response    ${Valid-token}   ${sessionName}    ${URI}      ${Payload}      400
    Verify API Response when send null/invalid values3    ${actualResult}

Testcase 7274- API service - Create Application - Check response when send post request with "identityNumber" contains letters for visitor
    [Tags]    regression
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": "309560L656","sponsorNumber": ${sponserNumber},"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
    Post Request and check response    ${Valid-token}   ${sessionName}    ${URI}      ${Payload}      422
    Verify API Response when send null/invalid values2     ${actualResult}


Testcase 7278- API service - Create Application - Check response when send post request with "identityNumber" contains spaces for visitor
    [Tags]    regression
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": "3095602 656","sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
    Post Request and check response    ${Valid-token}     ${sessionName}    ${URI}      ${Payload}      422
    Verify API Response when send null/invalid values2      ${actualResult}

Testcase 7280- API service - Create Application - Check response when send post request with "identityNumber" contains AR numbers for visitor
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": 3095603656,"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
    Post Request and check response  ${Valid-token}   ${sessionName}    ${URI}      ${Payload}      400
    Verify API Response when send null/invalid values     ${actualResult}


Testcase 7282- API service - Create Application - Check response when send post request with "sponsorNumber" less than 10 digits for visitor
    [Tags]    regression
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": 3095603656,"sponsorNumber": 566669,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
    Post Request and check response    ${Valid-token}   ${sessionName}    ${URI}      ${Payload}      400
    Verify API Response when send invalid data not matched with NIC - create application     ${actualResult}

Testcase 7283- API service - Create Application - Check response when send post request with "sponsorNumber" more than 10 digits for visitor
    [Tags]    regression
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": 3095603656,"sponsorNumber": 5558484895696555,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
    Post Request and check response   ${Valid-token}    ${sessionName}    ${URI}      ${Payload}      400
    Verify API Response when send invalid data not matched with NIC - create application     ${actualResult}



Testcase 7275- API service - Create Application - Check response when send post request with "identityNumber" less than 10 digits for visitor
    [Tags]    regression
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": 309563656,"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
    Post Request and check response    ${Valid-token}   ${sessionName}    ${URI}      ${Payload}      400
    Verify API Response when send null/invalid values     ${actualResult}

Testcase 7276- API service - Create Application - Check response when send post request with "identityNumber" more than 10 digits for visitor
    [Tags]    regression
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": 309560399656,"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
    Post Request and check response   ${Valid-token}   ${sessionName}    ${URI}      ${Payload}      400
    Verify API Response when send null/invalid values     ${actualResult}

Testcase 7279- API service - Create Application - Check response when send post request with null value "identityNumber" for Visitor
    [Tags]    regression
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": None,"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
    Post Request and check response     ${Valid-token}   ${sessionName}    ${URI}      ${Payload}      422
    Verify API Response when send null/invalid values2      ${actualResult}



Testcase 7281- API service - Create Application - Check response when send post request with "sponsorNumber" contains letters for visitor
    [Tags]    regression
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": 3095603656,"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
    Post Request and check response    ${Valid-token}   ${sessionName}    ${URI}      ${Payload}      400
    Verify API Response when send null/invalid values     ${actualResult}

Testcase 7285- API service - Create Application - Check response when send post request with "sponsorNumber" contains spaces for visitor
    [Tags]    regression
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": 3095603656,"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
    Post Request and check response    ${Valid-token}   ${sessionName}    ${URI}      ${Payload}      400
    Verify API Response when send null/invalid values     ${actualResult}

Testcase 7286- API service - Create Application - Check response when send post request with null value "sponsorNumber" for visitor
    [Tags]    regression
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": 3095603656,"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
    Post Request and check response    ${Valid-token}     ${sessionName}    ${URI}      ${Payload}      400
    Verify API Response when send null/invalid values     ${actualResult}

Testcase 7287- API service - Create Application - Check response when send post request with "sponsorNumber" contains AR numbers for visitor
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": 3095603656,"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
    Post Request and check response    ${Valid-token}     ${sessionName}    ${URI}      ${Payload}      400
    Verify API Response when send null/invalid values     ${actualResult}


Testcase 7127- API service - Create Application - Check response when send create application request with null Authentication token for logged in visitor
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": 3095603656,"sponsorNumber": ${sponserNumber},"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
    Post Request and check response when token is invalid    ${sessionName}    ${URI}      ${Payload}      401
   Verify API Response when send invalid Authentication token    ${actualResult}


Testcase 7116- API service - Create Application - Check response when send post request with "identityNumber" contains special characters for visitor
    [Tags]    regression
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": 30956_0656,"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
    Post Request and check response    ${Valid-token}    ${sessionName}    ${URI}      ${Payload}      400
    Verify API Response when send null/invalid values     ${actualResult}



Testcase 7332- API service - Create Application - Check response when send create application request with null Authentication token for logged in Saudi/iqama
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber},"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
    Post Request and check response when token is null    ${sessionName}    ${URI}      ${Payload}      401
    Verify API Response when send invalid Authentication token     ${actualResult}



Testcase 7126- API service - Create Application - Check response when send create application request with wrong Authentication token for logged in Saudi/iqama
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber},"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
    Post Request and check response when token is invalid    ${sessionName}    ${URI}      ${Payload}      401
    Verify API Response when send invalid Authentication token     ${actualResult}


Testcase 7120- API service - Create Application - Check response when send post request with wrong "dateOfBirthMonth" for Saudi/iqama
    [Tags]    regression
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber},"sponsorNumber": None,"dateOfBirthMonth": 11,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
    Post Request and check response    ${Valid-token}   ${sessionName}    ${URI}      ${Payload}      400
    Verify API Response when send invalid data not matched with NIC - create application      ${actualResult}


Testcase 7124- API service - Create Application - Check response when send post request with null values
    [Tags]    regression
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": None,"sponsorNumber": None,"dateOfBirthMonth": None,"dateOfBirthYear": None,"token": None,"captchaCode": None})
    Post Request and check response    ${Valid-token}   ${sessionName}    ${URI}      ${Payload}      422
    Verify API Response when send null/invalid values2       ${actualResult}

Testcase 7125- API service - Create Application - Check response when send post request with empty body
    [Tags]    regression
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({})
    Post Request and check response    ${Valid-token}     ${sessionName}    ${URI}      ${Payload}      400
    Verify API Response when send null/invalid values     ${actualResult}


Testcase 7294- API service - Create Application - Check response when send post request with null value "identityNumber" for Saudi/iqama
    [Tags]    regression
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": None,"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
    Post Request and check response   ${Valid-token}    ${sessionName}    ${URI}      ${Payload}      422
    Verify API Response when send null/invalid values2      ${actualResult}

Testcase 7309- API service - Create Application - Check response when send post request with null value for "dateOfBirthYear" for Saudi/iqama
    [Tags]    regression
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber},"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": None,"token": "","captchaCode": ""})
    Post Request and check response    ${Valid-token}   ${sessionName}    ${URI}      ${Payload}      400
    Verify API Response when send null/invalid values      ${actualResult}



Testcase 7288- API service - Create Application - Check response when send post request with "identityNumber" contains special characters for Saudi/iqama
    [Tags]    regression
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": "112160332&","sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
    Post Request and check response     ${Valid-token}    ${sessionName}     ${URI}      ${Payload}      422
    Verify API Response when send null/invalid values2    ${actualResult}


Testcase 7289- API service - Create Application - Check response when send post request with "identityNumber" contains letters for Saudi/iqama
    [Tags]    regression
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": "11216l3326","sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
    Post Request and check response     ${Valid-token}   ${sessionName}    ${URI}      ${Payload}      422
    Verify API Response when send null/invalid values2     ${actualResult}


Testcase 7290- API service - Create Application - Check response when send post request with "identityNumber" less than 10 digits for Saudi/iqama
    [Tags]    regression
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": 11216032,"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
    Post Request and check response   ${Valid-token}    ${sessionName}    ${URI}      ${Payload}      400
    Verify API Response when send invalid data not matched with NIC - create application    ${actualResult}


Testcase 7291- API service - Create Application - Check response when send post request with "identityNumber" more than 10 digits for Saudi/iqama
    [Tags]    regression
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber}895,"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
    Post Request and check response    ${Valid-token}   ${sessionName}    ${URI}      ${Payload}      400
    Verify API Response when send invalid data not matched with NIC - create application     ${actualResult}



Testcase 7293- API service - Create Application - Check response when send post request with "identityNumber" contains spaces for Saudi/iqama
    [Tags]    regression
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": "309560 3656","sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
    Post Request and check response   ${Valid-token}    ${sessionName}    ${URI}      ${Payload}      422
    Verify API Response when send null/invalid values2      ${actualResult}




Testcase 7295- API service - Create Application - Check response when send post request with "identityNumber" contains AR numbers for Saudi/iqama
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber},"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
    Post Request and check response  ${Valid-token}    ${sessionName}    ${URI}      ${Payload}      400
    Verify API Response when send null/invalid values3     ${actualResult}



Testcase 7296- API service - Create Application - Check response when send post request with "dateOfBirthMonth" with value > 12 for Saudi/iqama
    [Tags]    regression
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber},"sponsorNumber": None,"dateOfBirthMonth": 13,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
    Post Request and check response    ${Valid-token}    ${sessionName}    ${URI}      ${Payload}      400
    Verify API Response when send invalid data not matched with NIC - create application     ${actualResult}



Testcase 7297- API service - Create Application - Check response when send post request with "dateOfBirthMonth" with value < 1 for Saudi/iqama
    [Tags]    regression
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber},"sponsorNumber": None,"dateOfBirthMonth": -1,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
    Post Request and check response     ${Valid-token}     ${sessionName}    ${URI}      ${Payload}      400
    Verify API Response when send invalid data not matched with NIC - create application    ${actualResult}


Testcase 7298- API service - Create Application - Check response when send post request with "dateOfBirthMonth" in letters style for Saudi/iqama
    [Tags]    regression
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber},"sponsorNumber": None,"dateOfBirthMonth": "dec","dateOfBirthYear": 1418,"token": "","captchaCode": ""})
    Post Request and check response       ${Valid-token}    ${sessionName}    ${URI}      ${Payload}      422
    Verify API Response when send null/invalid values2     ${actualResult}

Testcase 7299- API service - Create Application - Check response when send post request with "dateOfBirthMonth" contains AR number for Saudi/iqama
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber},"sponsorNumber": None,"dateOfBirthMonth": 0,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
    Post Request and check response  ${Valid-token}    ${sessionName}    ${URI}      ${Payload}      400
    Verify API Response when send null/invalid values3     ${actualResult}

Testcase 7300- API service - Create Application - Check response when send post request with "dateOfBirthMonth" contains Spaces for Saudi/iqama
    [Tags]    regression
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber},"sponsorNumber": None,"dateOfBirthMonth": "1 2","dateOfBirthYear": 1418,"token": "","captchaCode": ""})
    Post Request and check response    ${Valid-token}   ${sessionName}    ${URI}      ${Payload}      422
    Verify API Response when send null/invalid values2      ${actualResult}

Testcase 7301- API service - Create Application - Check response when send post request with null value for "dateOfBirthMonth" for Saudi/iqama
    [Tags]    regression
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber},"sponsorNumber": None,"dateOfBirthMonth": None,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
    Post Request and check response   ${Valid-token}    ${sessionName}    ${URI}      ${Payload}      400
    Verify API Response when send null/invalid values      ${actualResult}

Testcase 7302- API service - Create Application - Check response when send post request with "dateOfBirthMonth" contains special characters for Saudi/iqama
    [Tags]    regression
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber},"sponsorNumber": None,"dateOfBirthMonth": "1@","dateOfBirthYear": 1418,"token": "","captchaCode": ""})
    Post Request and check response    ${Valid-token}    ${sessionName}    ${URI}      ${Payload}      422
    Verify API Response when send null/invalid values2     ${actualResult}

Testcase 7303- API service - Create Application - Check response when send post request with wrong "dateOfBirthYear" for Saudi/iqama
    [Tags]    regression
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber},"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1318,"token": "","captchaCode": ""})
    Post Request and check response    ${Valid-token}   ${sessionName}    ${URI}      ${Payload}      400
    Verify API Response when send invalid data not matched with NIC - create application     ${actualResult}



Testcase 7307- API service - Create Application - Check response when send post request with "dateOfBirthYear" contains AR number for Saudi/iqama
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": 3095604656,"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
    Post Request and check response  ${Valid-token}    ${sessionName}    ${URI}      ${Payload}      400
    Verify API Response when send null/invalid values     ${actualResult}


Testcase 7308- API service - Create Application - Check response when send post request with "dateOfBirthYear" contains Spaces for Saudi/iqama
    [Tags]    regression
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber},"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": "14 18","token": "","captchaCode": ""})
    Post Request and check response    ${Valid-token}     ${sessionName}    ${URI}      ${Payload}      422
    Verify API Response when send null/invalid values2     ${actualResult}



Testcase 7310- API service - Create Application - Check response when send post request with "dateOfBirthYear" contains special characters for Saudi/iqama
    [Tags]    regression
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber},"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": "14@18","token": "","captchaCode": ""})
    Post Request and check response     ${Valid-token}   ${sessionName}    ${URI}      ${Payload}      422
    Verify API Response when send null/invalid values2      ${actualResult}


#Testcase 7110- API service - Create Application - Check response when send valid create application request for non logged in visitor
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": ${borderNumber},"sponsorNumber": ${sponserNumber},"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": "4321"})
#    Post Request and check response   ${Valid-token}    ${sessionName}    ${URI}      ${Payload}      200
#    Verify API Response when send valid data - Create application- visitor    ${actualResult}      ${borderNumber}     ${sponserNumber}

#Testcase 7311- API service - Create Application - Check response when send post request with wrong "token" for non logged Saudi/iqama
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": 3095603656,"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response    ${sessionName}    ${URI}      ${Payload}      400
#    Verify API Response when send null/invalid values     ${actualResult}

#Testcase 7312- API service - Create Application - Check response when send post request with "token" contains AR number for non logged Saudi/iqama
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": ${borderNumber},"sponsorNumber": none,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response    ${sessionName}    ${URI}      ${Payload}      400
#    Verify API Response when send null/invalid values     ${actualResult}

#Testcase 7313- API service - Create Application - Check response when send post request with "token" contains Spaces for non logged Saudi/iqama
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": ${borderNumber},"sponsorNumber": none,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response    ${sessionName}    ${URI}      ${Payload}      400
#    Verify API Response when send null/invalid values     ${actualResult}

#Testcase 7314- API service - Create Application - Check response when send post request with null value for "token" for non logged Saudi/iqama
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": ${borderNumber},"sponsorNumber": none,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response    ${sessionName}    ${URI}      ${Payload}      400
#    Verify API Response when send null/invalid values     ${actualResult}

#Testcase 7315- API service - Create Application - Check response when send post request with "captchaCode" contains special characters for visitor
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": ${borderNumber},"sponsorNumber": none,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response    ${sessionName}    ${URI}      ${Payload}      400
#    Verify API Response when send null/invalid values     ${actualResult}
#
#Testcase 7316- API service - Create Application - Check response when send post request with "captchaCode" contains letters for visitor
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": ${borderNumber},"sponsorNumber": none,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response    ${sessionName}    ${URI}      ${Payload}      400
#    Verify API Response when send null/invalid values     ${actualResult}

#Testcase 7318- API service - Create Application - Check response when send post request with "captchaCode" contains spaces for visitor
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": ${borderNumber},"sponsorNumber": none,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response    ${sessionName}    ${URI}      ${Payload}      400
#    Verify API Response when send null/invalid values     ${actualResult}
#
#Testcase 7319- API service - Create Application - Check response when send post request with null value "captchaCode" for visitor
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": ${borderNumber},"sponsorNumber": none,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response    ${sessionName}    ${URI}      ${Payload}      400
#    Verify API Response when send null/invalid values     ${actualResult}
#
##Testcase 7320- API service - Create Application - Check response when send post request with "captchaCode" contains AR numbers for visitor
##    Create API session
##    ${Payload}  evaluate    json.dumps({"identityNumber": ${borderNumber},"sponsorNumber": none,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
##    Post Request and check response    ${sessionName}    ${URI}      ${Payload}      400
##    Verify API Response when send null/invalid values     ${actualResult}

#Testcase 7321- API service - Create Application - Check response when send post request with wrong "token" for non logged visitor
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": ${borderNumber},"sponsorNumber": none,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response    ${sessionName}    ${URI}      ${Payload}      400
#    Verify API Response when send null/invalid values     ${actualResult}
#
#Testcase 7322- API service - Create Application - Check response when send post request with "token" contains AR number for non logged visitor
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": ${borderNumber},"sponsorNumber": none,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response    ${sessionName}    ${URI}      ${Payload}      400
#    Verify API Response when send null/invalid values     ${actualResult}
#
#Testcase 7323- API service - Create Application - Check response when send post request with "token" contains Spaces for non logged visitor
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": ${borderNumber},"sponsorNumber": none,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response    ${sessionName}    ${URI}      ${Payload}      400
#    Verify API Response when send null/invalid values     ${actualResult}
#
#Testcase 7324- API service - Create Application - Check response when send post request with null value for "token" for non logged visitor
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber},"sponsorNumber": none,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response    ${sessionName}    ${URI}      ${Payload}      400
#    Verify API Response when send invalid identityNumber     ${actualResult}
#
#Testcase 7325- API service - Create Application - Check response when send post request with wrong "captchaCode" for non logged in Saudi/iqama
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber},"sponsorNumber": none,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response    ${sessionName}    ${URI}      ${Payload}      400
#    Verify API Response when send invalid identityNumber     ${actualResult}


#Testcase 7326- API service - Create Application - Check response when send post request with "captchaCode" contains special characters for Saudi/iqama
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber},"sponsorNumber": none,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response    ${sessionName}    ${URI}      ${Payload}      400
#    Verify API Response when send invalid identityNumber     ${actualResult}

#Testcase 7327- API service - Create Application - Check response when send post request with "captchaCode" contains letters for Saudi/iqama
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": 3095605656,"sponsorNumber": none,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response    ${sessionName}    ${URI}      ${Payload}      400
#    Verify API Response when send invalid identityNumber     ${actualResult}


#Testcase 7329- API service - Create Application - Check response when send post request with "captchaCode" contains spaces for Saudi/iqama
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": 3095605656,"sponsorNumber": none,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response    ${sessionName}    ${URI}      ${Payload}      400
#    Verify API Response when send invalid identityNumber     ${actualResult}


#Testcase 7330- API service - Create Application - Check response when send post request with null value "captchaCode" for Saudi/iqama
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": 3095605656,"sponsorNumber": none,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response    ${sessionName}    ${URI}      ${Payload}      400
#    Verify API Response when send invalid identityNumber     ${actualResult}


#Testcase 7331- API service - Create Application - Check response when send post request with "captchaCode" contains AR numbers for saudi or iqama
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": 3095604656,"sponsorNumber": none,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response    ${sessionName}    ${URI}      ${Payload}      400
#    Verify API Response when send invalid identityNumber     ${actualResult}


#Testcase 7110- API service - Create Application - Check response when send valid create application request for non logged in visitor
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": 3121603326,"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response    ${sessionName}    ${URI}      ${Payload}      200
#    Verify API Response when send null/invalid values    ${actualResult}

#Testcase 7123- API service - Create Application - Check response when send post request with wrong "captchaCode" for non logged in visitor
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": 3095603656,"sponsorNumber": None,"dateOfBirthMonth": 12,"dateOfBirthYear": 1418,"token": "","captchaCode": ""})
#    Post Request and check response    ${sessionName}    ${URI}      ${Payload}      400
#    Verify API Response when send invalid identityNumber     ${actualResult}






