*** Settings ***
Resource          ../resources/app_config.resource
Resource          ../resources/android_res.resource

Test Setup        Start Realm Application
Test Teardown     Stop Realm Application

*** Test Cases ***
Verify the Firmware Update Status - No Update needed
    [Documentation]     Test case to verify the firmware update status - No Update needed
    Switch To The Testing Endpoint
    Login Mobile App

    Perform Firmware Update Process
    Check Firmware Update Status - No Update Needed
   
#Verify Firmware Update Status
    #[Documentation]    Test case to verify the firmware update status visibility.
    # Check if the text is visible on the screen
   # Verify Status Text Visibility