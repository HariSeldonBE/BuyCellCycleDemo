@US_29
Feature: As an administrator, I want to be able to create a new coupon record via the API connection.

  Scenario Outline: When a POST body containing valid authorization information and necessary data
  (title, coupon_code, coupon_type, start_date, end_date, discount, discount_type, minimum_shopping, maximum_discount, is_expire, is_multiple_buy)
  is sent to the /api/coupon/couponAdd endpoint, the returned status code should be 201,
  and the message information in the response body should be verified as "coupon added successfully".

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/coupon/couponAdd" path parameters
    * The api user prepares a POST request containing the "<title>" "<coupon_code>" <coupon_type> "<start_date>" "<end_date>" <discount> <discount_type> <minimum_shopping> <maximum_discount> <is_expire> <is_multiple_buy> information to send to the api coupon CouponAdd endpoint.
    * The api user sends the "post" request and saves the "Response"
    * The api user verifies that for "post" request type the status code is 201 and the message information in the response body is "coupon added successfully"

    Examples:
      | title             |  | coupon_code |  | coupon_type |  | start_date |  | end_date   |  | discount |  | discount_type |  | minimum_shopping |  | maximum_discount |  | is_expire |  | is_multiple_buy |
      | Coupon Ekleme 005 |  | indirim     |  | 12          |  | 2024-04-10 |  | 2024-06-10 |  | 35       |  | 0             |  | 1                |  | 5                |  | 0         |  | 1               |

  Scenario Outline: The creation of the new coupon record via the API should be verified from the API itself.
    * The api user constructs the base url with the "admin" token
    * The api user sets "api/coupon/couponDetails" path parameters
    * The api user prepares a GET request containing the  <id> for which details are to be accessed
    * The api user sends a GET request and saves the response returned from the api coupon CouponDetails endpoint.
    * The api user verifies that the message information in the response body is "success"

    Examples:
      | id |
      | 72 |

  Scenario Outline: When a POST body containing invalid authorization information and necessary data
  (title, coupon_code, coupon_type, start_date, end_date, discount, discount_type, minimum_shopping, maximum_discount, is_expire, is_multiple_buy)
  is sent to the /api/coupon/couponAdd endpoint, the returned status code should be 401,
  and the message information in the response body should be verified as "Unauthenticated.".
    * The api user constructs the base url with the "invalid" token
    * The api user sets "api/coupon/couponAdd" path parameters
    * The api user prepares a POST request containing the "<title>" "<coupon_code>" <coupon_type> "<start_date>" "<end_date>" <discount> <discount_type> <minimum_shopping> <maximum_discount> <is_expire> <is_multiple_buy> information to send to the api coupon CouponAdd endpoint.
    * The api user sends the "post" request and saves the "Response"
    * The api user verifies that for "post" request type the status code is 401 and the message information in the response body is "Unauthenticated."

    Examples:
      | title           |  | coupon_code |  | coupon_type |  | start_date |  | end_date   |  | discount |  | discount_type |  | minimum_shopping |  | maximum_discount |  | is_expire |  | is_multiple_buy |
      | Attemt Coupon 4 |  | attemt      |  | 5           |  | 2024-04-18 |  | 2024-06-20 |  | 15       |  | 0             |  | 1                |  | 5                |  | 0         |  | 1               |