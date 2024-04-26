Feature: As an administrator, I want to be able to access coupon information via the API connection.

  @simge271
  Scenario:  When a GET request body containing valid authorization information is sent to the /api/coupon/couponList endpoint,
  the returned status code should be 200, and the message information should be verified as "success".

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/coupon/couponList" path parameters
    * The api user sends the "get" request and saves the "Response"
    * The api user verifies that for "get" request type the status code is 200 and the message information in the response body is "success"
  @272
  Scenario Outline:  When a GET request containing valid authorization information is sent to the /api/departmentList endpoint,
  the information returned in the response body for the department with ID 'x' should be validated, including the fields name and details.

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/coupon/couponList" path parameters
    * The api user sends the "get" request and saves the "Response"
    * The api user verifies the content of data <id> "<title>" "<coupon_code>" "<start_date>" "<end_date>" in the response body
    Examples:
     |id | title    | coupon_code |start_date |end_date  |
     |1  | Orderder | ordered      |2021-02-26 |2025-03-30|
  @simge273
  Scenario:  When a GET request body containing invalid authorization information is sent to the /api/coupon/couponList endpoint,
  the returned status code should be 401, and the message information should be verified as "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token
    * The api user sets "api/coupon/couponList" path parameters
    * The api user verifies that for "get" request type the status code is 401 and the message information in the response body is "Unauthorized"
