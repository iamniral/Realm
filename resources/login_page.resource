*** Settings ***
Library           AppiumLibrary

*** Variables ***
${USERNAME_FIELD}    xpath=(//android.widget.EditText)[1]
${PASSWORD_FIELD}    xpath=(//android.widget.EditText)[2]
${LOGIN_BUTTON}      xpath=//android.widget.Button[ancestor::android.view.View[./android.widget.TextView[@text='LOGIN']]]

*** Keywords ***
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
