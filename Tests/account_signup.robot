*** Settings ***
Library           SeleniumLibrary

Resource  ../Resources/Variables.robot
Resource  ../Resources/Keywords.robot

Test Setup        Open Browser To Home Page
Test Teardown     Close Browser


*** Test Cases ***

Successful Account Sign Up With Unique Data
    [Documentation]    Tests account creation using newly generated unique data.
    Click Register Link
    Generate Unique User Data
    Fill Out All Sign Up Fields
    Click Sign Up Button
    Verify Account Creation Success