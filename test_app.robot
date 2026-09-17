*** Settings ***
Library           AppiumLibrary

*** Variables ***
${REMOTE_URL}     http://127.0.0.1:4723
${PLATFORM}       Android
${DEVICE_NAME}    4B181VDAQ0001S
${APP_PACKAGE}    com.globalstar.realm
${APP_ACTIVITY}   com.globalstar.iot.system.MainActivity
${Settings}       xpath=//android.widget.ImageView[@bounds='[28,201][154,327]']
${version}        xpath=//android.view.View[@bounds='[0,341][1080,2240]']/android.view.View[@index='3']
${Support_API_Endpoint}      xpath=//android.view.View[@clickable='true'][.//android.widget.TextView[@text='Support API Endpoint']]
${Testing}        xpath=//android.view.View[@clickable='true'][.//android.widget.TextView[@text='Testing']]
${Username}       xpath=(//android.widget.EditText)[1]
${Password}       xpath=(//android.widget.EditText)[2]
${Login_Button}   xpath=//android.widget.Button[ancestor::android.view.View[./android.widget.TextView[@text='LOGIN']]]





*** Test Cases ***
Launch and Test Realm App
    Open Application    ${REMOTE_URL}    
    ...                 platformName=${PLATFORM}    
    ...                 deviceName=${DEVICE_NAME}    
    ...                 appPackage=${APP_PACKAGE}    
    ...                 appActivity=${APP_ACTIVITY}    
    ...                 automationName=UiAutomator2


    #Tap on the settings button
   Wait Until Element Is Visible   ${Settings}    timeout=10
    Click Element    ${Settings}

   # Tap on the version button seven times
   Wait Until Element Is Visible   ${version}  timeout=2
   Click Element   ${version}  
   
   Click Element   ${version}
   
   Click Element   ${version}
    
   Click Element   ${version}

   Click Element   ${version}

   Click Element   ${version}
  
   Click Element   ${version}
   
   Click Element   ${version}
   
   Click Element   ${version}
   
   Click Element   ${version}

  # Define the specific XPath locator as a variable


 # Wait Until Element Is Visible  xpath=//android.view.View[@clickable='true'][.//android.widget.TextView[@text='OPEN USER GUIDE']]
 # Click Element   xpath=//android.view.View[@clickable='true'][.//android.widget.TextView[@text='OPEN USER GUIDE']]

   Swipe By Percent    50    80    50    30    1000
   Wait Until Element Is Visible   ${Support_API_Endpoint}
   #click and open the Endpoint
   Click Element   ${Support_API_Endpoint}
  # select the Testing Endpoint
   Wait Until Element Is Visible   ${Testing}
   Click Element   ${Testing}  

    # Fixed the backtick typo in the IDs below:
   Wait Until Element Is Visible    ${Username}    timeout=20
   Click Element    ${Username}
   Input Text       ${Username}    globalstarapps
        
   Wait Until Element Is Visible    ${Password}    timeout=15
   Click Element    ${Password}
   Input Text       ${Password}     spot1234   

  # Wait Until Element Is Visible    xpath=(//android.widget.Button)    timeout=15
   Hide keyboard
  Tap   ${Login_Button}

    #Tap   xpath=(android.view.View)[1]
    
    #Click Element                      
    #Close Application
