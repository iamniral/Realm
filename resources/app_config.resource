*** Settings ***
Library           AppiumLibrary

*** Variables ***
${REMOTE_URL}     http://127.0.0.1:4723
${PLATFORM}       Android
${DEVICE_NAME}    4B181VDAQ0001S
${APP_PACKAGE}    com.globalstar.realm
${APP_ACTIVITY}   com.globalstar.iot.system.MainActivity

*** Keywords ***
Start Realm Application
    Open Application    ${REMOTE_URL}    
    ...                 platformName=${PLATFORM}    
    ...                 deviceName=${DEVICE_NAME}    
    ...                 appPackage=${APP_PACKAGE}    
    ...                 appActivity=${APP_ACTIVITY}    
    ...                 automationName=UiAutomator2

Stop Realm Application
    Close Application
