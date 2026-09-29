*** Settings ***
Resource          ../resources/app_config.resource
Resource          ../resources/android_res.resource

Test Setup        Start Realm Application
Test Teardown     Stop Realm Application


*** Test Cases ***
Verify User Can apply configuration profile sucssfully 
    [Documentation]    Apply configuration profile

    Open Settings Screen
    Unlock Developer Options By Tapping Version    tap_count=10
    Navigate And Select Testing Endpoint
    Enter Credentials    ${User1-Details}[username]   ${User1-Details}[password]
    Submit Login Form
    Sleep          60s
    Give The Permission  
    Open Config Screen   
    Select Config profile
    Apply Config Profile and Validate Result