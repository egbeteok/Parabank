*** Settings ***
Library     RequestsLibrary
Library     Collections


*** Variables ***
${BASE_url}                 https://automationexercise.com
${SESSION_ALIAS}            ae_api
${ENDPOINT}                 /api/productsList


*** Test Cases ***
Verify Product List API
    Create Session    ${SESSION_ALIAS}    ${BASE_url}
    ${response}=      GET On Session    ${SESSION_ALIAS}    ${ENDPOINT}
    Status Should Be    200     ${response}
    ${json_data}=    Set Variable    ${response.json()}
    ${api_response_code}=    Get From Dictionary    ${json_data}    responseCode
    Should Be Equal As Strings    ${api_response_code}    200
    Log To Console    API internal code verified: ${api_response_code}
    ${products_list}=    Get From Dictionary    ${json_data}    products
    ${number_of_products}=    Get Length    ${products_list}
    Should Be True    ${number_of_products} > 0    msg=The 'products' list was empty, but expected items.
    Log To Console    Successfully retrieved ${number_of_products} products.