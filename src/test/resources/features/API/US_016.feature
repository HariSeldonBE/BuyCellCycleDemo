@US_16
Feature: As an administrator, I want to be able to delete the record specified by the FAQ's id via the API connection.

  # US_14_post faqs request steps
  Scenario: When a POST request containing valid authorization credentials and necessary information
  (title, description) is sent to the /api/faqsAdd endpoint, the expected status code returned should be 201,
  and the message in the response body should confirm: "Faqs added successfully".

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/faqsAdd" path parameters
    * The api user adds a key field "title" with the value "newFaqTitle" to the request body
    * The api user adds a key field "description" with the value "newFaqDescription" to the request body
    * The api user sends the "post" request and saves the "Response"
    * The api user verifies that for "post" request type the status code is 201 and the message information in the response body is "Faqs added successfully"

  Scenario Outline: When a DELETE request containing valid authorization credentials and the FAQ's id to be deleted is sent to the /api/faqsDelete endpoint,
  the expected status code returned should be 202, and the message in the response body should confirm: "faqs deleted successfully".

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/faqsDelete" path parameters
    * The api user prepares a GET request containing the  <id> for which details are to be accessed
    * The api user sends the "delete" request and saves the "Response"
    * The api user verifies that for "delete" request type the status code is 202 and the message information in the response body is "faqs deleted successfully"
    * The api user verifies that the Deleted id information in the response body is the same as the id information in the request body.

    Examples:
      | id |
      | 190 |

  Scenario Outline: When a DELETE request containing valid authorization credentials and an incorrect
  (non-existent in the system) FAQ's id is sent to the /api/faqsDelete endpoint, the expected status code returned should be 404,
  and the message in the response body should confirm: "faqs not found".

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/faqsDelete" path parameters
    * The api user prepares a GET request containing the  <id> for which details are to be accessed
    * The api user verifies that for "delete" request type the status code is 404 and the message information in the response body is "Not Found"

    Examples:
      | id  |
      | 300 |

  Scenario Outline: When a DELETE request containing invalid authorization credentials and
  the FAQ's id to be deleted is sent to the /api/faqsDelete endpoint,
  the expected status code returned should be 401, and the message in the response body should confirm: "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token
    * The api user sets "api/faqsDelete" path parameters
    * The api user prepares a GET request containing the  <id> for which details are to be accessed
    * The api user verifies that for "delete" request type the status code is 401 and the message information in the response body is "Unauthorized"

    Examples:
      | id |
      | 189 |

  Scenario Outline: The deletion of the desired FAQ record via the API should be verified within the API itself.
  (The deletion of the record can be verified by sending a GET request to the
  /api/faqsDetails endpoint with the Deleted_Id returned in the response body.)

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/faqsDetails" path parameters
    * The api user prepares a GET request containing the  <id> for which details are to be accessed
    * The api user verifies that for "delete" request type the status code is 404 and the message information in the response body is "faqs deleted successfully"

    Examples:
      | id |
      | 190 |