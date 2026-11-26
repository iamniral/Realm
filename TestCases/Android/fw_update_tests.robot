*** Settings ***
Resource          ../../Config/Android_config.resource
Resource          ../../Resources/Android_keywords.resource

Test Setup        Suite And Device Setup
Test Teardown     Suite And Device Teardown

*** Test Cases ***
Verify The User Can Perform Nordic Firmware Update
    [Documentation]     To Verify that the user is able to Perform Nordic Firmware Update - Success.
    Switch To The Testing Endpoint
    Login Mobile App

    Perform Firmware Update Process
    Check the Firmware Update Status - Success
   # Verify Status Text Visibility
    #Verify Firmware Update Status
