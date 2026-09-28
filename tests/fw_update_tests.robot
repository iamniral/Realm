*** Settings ***
Resource          ../resources/app_config.resource
Resource          ../resources/android_res.resource

Test Setup        Start Realm Application
Test Teardown     Stop Realm Application

*** Test Cases ***
Verify The User Can Perform Nordic Firmware Update
    [Documentation]     To Verify that the user is able to Perform Nordic Firmware Update - Success.
    Switch To The Testing Endpoint
    Login Mobile App

    Perform Firmware Update Process
    Check the Firmware Update Status - Success
   # Verify Status Text Visibility
    #Verify Firmware Update Status
