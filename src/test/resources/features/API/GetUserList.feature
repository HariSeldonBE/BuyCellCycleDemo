Feature:US_006 When a GET request containing valid authorization credentials and the customer id data for the desired detailed information is sent to the /api/get-user endpoint, the expected status code returned should be 200, and the message in the response body should confirm: "success".




  @[US_006-TC_001]
  Scenario Outline:When a GET request containing valid authorization credentials and the customer id data for the desired detailed information is sent to the /api/get-user endpoint, the expected status code returned should be 200, and the message in the response body should confirm: "success"

    * The api user constructs the base url with the "admin" token

    * The api user sets "api/get-user" path parameters

    * The api user prepares a GET request containing the  <id> for which details are to be accessed

    * The api user sends the "getbody" request and saves the "Response"

    * The api user verifies that for "getbody" request type the status code is 200 and the message information in the response body is "success"



    Examples:
      | id |
      | 1 |

  @[US_006-TC_002]

Scenario Outline: When a GET request body containing valid authorization information and the coupon ID to access details is sent to the /api/coupon/couponDetails endpoint,
the data (id, title ,coupon_code, coupon_type, start_date, end_date, discount, discount_type, minimum_shopping, maximum_discount, created_by, updated_by, is_expire, is_multiple_buy, multiple_buy_limit, created_at, updated_at ) returned in the response body should be validated.


  * The api user constructs the base url with the "admin" token

  * The api user sets "api/get-user" path parameters

  * The api user prepares a GET request containing the  <id> for which details are to be accessed

  * The api user sends the "getbody" request and saves the "Response"

  * The api user validates the <id>, "<first_name>", "<last_name>", <role_id>, <is_verified>, <is_active>, "<lang_code>", <currency_id>, "<currency_code>", "<name>" of the response body

    Examples:

    | id | first_name   | last_name       | role_id                  | is_verified      | is_active   |  lang_code    | currency_id  |currency_code  |name       |
    | 1  | Super        | admin           | 1                        | 1                | 1           |   en          |  2           | USD           |Super admin|



  @[US_006-TC_003]

  Scenario Outline: When a GET request containing valid authorization
  credentials and incorrect customer id data is sent to the /api/get-user endpoint, the expected status code returned should be 404, and the message in the response body should confirm: "user not found".

    * The api user constructs the base url with the "customer" token

    * The api user sets "api/get-user" path parameters

    * The api user prepares a GET request containing the  <id> for which details are to be accessed

    * The api user verifies that for "getbody" request type the status code is 404 and the message information in the response body is "Not Found"

    Examples:
      | id |
      | 67 |

  @[US_006-TC_004]

  Scenario Outline: When a GET request body containing invalid authorization information and the coupon ID to access details is sent to the api/get-user endpoint,
  the returned status code should be 401, and the message information should be verified as "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token

    * The api user sets "api/get-user" path parameters

    * The api user prepares a GET request containing the  <id> for which details are to be accessed

    * The api user verifies that for "getbody" request type the status code is 401 and the message information in the response body is "Unauthorized"

    Examples:
      | id |
      | 65 |
