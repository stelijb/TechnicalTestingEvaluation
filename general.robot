*** Settings ***
Documentation     A resource file with reusable keywords and variables.
Library           SeleniumLibrary

*** Variables ***
${PROTOCOL}       http
${HOSTNAME}       automationpractice.com
${PATH}           index.php
${HOMEPAGE}       ${PROTOCOL}://${HOSTNAME}/${PATH}
${BROWSER}        Chrome
${DELAY}          0

*** Keywords ***
Open Browser To Homepage
    Open Browser    ${HOMEPAGE}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Title Should Be    My Store
