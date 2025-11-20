# Import files

*** Settings ***

Library           SeleniumLibrary
Resource          Variables.robot
Library           FakerLibrary
Library           DateTime
Library           ../Libraries/ParabankLogin.py





*** Keywords ***

Open Browser To Home Page
    [Documentation]    Opens the Chrome browser and navigates to the login page.
    # REFACTORED: Delegates to Python library
    Navigate To Home Page    ${LOGIN_URL}    ${BROWSER}

Login With Valid Credentials
    [Documentation]    Enters valid username and password and clicks login.
    # REFACTORED: Delegates to Python library
    Perform Login    ${USERNAME}    ${PASSWORD}

Verify Successful Login
    [Documentation]    Checks for the expected welcome message after login.
    # REFACTORED: Delegates to Python library
    Verify User Logged In    ${FIRST_NAME}    ${LAST_NAME}

Open Login Page
    Go To    ${LOGIN_URL}

Generate Unique User Data
    # REMAINS UNCHANGED: Test data generation should stay in Robot,
    # as it uses specialized Robot libraries like FakerLibrary.
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
    # REFACTORED: Delegates to Python library
    Log Out From Account
    Wait Until Page Contains    ${lOGIN_header}