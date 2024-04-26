Feature: As an administrator, I want to be able to update department information with
  the specified ID number via the API connection.
@zehra
  Scenario Outline: When a PATCH request body containing valid authorization information,
  the department ID to be updated, and necessary data (name, details, status) is sent to the
  /api/departmentUpdate/{id} endpoint, the returned status code should be 202,
  and the message information in the response body should be verified as "department updated successfully".

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/departmentUpdate/<id>" path parameters
    * The api user prepares a PATCH request containing the "<name>" data to send to the api.
    * The api user sends the "patch" request and saves the "Response"
    * The api user verifies that for "patch" request type the status code is 202 and the message information in the response body is "department updated successfully"
    * The api user verifies that the updated id information in the response body matches the id path parameter specified in the endpoint.

    Examples:
      | id | name        |
      | 33 | Marketing 2 |

  Scenario Outline: When a PATCH request body containing valid authorization information and an
  incorrect (non-existent in the system) department ID, along with necessary data
  (name, details, status), is sent to the /api/departmentUpdate/{id} endpoint,
  the returned status code should be 404, and the message information in the response body should be
  verified as "department not found".

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/departmentUpdate/<id>" path parameters
    * The api user prepares a PATCH request containing the "<name>" data to send to the api.
    * The api user verifies that for "patch" request type the status code is 404 and the message information in the response body is "Not Found"

    Examples:
      | id  | name        |
      | 133 | Marketing 2 |

  Scenario Outline: When a PATCH request body containing invalid authorization information,
  along with the department ID to be updated and necessary data (name, details, status),
  is sent to the /api/departmentUpdate/{id} endpoint, the returned status code should be 401,
  and the message information in the response body should be verified as "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token
    * The api user sets "api/departmentUpdate/<id>" path parameters
    * The api user prepares a PATCH request containing the "<name>" data to send to the api.
    * The api user verifies that for "patch" request type the status code is 401 and the message information in the response body is "Unauthorized"

    Examples:
      | id | name        |
      | 33 | Marketing 2 |

  Scenario Outline: The update of the desired department record via the API should be confirmed from the API itself.
  (The update of the record can be verified by sending a GET request to the /api/departmentDetails
  endpoint with the updated_Id returned in the response body.)

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/departmentDetails" path parameters
    * The api user prepares a GET request containing the  <id> for which details are to be accessed
    * The api user sends the "getbody" request and saves the "Response"
    * The api user verifies that the reason information in the response body "<nameValue>".

    Examples:
      | id | nameValue   |
      | 33 | Marketing 2 |