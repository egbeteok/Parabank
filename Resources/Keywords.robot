# Import files

*** Settings ***

Library           SeleniumLibrary
Resource          Variables.robot
Library           FakerLibrary
Library           DateTime



*** Variables ***
${site_url}  https://parabank.parasoft.com/parabank/admin.htm
${browser}  Chrome

*** Keywords ***

Open Browser To Home Page
    [Documentation]    Opens the Chrome browser and navigates to the login page.
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window

Login With Valid Credentials
    [Documentation]    Enters valid username and password and clicks login.
    Input Text    name:username    ${USERNAME}
    Input Text    name:password    ${PASSWORD}
    Click Button    class:button

Verify Successful Login
    [Documentation]    Checks for the expected welcome message after login.
    Wait Until Page Contains    ${WELCOME_MESSAGE}
    Page Should Contain    ${WELCOME_MESSAGE}



Generate Unique User Data
    ${TIMESTAMP}=    Get Current Date    result_format=%Y%m%d%H%M%S
    ${UNIQUE_USERNAME}=    Set Variable    user_${TIMESTAMP}

    ${FIRST_NAME}=    FakerLibrary.First Name
    ${LAST_NAME}=     FakerLibrary.Last Name
    ${ADDRESS}=       FakerLibrary.Street Address
    ${CITY}=          FakerLibrary.City
    ${STATE}=         FakerLibrary.State Abbr
    ${ZIP_CODE}=      FakerLibrary.Postcode
    ${PHONE}=         FakerLibrary.Phone Number
    ${SSN}=           FakerLibrary.Ssn
    ${PASSWORD2}=     FakerLibrary.Password

    Set Test Variable    ${FIRST_NAME}
    Set Test Variable    ${LAST_NAME}
    Set Test Variable    ${ADDRESS}
    Set Test Variable    ${CITY}
    Set Test Variable    ${STATE}
    Set Test Variable    ${ZIP_CODE}
    Set Test Variable    ${PHONE}
    Set Test Variable    ${SSN}
    Set Test Variable    ${USERNAME}    ${UNIQUE_USERNAME}
    #Set Test Variable    ${PASSWORD2}
    #Set Test Variable    ${CONFIRM_FIELD}     ${PASSWORD2}

Fill Out All Sign Up Fields
    Input Text    ${FIRST_NAME_FIELD}     ${FIRST_NAME}
    Input Text    ${LAST_NAME_FIELD}      ${LAST_NAME}
    Input Text    ${ADDRESS_FIELD}        ${ADDRESS}
    Input Text    ${CITY_FIELD}           ${CITY}
    Input Text    ${STATE_FIELD}          ${STATE}
    Input Text    ${ZIP_CODE_FIELD}       ${ZIP_CODE}
    Input Text    ${PHONE_FIELD}          ${PHONE}
    Input Text    ${SSN_FIELD}            ${SSN}
    Input Text    ${USERNAME_FIELD}       ${USERNAME}
    #Input Text    ${PASSWORD_FIELD}       ${PASSWORD2}
    #Input Text    ${CONFIRM_FIELD}        ${PASSWORD2}
    Input Password    ${PASSWORD_FIELD}    ${PASSWORD}
    Input Password    ${CONFIRM_FIELD}    ${PASSWORD}

Click Register Link

    Wait Until Element Is Visible   ${Register}
    Click Link    ${Register}

Verify Account Creation Success
    Wait Until Page Contains    Your account was created successfully. You are now logged in.

Click Sign Up Button
    Wait Until Element Is Visible   ${SIGN_UP_BUTTON_LOCATOR}
    Click Button    ${SIGN_UP_BUTTON_LOCATOR}

