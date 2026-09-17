*** Settings ***
Library           AppiumLibrary

*** Variables ***
${SETTINGS_BUTTON}           xpath=//android.widget.ImageView[@bounds='[28,201][154,327]']
${VERSION_ELEMENT}           xpath=//android.view.View[@bounds='[0,341][1080,2240]']/android.view.View[@index='3']
${SUPPORT_API_ENDPOINT}      xpath=//android.view.View[@clickable='true'][.//android.widget.TextView[@text='Support API Endpoint']]
${TESTING_ENDPOINT}          xpath=//android.view.View[@clickable='true'][.//android.widget.TextView[@text='Testing']]

*** Keywords ***
Open Settings Screen
    Wait Until Element Is Visible    ${SETTINGS_BUTTON}    timeout=10s
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
