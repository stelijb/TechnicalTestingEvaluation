*** Settings ***
Resource    ../general.robot
Test Teardown    Close Browser
Force Tags      homepage

*** Test Cases ***
Access the automationpractice homepage and check that all the important elements are shown correctly
    Open Browser To Homepage
    Homepage Was Displayed
    Contact Us And Sign in links are displayed
    Search Input Is Displayed
    Top Menu Is Displayed
    Products Are Displayed
    Footer is displayed and the link to “Terms and conditions” appears

*** Keywords ***
Homepage Was Displayed
    Element Should Be Visible   id:page

Contact Us And Sign in links are displayed
    Element Should Be Visible   id:contact-link
    Element Should Be Visible   class:login

Search Input Is Displayed
    Element Should Be Visible   id:searchbox

Top Menu Is Displayed
    Element Should Be Visible   id:block_top_menu

Products Are Displayed
    ${count} =	Get Element Count	class:product-container
    Should Be True	${count} > 0

Footer is displayed and the link to “Terms and conditions” appears
    Element Should Be Visible   id:footer
    Element Should Be Visible   xpath: //a[contains(text(), "Terms and conditions of use")]
