*** Settings ***
Resource          ../../Config/Android_config.resource
Resource          ../../Resources/Android_keywords.resource

Test Setup        Suite And Device Setup
Test Teardown     Suite And Device Teardown


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