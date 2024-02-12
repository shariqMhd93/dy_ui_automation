*** Settings ***
Library           SeleniumLibrary    screenshot_root_directory=EMBED
Resource          ../Resources/Locators.robot
Resource          ../Resources/Locators/Cart_Locators.robot
Resource          ../Keywords/CommonWeb.robot
Resource          ../Resources/Locators/WishList_Locators.robot


*** Keywords ***
Hover over My Bag
    Mouse Over    ${minicart_icon_l}

Click on My Bag
    Click Element    ${minicart_icon_l}
    Wait Until Location Contains    /shopping-bag

Access Cart page directly
    Go To    ${uat_URL}user/shopping-bag

Click on Checkout button from Cart page
    Execute Javascript    window.scrollTo(0,document.body.scrollHeight/2)
    CommonWeb.Click by JS    ${cart_checkout_l}

Click on Chekout button from Minicart modal
    Scroll Element Into View    ${cart_checkout_l}
    Click Element   ${cart_checkout_l}

Click on Add to wishlist button from Cart page
    Click Element   ${add_to_wishlish}

Click on View Bag button from Minicart modal
    Scroll Element Into View    ${view_bag_button}
    Click Element   ${view_bag_button}
    Wait Until Element Is Visible    ${cart_title}    10s    Cart page is not displayed

Capture item details from mini cart page
    ${no_of_items_mini_cart} =  Get text    ${no_of_items_locator_mini_cart}
    ${product_primary_title_mini_cart} =  Get text    ${product_primary_title_locator_mini_cart}
    ${product_secondary_title_mini_cart} =  Get text   ${product_secondary_title_locator_mini_cart}
    ${item_size_mini_cart} =  Get text   ${item_size_locator_mini_cart}
    ${item_price_mini_cart} =  Get text   ${item_price_locator_mini_cart}

    Set Test Variable    ${no_of_items_mini_cart}   ${no_of_items_mini_cart}
    Set Test Variable    ${product_primary_title_mini_cart}       ${product_primary_title_mini_cart}
    Set Test Variable    ${product_secondary_title_mini_cart}     ${product_secondary_title_mini_cart}
    Set Test Variable    ${item_size_mini_cart}                   ${item_size_mini_cart}
    Set Test Variable    ${item_price_mini_cart}                 ${item_price_mini_cart}

Capture item details from cart page
    ${no_of_items_cart} =  Get text    ${no_of_items_locator_cart}
    ${product_primary_title_cart} =  Get text    ${product_primary_title_locator_cart}
    ${product_secondary_title_cart} =  Get text   ${product_secondary_title_locator_cart}
    ${item_size_cart} =  Get text   ${item_size_locator_cart}
    ${item_price_cart} =  Get text   ${item_price_locator_cart}

    Set Test Variable    ${no_of_items_cart}   ${no_of_items_cart}
    Set Test Variable    ${product_primary_title_cart}       ${product_primary_title_cart}
    Set Test Variable    ${product_secondary_title_cart}     ${product_secondary_title_cart}
    Set Test Variable    ${item_size_cart}                   ${item_size_cart}
    Set Test Variable    ${item_price_cart}                  ${item_price_cart}

Capture payment summary from cart page
    ${preShippingSubTotal_cart_1} =  Get text    ${pre_shipping_total_locator_cart}
    ${shipping_charge_cart} =   Get text    ${shipping_charge_locator_cart}
    ${tax_total_cart} =  Get Text  ${tax_total_locatorcart}
    ${sub_total_cart} =  Get Text  ${sub_total_locator_cart}

    Set Test Variable    ${preShippingSubTotal_cart}   ${preShippingSubTotal_cart_1}
    Set Test Variable    ${shipping_charge_cart}       ${shipping_charge_cart}
    Set Test Variable    ${tax_total_cart}             ${tax_total_cart}
    Set Test Variable    ${sub_total_cart}             ${sub_total_cart}

Check items details are same in mini cart and cart
    Run Keyword And Warn On Failure    Should Contain Text    ${no_of_items_cart}   ${no_of_items_mini_cart}
    Run Keyword And Warn On Failure    Should Be Equal As Strings    ${product_primary_title_cart}    ${product_primary_title_mini_cart}
    Run Keyword And Warn On Failure    Should Be Equal As Strings    ${product_secondary_title_cart}    ${product_secondary_title_mini_cart}
    Run Keyword And Warn On Failure    Should Be Equal As Strings    ${item_size_cart}    ${item_size_mini_cart}
    Run Keyword And Warn On Failure    Should Be Equal As Strings    ${item_price_cart}    ${item_price_mini_cart}
