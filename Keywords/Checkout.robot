*** Settings ***
Library           SeleniumLibrary    screenshot_root_directory=EMBED
Resource          ../Resources/Locators.robot
Resource          ../Resources/Variables.robot
Resource          ../Keywords/CommonWeb.robot

*** Keywords ***
Click on Sign In button from Checkout
    Wait Until Page Contains Element    ${shipping_stage}   10s    Checkout page is not entirely loaded
    Wait Until Element Is Visible    ${checkout_signin_l}    10s    Sign In button is not displayed
    Click Element    ${checkout_signin_l}
    Wait Until Element Is Visible    ${checkout_email_l}    10s    Email field is not displayed
    Wait Until Element Is Visible    ${checkout_pwd_l}    10s    Password field is not displayed

Click on Paypal button from Page
    [Arguments]    ${page}
    IF    "${page}" == "identification"
        Wait Until Page Contains Element    ${paypal_idntf_btn_l}    20s    Paypal button is not yet visible
    END
    Select Frame    ${paypal_iframe_l}
    Wait Until Page Contains Element    ${paypal_btn_container_l}    30s    Paypal button is not yet visible
    CommonWeb.Scroll and Click    ${paypal_btn_container_l}

Enter login credentials during checkout
    [Arguments]    ${user}    ${pwd}
    CommonWeb.Check and Input text    ${checkout_email_l}    ${user}
    CommonWeb.Check and Input text    ${checkout_pwd_l}    ${pwd}

Click on Sign In button during checkout
    Click Element    ${checkout_signin_submit_l}
    Wait Until Page Contains Element    ${checkout_signin_email_l}    10s    Email is not displayed
    Wait Until Element Is Visible    ${checkout_signin_email_l}    10s    Email is not visible

Sign in during checkout
    Click on Sign In button from Checkout
    Enter login credentials during checkout    ${REGISTERED_email}    ${REGISTERED_pwd}
    Click on Sign In button during checkout

Check Info Texts During Checkout
    ${footer_items} =    Get Element Count    ${checkout_info_modal_nr_l}
    FOR    ${index}    IN RANGE    1    ${footer_items}+1
        ${index_minus_one}=    Evaluate    ${index}-1
        CommonWeb.Check and Click    css:.checkout-right-container .footer-item:nth-child(${index})
        Wait Until Page Contains Element    ${checkout_info_modal_show_l}    10s    Info Modal is not visible
        Wait Until Element Is Visible    ${checkout_info_modal_title_l}    10s    Info Modal is not visible
        Run Keyword And Warn On Failure    Element Text Should Be    ${checkout_info_modal_title_l}   ${checkout_expected_info_texts}[${index_minus_one}]
        CommonWeb.Check and Click    ${checkout_info_modal_close_l}
        Wait Until Element Is Not Visible    ${checkout_info_modal_title_l}    10s    Info Modal is still visible
    END

Hover over Minicart
    Mouse Over    ${minicart_icon_l}

Click on Checkout button from Minicart
    Mouse Over    ${minicart_icon_l}
    Wait Until Element Is Visible    css:.popover.show a[href*='checkout']    10s    Minicart modal is not visible
    Click Element    css:.popover.show a[href*='checkout']

#Capture payment details in checkout page
#
#Capture Item details in checkout page

