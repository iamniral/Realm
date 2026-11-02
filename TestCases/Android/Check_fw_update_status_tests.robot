*** Settings ***
Resource          ../../Config/Android_config.resource
Resource          ../../Resources/Android_keywords.resource
#Resource         ../Resources/Firmware_keywords.resource
#Library     SerialLibrary    # Add this line

Test Setup        Suite And Device Setup
Test Teardown     Suite And Device Teardown

*** Test Cases ***
Verify the Firmware Update Status - No Update needed
    [Documentation]     Test case to verify the firmware update status - No Update needed
    Switch To The Testing Endpoint
    Login Mobile App

    Perform Firmware Update Process
    #Check the Firmware Update Status - Success
    Check Firmware Update Status - No Update Needed
    Log To Console    message=Checking the Device FW version with AT command
    Read AT command
   
   
#Verify Firmware Update Status
    #[Documentation]    Test case to verify the firmware update status visibility.
    # Check if the text is visible on the screen
   # Verify Status Text Visibility