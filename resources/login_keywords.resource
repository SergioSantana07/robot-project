*** Settings ***
Library    SeleniumLibrary
Variables    ../variables/variables.py

*** Keywords ***
I navigate to the login page
    [Arguments]    ${URL}
    Go To    ${URL}

Input correct credentials
    Wait Until Element Is Visible    id=user-name
    Input Text    id=user-name    ${LOGIN_DATA["correctdata"]["username"]}
    Input Text    id=password    ${LOGIN_DATA["correctdata"]["password"]}

Input incorrect credentials
    Wait Until Element Is Visible    id=user-name
    Input Text    id=user-name    ${LOGIN_DATA["incorrectdata"]["username"]}
    Input Text    id=password    ${LOGIN_DATA["incorrectdata"]["password"]}

I click on the login button
    Click Button    id=login-button

I see the home page
    ${location}    Get Location 
    Should Be Equal    ${location}    https://www.saucedemo.com/inventory.html

I see the expect error message
    [Arguments]    ${ERROR_MESSAGE}
    Wait Until Element Contains    class=error-message-container    ${ERROR_MESSAGE}

Input only username
    Wait Until Element Is Visible    id=user-name
    Input Text    id=user-name     ${LOGIN_DATA["correctdata"]["username"]}

Input only password
    Wait Until Element Is Visible    id=user-name
    Input Text    id=password    ${LOGIN_DATA["correctdata"]["password"]}

No input credentials
    Wait Until Element Is Visible    id=user-name