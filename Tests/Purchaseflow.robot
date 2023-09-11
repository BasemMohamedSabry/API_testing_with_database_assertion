*** Settings ***
Documentation    Suite description
Library        SeleniumLibrary
Resource    ../Resources/Keyword/Keywords_Common_Purchaseflow.robot


*** Keywords ***


*** Variables ***

*** Test Cases ***

#As a visitor, Check that user can purchase policy:
#    Create application - visitor
#    Update Application - visitor
#    Declare Application - visitor_False
##   Declare Application - visitor_False
#    Get all quotations - Visitor
#    Select Quotation - Visitor
#    Update FacilityDetails - visitor
#    Create payment - visitor
#



As a Saudi/Iqama, Check that user can purchase policy:
    Create application - saudi/iqama
    Update Application - saudi/iqama
    Declare Application - saudi/iqama
    Get all quotations - saudi/iqama
    Select Quotation - Saudi/iqama
    Update FacilityDetails - Saudi/iqama
    Create payment - Saudi/iqama


#    open browser    ${PaymentURl}    chrome
#    click button    id="details-button"
#    wait until element contains    xpath=//*[@id="proceed-link"]
#    click element    xpath=//*[@id="proceed-link"]
#    click element    xpath=/html/body/form/input[1]
#    input text    xpath=/html/body/form/input[1]       4111111111111111
#    input text    xpath=//*[@id="card_1363609702574"]/form/div[3]/div[2]/input       05/23
#    input text    xpath=//*[@id="card_1363609702574"]/form/div[4]/div[2]/input      basem
#    input text    xpath=/html/body/form/input      123
#    click button    xpath=//*[@id="card_1363609702574"]/form/div[10]/div/button







#
#Testcase 7114- API service - Create Application - Check response when send valid create application request for logged in Saudi/iqama
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"identityNumber": 2283215347,"sponsorNumber": None,"dateOfBirthMonth": 7,"dateOfBirthYear": 1981,"token": None,"captchaCode": None})
#    Post Request and check response   ${Valid-token}     ${sessionName}    /Applications      ${Payload}      200
#    set global variable         ${RefNum}     ${actualResult['applicationReference']}
#    Verify API Response when send valid data - Create application    ${actualResult}
#
#
#    set global variable         ${URI-RefNum}     /Applications/${actualResult['applicationReference']}/Profession
#    log to console      ${URI-RefNum}
#     set global variable       ${RefNum}     ${actualResult['applicationReference']}
#         log to console      ${RefNum}
#
#
#Testcase 7174- API service - Update Application - Check response when send valid Update application request for logged in Saudi/iqama
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"12-08-2022","effectiveEndDate":"10-09-2022","effectiveDate":"${effectiveDate}","specialityId":1,"subSpecialityId":None,"isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None})
#    put request and check response     ${Valid-token}    ${sessionName}     ${RefNum}       ${Payload}      200
#    Verify API Response when send valid data - Update application     ${actualResult}
#
#    set global variable         ${URI-RefNum}     /Applications/${actualResult['applicationReference']}/Declaration
#    log to console    ${URI-RefNum}
#
#Testcase 7228- API service - Declare Application - Check response when send valid Declare application request for logged in Saudi/iqama
#    Get token
#    Create API session
#    ${Payload}  evaluate    json.dumps({"questionsAnswers": [{"questionId": 1,"answer": False},{"questionId": 2,"answer": False },{"questionId": 3,"answer": True },{"questionId": 4,"answer": True},{"questionId": 5,"answer": True},{"questionId": 6,"answer": False }],"previousPolicy": None})
#    put request and check response     ${Valid-token}     ${sessionName}     ${RefNum}        ${Payload}      200
#    Verify API Response when send valid data - declare application     ${actualResult}
#
#
#    set global variable         ${URI-RefNum}     /Applications/${actualResult['applicationReference']}/Quotations
#    log to console    ${URI-RefNum}
#
#
#Testcase API service - Get All quatation list - Check response when send valid Get All quatation list request for logged in Saudi/iqama
#   Get token
#   Create API session
#   get request and check response    ${Valid-token}     ${sessionName}        ${RefNum}          200
#   Verify API Response when send valid data - get all quotations       ${actualResult}
#
#    log to console        ${actualResult}
#    set global variable         ${URI-RefNum}     /Applications/${actualResult['applicationReference']}/Quotations/${actualResult['model'][2]['quotationReference']}
#    log to console    ${URI-RefNum}
#
#
#
#Testcase API service - Select Quotation - Check response when send valid SelectQuotation request for logged in Saudi/iqama
#    Get token
#    Create API session
#    ${Payload}  evaluate     json.dumps({"coverPlanReference": "fdf5eb45-486d-4473-923e-53faeb646c75","retroactivePeriodReference": None,"extendedReportingPeriodReference": None})
#    Post Request and check response   ${Valid-token}     ${sessionName}    ${RefNum}      ${Payload}      200
#    Verify API Response when send valid data - select quotation    ${actualResult}
#
