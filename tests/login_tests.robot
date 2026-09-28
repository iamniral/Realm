*** Settings ***
Resource          ../resources/app_config.resource
Resource          ../resources/android_res.resource



Test Setup        Start Realm Application
Test Teardown     Stop Realm Application

*** Test Cases ***
Verify User Can Switch To Testing Endpoint And Login
    [Documentation]    Unlocks developer settings, switches to the testing end point,and attempts a login.
    
    Switch To The Testing Endpoint
    Login Mobile App