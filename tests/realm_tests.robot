*** Settings ***
Resource          ../resources/app_config.resource
Resource          ../resources/settings_page.resource
Resource          ../resources/login_page.resource

Test Setup        Start Realm Application
Test Teardown     Stop Realm Application

*** Test Cases ***
Verify User Can Switch To Testing Endpoint And Login
    [Documentation]    Unlocks developer settings, switches to the testing environment, and attempts a login.
    
    Open Settings Screen
    Unlock Developer Options By Tapping Version    tap_count=10
    Navigate And Select Testing Endpoint
    
    Enter Credentials    username=globalstarapps    password=spot1234
    Submit Login Form
