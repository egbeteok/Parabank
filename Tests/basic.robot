*** Settings ***

Library  SeleniumLibrary

*** Settings ***
# Imports the SeleniumLibrary keywords for browser interaction
Library           SeleniumLibrary

Test Setup        Open Browser To Login Page
Test Teardown     Close Browser

#Resource        ../Resources/PageObject/KeywordDefinitionFiles/Keywords.robot


*** Variables ***
${LOGIN_URL}      https://parabank.parasoft.com/parabank/admin.htm
${BROWSER}        Chrome
${USERNAME}       johndoe
${PASSWORD}       Password123
${WELCOME_MESSAGE}    Accounts Overview




*** Keywords ***

Open Browser To Login Page
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



*** Test Cases ***

Verify that user can login successfuly to a customer account
    [Documentation]    Test a successful login with valid credentials.
    Login With Valid Credentials
    Verify Successful Login








