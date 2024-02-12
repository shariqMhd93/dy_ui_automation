*** Settings ***
Test Setup        Run Keywords    Open website    Accept Cookies
Test Teardown     Run Keywords    Set BS URL    Close All Browsers
Force Tags        prod    automation
Library           SeleniumLibrary    screenshot_root_directory=EMBED
Resource          ../../Resources/Locators.robot
Resource          ../../Resources/Locators/Cart_Locators.robot
Resource          ../../Resources/Variables.robot
Resource          ../../Resources/Errors.robot
Resource          ../../Keywords/Checkout.robot
Resource          ../../Keywords/Cart.robot
Resource          ../../Keywords/OrderConfirmation.robot
Resource          ../../Keywords/Shipping.robot
Resource          ../../Keywords/Payment.robot
Resource          ../../Keywords/PDP.robot
Resource          ../../Keywords/PLP.robot
Resource          ../../Keywords/CommonWeb.robot
#Resource         ../Keywords/MyAccount.robot
Resource          ../../Keywords/Homepage.robot
Resource          ../../Keywords/StoreLocator.robot
Resource          ../../Keywords/GiftCard.robot
*** Test Cases ***
#Negative Scenarios
Shipping Address Form - Validations
    [Tags]   Generic   Guest_User   EN   CN   FR    EU  Negative_Scenario
    Open PDP for product with id    BC0100MSS
    Close the Get the First Look modal
    Select Size    M
    Sleep  5s
    Click Add To Cart Button from PDP
    Click on My Bag
    Click on Checkout button from Cart page
    Click on Continue To Payment button
    Verify the empty fields validation on Shipping Address step
    Verify the invalid fields validation on Shipping Address step

Promo Code Form - Validations
    [Tags]   Generic   Guest_User   EN   CN   FR    EU  Negative_Scenario
    Open PDP for product with id    BC0100MSS
    Close the Get the First Look modal
    Select Size    M
    Sleep  5s
    Click Add To Cart Button from PDP
  #  Click on My Bag
    Click on Checkout button from Cart page
    Click on Continue To Payment button
    Generate Timestamp Email
    Enter valid Shipping details    ${guest_valid}    ${FIRST_NAME}   ${LAST_NAME}   ${ADDRESS}   ${ADDRESS2}   ${ZIP}   ${PHONE}
    Click on Continue To Payment button
    Select an Address from Address Suggestion modal    entered
    Expand the Promo Code section
    Click on Add Promo Code button
    Verify the Empty field validation message for Promo Code
    Expand the Redeem Gift Card section
    Click on Apply button
    Verify the Empty fields validation messages for Gift Card
    Verify the invalid fields validation message for Gift Card
    Check The Gift Card Balances
    Remove the applied gift card

Credit Card Form - Validations
    [Tags]   Generic   Guest_User   EN   CN   FR    EU  Negative_Scenario
    Open PDP for product with id    BC0100MSS
    Close the Get the First Look modal
    Select Size    M
    Sleep  5s
    Click Add To Cart Button from PDP
    #Click on My Bag
    Click on Checkout button from Cart page
    Generate Timestamp Email
    Enter valid Shipping details    ${guest_valid}    ${FIRST_NAME}   ${LAST_NAME}   ${ADDRESS}   ${ADDRESS2}   ${ZIP}   ${PHONE}
    Click on Continue To Payment button
    Select an Address from Address Suggestion modal    entered
    Check that Credit Card payment option is preselected and expanded
    Click on Place Order CTA
    Verify the Empty fields validation messages for Credit Card section
    Verify the invalid fields validation for Credit Card section    #bug USSDY-283

#Positive Scenarios
Checkout with Credit Card/Visa and One item in bag - Suggested Address
    [Tags]   Generic   Guest_User   EN   CN   FR    EU  CreditCard   Positive_Scenario
    Open PDP for product with id    BC0100MSS
    Close the Get the First Look modal
    Select Size    M
    Sleep  5s
    Click Add To Cart Button from PDP
    Capture item details from mini cart page
    Click on View Bag button from Minicart modal
    Capture item details from cart page
    Capture payment summary from cart page
    Check items details are same in mini cart and cart
#    Click on Checkout button from Cart page
#    Generate Timestamp Email
#    Enter valid Shipping details    ${guest_valid}    ${FIRST_NAME}   ${LAST_NAME}   ${ADDRESS}   ${ADDRESS2}   ${ZIP}   ${PHONE}
#    Check that the default Delivery Method is selected    Overnight
#    Click on Continue To Payment button
#    Select an Address from Address Suggestion modal    suggested
#    Verify that the shipping information is correct on Payment page    ${guest_valid}    ${FIRST_NAME}   ${LAST_NAME}   ${ADDRESS}   ${ADDRESS2}   ${ZIP}   ${PHONE}
#    Verify that the shipping method is correct on Payment page    2-day
#    Enter payment details    ${visa_number}    ${card_exp}    ${csv}    ${card_holder}
#    Click on Place Order CTA for payment    cc
#    Check Order Confirmation page
#    Verify Order Confirmation details


Checkout with Credit Card/Visa - Entered Address
    [Tags]   Generic   Guest_User   EN   CN   FR    EU  CreditCard   Positive_Scenario
    Open PDP for product with id    BC0100MSS
    Close the Get the First Look modal
    Select Size    M
    Sleep  5s
    Click Add To Cart Button from PDP
#   Click on My Bag (current production code)
    Click on Checkout button from Cart page
#    Capture payment summary
    Generate Timestamp Email
    Enter valid Shipping details    ${guest_valid}    ${FIRST_NAME}   ${LAST_NAME}   ${ADDRESS}   ${ADDRESS2}   ${ZIP}   ${PHONE}
    Check that the default Delivery Method is selected    Overnight
    Click on Continue To Payment button
    Select an Address from Address Suggestion modal    entered
    Verify that the shipping information is correct on Payment page    ${guest_valid}    ${FIRST_NAME}   ${LAST_NAME}   ${ADDRESS}   ${ADDRESS2}   ${ZIP}   ${PHONE}
    Verify that the shipping method is correct on Payment page    Overnight
    Enter payment details    ${visa_number}    ${card_exp}    ${csv}    ${card_holder}
    Click on Place Order CTA for payment    cc
    Check Order Confirmation page
    Verify Order Confirmation details

Checkout with PayPal
    [Tags]    Generic   Guest_User   EN   CN   FR    EU  Paypal   Positive_Scenario
    Open PDP for product with id    BC0100MSS
    Close the Get the First Look modal
    Select Size    M
    Sleep  5s
    Click Add To Cart Button from PDP
#   Click on My Bag (current production code)
    Click on Checkout button from Cart page
#    Capture payment summary
    Generate Timestamp Email
    Enter valid Shipping details    ${guest_valid}    ${FIRST_NAME}   ${LAST_NAME}   ${ADDRESS}   ${ADDRESS2}   ${ZIP}   ${PHONE}
    Check that the default Delivery Method is selected    Overnight
    Click on Continue To Payment button
    Select an Address from Address Suggestion modal    entered
    Verify that the shipping information is correct on Payment page    ${guest_valid}    ${FIRST_NAME}   ${LAST_NAME}   ${ADDRESS}   ${ADDRESS2}   ${ZIP}   ${PHONE}
    Verify that the shipping method is correct on Payment page    Overnight
    Select the PayPal payment method
    Log into PayPal
    On Paypal Account click on Save and Continue
    Check Order Confirmation page
    Verify Order Confirmation details

Checkout with Credit Card/AMEX
    [Tags]   Generic   Guest_User   EN   CN   FR    EU  CreditCard   Positive_Scenario
    Open PDP for product with id    BC0100MSS
    Close the Get the First Look modal
    Select Size    M
    Sleep  5s
    Click Add To Cart Button from PDP
#   Click on My Bag (current production code)
    Click on Checkout button from Cart page
#    Capture payment summary
    Generate Timestamp Email
    Enter valid Shipping details    ${guest_valid}    ${FIRST_NAME}   ${LAST_NAME}   ${ADDRESS}   ${ADDRESS2}   ${ZIP}   ${PHONE}
    Check that the default Delivery Method is selected    Overnight
    Click on Continue To Payment button
    Verify that the shipping information is correct on Payment page    ${guest_valid}    ${FIRST_NAME}   ${LAST_NAME}   ${ADDRESS}   ${ADDRESS2}   ${ZIP}   ${PHONE}
    Verify that the shipping method is correct on Payment page    Overnight
    Select an Address from Address Suggestion modal    entered
    Enter payment details    ${amex_number}    ${card_exp}    ${amex_csv}    ${card_holder}
    Click on Place Order CTA for payment    cc
    Check Order Confirmation page
    Verify Order Confirmation details

Checkout with Credit Card/Discover
    [Tags]   Generic   Guest_User   EN   CN   FR    EU  CreditCard   Positive_Scenario
    Open PDP for product with id    BC0100MSS
    Close the Get the First Look modal
    Select Size    M
    Sleep  5s
    Click Add To Cart Button from PDP
#   Click on My Bag (current production code)
    Click on Checkout button from Cart page
#    Capture payment summary
    Generate Timestamp Email
    Enter valid Shipping details    ${guest_valid}    ${FIRST_NAME}   ${LAST_NAME}   ${ADDRESS}   ${ADDRESS2}   ${ZIP}   ${PHONE}
    Check that the default Delivery Method is selected    Overnight
    Click on Continue To Payment button
    Verify that the shipping information is correct on Payment page    ${guest_valid}    ${FIRST_NAME}   ${LAST_NAME}   ${ADDRESS}   ${ADDRESS2}   ${ZIP}   ${PHONE}
    Verify that the shipping method is correct on Payment page    Overnight
    Select an Address from Address Suggestion modal    entered
    Enter payment details    ${discover_number}    ${card_exp}    ${csv}    ${card_holder}
    Click on Place Order CTA for payment    cc
    Check Order Confirmation page
    Verify Order Confirmation details



