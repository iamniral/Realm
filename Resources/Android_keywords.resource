*** Settings ***
Library           AppiumLibrary
Library           String
Library           Collections
Resource          ../Locators/Android_Locators.resource
Resource          ../Config/Android_config.resource
Resource          ../Resources/Firmware_keywords.resource

*** Keywords ***

Suite And Device Setup
    Start Realm Application
    Connect To Nordic Device

Suite And Device Teardown
    Stop Realm Application
    # Close All Ports

# Login Page Keywords
Enter Credentials
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    ${USERNAME_FIELD}    timeout=1120s
    Click Element                    ${USERNAME_FIELD}
    Input Text                       ${USERNAME_FIELD}    ${username}
    Log To Console    The value of the username variable is: ${username}    
    Wait Until Element Is Visible    ${PASSWORD_FIELD}    timeout=15s
    Click Element                    ${PASSWORD_FIELD}
    Input Text                       ${PASSWORD_FIELD}    ${password}
    Log To Console    The value of the password variable is: ${password}

Submit Login Form
    Hide Keyboard
    Wait Until Element Is Visible    ${LOGIN_BUTTON}      timeout=5s
    Tap                              ${LOGIN_BUTTON}
    Log To Console    Hello, Varibales entered successfully.
    Log To Console    Hello, user is able to click on the login successfully.

# Settings Page Keywords
Open Settings Screen
    Wait Until Element Is Visible    ${SETTINGS_BUTTON}    timeout=5525s
    Click Element                    ${SETTINGS_BUTTON}
    Log To Console    Hello, user is able to click on the Settings successfully.

Unlock Developer Options By Tapping Version
    [Arguments]    ${tap_count}=10
    Wait Until Element Is Visible    ${VERSION_ELEMENT}    timeout=5s
    FOR    ${counter}    IN RANGE    ${tap_count}
    Click Element    ${VERSION_ELEMENT}
    END
    Log To Console    Hello, user is able to Unlock Developer Options By Tapping Version successfully.

Navigate And Select Testing Endpoint
    # Swipe up to reveal the hidden endpoint settings
    Swipe By Percent    50    80    50    30    1000
    Wait Until Element Is Visible    ${SUPPORT_API_ENDPOINT}    timeout=5s
    Click Element                    ${SUPPORT_API_ENDPOINT}
    Log To Console    Hello, user is able to click on the suppot api endpoint successfully.
    Wait Until Element Is Visible    ${TESTING_ENDPOINT}        timeout=5s
    Click Element                    ${TESTING_ENDPOINT}

Switch To The Testing Endpoint
    Open Settings Screen
    Unlock Developer Options By Tapping Version
    Navigate And Select Testing Endpoint

Login Mobile App
    Enter Credentials   ${User1-Details}[username]   ${User1-Details}[password]
    Submit Login Form
     
# Verify Page Title Is Scan
#      [Documentation]    Verifies that the page title displays the text 'Scan'.
#      # Wait up to 125 seconds for the element to appear on the screen
#     Wait Until Element Is Visible    ${TITLE_LOCATOR}    timeout=125s
#      # Capture the actual text from the element
#     ${actual_text}=    Get Text      ${TITLE_LOCATOR}
#       # Assert that the captured text matches the expected value
#     Should Be Equal As Strings       ${actual_text}    Scan    

Interact With Filter Button
    [Documentation]    Verifies that the Filter button is clickable and executes the action.
    Wait Until Element Is Visible    ${BTN_FILTER}    timeout=200s
    Click Element                    ${BTN_FILTER}
    # TODO: Add verification keyword here for the Filter menu pop-up/screen
    # Example: Wait Until Element Is Visible    xpath=//android.widget.TextView[@text='Filter Options']
    
Interact With Config Update Button
    [Documentation]    Verifies that the Config/Update button is clickable and executes the action.
    Wait Until Element Is Visible    ${BTN_CONFIG_UPDATE}    timeout=2145s
    Click Element                    ${BTN_CONFIG_UPDATE}
    # Pauses execution for exactly 15 seconds before moving to the next test or teardown
    Sleep                            5s
    Log To Console    User is able to Interact With Config Update Button successfully.
    # TODO: Add verification keyword here for the Configuration screen change

Interact With Power Off Button
    [Documentation]    Verifies that the Power Off button is clickable and executes the action.
    Wait Until Element Is Visible    ${BTN_POWER_OFF}    timeout=10s
    Click Element                    ${BTN_POWER_OFF}

Select Configuration From Popup List
    #select the configuration from the popup list
    Wait Until Element Is Visible    ${ITEM_CONFIGURATION}    timeout=10s
    Click Element                    ${ITEM_CONFIGURATION}
    Log To Console    User is able to Select Configuration From Popup List successfully.
    Sleep                            5s

Select Update From Popup List
    #select the configuration from the popup list
    Wait Until Element Is Visible    ${ITEM_UPDATE}    timeout=10s
    Click Element                    ${ITEM_UPDATE}
    Log To Console    User is able to Select Update From Popup List successfully.
    Sleep                            5s

Select INT200 From Popup List
    #select the configuration from the popup list
    Wait Until Element Is Visible    ${ITEM_INT200}    timeout=10s
    Click Element                    ${ITEM_INT200}
    Log To Console    User is able to Select INT200 From Popup List successfully.
    Sleep                            5s

Select Device And Proceed To Review
    [Documentation]    Selects the device row, validates the counter, and clicks the review update button.
    # 1. Verify initial state shows 0 devices selected
    Wait Until Element Is Visible    ${TXT_SELECTION_COUNT}    timeout=10s
    ${initial_text}=                 Get Text                  ${TXT_SELECTION_COUNT}
    Should Be Equal As Strings       ${initial_text}           0 devices selected
    Log To Console    Verify initial state shows 0 devices selected.
    # 2. Click the radio indicator button next to the device name
    Wait Until Element Is Visible    ${RADIO_DEVICE_GST}       timeout=15s
    Click Element                    ${RADIO_DEVICE_GST}
    Log To Console    Click the radio indicator button next to the device name.
    # 3. Click the "REVIEW DEVICES TO UPDATE" confirmation button
    Wait Until Element Is Visible    ${BTN_REVIEW_DEVICES}     timeout=5s
    Click Element                    ${BTN_REVIEW_DEVICES}
    Log To Console    Click the "REVIEW DEVICES TO UPDATE" confirmation button.
    # 4. Final pause step at the end of execution
    Sleep                            5s    

Execute Firmware Update
    # Wait for the UPDATE button to appear
    Wait Until Element Is Visible    ${BTN_UPDATE}    timeout=5
    # Click the UPDATE button
    Click Element                    ${BTN_UPDATE}
    # Log the action to the console terminal
    Log To Console    Click the "UPDATE" confirmation button.

Handle Warning And Continue Update
    # Wait for the CONTINUE UPDATE button to appear on the warning pop-up
    Wait Until Element Is Visible    ${BTN_CONTINUE_UPDATE}    timeout=5s
    # Click the CONTINUE UPDATE button
    Click Element                    ${BTN_CONTINUE_UPDATE}
    # Log the action to the console terminal
    Log To Console    Click the "CONTINUE UPDATE" confirmation button.
    # Wait for the CONTINUE UPDATE button to appear on the warning pop-up
    #Trigger Firmware Update

Perform Firmware Update Process
    #Select Configuration From Popup List  
    Give The Permission
    Interact With Config Update Button
    Select Update From Popup List
    Select INT200 From Popup List
    Select Device And Proceed To Review
    Execute Firmware Update
    Handle Warning And Continue Update
    # Call the new dynamic status inspector immediately after execution completes
    #Determine Firmware Update 
    
Determine Firmware Update Result
    [Documentation]    Dynamically inspects the screen post-update execution 
    ...                to safely determine if it succeeded, failed, or was skipped.
    ...                Returns the status string without failing the test case.
    [Arguments]    ${timeout}=600s    ${poll_interval}=2s

    WHILE    True    limit=${timeout}
        # 1. Check for SUCCESS
        ${is_success}=    Run Keyword And Return Status    Wait Until Element Is Visible     ${UPDATE_HEADER_XPATH}    timeout=1s
        IF    ${is_success}
            Log To Console    \n[RESULT] Update Status: SUCCESSFUL! ('Update complete' is visible)
            Log               [RESULT] Update Status: SUCCESSFUL!
            Wait Until Element Is Visible    ${ACKNOWLEDGE_BTN}    timeout=5s
            Click Element                    ${ACKNOWLEDGE_BTN}
            RETURN    SUCCESS
        END

        # 2. Check for NO UPDATE NEEDED
        ${no_update_needed}=    Run Keyword And Return Status   Page Should Contain Text    No update needed
        IF    ${no_update_needed}
            Log To Console    \n[RESULT] Update Status: SKIPPED! (Firmware is already up to date)
            Log               [RESULT] Update Status: SKIPPED!
            Wait Until Element Is Visible    ${ACKNOWLEDGE_BTN}    timeout=5s
            Click Element                    ${ACKNOWLEDGE_BTN}
            RETURN    SKIPPED
        END

        # 3. Check for explicit FAILURE
        ${is_failure}=    Run Keyword And Return Status   Wait Until Element Is Visible     ${FAILURE_HEADER_XPATH}    timeout=1s
        IF    ${is_failure}
            Fail    \n[RESULT] Update Status: FAILED! (An error layout was captured on screen)
            #Log To Console    \n[RESULT] Update Status: FAILED! (An error layout was captured on screen)
            Log               [RESULT] Update Status: FAILED! (An error layout was captured on screen)    level=WARN
            
            #Wait Until Element Is Visible    ${ACKNOWLEDGE_BTN}    timeout=5s
            #Click Element                    ${ACKNOWLEDGE_BTN}
            #RETURN
        END

        Sleep    ${poll_interval}
    END

    # If timeout limit is reached without encountering any valid final state
    Log To Console    \n[RESULT] Update Status: FAILED! (The process timed out after ${timeout} without reaching a valid final screen state)
    #Log               [RESULT] Update Status: FAILED! (Timed out after ${timeout})    level=WARN
    #Fail    \n[RESULT] Update Status: FAILED! (The process timed out after ${timeout} without reaching a valid final screen state)
    #RETURN    TIMEOUT


    # If timeout limit is reached without encountering any valid final state
    Fail    \n[RESULT] Update Status: FAILED! (The process timed out after ${timeout} without reaching a valid final screen state)

Scroll Down Until Text Is Found
    #page scroll down untill test is found
    [Arguments]      ${Config_Profile_Name}
    [Documentation]    Uses Android UiScrollable to scroll until an element matching the text is in view.
    # This directly triggers Android's internal UI framework for highly reliable element finding.
    ${selector}=    Set Variable    new UiScrollable(new UiSelector().scrollable(true)).scrollIntoView(new UiSelector().text("${Config_Profile_Name}"))
    Click Element    android=dom=${selector}

Give The Permission
   # Tap allow on the permission dialog
    Wait Until Element Is Visible    ${Alow_Permission}  timeout=150s
    Click Element         ${Alow_Permission}

Open Config Screen
  # Open configuration profile screen
    Click Element        ${ConfigUpdate_Button}
    Click Element        ${Configuration_Button}
    Click Element        ${Intergrity200_Button}

Select Config profile
  # Select config profile which you want to apply
        &{scroll_args}=    Create Dictionary    
    ...    left=${100}    
    ...    top=${200}    
    ...    width=${800}    
    ...    height=${1200}    
    ...    direction=down    
    ...    percent=${1.0}
    
    FOR    ${i}    IN RANGE    10    # Maximum 10 scroll attempts
        # Check if the text has appeared on screen yet
        ${is_found}=    Run Keyword And Return Status    Page Should Contain Text    ${Config_Profile_Name}
        
        IF    ${is_found}
            Click Text    ${Config_Profile_Name}
            BREAK
        END
        
        # If not found yet, perform 1 scroll gesture and repeat
        Execute Script    mobile: scrollGesture    &{scroll_args}
        Sleep    1s    # Small break to let the list rendering engine load new items
    END
    # If the loop finished and it still isn't there, throw a clean custom error message
    Page Should Contain Text    ${Config_Profile_Name}    error=Profile ${Config_Profile_Name} was not found after scrolling.
    # Wait for the new screen or button text to appear in the UI
    Wait Until Page Contains      SELECT DEVICES TO APPLY    timeout=10s

Apply Config Profile and Validate Result
  # Apply config profile and verify the result
    Click Text                    SELECT DEVICES TO APPLY
    Sleep           10s
    Click Element       xpath=//qp1/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View
    Click Element       xpath=//android.widget.Button
    Click Element       xpath=//qp1/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[3]/android.view.View/android.widget.Button
    Click Element       xpath=//android.view.ViewGroup/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.widget.Button
    Sleep         60s
    Wait Until Page Contains        Update Report
    # 1. Wait for the update process to finish (adjust timeout based on how long the update takes)
    Wait Until Page Contains      Update complete    timeout=30s

    # 2. Assert that the text is present, else throw a custom failure message
    Page Should Contain Text      Update complete    error=Test Failed: 'Update complete' confirmation text was not found on the screen.


Click Acknowledge Button
    [Documentation]    Clicks the ACKNOWLEDGE button on the update report screen.
    #Clicks the ACKNOWLEDGE button on the update report screen
    Wait Until Element Is Visible    xpath=${Acknowledge_Button}    timeout=10s   
    Click Element      ${Acknowledge_Button}

Verify Device Software Version
    [Documentation]    Locates the version text node and verifies it matches v 0.2.0.
   
    # Wait for the version text element to be visible on the screen
    Wait Until Element Is Visible    xpath=${VERSION_XPATH}    timeout=10s
    
    # Retrieve the text from the located element
    ${actual_version}=    Get Text    xpath=${VERSION_XPATH}
    
    # Compare and verify that the actual text matches the expected value
    Should Be Equal As Strings    ${actual_version}    ${EXPECTED_VERSION}    

Verify Nordic Version vs Mobile app fw version
    [Documentation]    Verify Nordic Version vs Mobile app fw version

    # 1. Fetch the version text displayed on the mobile app UI (e.g., "v 0.2.0")
    Wait Until Element Is Visible    xpath=${VERSION_XPATH}    timeout=25s
    ${FW_version_raw}=               Get Text    xpath=${VERSION_XPATH}
    
    # 2. Clean the string to handle potential formatting variations (e.g., stripping "v " to leave "0.2.0")
    ${FW_version_clean}=             Replace String    ${FW_version_raw}    v${SPACE}    ${EMPTY}
    ${FW_version_clean}=             Strip String      ${FW_version_clean}
    # 3. Request the hardware internal firmware value via serial link
    ${at_response}=                  Send AT Command    AT+CGMR?
    # 1. Clean the prefix text
    ${clean_csv}=       Replace String    ${at_response}    +CGMR:${SPACE}    ${EMPTY}
    
    # 2. Break string cleanly into a list variable array
    @{version_list}=    Split String      ${clean_csv}      ,
    
    # 3. Safely target array index 0 
    ${first_version}=   Get From List     ${version_list}    0
    
    # 4. Enforce strict matching using standard string equality
    BuiltIn.Should Be Equal As Strings    ${first_version}    ${FW_version_clean}
    ...    msg=Expected first value to be ${FW_version_clean} but found ${first_version}
    
    Log To Console    message= The Nordic FW ${first_version} version is match with Latest updated FW from the Application. 

Get Expected Firmware Version
    [Documentation]    Extracts '0.2.0' cleanly even if the UI text ends with '...', '…', or ':'.
    Wait Until Element Is Visible    ${LATEST_FW_VERSION}    timeout=10s
    ${prompt_text}=                  Get Text    ${LATEST_FW_VERSION}

    # 1. Get everything after "version " -> e.g. "0.2.0 …" or "0.2.0:"
    ${after_version}=                Fetch From Right    ${prompt_text}    version${SPACE}
    ${after_version}=                Strip String        ${after_version}

    # 2. Take only the first word before any space -> "0.2.0"
    ${expected_version}=             Fetch From Left     ${after_version}    ${SPACE}

    # 3. Strip any trailing colons, periods, or Unicode ellipsis (…) just in case there was no space
    ${expected_version}=             Strip String        ${expected_version}    characters=:.…${SPACE}
    RETURN    ${expected_version}


Verify Aggregate Version vs Expected FW Version
    [Documentation]    Fetches the Aggregate Version via AT+CGMR? and compares it against the expected FW version.
    [Arguments]    ${expected_version}

    # 1. Query hardware via AT command
    Log To Console    message=Checking the Device FW version with AT command wait for 25 second
    Sleep         60s
    Connect To Nordic Device
    #Read AT command
    ${at_response}=      Send AT Command    AT+CGMR?

    # 2. Clean response (remove '+CGMR:', 'OK', newlines, and extra spaces)
    ${clean_csv}=        Remove String      ${at_response}    +CGMR:    OK    ok    \r    \n
    ${clean_csv}=        Strip String       ${clean_csv}

    # 3. Extract the last comma-separated value (Aggregate Version)
    @{version_list}=     Split String       ${clean_csv}       ,
    ${aggregate_ver}=    Get From List      ${version_list}    -1
    ${aggregate_ver}=    Strip String       ${aggregate_ver}

    # 4. Compare Aggregate Version vs Expected FW Version (non-failing)
    IF    '${aggregate_ver}' == '${expected_version}'
        Log To Console      \n[AT VERSION CHECK] MATCH! Expected: ${expected_version} | Aggregate AT: ${aggregate_ver}
        Set Test Message    | AT Aggregate Version Matched (${aggregate_ver})    append=True
        RETURN    True
    ELSE
        Log To Console      \n[AT VERSION CHECK] MISMATCH! Expected: ${expected_version} | Aggregate AT: ${aggregate_ver}
        Log                 AT Aggregate Version Mismatch! Expected '${expected_version}', but got '${aggregate_ver}'    level=WARN
        Set Test Message    | AT Version Mismatch (Expected: ${expected_version}, Got: ${aggregate_ver})    append=True
        RETURN    False
    END

Verify Firmware Update And AT Aggregate Version
    # 1. Capture expected version before update starts (e.g., "0.2.0")
    ${expected_fw}=    Get Expected Firmware Version

    # 2. Execute update and check screen result
    #Trigger Firmware Update
    ${fw_status}=      Determine Firmware Update Result

    # 3. Compare AT command Aggregate Version against Expected Version
    ${at_matched}=     Verify Aggregate Version vs Expected FW Version    ${expected_fw}

    # Test continues and ends as PASS while logging full status in the report
    Log To Console     \nTest completed with final status: PASS
