*** Settings ***
Documentation  A test suite  to search canon calulator lowestprice on officemate and add to cart
...              Created By Puttraporn C
Library    Selenium2Library
Library     BuiltIn
Library     String

Suite Teardown     Close Browser

*** Variable ***
${url_officemate}        https://www.officemate.co.th
${input_item}          //input[@value="canon calulator"]
${input_search}          //*[@class="_5vxBY _32CNv _2MLml"]
${btn_search}           //div[@id='btn-searchResultPage']
${btn_Sortbrand}       //*[@id="app"]/div/div[4]/div/div[3]/div/div/div[1]/div/div[2]/div/div[2]/div/div[2]/div/div[2]/div/div[1]
${btn_Sort}            (.//*[normalize-space(text()) and normalize-space(.)='จัดเรียงตาม'])[2]/following::*[name()='svg'][1]
${btn_lowestprice}         //*[@id="price_asc"]/div
${btn_addcart1}           //div[@id="btn-addCart-OFM8015945"]
#${btn_addcart2}           //div[@id="btn-addCart-OFM8015949"]
${btn_Verifyadd}            //span[@id='lbl-minicartQty']
${btn_Verifyadd2}       //div[@id='mini-cart--OFM8015945']
${btn_beSortbrand}      //*[@id="btn-collapseClose-Category"]

*** Keywords ***
 Open Browser officemate
  Open Browser  ${url_officemate}   chrome

Search canon calulator
    Input Text  ${input_search}  ${input_item}

Click Button Search
    Click Element  ${btn_search}
    Wait until page contains element  ${btn_beSortbrand}
Sort by lowest price
    Mouse Over  ${btn_beSortbrand}
    Click Element  ${btn_beSortbrand}
    Mouse Over  ${btn_Sortbrand}
    Click Element   ${btn_Sortbrand}
    Wait until page contains element  ${btn_Sort}
    Mouse Over  ${btn_Sort}
    Click Element   ${btn_Sort}
    Wait until page contains element  ${btn_lowestprice}
    Mouse Over  ${btn_lowestprice}
    Click Element  ${btn_lowestprice}

Click Button Add to Cart1
    Click Element  ${btn_addcart1}
Click Button Add to Cart2
    Click Element  ${btn_addcart1}

Click Button Verify View Cart 2 items
    Click Element  ${btn_Verifyadd}
    Click Element  ${btn_Verifyadd2}

*** Test Cases ***

Add to Cart
    Open Browser officemate
    Search canon calulator
    Click Button Search
    Sort by lowest price
    Click Button Add to Cart1
    Click Button Add to Cart2
	Click Button Verify View Cart 2 items

Test Teardown    Close Browser