Feature: As an administrator, I want to be able to access the address information of a customer with a specified ID number via the API connection.

  Scenario Outline:When a GET request body containing valid authorization credentials and the desired address id to access detailed information is sent to the /api/profile/addressDetails endpoint, the returned status code should be validated as 200, and the message information in the response body should confirm as "success".


    * The api user constructs the base url with the "admin" token
    * The api user sets "api/profile/addressDetails" path parameters
    * The api user prepares a GET request containing the  <id> for which details are to be accessed
    * The API user sends a GET request and records the response .
    * The api user verifies that the status code is 200
    * The api user verifies that the message information in the response body is "success"

    Examples:
    | id |
    | 77 |

@412
  Scenario Outline: When a GET request body containing valid authorization credentials and the desired address id to access detailed information is sent to the /api/profile/addressDetails endpoint, the data returned in the response body should be validated. This data should include fields such as id, customer_id, name, email, phone, address, city, state, country, postal_code, is_shipping_default, is_billing_default, created_at, updated_at.


    * The api user constructs the base url with the "admin" token
    * The api user sets "api/profile/addressDetails" path parameters
    * The api user prepares a GET request containing the  <id> for which details are to be accessed
   # * The API user sends a GET request and records the response .
    * The api user validates the <id>, <customer_id>, "<name>", "<email>", "<phone>", "<address>", "<city>", "<state>", "<country>", <is_shipping_default>, <is_billing_default>, "<created_at>", "<updated_at>" of the response body with index <dataindex>.

    Examples:
    | id | customer_id  | name             | email                           | phone       | address  | city  | state | country |   is_shipping_default | is_billing_default | created_at                  | updated_at                  | dataindex |
    | 77 | 108          | Ihsan Altunışık  | customer.ihsan@buysellcycle.com | 01234567814 | erfsdfs  | 47854 | 3956  | 231     |   0                   | 0                  | 2024-03-26T08:48:20.000000Z | 2024-03-28T09:12:51.000000Z | 0         |





  Scenario Outline: When a GET request body containing valid authorization credentials and an incorrect (non-existent in the system) address id is sent to the /api/profile/addressDetails endpoint,
  the returned status code should be validated as 404, and the message information in the response body should confirm as "address not found".


    * The api user constructs the base url with the "admin" token
    * The api user sets "api/profile/addressDetails" path parameters
    * The api user prepares a GET request containing the  <id> for which details are to be accessed
    * The API user records the response from the api refundReasonDetails endpoint, verifying that the status code is '404' and the reason phrase is Not Found.

    Examples:
      | id  |
      | 500 |

    #status code: 404, reason phrase: Not Found


  Scenario:When a GET request body containing invalid authorization credentials and the desired address id to access detailed information is sent to the
  /api/profile/addressDetails endpoint, the returned status code should be validated as 401, and the message information in the response body should confirm as "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token
    * The api user sets "api/profile/addressDetails" path parameters
    * The API user records the response from the api refundReasonList endpoint, confirming that the status code is 401 and the reason phrase is Unauthenticated.






