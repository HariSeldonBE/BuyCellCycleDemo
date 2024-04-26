Feature: As an administrator, I want to be able to delete Refund&Reason information with the specified ID number
  via the API connection.

  @26/1
  Scenario Outline: When a DELETE body containing valid authorization information and the department ID
  to be deleted is sent to the /api/departmentDelete endpoint, the returned status code should be 202,
  and the message information in the response body should be verified as "department deleted successfully".


    * The api user constructs the base url with the "admin" token
    * The api user sets "api/departmentDelete" path parameters
    * The api user prepares a GET request containing the  <id> for which details are to be accessed
    * The api user sends the "delete" request and saves the "Response"
    * The api user verifies that the message information in the response body is "department deleted successfully"

    Examples:
      | id  |
      | 128 |
  @26/2
  Scenario Outline: When a DELETE body containing valid authorization information and an incorrect (non-existent in the system)
  department ID is sent to the /api/departmentDelete endpoint, the returned status code should be 404,
  and the message information in the response body should be verified as "department not found".


    * The api user constructs the base url with the "admin" token
    * The api user sets "api/departmentDelete" path parameters
    * The api user prepares a GET request containing the  <id> for which details are to be accessed
    * The api user verifies that for "delete" request type the status code is 404 and the message information in the response body is "Not Found"

    Examples:
      | id |
      | 128 |

  @26/3
  Scenario Outline: When a DELETE body containing invalid authorization information and the department ID
  to be deleted is sent to the /api/departmentDelete endpoint, the returned status code should be 401,
  and the message information in the response body should be verified as "Unauthenticated.".


    * The api user constructs the base url with the "invalid" token
    * The api user sets "api/departmentDelete" path parameters
    * The api user prepares a GET request containing the  <id> for which details are to be accessed
    * The api user verifies that for "delete" request type the status code is 401 and the message information in the response body is "Unauthorized"

    Examples:
      | id |
      | 25 |

  @26/4
  Scenario Outline: The Deleted_Id information in the response body from the /api/departmentDelete endpoint should be verified
  to be identical to the id information in the DELETE request body sent to the /api/departmentDelete endpoint.


    * The api user constructs the base url with the "admin" token
    * The api user sets "api/departmentDetails" path parameters
    * The api user prepares a GET request containing the  <id> for which details are to be accessed
    * The api user verifies that the Deleted id information in the response body is the same as the id information in the request body.

    Examples:
      | id |
      | 128 |

  @26/5
  Scenario Outline: The deletion of the department record via the API should be validated from the API itself.
  (The deletion of the record can be confirmed by sending a GET request to the /api/departmentDetails endpoint
  with the Deleted_Id returned in the response body.)"



    * The api user constructs the base url with the "admin" token
    * The api user sets "api/departmentDetails" path parameters
    * The api user prepares a GET request containing the  <id> for which details are to be accessed
    * The api user sends the DELETE request and saves the response returned from the api refundReasonDelete endpoint.
    * The api user verifies that the message information in the response body is "department not found"



    Examples:
      | id |
      | 118 |



