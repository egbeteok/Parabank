*** Settings ***
Library    RequestsLibrary
Library    Collections


*** Variables ***
# --- Shared Variables ---
${BASE_URL}             https://automationexercise.com
${SESSION_ALIAS}        ae_api

# --- Request Variables ---
${GET_ENDPOINT}         /api/productsList
${POST_ENDPOINT}        /api/searchProduct
&{SEARCH_PAYLOAD}       search_product=top


*** Test Cases ***
Verify Successful Products List Fetch (GET)
    Create Session    ${SESSION_ALIAS}    ${BASE_URL}
    ${response}=      GET On Session    ${SESSION_ALIAS}    ${GET_ENDPOINT}

    Status Should Be    200     ${response}
    ${json_data}=    Set Variable    ${response.json()}

    ${api_response_code}=    Get From Dictionary    ${json_data}    responseCode
    Should Be Equal As Strings    ${api_response_code}    200

Verify Successful Product Search (POST)
    Create Session    ${SESSION_ALIAS}    ${BASE_URL}

    ${response}=    POST On Session    ${SESSION_ALIAS}    ${POST_ENDPOINT}    data=&{SEARCH_PAYLOAD}

    Status Should Be    200     ${response}
    ${json_data}=    Set Variable    ${response.json()}

    ${api_response_code}=    Get From Dictionary    ${json_data}    responseCode
    Should Be Equal As Strings    ${api_response_code}    200

    ${products_list}=    Get From Dictionary    ${json_data}    products
    Should Not Be Empty    ${products_list}