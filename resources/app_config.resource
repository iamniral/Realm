*** Settings ***
Library           AppiumLibrary

*** Variables ***
${REMOTE_URL}     http://127.0.0.1:4723
${PLATFORM}       Android
#${DEVICE_NAME}    4B181VDAQ0001S
${DEVICE_NAME}     RZCX927AG1F
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
    ...                 dontStopAppOnReset=true        # Prevents Appium from closing the process on state shifts
    ...                 newCommandTimeout=800    # Keeps the session alive for 5 minutes of idling

Stop Realm Application
    Close Application
