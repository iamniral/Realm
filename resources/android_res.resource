*** Settings ***
Library           AppiumLibrary

*** Variables ***

#*** Test Variable ***
&{User1-Details}        username=globalstarapps       password=spot1234

# Login Page Elements
${USERNAME_FIELD}            xpath=(//android.widget.EditText)[1]
${PASSWORD_FIELD}            xpath=(//android.widget.EditText)[2]
${LOGIN_BUTTON}              xpath=//android.widget.Button[ancestor::android.view.View[./android.widget.TextView[@text='LOGIN']]]
# Settings Page Elements
${SETTINGS_BUTTON}           xpath=//android.widget.ImageView[@bounds='[28,201][154,327]']
#${SETTINGS_BUTTON}           xpath=//android.widget.ImageView[@content-desc="settings"]
${VERSION_ELEMENT}           xpath=//android.view.View[@bounds='[0,341][1080,2240]']/android.view.View[@index='3']
#${VERSION_ELEMENT}           xpath=/android.widget.TextView[@text="2.7.2 (1008)"]
${SUPPORT_API_ENDPOINT}      xpath=//android.view.View[@clickable='true'][.//android.widget.TextView[@text='Support API Endpoint']]
${TESTING_ENDPOINT}          xpath=//android.view.View[@clickable='true'][.//android.widget.TextView[@text='Testing']]

#scan scren
${TITLE_LOCATOR}             xpath=//android.view.View[./android.widget.TextView[@text='Scan']]
#config button
${CONFIG_UPDATE_BUTTON}      xpath=//android.view.View[@clickable='true' and .//android.widget.TextView[@text='Config/Update']]

# Highly specific button locators based on the screen layout
${BTN_FILTER}                xpath=//android.view.View[@clickable='true' and .//android.widget.TextView[@text='Filter']]
${BTN_CONFIG_UPDATE}         xpath=//android.view.View[@clickable='true' and .//android.widget.TextView[@text='Config/Update']]
${BTN_POWER_OFF}             xpath=//android.view.View[@clickable='true' and .//android.widget.TextView[@text='Power Off']]

# configuration field from the list
${ITEM_CONFIGURATION}        xpath=//android.view.View[./android.widget.TextView[@text='CONFIG/UPDATE']]/android.widget.TextView[@text='Configuration']
# Update field from the list
${ITEM_UPDATE}               xpath=//android.view.View[./android.widget.TextView[@text='CONFIG/UPDATE']]/android.widget.TextView[@text='Update']

# Locator for the update list Int200 
${ITEM_INT200}               xpath=//android.view.View[./android.widget.TextView[@text='UPDATE']]/android.widget.TextView[@text='INTEGRITY 200']

${RADIO_DEVICE_GST}          xpath=//android.view.View[.//android.widget.TextView[@text='gst-010005949515']]/android.view.View[@content-desc='selector_indicator']
#${RADIO_DEVICE_GST}      xpath=//android.view.View[.//android.widget.TextView[@text='gst-010010695392']]/android.view.View[@content-desc='selector_indicator']
${TXT_SELECTION_COUNT}       xpath=//android.widget.TextView[contains(@text, 'devices selected')]
${BTN_REVIEW_DEVICES}        xpath=//android.view.View[@clickable='true' and .//android.widget.TextView[@text='REVIEW DEVICES TO UPDATE']]
${BTN_UPDATE}                xpath=//android.view.View[@clickable="true"]//android.widget.TextView[@text="UPDATE"]
${BTN_CONTINUE_UPDATE}       xpath=//android.view.ViewGroup//android.view.View[@index="2"]/android.widget.TextView
${PAGE_TITLE}                xpath=//android.view.View/android.view.View/android.widget.TextView[@index="0" and parent::android.view.View]
${PROGRESS_BAR}              xpath=//android.widget.ProgressBar or //android.widget.TextView[contains(@text, "Updating application")]
${UPDATE_HEADER_XPATH}       xpath=//android.widget.TextView[contains(@text, "Update complete")]
${ACKNOWLEDGE_BTN}           xpath=//android.widget.TextView[@text="ACKNOWLEDGE"]/following-sibling::android.widget.Button
#${DEVICE_ID}      //android.widget.TextView[contains(@text, 'gst-010005949515')]
${STATUS_XPATH}    //android.widget.TextView[@text='No update needed']
#${STATUS_XPATH}              xpath=//android.widget.TextView[contains(@text='No update needed')]
*** Keywords ***
# Login Page Keywords
Enter Credentials
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    ${USERNAME_FIELD}    timeout=20s
    Click Element                    ${USERNAME_FIELD}
    Input Text                       ${USERNAME_FIELD}    ${username}
    Log To Console    The value of the username variable is: ${USERNAME_FIELD}    
    Wait Until Element Is Visible    ${PASSWORD_FIELD}    timeout=15s
    Click Element                    ${PASSWORD_FIELD}
    Input Text                       ${PASSWORD_FIELD}    ${password}
    Log To Console    The value of the password variable is: ${PASSWORD_FIELD}
Submit Login Form
    Hide Keyboard
    Wait Until Element Is Visible    ${LOGIN_BUTTON}      timeout=5s
    Tap                              ${LOGIN_BUTTON}
    Log To Console    Hello, Varibales entered successfully.
    Log To Console    Hello, user is able to click on the login successfully.

# Settings Page Keywords
Open Settings Screen
    Wait Until Element Is Visible    ${SETTINGS_BUTTON}    timeout=25s
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
Verify Page Title Is Scan
     [Documentation]    Verifies that the page title displays the text 'Scan'.
     # Wait up to 125 seconds for the element to appear on the screen
    Wait Until Element Is Visible    ${TITLE_LOCATOR}    timeout=125s
     # Capture the actual text from the element
    ${actual_text}=    Get Text      ${TITLE_LOCATOR}
      # Assert that the captured text matches the expected value
    Should Be Equal As Strings       ${actual_text}    Scan    

Interact With Filter Button
    [Documentation]    Verifies that the Filter button is clickable and executes the action.
    Wait Until Element Is Visible    ${BTN_FILTER}    timeout=200s
    Click Element                    ${BTN_FILTER}
    # TODO: Add verification keyword here for the Filter menu pop-up/screen
    # Example: Wait Until Element Is Visible    xpath=//android.widget.TextView[@text='Filter Options']
    
Interact With Config Update Button
    [Documentation]    Verifies that the Config/Update button is clickable and executes the action.
    Wait Until Element Is Visible    ${BTN_CONFIG_UPDATE}    timeout=245s
    Click Element                    ${BTN_CONFIG_UPDATE}
      # Pauses execution for exactly 15 seconds before moving to the next test or teardown
    Sleep                            15s
    Log To Console    User is able to Interact With Config Update Button successfully.
    # TODO: Add verification keyword here for the Configuration screen change

Interact With Power Off Button
    [Documentation]    Verifies that the Power Off button is clickable and executes the action.
    Wait Until Element Is Visible    ${BTN_POWER_OFF}    timeout=10s
    Click Element                    ${BTN_POWER_OFF}
    # TODO: Add verification keyword here (e.g., verifying a confirmation dialog appears)

Select Configuration From Popup List
    #select the configuration from the popup list
    Wait Until Element Is Visible    ${ITEM_CONFIGURATION}    timeout=10s
    Click Element                    ${ITEM_CONFIGURATION}
    Log To Console    User is able to Select Configuration From Popup List successfully.
    Sleep                            10s
Select Update From Popup List
    #select the configuration from the popup list
    Wait Until Element Is Visible    ${ITEM_UPDATE}    timeout=10s
    Click Element                    ${ITEM_UPDATE}
    Log To Console    User is able to Select Update From Popup List successfully.
    Sleep                            15s
Select INT200 From Popup List
    #select the configuration from the popup list
    Wait Until Element Is Visible    ${ITEM_INT200}    timeout=10s
    Click Element                    ${ITEM_INT200}
    Log To Console    User is able to Select INT200 From Popup List successfully.
    Sleep                            15s
   
#Select Specific Device From List
   # [Documentation]    Locates and clicks the radio selector against the device.
  #  Wait Until Element Is Visible    ${RADIO_DEVICE_GST}    timeout=10s
  #  Click Element                    ${RADIO_DEVICE_GST}
  #  Sleep                            15s
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

    # 3. Assert that the validation counter updates to 1 device selected
    # Wait Until Element Is Visible    xpath=//android.widget.TextView[@text='1 devices selected']    timeout=5s
    # ${updated_text}=                 Get Text                  ${TXT_SELECTION_COUNT}
    # Should Be Equal As Strings       ${updated_text}           1 devices selected
    # Log To Console    Assert that the validation counter updates to 1 device selected.
    # 4. Click the "REVIEW DEVICES TO UPDATE" confirmation button
    Wait Until Element Is Visible    ${BTN_REVIEW_DEVICES}     timeout=5s
    Click Element                    ${BTN_REVIEW_DEVICES}
    Log To Console    Click the "REVIEW DEVICES TO UPDATE" confirmation button.
    # 5. Final pause step at the end of execution
    Sleep                            5s    
Execute Firmware Update
    # Wait for the UPDATE button to appear
    Wait Until Element Is Visible    ${BTN_UPDATE}    timeout=5s
    
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

Verify System Update Status
    [Documentation]    Validates that the update is successful when 'Update complete' appears.
    
    # 1. Wait for the success indicator element to load on screen (up to 15 seconds)
    Wait Until Element Is Visible    xpath=${UPDATE_HEADER_XPATH}    timeout=15s
    
    # 2. Log confirmation message directly to your logs & terminal output
    Log To Console    \n[SUCCESS] The text 'Update complete' is visible. update status: SUCCESSFUL!
    Log               The update completed successfully.    level=INFO
    
    # Optional Step: Complete the interaction by dismissing the screen
    Wait Until Element Is Visible    xpath=${ACKNOWLEDGE_BTN}    timeout=5s
    Click Element                    xpath=${ACKNOWLEDGE_BTN}
#Verify Status Text Visibility
    # Wait for the element to exist in the DOM structure
   # Wait Until Page Contains Element    xpath=${STATUS_XPATH}    timeout=15s
    
    # Retrieve the text attribute from the element
   # ${actual_text}=    Get Text    xpath=${STATUS_XPATH}
    
    # Assert that the extracted string matches what you expect
   # Should Be Equal As Strings    ${actual_text}    No update needed
  #  Log    Success: Verified Current Firmware version is up to date, No update needed.
Verify Firmware Update Status
    # Scans the active screen dump for the string literal directly
    Wait Until Page Contains    No update needed    timeout=10s
    Page Should Contain Text    No update needed
    Log To Console   Success: The Firmware is already up to date "No update needed."  