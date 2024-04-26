Feature:As an administrator, I want to be able to access detailed information about the
  department with the specified ID number via the API connection.


  @23/1
  Scenario Outline: When a GET request body containing valid authorization information and the department ID
  to access detailed information is sent to the /api/departmentDetails endpoint,
  the returned status code should be 200, and the message information should be verified as "success".

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/departmentDetails" path parameters
    * The api user prepares a GET request containing the  <id> for which details are to be accessed
    * The api user sends the "getbody" request and saves the "Response"
    * The api user verifies that for "getbody" request type the status code is 200 and the message information in the response body is "success"

    Examples:
      | id |
      | 1  |


  @23/2
  Scenario Outline: When a GET request body containing valid authorization information and the department ID
  to access detailed information is sent to the /api/departmentDetails endpoint, the data
  (id, name ,details, status, cerated_at, updated_at) in the returned response body should be validated.

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/departmentDetails" path parameters
    * The api user prepares a GET request containing the  <id> for which details are to be accessed
    * The api user sends the "get" request and saves the "Response"
    * The api user verifies that for "getbody" request type the status code is 200 and the message information in the response body is "success"
    * The api user verifies the content of the data <id>, "<name>", <status>, "<details>", "<created_at>", "<updated_at>" in the response body.

    Examples:
      | id | id | name  | status | details          | created_at | updated_at |
      | 1  | 1  | Sales | 1      | Sales Department |            |            |

  @23/3
  Scenario Outline: When a GET request body containing valid authorization information and an incorrect
  (non-existent in the system) department ID is sent to the /api/departmentDetails endpoint,
  the returned status code should be 404, and the message information should be verified as
  "department not found".

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/departmentDetails" path parameters
    * The api user prepares a GET request containing "department" <id> to send to the api "departmentDetails" endpoint.
    * The api user verifies that for "getbody" request type the status code is 404 and the message information in the response body is "Not Found"


    Examples:

      | id  |
      | 777 |

  @23/4
  Scenario Outline: When a GET request body containing invalid authorization information and the department ID
  to access detailed information is sent to the /api/departmentDetails endpoint,
  the returned status code should be 401, and the message information should be verified as "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token
    * The api user sets "api/departmentDetails" path parameters
    * The api user prepares a GET request containing "department" <id> to send to the api "departmentDetails" endpoint.
    * The api user verifies that for "get" request type the status code is 401 and the message information in the response body is "Unauthorized"

    Examples:

      | id |
      | 1  |


