*** Variables ***
#Application and browser settings
${LOGIN_URL}      https://parabank.parasoft.com/parabank/admin.htm
${BROWSER}        Chrome

#Credentials
${USERNAME}       johndoe
${PASSWORD}       Password123

#Expected text message
${WELCOME_MESSAGE}    Accounts Overview



${Register}           link:Register
${BROWSER}                 chrome
${FIRST_NAME_FIELD}        name:customer.firstName
${LAST_NAME_FIELD}         id:customer.lastName
${ADDRESS_FIELD}           name:customer.address.street
${CITY_FIELD}              id:customer.address.city
${STATE_FIELD}             id:customer.address.state
${ZIP_CODE_FIELD}          id:customer.address.zipCode
${PHONE_FIELD}             id:customer.phoneNumber
${SSN_FIELD}               id:customer.ssn
${USERNAME_FIELD}          id:customer.username
${PASSWORD_FIELD}          id:customer.password
${CONFIRM_FIELD}           id:repeatedPassword
${SIGN_UP_BUTTON_LOCATOR}  css:input[value='Register']