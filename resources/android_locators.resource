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
#${SETTINGS_BUTTON}           xpath=//android.widget.ImageView[@bounds='[28,201][154,327]']
${SETTINGS_BUTTON}           xpath=//android.widget.ImageView[@content-desc="settings"]
#${VERSION_ELEMENT}           xpath=//android.view.View[@bounds='[0,341][1080,2240]']/android.view.View[@index='3']
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

${RADIO_DEVICE_GST}          xpath=//android.view.View[.//android.widget.TextView[@text='gst-010010696390']]/android.view.View[@content-desc='selector_indicator']
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