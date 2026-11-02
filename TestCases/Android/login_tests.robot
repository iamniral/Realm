*** Settings ***
Resource          ../../Config/Android_config.resource
Resource          ../../Resources/Android_keywords.resource



Test Setup        Suite And Device Setup
Test Teardown     Suite And Device Teardown

*** Test Cases ***
Verify User Can Switch To Testing Endpoint And Login
    [Documentation]    Unlocks developer settings, switc    hes to the testing end point,and attempts a login.
    
    Switch To The Testing Endpoint
    Login Mobile App