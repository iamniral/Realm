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

Verify User Can Perform Firmware Update
    [Documentation]    Verify that user can perfom the Firmware Update.
    #Verify Page Title Is Scan
    Interact With Config Update Button
    #Select Configuration From Popup List

    Select Update From Popup List
    Select INT200 From Popup List
   # Select Specific Device From List

    Select Device And Proceed To Review
    Execute Firmware Update
    Handle Warning And Continue Update
   # Verify System Update Status
   
#Verify Firmware Update Status
    [Documentation]    Test case to verify the firmware update status visibility.
    # Check if the text is visible on the screen
   # Verify Status Text Visibility
