*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/login_keywords.resource
Suite Setup    Open Browser    browser=chrome
Variables    ../variables/variables.py

*** Variables ***
${URL}    https://www.saucedemo.com/

*** Test Cases ***
Successful login
    I navigate to the login page    ${URL}
    Input correct credentials 
    I click on the login button
    I see the home page
Unsuccessful login - No credentials
    I navigate to the login page    ${URL}
    No input credentials
    I click on the login button
    I see the expect error message    ${ERROR_MESSAGE["nocredentials"]}

Unsuccessful login - No username
    I navigate to the login page    ${URL}
    Input only password    
    I click on the login button
    I see the expect error message    ${ERROR_MESSAGE["nousername"]}

Unsuccessful login - No password
    I navigate to the login page    ${URL}
    Input only username   
    I click on the login button
    I see the expect error message    ${ERROR_MESSAGE["nopassword"]}

Unsuccessful login - Wrong credentials
    I navigate to the login page    ${URL}
    Input incorrect credentials
    I click on the login button
    I see the expect error message    ${ERROR_MESSAGE["wrongcredentials"]}
