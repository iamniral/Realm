*** Settings ***
Resource          ../resources/app_config.resource
Resource          ../resources/android_res.resource
Resource          ../resources/login_config.resource
Test Setup        Start Realm Application
Test Teardown     Stop Realm Application

*** Test Cases ***
 

Verify User Can Perform Firmware Update
    [Documentation]    Verify that user can perfom the Firmware Update.    
     # 1. Call your login keyword directly
    Verify User Can Switch To Testing Endpoint And Login
    #Verify Page Title Is Scan
    # 2. Proceed with firmware update steps
    Interact With Config Update Button
    #Select Configuration From Popup List
    Select Update From Popup List
    Select INT200 From Popup List
    Select Device And Proceed To Review
    Execute Firmware Update
    Handle Warning And Continue Update
   # Verify System Update Status
   
#Verify Firmware Update Status
    #[Documentation]    Test case to verify the firmware update status visibility.
    # Check if the text is visible on the screen
   # Verify Status Text Visibility