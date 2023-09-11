*** Settings ***
Library     RequestsLibrary
Library     BuiltIn
Library     Collections
Library     String
Library    JSONLibrary
Library          DateTime
Resource    ../Objects/API_Preferences.robot
Resource    ../Keyword/Keywords_CreateApplication.robot
Resource    ../Keyword/Keywords_UpdateApplication.robot
Resource    ../Keyword/Keywords_DeclareApplication.robot
Resource    ../Keyword/Keywords_GetAllQuotationlist.robot
Resource    ../Keyword/Keywords_SelectQuotation.robot
Resource    ../Keyword/Keywords_CreatePayment.robot
Resource    ../Database/Query.robot
Resource     ../Keyword/Common.robot

*** Variables ***


${identityNumber}     1121603326
${borderNumber}      3100933328
${sponserNumber}      7029140709
${Q1_F}  False
${Q1}    True
${Q2}    True
${Q3}    False
${Q4}    True
${Q5}    True
${Q6}    False

${paymentMethod}     Visa
${paymentMethod1}    Master
${email}        basem2060@yahoo.com
${mobile}      0521256465
${qualificationId}    1
${qualification}     ""
${employmentTypeId}    1
${schsRegistrationNumber}    11AA1234467
${schsExpiryDate}     01-06-2023
${iban}      SA1115781144220000422336
${paymentReturnURL}      https://mmpuat.gettameeni.com/Payment/PaymentSuccess
*** Keywords ***

Create application - visitor
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": ${borderNumber},"sponsorNumber":${sponserNumber},"dateOfBirthMonth": 11,"dateOfBirthYear": 1419,"token": None,"captchaCode": None})
    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications      ${Payload}      200
    Verify API Response when send valid data - Create application- visitor    ${actualResult}      ${borderNumber}     ${sponserNumber}
    set global variable         ${RefNum}     ${actualResult['applicationReference']}
    LOG    ${RefNum}
Create application - saudi/iqama
    Get token
    Create API session
    ${Payload}  evaluate    json.dumps({"identityNumber": ${identityNumber},"sponsorNumber":None,"dateOfBirthMonth":12,"dateOfBirthYear": 1418,"token": None,"captchaCode": None})
    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications      ${Payload}      200
    Verify API Response when send valid data - Create application- saudi/iqama   ${actualResult}    ${identityNumber}
    set global variable         ${saudi/iqama-RefNum}     ${actualResult['applicationReference']}
    LOG    ${saudi/iqama-RefNum}

Update Application - visitor
    Create API session
    Create_Date_Today+2
    ${Payload}  evaluate    json.dumps({"effectiveStartDate":"08-09-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":4,"subSpecialityId":70,"isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails":{"practiceOfRegionID":[0],"facility":[{"number":1,"placeType":1,"places":["basem"]}]}})
    put request and check response   ${Valid-token}    ${sessionName}      /Applications/${RefNum}/Profession        ${Payload}      200
    Verify API Response when send valid data - Update application      ${actualResult}     ${TodayDate+2}
#    set global variable       ${RefNum}     ${actualResult['applicationReference']}
#    LOG            ${RefNum}

Update Application - saudi/iqama
    Create API session
    Create_Date_Today+2
        ${Payload}  evaluate    json.dumps({"effectiveStartDate":"08-09-2022","effectiveEndDate":"08-09-2022","effectiveDate":"${TodayDate+2}","specialityId":4,"subSpecialityId":70,"isSergery":True,"yearsOfExceperienceId":1,"regionId":1,"schemeEntityId":None,"facilityDetails":{"practiceOfRegionID":[0],"facility":[{"number":1,"placeType":1,"places":["sabry"]}]} })
    put request and check response   ${Valid-token}    ${sessionName}      /Applications/${saudi/iqama-RefNum}/Profession        ${Payload}      200
    Verify API Response when send valid data - Update application      ${actualResult}    ${TodayDate+2}
#    set global variable       ${RefNum}     ${actualResult['applicationReference']}
#    LOG            ${RefNum}
Declare Application - visitor_False
    Create API session
    ${Payload}  evaluate    json.dumps({"questionsAnswers": [{"questionId": 1,"answer": ${Q1_F}},{"questionId": 2,"answer": ${Q2} },{"questionId": 3,"answer": ${Q3} },{"questionId": 4,"answer": ${Q4}},{"questionId": 5,"answer": ${Q5}},{"questionId": 6,"answer": ${Q6} }],"previousPolicy": None})
    put request and check response     ${Valid-token}    ${sessionName}    /Applications/${RefNum}/Declaration       ${Payload}      200
    Verify API Response when send valid data - declare application       ${actualResult}     ${Q1_F}    ${Q2}    ${Q3}    ${Q4}    ${Q5}    ${Q6}


Declare Application - visitor
    Create API session
    ${Payload}  evaluate    json.dumps({"questionsAnswers": [{"questionId": 1,"answer":${Q1}},{"questionId": 2,"answer":${Q2}},{"questionId": 3,"answer": ${Q3}},{"questionId": 4,"answer":${Q4}},{"questionId": 5,"answer":${Q5}},{"questionId": 6,"answer":${Q6}}],"previousPolicy":{ "number": "1234567891","insuaranceCompanyId": "128","effectiveDate":"02-03-2022","expirationDate": "15-03-2023","retroactiveDate":None, "unInterruptedDuration": 10}})
    put request and check response     ${Valid-token}   ${sessionName}    /Applications/${RefNum}/Declaration       ${Payload}      200
    Verify API Response when send valid data - declare application       ${actualResult}     ${Q1}     ${Q2}    ${Q3}    ${Q4}    ${Q5}    ${Q6}


Declare Application - saudi/iqama

    Create API session
    ${Payload}  evaluate    json.dumps({"questionsAnswers": [{"questionId": 1,"answer":${Q1}},{"questionId": 2,"answer":${Q2}},{"questionId": 3,"answer": ${Q3}},{"questionId": 4,"answer":${Q4}},{"questionId": 5,"answer":${Q5}},{"questionId": 6,"answer":${Q6}}],"previousPolicy":{ "number": "1234567891","insuaranceCompanyId": "128","effectiveDate":"02-03-2022","expirationDate": "15-03-2023","retroactiveDate":None, "unInterruptedDuration": 10}})
    put request and check response     ${Valid-token}   ${sessionName}    /Applications/${saudi/iqama-RefNum}/Declaration       ${Payload}      200
    Verify API Response when send valid data - declare application       ${actualResult}     ${Q1}     ${Q2}    ${Q3}    ${Q4}    ${Q5}    ${Q6}
#     set test variable       ${RefNum}     ${actualResult['applicationReference']}


Get all quotations - Visitor
   QuotesAggregator - visitor
   Create API session
   sleep    60s
   get request and check response     ${Valid-token}     ${sessionName}     /Applications/${RefNum}/Quotations                   200
   Verify API Response when send valid data - get all quotations       ${actualResult}
    set test variable     ${QUOTEref}     ${actualResult['model'][0]['quotationReference']}

Get all quotations - saudi/iqama
   QuotesAggregator - Saudi/iqama
   Create API session
    sleep    60s
    get request and check response    ${Valid-token}     ${sessionName}     /Applications/${saudi/iqama-RefNum}/Quotations          200
   Verify API Response when send valid data - get all quotations       ${actualResult}
    set test variable     ${QUOTEref}     ${actualResult['model'][0]['quotationReference']}

Select Quotation - visitor
   Get_CoverPlan_ref_By_QouteRef    ${QUOTEref}
   Create API session
   ${Payload}  evaluate    json.dumps({"coverPlanReference": "${coverplan}","retroactivePeriodReference": None,"extendedReportingPeriodReference": None,"selectedDeductableId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"})
   Post Request and check response    ${Valid-token}   ${sessionName}    /Applications/${RefNum}/Quotations/${QUOTEref}      ${Payload}      200
   Verify API Response when send valid data - select quotation   ${actualResult}


Select Quotation - Saudi/iqama
    Get_CoverPlan_ref_By_QouteRef    ${QUOTEref}
    Create API session
    ${Payload}  evaluate    json.dumps({"coverPlanReference": "${coverplan}","retroactivePeriodReference": None,"extendedReportingPeriodReference": None,"selectedDeductableId": "3fa85f64-5717-4562-b3fc-2c963f66afa6"})
    Post Request and check response    ${Valid-token}   ${sessionName}    /Applications/${saudi/iqama-RefNum}/Quotations/${QUOTEref}      ${Payload}      200
    Verify API Response when send valid data - select quotation   ${actualResult}

Update FacilityDetails - visitor
    Create API session
    ${Payload}  evaluate    json.dumps({"facility":[{"number":1,"placeType":1,"places":["basem"]}]})
     put request and check response   ${Valid-token}    ${sessionName}      /Applications/${RefNum}/FacilityDetails        ${Payload}      200
#    Verify API Response when send valid data - Update application      ${actualResult}

Update FacilityDetails - Saudi/iqama
    Create API session
    ${Payload}  evaluate    json.dumps({"facility":[{"number":1,"placeType":1,"places":["basem"]}]})
    put request and check response   ${Valid-token}    ${sessionName}      /Applications/${saudi/iqama-RefNum}/FacilityDetails        ${Payload}      200
#    Verify API Response when send valid data - Update application      ${actualResult}

Create payment - visitor
    Get token
   Create API session
   ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId":${qualificationId},"qualification":${qualification},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}","payout":{"beneficiary":[{ "name":"TheNationalCommercialBank", "accountId":"57700000010508","bankIdBIC":"NCBKSAJE","debitCurrency":"SAR","transferCurrency":"SAR"}]}})
#   ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId":${qualificationId},"qualification":${qualification},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}"})

   Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${RefNum}/Payment       ${Payload}      200
   Verify API Response when send valid data - Create Payment    ${actualResult}
   set test variable     ${PaymentURl}     ${actualResult['model']['url']}



Create payment - Saudi/iqama
    Get token
    Create API session
  ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod1}","email": "${email}","mobile": "${mobile}","qualificationId":${qualificationId},"qualification":${qualification},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}","payout":{"beneficiary":[{ "name":"TheNationalCommercialBank", "accountId":"57700000010508","bankIdBIC":"NCBKSAJE","debitCurrency":"SAR","transferCurrency":"SAR"}]}})
#   ${Payload}  evaluate    json.dumps({"paymentMethod": "${paymentMethod}","email": "${email}","mobile": "${mobile}","qualificationId":${qualificationId},"qualification":${qualification},"schsRegistrationNumber": "${schsRegistrationNumber}","schsExpiryDate": "${schsExpiryDate}","iban": "${iban}","paymentReturnURL": "${paymentReturnURL}","payout":{"benificiaryName":"TheNationalCommercialBank","bankIdCode":"NCBKSAJE","iBanNum": "SA1115781144220000422336","transferAmount":"500","transferDate":"01-06-2023","transferCurrency":"SAR"}]}})

    Post Request and check response   ${Valid-token}   ${sessionName}    /Applications/${saudi/iqama-RefNum}/Payment       ${Payload}      200
    Verify API Response when send valid data - Create Payment    ${actualResult}
    set test variable     ${PaymentURl}     ${actualResult['model']['url']}

QuotesAggregator - visitor
     DB_Get_PolicyHolder_details_By_Identity_num    ${borderNumber}
    Create API session_Aggregator
    ${Payload}  evaluate    json.dumps({"applicationId":"${DB_Application_ref}","language":"ar","insuranceCompanyCode":1,"policyHolder":{"idTypeCode":1,"id":${borderNumber},"policyHolderDOBH":None,"policyHolderDOBG":"12-1418","nationalityID":102,"gender":1,"arabicName":{"firstName":"امجد","middleName":None,"lastName":"يحيى"},"englishName":{"firstName":"Amjad","middleName":"Ata","lastName":"Yahya"}},"quotationDetails":{"policyEffectiveDate":"21-09-2022","professionInfo":{"professionID":1,"subProfessionID":None,"isSurgeon":True,"experiencePeriod":1,"practicePlace":[{"practiceRegionID":1,"healthFacilityID":None}],"declarations":[{"questionID":1,"questionAnswer":False},{"questionID":2,"questionAnswer":True},{"questionID":3,"questionAnswer":False},{"questionID":4,"questionAnswer":False},{"questionID":5,"questionAnswer":False},{"questionID":6,"questionAnswer":False}],"previousPolicyInfo":None}},"scheme":{"schemeRef":"string","icSchemeRef":"string","schemeTypeID":"string","value":"string"},"customizedParameters":[{"key":"string","value":"string"}]})
    Post Request and check response_Aggregator     ${sessionName}            /Quote      ${Payload}      200

QuotesAggregator - Saudi/iqama
     DB_Get_PolicyHolder_details_By_Identity_num    ${identityNumber}
    Create API session_Aggregator
    ${Payload}  evaluate    json.dumps({"applicationId":"${DB_Application_ref}","language":"ar","insuranceCompanyCode":1,"policyHolder":{"idTypeCode":1,"id":${identityNumber},"policyHolderDOBH":None,"policyHolderDOBG":"12-1418","nationalityID":102,"gender":1,"arabicName":{"firstName":"امجد","middleName":None,"lastName":"يحيى"},"englishName":{"firstName":"Amjad","middleName":"Ata","lastName":"Yahya"}},"quotationDetails":{"policyEffectiveDate":"21-09-2022","professionInfo":{"professionID":1,"subProfessionID":None,"isSurgeon":True,"experiencePeriod":1,"practicePlace":[{"practiceRegionID":1,"healthFacilityID":None}],"declarations":[{"questionID":1,"questionAnswer":False},{"questionID":2,"questionAnswer":True},{"questionID":3,"questionAnswer":False},{"questionID":4,"questionAnswer":False},{"questionID":5,"questionAnswer":False},{"questionID":6,"questionAnswer":False}],"previousPolicyInfo":None}},"scheme":{"schemeRef":"string","icSchemeRef":"string","schemeTypeID":"string","value":"string"},"customizedParameters":[{"key":"string","value":"string"}]})
    Post Request and check response_Aggregator     ${sessionName}            /Quote      ${Payload}      200

