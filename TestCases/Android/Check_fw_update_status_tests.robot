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
    # Sleep          25s
    
    Perform Firmware Update Process
    Verify Firmware Update And AT Aggregate Version

    Sleep         25s
    
   # Click Acknowledge Button
    #Verify Device Software Version
    Verify Nordic Version vs Mobile app fw version
   
   
#Verify Firmware Update Status
    #[Documentation]    Test case to verify the firmware update status visibility.
    # Check if the text is visible on the screen
   # Verify Status Text Visibility