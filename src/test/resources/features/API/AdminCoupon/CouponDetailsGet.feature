@zehra28
Feature: As an administrator, I want to be able to access the details of the coupon with the specified ID number via the API connection.


  Scenario Outline: When a GET request body containing valid authorization information and
  the coupon ID to access details is sent to the /api/coupon/couponDetails endpoint, the returned status code should be 200, and the message information should be verified as "success".

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/coupon/couponDetails" path parameters
    * The api user prepares a GET request containing the  <id> for which details are to be accessed
    * The api user sends the "getbody" request and saves the "Response"
    * The api user verifies that for "get" request type the status code is 200 and the message information in the response body is "success"

    Examples:
      | id |
      | 20 |


  Scenario Outline: When a GET request body containing valid authorization information and the coupon ID to access details is sent to the /api/coupon/couponDetails endpoint,
  the data (id, title ,coupon_code, coupon_type, start_date, end_date, discount, discount_type, minimum_shopping, maximum_discount, created_by, updated_by, is_expire, is_multiple_buy, multiple_buy_limit, created_at, updated_at ) returned in the response body should be validated.

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/coupon/couponDetails" path parameters
    * The api user prepares a GET request containing the  <id> for which details are to be accessed
    * The api user sends the "getbody" request and saves the "Response"
    * The api user validates the <id>, "<title>", "<coupon_code>", <coupon_type>, "<start_date>", "<end_date>", <discount>, <discount_type>, <minimum_shopping>, <maximum_discount>, <created_by>, <updated_by>, <is_expire>, <is_multiple_buy>, "<created_at>", "<updated_at>" of the response body .

    Examples:
      | id | title    | coupon_code | coupon_type | start_date | end_date   | discount | discount_type | minimum_shopping | maximum_discount | created_by | updated_by | is_expire | is_multiple_buy | created_at                  | updated_at                  |
      | 25 | Orderder | ordered     | 2           | 2024-04-18 | 2024-04-20 | 10       | 0             | 1                | 2                | 4          | 4          | 0         | 1               | 2024-04-10T13:38:06.000000Z | 2024-04-10T14:34:58.000000Z |


  Scenario Outline: When a GET request body containing valid authorization information and an incorrect (non-existent in the system) coupon ID is sent to the /api/coupon/couponDetails endpoint,
  the returned status code should be 404, and the message information should be verified as "coupon not found".

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/coupon/couponDetails" path parameters
    * The api user prepares a GET request containing the  <id> for which details are to be accessed
    * The api user verifies that for "get" request type the status code is 404 and the message information in the response body is "Not Found"

    Examples:
      | id |
      | 58 |

  Scenario Outline: When a GET request body containing invalid authorization information and the coupon ID to access details is sent to the /api/coupon/couponDetails endpoint,
  the returned status code should be 401, and the message information should be verified as "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token
    * The api user sets "api/coupon/couponDetails" path parameters
    * The api user prepares a GET request containing the  <id> for which details are to be accessed
    * The api user verifies that for "get" request type the status code is 401 and the message information in the response body is "Unauthorized"

    Examples:
      | id |
      | 25 |