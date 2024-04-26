Feature: As a user, I should be able to access detailed information about the address in my profile with the specified ID via the API connection.
  @simge331
  Scenario Outline:  When a valid GET request containing the address ID data that is intended to access detailed information is sent to the /api/profile/customerDetailsAddress endpoint with valid authorization credentials,
  the returned status code should be 200, and the message in the response should be verified as "success".

    * The api user constructs the base url with the "customer" token
    * The api user sets "api/profile/customerDetailsAddress" path parameters
    * The api user prepares a GET request containing the  <id> for which details are to be accessed
    * The api user sends the "getbody" request and saves the "Response"
    * The api user verifies that for "getbody" request type the status code is 200 and the message information in the response body is "success"
    Examples:
      |id |
      |373|
  @simge332
  Scenario Outline:  When a valid GET request containing the address ID data intended to access detailed information is sent to the /api/profile/customerDetailsAddress endpoint with valid authorization credentials,
  the data in the response body, including (id, customer_id, name, email, phone, address, city, state, country, postal_code, is_shipping_default, is_billing_default, created_at, updated_at), should be verified.

    * The api user constructs the base url with the "customer" token
    * The api user sets "api/profile/customerDetailsAddress" path parameters
    * The api user prepares a GET request containing the  <id> for which details are to be accessed
    * The api user sends the "getbody" request and saves the "Response"
      * The api user validates the <id> <customer_id>  "<name>"  "<email>"  "<phone>" "<address>"  "<city>"  "<state>" "<country>" "<is_shipping_default>" "<is_billing_default>" "<created_at>" "<updated_at>" of the response body with index <dataindex>.

      Examples:
        | id | customer_id  | name   | email           | phone       | address      | city    | state   | country | is_shipping_default | is_billing_default | created_at                  | updated_at                   | dataindex  |
        |373 | 115          | Simge  | dilan@gmail.com | 547895562   | Tokat merkez | Almus   |Tokat    |Turkey           | 0           |         0          | 2024-04-22T23:16:45.000000Z |2024-04-22T23:16:45.000000Z   |      0     |



  Scenario Outline: When a GET request containing the incorrect (non-existent in the system) address ID data is sent to the /api/profile/customerDetailsAddress endpoint with valid authorization credentials,
  the status code returned should be 404, and the message in the response body should be verified to be "address not found".

    * The api user constructs the base url with the "customer" token
    * The api user sets "api/profile/customerDetailsAddress" path parameters
    * The api user prepares a GET request containing the  <id> for which details are to be accessed
    * The api user verifies that for "getbody" request type the status code is 404 and the message information in the response body is "Not Found"
    Examples:
      |id |
      |370|
  @simge334
  Scenario Outline: When a GET request containing the address ID data to be accessed is sent to the /api/profile/customerDetailsAddress endpoint with invalid authorization credentials,
  the status code returned should be 401, and the message in the response body should be verified to be "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token
    * The api user sets "api/profile/customerDetailsAddress" path parameters
    * The api user prepares a GET request containing the  <id> for which details are to be accessed
    * The api user verifies that for "getbody" request type the status code is 401 and the message information in the response body is "Unauthorized"
    Examples:
      |id |
      |373|