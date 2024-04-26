Feature: As an administrator, I want to be able to access all the country information registered in the system via the API connection.
  @zehra
  Scenario: When a GET request body containing valid authorization credentials is sent to the /api/profile/allCountries endpoint, the returned status code should be validated as 200
  , and the message information in the response body should confirm as "success".

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/profile/allCountries" path parameters
    * The api user sends the "get" request and saves the "Response"
    * The api user verifies that for "get" request type the status code is 200 and the message information in the response body is "success"



  Scenario Outline: When a GET request body containing valid authorization credentials is sent to the /api/profile/allCountries endpoint, the returned response body should be validated to
  confirm that the country with an ID of 223 has the following attributes: "code": "TR" and "name": "Turkey".


    * The api user constructs the base url with the "admin" token
    * The api user sets "api/profile/allCountries" path parameters
    * The api user sends the "get" request and saves the "Response"
    * The api user validates the  confirm that the country with an ID of <id> has the following attributes: "<code>": TR and "<name>": Turkey.

    Examples:
      | id  | code | name   |
      | 223 | TR   | Turkey |


  Scenario Outline: When a GET request body containing invalid authorization credentials is sent to the /api/profile/allCountries endpoint, the returned status
  code should be validated as 401, and the message information in the response body should confirm as "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token
    * The api user sets "api/profile/allCountries" path parameters
    * The api user prepares a GET request containing the  <id> for which details are to be accessed
    * The api user verifies that for "getbody" request type the status code is 401 and the message information in the response body is "Unauthorized"

    Examples:
      | id |
      | 25 |