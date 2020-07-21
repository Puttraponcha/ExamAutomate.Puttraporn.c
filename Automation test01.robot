*** Settings ***
Library    Selenium2Library
Library     BuiltIn
Library     String

Suite Teardown     Close Browser

*** Variable ***
${BROWSER}        chrome
${url_officemate}        https://www.officemate.co.th   
${input_search}          //*[@class="_5vxBY _32CNv _2MLml"]
${btn_search}           //*[@id="btn-searchResultPage"]
${btn_Sort}          //*[@class="_13F3t _2cV8K x1C8Q MGtP6 Uh6-P"]
${btn_lowestprice}           //*[@class="_2CEQo"]
${btn_addcart}           //*[@class="_3bEQ9 js-trackAddToCart"]
${txt_message_search}         //div//textarea[@name="canon calulator"]
${txt_message_VerifyAdd} //*[@class="lbl-minicartQty"]

*** Keywords ***
 Open Browser officemate
  Open Browser   ${url_officemate}    ${BROWSER} chrome

Search canon calulator   
    input text ${input_search} ${txt_message_search} 

Click Button Search
    Click Element ${btn_search}

Sort by lowest price
    Click Element    ${btn_Sort} ${btn_lowestprice}

Click Button Add to Cart
    Click Element    ${btn_addcart} 

Verify Add to Cart Success
    Element Text Should Be ${txt_message_VerifyAdd} 

Click Button View Cart
    Click Element   ${btn_viewcart}

*** Test Cases ***
Open Browser officemate
     Close Browser

Search success
    Open Browser officemate  
    Search canon calulator 
    Click Button Search  
    Sort by lowest price   
	Verify Search Result Success
  Close Browser

Add to Cart 
    Open Browser officemate 
    Search canon calulator
    Click Button Search
    Sort by lowest price
    Click Button Add to Cart
    Verify Add to Cart Success 
	Click Button View Cart

Test Teardown    Close Browser