Feature: As an administrator, I want to be able to access all customer addresses registered in
  the system via the API connection.

  @40/1
  Scenario: When a GET request body containing valid authorization credentials is sent to the
  /api/profile/allAddressList endpoint, the returned status code should be validated as 200,
  and the message information in the response body should confirm as "success".

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/profile/allAddressList" path parameters
    * The api user sends the "getbody" request and saves the "Response"
    * The api user verifies that for "get" request type the status code is 200 and the message information in the response body is "success"

  @40/2
  Scenario Outline: When a GET request body containing valid authorization credentials is sent to
  the /api/profile/allAddressList endpoint, the information returned in the response body for the entry
  with id (x) should be validated. This includes fields such as customer_id, name,email, phone, address,
  city, state, country, postal_code.


    * The api user constructs the base url with the "admin" token
    * The api user sets "api/profile/allAddressList" path parameters
    * The api user prepares a GET request containing the  <id> for which details are to be accessed
    * The api user sends the "getbody" request and saves the "Response"
    * The api user validates the <id> <customer_id>  "<name>"  "<email>"  "<phone>" "<address>"  "<city>"  "<state>" "<country>" "<is_shipping_default>" "<is_billing_default>" "<created_at>" "<updated_at>" of the response body with index <dataindex>.

  Examples:
    | id | customer_id  | name        | email                           | phone              | address                | city    | state   | country | is_shipping_default | is_billing_default | created_at                  | updated_at                   | dataindex  |
    | 1  | 5            | ra_name     | ra_mail@gmail.com               | 0123456789123456   | DE                     | 18744   |1357     |82       |                     |                    |                             |                              |      1    |
  # * The api user verifies the content of the data <id> ,<customer_id>,"<name>","<email>", "<phone>", "<address>","<city>" ,"<state>","<country>","<postal_code>" in the response body.

  #  Examples:
   #   | id | id | customer_id | name    | email             | phone            | address | city  | state | country | postal_code |
    #  | 1  | 1  | 5           | ra_name | ra_mail@gmail.com | 0123456789123456 | DE      | 18744 | 1357  | 82      | 45857       |


  Scenario Outline: When a GET request body containing invalid authorization credentials is sent to
  the /api/profile/allAddressList endpoint, the returned status code should be validated as 401,
  and the message information in the response body should confirm as "Unauthenticated.".


    * The api user constructs the base url with the "invalid" token
    * The api user sets "api/profile/allAddressList" path parameters
    * The api user validates the <id> <customer_id>  "<name>"  "<email>"  "<phone>" "<address>"  "<city>"  "<state>" "<country>" "<is_shipping_default>" "<is_billing_default>" "<created_at>" "<updated_at>" of the response body with index <dataindex>.

    Examples:
      | id | id | customer_id | name    | email             | phone            | address | city  | state | country | postal_code |
      | 1  | 1  | 5           | ra_name | ra_mail@gmail.com | 0123456789123456 | DE      | 18744 | 1357  | 82      | 45857       |
