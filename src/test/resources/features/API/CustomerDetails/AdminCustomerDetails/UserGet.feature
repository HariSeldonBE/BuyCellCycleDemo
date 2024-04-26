Feature: As an administrator, I should be able to access all registered user information via API connection.

  @zehra
  Scenario: When a GET request is sent to the /api/get-users endpoint with valid authorization credentials, the expected status code
  returned should be 200, and the message in the response body should confirm: "success".

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/get-users" path parameters
    * The api user sends the "get" request and saves the "Response"
    * The api user verifies that for "get" request type the status code is 200 and the message information in the response body is "success"


  Scenario Outline: When a GET request is sent to the /api/get-users endpoint with valid authorization credentials, the information returned in the response body for the user with id(x) should be validated,
  including fields such as first_name, username, email, name.

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/get-users" path parameters
    * The api user sends the "get" request and saves the "Response"
    * The api user validates the <id>, "<first_name>", "<username>", "<email>", "<name>" of the response body with index <dataIndex>.

    Examples:
      | dataIndex|id | first_name |username| email                | name |
      | 0        |1  | Super      |0181    |info@buysellcycle.com |Super |


  Scenario: When a GET request is sent to the /api/get-users endpoint with invalid authorization credentials,
  the expected status code returned should be 401, and the message in the response body should confirm: "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token
    * The api user sets "api/get-users" path parameters
    * The api user verifies that for "get" request type the status code is 401 and the message information in the response body is "Unauthorized"

