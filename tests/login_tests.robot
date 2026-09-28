*** Settings ***
Resource          ../resources/app_config.resource
Resource          ../resources/android_res.resource

Test Setup        Start Realm Application
Test Teardown     Stop Realm Application

*** Test Cases ***
Verify User Can Switch To Testing Endpoint And Login
    [Documentation]    Unlocks developer settings, switches to the testing environment, and attempts a login.
    
    Open Settings Screen
    Unlock Developer Options By Tapping Version    tap_count=10
    Navigate And Select Testing Endpoint
    
    Enter Credentials    ${User1-Details}[username]   ${User1-Details}[password]
    Submit Login Form