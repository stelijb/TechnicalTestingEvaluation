*** Settings ***
Resource    ../general.robot
Test Teardown    Close Browser
Force Tags      register
Library     String

*** Test Cases ***
Access the automationpractice homepage and use the register form to create a new account
    Open Browser To Homepage
    Homepage Was Displayed
    Click The Top Right Link With Text "Sign In"
    Page Redirects To Authentication Page And The Button With Text "Create an account" appears
    Introduce A Valid Email In The “Create an account” Section Input And Click The Button With Text "Create an account"
    Complete All The Required Form Data And Click The Submit Button With Text "Register"
    Page Redirects To My Account page

*** Keywords ***
Homepage Was Displayed
    Element Should Be Visible   id:page

Click The Top Right Link With Text "Sign In"
    Click Element   class:login

Page Redirects To Authentication Page And The Button With Text "Create an account" appears
    Wait Until Element Is Visible   id:authentication
    Element Should Be Visible    id:SubmitCreate

Introduce A Valid Email In The “Create an account” Section Input And Click The Button With Text "Create an account"
    ${firstname}=  generate random string  3  [LOWER]
    Input Text    id:email_create    ${firstname}@${firstname}.com
    Click Element   id:SubmitCreate
    Wait Until Element Is Visible   id:account-creation_form

Complete All The Required Form Data And Click The Submit Button With Text "Register"
    ${firstname}=  generate random string  9  [LOWER]
    ${lastname}=  generate random string  10  [LOWER]
    ${password}=  generate random string  5  [NUMBERS]
    ${postcode}=  generate random string  5  [NUMBERS]
    ${address}=  generate random string  10  [LOWER]
    ${phone}=  generate random string  9  [NUMBERS]
    Click Element   id:id_gender1
    Input Text  id:customer_firstname   ${firstname}
    Input Text  id:customer_lastname   ${lastname}
    Input Text  id:passwd   ${password}
    Input Text  id:passwd   ${password}
    Select From List by Value    xpath=//select[@id="days"]    1
    Select From List by Value    xpath=//select[@id="months"]    1
    Select From List by Value    xpath=//select[@id="years"]    1990
    Input Text  id:address1   ${address}
    Input Text  id:city   Chicago
    Select From List by Value    xpath=//select[@id="id_state"]    1
    Input Text  id:postcode   ${postcode}
    Input Text  id:phone_mobile   ${phone}
    Click Element   id:submitAccount

Page Redirects To My Account page
    Wait Until Element Is Visible   id:my-account