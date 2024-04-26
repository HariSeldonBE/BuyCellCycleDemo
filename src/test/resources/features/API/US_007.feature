Feature: As an administrator I should be able to access holiday data for staff members via API.

  @7/1
  Scenario: When a GET request is sent to the /api/holidayList endpoint with valid authorization credentials,
  the expected status code returned should be 200,
  and the message in the response body should confirm: "success".

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/holidayList" path parameters
    * The api user sends the "get" request and saves the "Response"
    * The api user verifies that for "get" request type the status code is 200 and the message information in the response body is "success"


  @7/2
  Scenario Outline: When a GET request is sent to the /api/holidayList endpoint with valid authorization credentials,
  the information returned in the response body for the holiday with id(x) should be validated,
  including fields such as year and name.

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/holidayList" path parameters
    * The api user sends the "get" request and saves the "Response"
    * The api user verifies the content of the data <id>, "<year>", "<name>", in the response body.

    Examples:
      | id | year | name                                       |
      | 2  | 2025 | Spring |


  @7/3
  Scenario: When a GET request is sent to the /api/holidayList endpoint with valid authorization credentials,
  the expected status code returned should be 200,
  and the message in the response body should confirm: "success".

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/holidayList" path parameters
    * The api user sends the "get" request and saves the "Response"
    * The api user verifies that the status code is 200
    * The api user verifies that for "get" request type the status code is 200 and the message information in the response body is "success"






