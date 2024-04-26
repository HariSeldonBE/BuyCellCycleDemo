Feature: As an administrator, I want to be able to add a new department record via the API connection.

  Scenario Outline: When a POST body containing valid authorization information and necessary data (name, details, status) is sent to the /api/departmentAdd endpoint, the returned status code should be 201, and the message information in the response body should be verified as "department added successfully".

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/departmentAdd" path parameters
    * The api user prepares a POST request containing the "<name>", "<details>", "<staus>" information to send to the api departmentAdd endpoint.
    * The api user sends a GET request and saves the response returned from the api departmentAdd endpoint
    * The api user verifies that the status code is 201
    * The api user verifies that the message information in the response body is "department added successfully"

    Examples:
      | name | details        | staus |
      | HR   | Human Resource | 1     |



   Scenario Outline:The creation of the new department record via the API should be verified from the API itself.
  (The creation of the record can be confirmed by sending a GET request to the /api/departmentDetails endpoint with the added_item_id returned in the response body.)

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/departmentDetails" path parameters
    * The api user prepares a GET request containing the  <id> for which details are to be accessed
    * The API user sends a GET request and records the response .
    * The api user verifies that the message information in the response body is "success"

    Examples:
      | id |
      | 35 |



  Scenario Outline:When a POST body containing invalid authorization information and necessary data (name, details, status) is sent to the /api/departmentAdd endpoint,
  the returned status code should be 401, and the message information in the response body should be verified as "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token
    * The api user sets "api/departmentAdd" path parameters
    * The api user prepares a POST request containing the "<name>", "<details>", "<staus>" information to send to the api departmentAdd endpoint.
    * The api user verifies that the status code is 401
    * The api user verifies that the message information in the response body is "Unauthenticated."

    Examples:
      | name | details        | staus |
      | HR   | Human Resource | 1     |

