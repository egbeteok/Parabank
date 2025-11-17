*** Settings ***

Library           SeleniumLibrary
Variables         Variables.yaml
Library           FakerLibrary
Library           DateTime




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
    Element Text Should Be    ${ACCOUNT_NAME_ASSERTION}    Welcome ${FIRST_NAME} ${LAST_NAME}
    
Open Login Page
    Go To    ${LOGIN_URL} 



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
    ${PASSWORD}=     FakerLibrary.Password

    Set Suite Variable    ${FIRST_NAME}
    Set Suite Variable    ${LAST_NAME}
    Set Suite Variable    ${ADDRESS}
    Set Suite Variable    ${CITY}
    Set Suite Variable    ${STATE}
    Set Suite Variable    ${ZIP_CODE}
    Set Suite Variable    ${PHONE}
    Set Suite Variable    ${SSN}
    Set Suite Variable    ${PASSWORD}
    Set Suite Variable    ${USERNAME}    ${UNIQUE_USERNAME}


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
    Input Password    ${PASSWORD_FIELD}    ${PASSWORD}
    Input Password    ${CONFIRM_FIELD}    ${PASSWORD}

Click Register Link

    Wait Until Element Is Visible   ${Register}
    Click Link    ${Register}

Verify Account Creation Success
    [Documentation]    Checks for the expected welcome message after sign up.
    Wait Until Page Contains    Your account was created successfully. You are now logged in.
    Element Text Should Be    ${SIGN_UP_ASSERTION}    Welcome ${USERNAME}

Click Sign Up Button
    Wait Until Element Is Visible   ${SIGN_UP_BUTTON_LOCATOR}
    Click Button    ${SIGN_UP_BUTTON_LOCATOR}
    
    
Logout of User Account
    Click Link    ${SIGN_OUT}
    Wait Until Page Contains    ${lOGIN_header}




