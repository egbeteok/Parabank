*** Settings ***
Library           SeleniumLibrary
Variables   ../Resources/Variables.yaml
Resource    ../Resources/Keywords.robot
Suite Setup             Run Keywords
...                     Open Browser To Home Page  AND
...                     Generate Unique User Data
Suite Teardown          Close Browser


*** Test Cases ***
Successful Account Sign Up With Unique Data
    [Documentation]    Tests account creation using newly generated unique data.
    Click Register Link
    Fill Out All Sign Up Fields
    Click Sign Up Button
    Verify Account Creation Success


Verify that user can login successfuly to a customer account
    [Documentation]    Test a successful login with valid credentials.
    Logout of User Account
    Login With Valid Credentials
    Verify Successful Login

