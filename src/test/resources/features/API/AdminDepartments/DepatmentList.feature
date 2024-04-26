Feature: As an administrator, I want to be able to access departments via the API connection.

  @simge221
  Scenario:  When a GET request containing valid authorization information is sent to the /api/departmentList endpoint,
  the returned status code should be 200, and the message information in the response body should be verified as "success".

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/departmentList" path parameters
    * The api user sends the "get" request and saves the "Response"
    * The api user verifies that for "get" request type the status code is 200 and the message information in the response body is "success"
  @simge222
  Scenario Outline:  When a GET request containing valid authorization information is sent to the /api/departmentList endpoint,
  the information returned in the response body for the department with ID 'x' should be validated, including the fields name and details.

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/departmentList" path parameters
    * The api user sends the "get" request and saves the "Response"
    * The api user verifies the content of data <id> "<name>" "<details>" in the response body
    Examples:
      | id | name  | details        |
      | 1  | Sales |Sales Department|
  @simge223
  Scenario:  When a GET request containing invalid authorization information is sent to the /api/departmentList endpoint,
  the returned status code should be 401, and the message information in the response body should be verified as "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token
    * The api user sets "api/departmentList" path parameters
    * The api user verifies that for "get" request type the status code is 401 and the message information in the response body is "Unauthorized"

