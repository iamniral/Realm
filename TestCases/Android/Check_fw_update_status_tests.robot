*** Settings ***
Resource          ../../Config/Android_config.resource
Resource          ../../Resources/Android_keywords.resource
#Resource         ../Resources/Firmware_keywords.resource
#Library     SerialLibrary    # Add this line

Test Setup        Suite And Device Setup
Test Teardown     Suite And Device Teardown

*** Test Cases ***
Verify the Firmware Update Status Success or No Update Needed or Failed 
    [Documentation]     Test case to Verify the Firmware Update Status Success or No Update Needed or Failed
    Switch To The Testing Endpoint
    Login Mobile App
    Sleep          100s
    
    Perform Firmware Update Process
    #Check the Firmware Update Status - Success
    #Check Firmware Update Status - No Update Needed
    Sleep         25s
    Log To Console    message=Checking the Device FW version with AT command wait for 25 second
    Sleep         50s
    Read AT command
   # Click Acknowledge Button
    #Verify Device Software Version
    Verify Nordic Version vs Mobile app fw version
    Verify Aggregate Version vs Mobile App FW Version
   
   
#Verify Firmware Update Status
    #[Documentation]    Test case to verify the firmware update status visibility.
    # Check if the text is visible on the screen
   # Verify Status Text Visibility