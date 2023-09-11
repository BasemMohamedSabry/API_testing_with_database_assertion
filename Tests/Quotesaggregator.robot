*** Settings ***
Documentation    Create application suite is designed for test and verify that quotes created successfully
Resource    ../Resources/Objects/API_Preferences.robot





*** Variables ***
#${URI}      http://172.30.20.184/MMPAggregator/MMPAggregator
${RefNumVisitor}    b4eaaa55-aab4-4d93-9dd1-4c04fbeb605b
${RefNumSaudi/iqama}    b4eaaa55-aab4-4d93-9dd1-4c04fbeb605b

*** Keywords ***




*** Test Cases ***

Testcase - API service - Check response when send valid QuotesAggregator request for logged in visitor
    Create API session_Aggregator
    ${Payload}  evaluate    json.dumps({"applicationId":"${RefNumVisitor}","language":"ar","insuranceCompanyCode":1,"policyHolder":{"idTypeCode":1,"id":3095602656,"policyHolderDOBH":None,"policyHolderDOBG":"12-1418","nationalityID":102,"gender":1,"arabicName":{"firstName":"امجد","middleName":None,"lastName":"يحيى"},"englishName":{"firstName":"Amjad","middleName":"Ata","lastName":"Yahya"}},"quotationDetails":{"policyEffectiveDate":"21-09-2022","professionInfo":{"professionID":1,"subProfessionID":None,"isSurgeon":True,"experiencePeriod":1,"practicePlace":[{"practiceRegionID":1,"healthFacilityID":None}],"declarations":[{"questionID":1,"questionAnswer":False},{"questionID":2,"questionAnswer":True},{"questionID":3,"questionAnswer":False},{"questionID":4,"questionAnswer":False},{"questionID":5,"questionAnswer":False},{"questionID":6,"questionAnswer":False}],"previousPolicyInfo":None}},"scheme":{"schemeRef":"string","icSchemeRef":"string","schemeTypeID":"string","value":"string"},"customizedParameters":[{"key":"string","value":"string"}]})
    Post Request and check response_Aggregator     ${sessionName}            /Quote      ${Payload}      200


