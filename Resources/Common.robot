*** Settings ***

Library  SeleniumLibrary
Resource  ../Locators/Locators.py
Resource  ../TestData/TestData.py

*** Variables ***
${site_url}  https://parabank.parasoft.com/parabank/admin.htm
${browser}  Chrome


*** Keywords ***
Opening Browser
    [Arguments]     ${site_url}     ${browser}
    Open Browser    ${site_url}     ${browser}
    Wait Until Element Is Visible   ${LoginUsernameInputBox}


