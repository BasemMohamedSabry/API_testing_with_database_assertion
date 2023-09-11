*** Settings ***
Library     SeleniumLibrary
Library     RequestsLibrary
Library     BuiltIn
Library     Collections
Library     String
Library     JSONLibrary
Library     json
Variables       ${EXEC_DIR}/Resources/Project_Configration/Test_Config.yaml


*** Variables ***

${token_Invalid}    Bearer eyJhbGciOiJIUzICJ9.eyJodHRwOi81LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6Ijc0NzUzZDdlLTUyYmItNDViYS1hNTk2LWRjYjc3YmFlNTY4YyIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWUiOiJNTVAgVXNlciIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL2VtYWlsYWRkcmVzcyI6Im1tcFVzZXJAbW1wLmNvbSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL21vYmlsZXBob25lIjoiOTY2NTI0NTI1NjY2NTYiLCJVc2VyTmFtZSI6Im1tcFVzZXJAbW1wLmNvbSIsImV4cCI6MTY2MTUyMTEyMywiaXNzIjoiaHR0cDovL0luc3VyZVRlY2guTU1QLklzc3Vlci5jb20ifQ.E7m_CH1__kpZTLDnOh5KpuHyWlXrfLZgZMzC0y2gVEk
${username}         1121603326

*** Keywords ***

Get token
    create session       mysession     https://idpuat.gettameeni.com      disable_warnings=1
    ${headers}          create dictionary       Content-Type=application/x-www-form-urlencoded
    ${payload}          create dictionary       username=${username}     password=123456        grant_type=password           client_id=MMPAutomation    client_secret=Secret12345     scope=openid mmp_read mmp_write
    ${response}         Post request        mysession          /connect/token    headers=${headers}       data=${payload}
    should be equal as strings      ${response.status_code}         200
    ${Data}     to json         ${response.content}
    set global variable         ${Valid-token}    Bearer ${data['access_token']}
    #log to console      ${Valid-token}

Create API session
    ${randomNumber}          generate random string          4    [NUMBERS]
    ${sessionName}           Catenate    session_${randomNumber}
    set global variable      ${sessionName}
    create session           ${sessionName}      ${Base_Url}          timeout=30     disable_warnings=1

Create API session_Aggregator
    ${randomNumber}          generate random string          4    [NUMBERS]
    ${sessionName}           Catenate    session_${randomNumber}
    set global variable      ${sessionName}
    create session           ${sessionName}      ${AG_Base_Url}          timeout=30     disable_warnings=1

Post Request and check response_Aggregator

    [Arguments]     ${sessionName}    ${SecondUrl}       ${body}      ${statuscode}
    ${header}=  Create Dictionary   Content-Type=application/json
    ${resp}     Post request           ${sessionName}         ${SecondUrl}    ${body}    headers=${header}
    set test variable   ${actualResult}       ${resp}
    should be equal as strings             ${resp.status_code}         ${statuscode}
    set test variable     ${actualResult}

Post Request and check response
    [Arguments]   ${Valid-token}    ${sessionName}    ${SecondUrl}       ${body}      ${statuscode}
    ${header}=  Create Dictionary   Content-Type=application/json   sessionReference=A8930E1A-0239-4804-9540-AE4ABFD12A1A     Authorization=${Valid-token}
    ${resp}     Post request           ${sessionName}         ${SecondUrl}    ${body}    headers=${header}
    set test variable   ${actualResult}      ${resp.json()}
    should be equal as strings             ${resp.status_code}         ${statuscode}
    set test variable     ${actualResult}

Post Request and check response when token is invalid
    [Arguments]    ${sessionName}    ${SecondUrl}       ${body}      ${statuscode}
    ${header}=  Create Dictionary   Content-Type=application/json   sessionReference=A8930E1A-0239-4804-9540-AE4ABFD12A1A     Authorization=${token_Invalid}
    ${resp}     Post request           ${sessionName}         ${SecondUrl}    ${body}    headers=${header}
    set test variable   ${actualResult}      ${resp.json()}
    should be equal as strings             ${resp.status_code}         ${statuscode}
    set test variable     ${actualResult}

Post Request and check response when token is null
    [Arguments]    ${sessionName}    ${SecondUrl}       ${body}      ${statuscode}
    ${header}=  Create Dictionary   Content-Type=application/json   sessionReference=A8930E1A-0239-4804-9540-AE4ABFD12A1A     Authorization=None
    ${resp}     Post request           ${sessionName}         ${SecondUrl}    ${body}    headers=${header}
    set test variable   ${actualResult}      ${resp.json()}
    should be equal as strings             ${resp.status_code}         ${statuscode}
    set test variable     ${actualResult}

put request and check response
    [Arguments]    ${Valid-token}     ${sessionName}     ${SecondUrl}       ${body}      ${statuscode}
    ${header}=  Create Dictionary   Content-Type=application/json   sessionReference=A8930E1A-0239-4804-9540-AE4ABFD12A1A     Authorization=${Valid-token}
    ${resp}     put request              ${sessionName}         ${SecondUrl}    ${body}    headers=${header}
    set test variable   ${actualResult}      ${resp.json()}
    should be equal as strings             ${resp.status_code}         ${statuscode}
    set test variable     ${actualResult}


put request and check response when invalid Auth for updateApplication
    [Arguments]    ${sessionName}    ${SecondUrl}       ${body}      ${statuscode}
    ${header}=  Create Dictionary   Content-Type=application/json   sessionReference=A8930E1A-0239-4804-9540-AE4ABFD12A1A     Authorization=${token_Invalid}
    ${resp}     put request              ${sessionName}         ${SecondUrl}    ${body}    headers=${header}
    set test variable   ${actualResult}      ${resp.json()}
    should be equal as strings             ${resp.status_code}         ${statuscode}
    set test variable     ${actualResult}


get request and check response
    [Arguments]  ${Valid-token}    ${sessionName}    ${SecondUrl}        ${statuscode}
    ${header}=  Create Dictionary   Content-Type=application/json   sessionReference=A8930E1A-0239-4804-9540-AE4ABFD12A1A     Authorization=${Valid-token}
    ${resp}     get request          ${sessionName}         ${SecondUrl}      headers=${header}
    set test variable   ${actualResult}      ${resp.json()}
    should be equal as strings             ${resp.status_code}         ${statuscode}
    set test variable     ${actualResult}
    set test variable      ${QUOTEref}    ${actualResult['model'][0]['quotationReference']}



