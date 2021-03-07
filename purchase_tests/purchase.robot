*** Settings ***
Resource    ../general.robot
Test Teardown    Close Browser
Force Tags      purchase
Library     String

*** Test Cases ***
Access the automationpractice homepage and complete a full purchase flow
    Open Browser To Homepage
    Homepage Was Displayed
    Click The Add To Cart Button Of Any Product
    Cart Modal Appears With The Item Added
    Click The "Proceed to checkout" Link
    Page Redirects To "Shopping-cart summary"
    Click The "Proceed to checkout" Link 2
    Introduce A Valid Email And Password In The Right Form And Click The “Sign in” Button
    Login Has Been Successfully And Page Redirects To “Address” Step Page
    Click The "Proceed to checkout" Address Button
    Page Redirects To "Shipping" Step Page
    Click The Checkbox To Accept The Terms Of Service
    Click The "Proceed to checkout" Carrier Button
    Page Redirects To "Payment" Step Page
    Click The “Pay by bank wire” Option
    Page Redirects To Bank Wire Page
    Click The "I confirm my order button" Button
    The Order Information Appears And The Order Has Been Made

*** Keywords ***
Homepage Was Displayed
    Element Should Be Visible   id:page

Click The Add To Cart Button Of Any Product
    Mouse Over     xpath=//div[@class="product-image-container"][1]
    Click Element   xpath=//a[@data-id-product=1]

Cart Modal Appears With The Item Added
    Wait Until Element Is Visible   id:layer_cart

Click The "Proceed to checkout" Link
    Wait Until Element Is Visible    xpath=//a[@title='Proceed to checkout']
    Scroll Element Into View    xpath=//a[@title='Proceed to checkout']
    Click Element   xpath=//a[@title='Proceed to checkout']

Click The "Proceed to checkout" Link 2
    Wait Until Element Is Visible    xpath=//*[@id="center_column"]/p[2]/a[1]
    Scroll Element Into View    xpath=//*[@id="center_column"]/p[2]/a[1]
    Click Element   xpath=//*[@id="center_column"]/p[2]/a[1]

Click The "Proceed to checkout" Address Button
    Click Element   xpath=//button[@name='processAddress']

Click The "Proceed to checkout" Carrier Button
    Click Element   xpath=//button[@name='processCarrier']

Page Redirects To "Shopping-cart summary"
    Wait Until Element Is Visible   id:order

Introduce A Valid Email And Password In The Right Form And Click The “Sign in” Button
    Input Text  id:email    vexikex182@netjook.com
    Input Text  id:passwd   123456
    Click Element   id:SubmitLogin

Login Has Been Successfully And Page Redirects To “Address” Step Page
    Wait Until Element Is Visible   xpath=//p[@class="address_add submit"]

Page Redirects To "Shipping" Step Page
    Wait Until Element Is Visible   id:carrier_area

Click The Checkbox To Accept The Terms Of Service
    Click Element   id:cgv

Page Redirects To "Payment" Step Page
    Wait Until Element Is Visible   id:order-detail-content

Click The “Pay by bank wire” Option
    Click Element   xpath=//a[@class="bankwire"]

Page Redirects To Bank Wire Page
    Wait Until Element Is Visible   xpath=//div[@class="box cheque-box"]

Click The "I confirm my order button" Button
    Click Element   xpath=//*[@id="cart_navigation"]/button

The Order Information Appears And The Order Has Been Made
    Wait Until Element Is Visible   id:order-confirmation