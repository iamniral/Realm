*** Settings ***
Library           AppiumLibrary

*** Variables ***

#*** Test Variable ***
&{User1-Details}        username=globalstarapps       password=spot1234

# Login Page Elements
${USERNAME_FIELD}    xpath=(//android.widget.EditText)[1]
${PASSWORD_FIELD}    xpath=(//android.widget.EditText)[2]
${LOGIN_BUTTON}      xpath=//android.widget.Button[ancestor::android.view.View[./android.widget.TextView[@text='LOGIN']]]
# Settings Page Elements
#${SETTINGS_BUTTON}           xpath=//android.widget.ImageView[@bounds='[28,201][154,327]']
${SETTINGS_BUTTON}           xpath=//android.widget.ImageView[@content-desc="settings"]
#${VERSION_ELEMENT}          xpath=//android.view.View[@bounds='[0,341][1080,2240]']/android.view.View[@index='3']
#${VERSION_ELEMENT}           xpath=/android.widget.TextView[@text="2.7.2 (1008)"]
${VERSION_ELEMENT}           xpath=//qp1/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View[2]
${SUPPORT_API_ENDPOINT}      xpath=//android.view.View[@clickable='true'][.//android.widget.TextView[@text='Support API Endpoint']]
${TESTING_ENDPOINT}          xpath=//android.view.View[@clickable='true'][.//android.widget.TextView[@text='Testing']]
#Configuration Page Elements
${ConfigUpdate_Button}       xpath=//qp1/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.view.View[2]
${Configuration_Button}      xpath=//android.widget.TextView[@text="Configuration"]
${Intergrity200_Button}      xpath=//android.widget.TextView[@text="INTEGRITY 200"]
${Config_Profile_Name}       Std_USB_D_12_A_34
${Alow_Permission}           xpath=//android.widget.Button[@resource-id="com.android.permissioncontroller:id/permission_allow_button"]

*** Keywords ***
# Login Page Keywords
Enter Credentials
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    ${USERNAME_FIELD}    timeout=20s
    Click Element                    ${USERNAME_FIELD}
    Input Text                       ${USERNAME_FIELD}    ${username}
        
    Wait Until Element Is Visible    ${PASSWORD_FIELD}    timeout=15s
    Click Element                    ${PASSWORD_FIELD}
    Input Text                       ${PASSWORD_FIELD}    ${password}

Submit Login Form
    Hide Keyboard
    Wait Until Element Is Visible    ${LOGIN_BUTTON}      timeout=5s
    Tap                              ${LOGIN_BUTTON}


# Settings Page Keywords
Open Settings Screen
    Wait Until Element Is Visible    ${SETTINGS_BUTTON}    timeout=15s
    Click Element                    ${SETTINGS_BUTTON}

Unlock Developer Options By Tapping Version
    [Arguments]    ${tap_count}=10
    Wait Until Element Is Visible    ${VERSION_ELEMENT}    timeout=5s
    FOR    ${counter}    IN RANGE    ${tap_count}
        Click Element    ${VERSION_ELEMENT}
    END

Navigate And Select Testing Endpoint
    # Swipe up to reveal the hidden endpoint settings
    Swipe By Percent    50    80    50    30    1000
    Wait Until Element Is Visible    ${SUPPORT_API_ENDPOINT}    timeout=5s
    Click Element                    ${SUPPORT_API_ENDPOINT}
    
    Wait Until Element Is Visible    ${TESTING_ENDPOINT}        timeout=5s
    Click Element                    ${TESTING_ENDPOINT}

Scroll Down Until Text Is Found
    #page scroll down untill test is found
    [Arguments]      ${Config_Profile_Name}
    [Documentation]    Uses Android UiScrollable to scroll until an element matching the text is in view.
    # This directly triggers Android's internal UI framework for highly reliable element finding.
    ${selector}=    Set Variable    new UiScrollable(new UiSelector().scrollable(true)).scrollIntoView(new UiSelector().text("${Config_Profile_Name}"))
    Click Element    android=dom=${selector}

Give The Permission
   # Tap allow on the permission dialog
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