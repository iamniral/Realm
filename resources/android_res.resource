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
${SETTINGS_BUTTON}           xpath=//android.widget.ImageView[@bounds='[28,201][154,327]']
#${SETTINGS_BUTTON}           xpath=//android.widget.ImageView[@content-desc="settings"]
${VERSION_ELEMENT}          xpath=//android.view.View[@bounds='[0,341][1080,2240]']/android.view.View[@index='3']
#${VERSION_ELEMENT}           xpath=/android.widget.TextView[@text="2.7.2 (1008)"]
${SUPPORT_API_ENDPOINT}      xpath=//android.view.View[@clickable='true'][.//android.widget.TextView[@text='Support API Endpoint']]
${TESTING_ENDPOINT}          xpath=//android.view.View[@clickable='true'][.//android.widget.TextView[@text='Testing']]



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
