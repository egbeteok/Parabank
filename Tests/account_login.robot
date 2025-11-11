*** Settings ***
Library           SeleniumLibrary

Resource  ../Resources/Variables.robot
Resource  ../Resources/Keywords.robot

Test Setup        Open Browser To Home Page
Test Teardown     Close Browser


*** Test Cases ***

Verify that user can login successfuly to a customer account
    [Documentation]    Test a successful login with valid credentials.
    Login With Valid Credentials
    Verify Successful Login


