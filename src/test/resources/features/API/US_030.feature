@US_30
Feature: As an administrator, I want to be able to update coupon information with the specified ID number via the API connection.

  Scenario Outline: When a PATCH request body containing valid authorization information, the coupon ID to be updated, and necessary data
  (title, coupon_code, coupon_type, start_date, end_date, discount, discount_type, minimum_shopping, maximum_discount, is_expire, is_multiple_buy)
  is sent to the /api/coupon/couponUpdate/{id} endpoint, the returned status code should be 202,
  and the message information in the response body should be verified as "coupon updated successfully".

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/coupon/couponUpdate/<id>" path parameters
    * The api user prepares a PATCH request containing the "<title>" "<coupon_code>" <coupon_type> "<start_date>" "<end_date>" <discount> <discount_type> <minimum_shopping> <maximum_discount> <is_expire> <is_multiple_buy> data to send to the api coupon couponUpdate endpoint.
    * The api user sends the PATCH request and saves the response returned from the api coupon couponUpdate endpoint.
    * The api user verifies that for "patch" request type the status code is 202 and the message information in the response body is "coupon updated successfully"
    * The api user verifies that the updated id information in the response body matches the id path parameter specified in the endpoint.

    Examples:
      | id | title            | coupon_code      | coupon_type | start_date | end_date   | discount | discount_type | minimum_shopping | maximum_discount | is_expire | is_multiple_buy |
      | 72 | newUpdate_Coupon | project_added_id | 007         | 2028-08-28 | 2024-03-30 | 10       | 5             | 1                | 30               | 1         | 1               |


  Scenario Outline:When a PATCH request body containing valid authorization information and an incorrect (non-existent in the system) coupon ID,
  along with necessary data (title, coupon_code, coupon_type, start_date, end_date, discount, discount_type,minimum_shopping, maximum_discount, is_expire, is_multiple_buy),
  is sent to the /api/coupon/couponUpdate/{id} endpoint, the returned status code should be 404,
  and the message information in the response body should be verified as "coupon not found".

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/coupon/couponUpdate/<id>" path parameters
    * The api user prepares a PATCH request containing the "<title>" "<coupon_code>" <coupon_type> "<start_date>" "<end_date>" <discount> <discount_type> <minimum_shopping> <maximum_discount> <is_expire> <is_multiple_buy> data to send to the api coupon couponUpdate endpoint.
    * The api user records the response from the api coupon couponUpdate endpoint, verifying that the status code is '404' and the reason phrase is coupon not found.

    Examples:
      | id  | title             | coupon_code | coupon_type | start_date | end_date   | discount | discount_type | minimum_shopping | maximum_discount | is_expire | is_multiple_buy |
      | 100 | updateCoupon_id72 | ordered_72  | 5           | 2028-03-30 | 2024-03-30 | 15       | 5             | 1                | 30               | 0         | 0               |


  Scenario Outline: When a PATCH request body containing invalid authorization information, along with the coupon ID to be updated and necessary data
  (title, coupon_code, coupon_type, start_date, end_date, discount, discount_type, minimum_shopping, maximum_discount, is_expire, is_multiple_buy),
  is sent to the /api/coupon/couponUpdate/{id} endpoint, the returned status code should be 401,
  and the message information in the response body should be verified as "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token
    * The api user sets "api/coupon/couponUpdate/<id>" path parameters
    * The api user prepares a PATCH request containing the "<title>" "<coupon_code>" <coupon_type> "<start_date>" "<end_date>" <discount> <discount_type> <minimum_shopping> <maximum_discount> <is_expire> <is_multiple_buy> data to send to the api coupon couponUpdate endpoint.
    * The api user records the response from the api coupon couponUpdate endpoint, verifying that the status code is '401' and the reason phrase is Unauthenticated.

    Examples:
      | id | title            | coupon_code      | coupon_type | start_date | end_date   | discount | discount_type | minimum_shopping | maximum_discount | is_expire | is_multiple_buy |
      | 72 | newUpdate_Coupon | project_added_id | 007         | 2028-08-28 | 2024-03-30 | 10       | 5             | 1                | 30               | 1         | 1               |


  Scenario Outline:The updated_Id information in the response body from the /api/coupon/couponUpdate/{id} endpoint
  should be verified to be identical to the id path parameter written in the /api/coupon/couponUpdate/{id} endpoint.

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/coupon/couponDetails" path parameters
    * The api user prepares a GET request containing the  <id> for which details are to be accessed
    * The api user sends a GET request and saves the response returned from the api coupon CouponDetails endpoint.
    * The api user verifies that the title information in the response body is "<title>".

    Examples:
      | id | title            |
      | 72 | newUpdate_Coupon |