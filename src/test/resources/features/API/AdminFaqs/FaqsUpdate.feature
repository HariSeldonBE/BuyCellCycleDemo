Feature: As an administrator, I want to be able to update the information
of the FAQ record with the specified FAQ id via API connection.

  @HS
  Scenario Outline:  When a PATCH request containing valid authorization credentials, the FAQ id to be updated, and the
  updated information of the FAQ (title) is sent to the /api/faqsUpdate/{id} endpoint, the expected status code returned
  should be 202, and the message in the response body should confirm: "faqs updated successfully".

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/faqsUpdate/<id>" path parameters
    * The api user adds a key field "title" with the value "updatedTitle" to the request body
    * The api user sends the "patch" request and saves the "Response"
    * The api user verifies that for "patch" request type the status code is 202 and the message information in the response body is "faqs updated successfully"
    Examples:
      |id |
      |119|



  @SC
  Scenario Outline: When a PATCH request containing valid authorization credentials, the FAQ id to be updated, and
  the updated information of the FAQ (title, description) is sent to the /api/faqsUpdate/{id} endpoint, the expected
  status code returned should be 202, and the message in the response body should confirm: "faqs updated successfully".

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/faqsUpdate/<id>" path parameters
    * The api user adds a key field "title" with the value "updatedTitle" to the request body
    * The api user adds a key field "description" with the value "updatedDescription" to the request body
    * The api user sends the "patch" request and saves the "Response"
    * The api user verifies that for "patch" request type the status code is 202 and the message information in the response body is "faqs updated successfully"
    Examples:
      |id |
      |120|




  @HS
  Scenario Outline: "When a PATCH request containing valid authorization credentials and an incorrect (non-existent in the system)
  FAQ id, along with the updated information of the FAQ (title, description), is sent to the /api/faqsUpdate/{id} endpoint,
  the expected status code returned should be 404, and the message in the response body should confirm: "faqs not found".

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/faqsUpdate/<id>" path parameters
    * The api user adds a key field "title" with the value "updatedTitle" to the request body
    * The api user adds a key field "description" with the value "updatedDescription" to the request body
    * The api user verifies that for "patch" request type the status code is 404 and the message information in the response body is "Not Found"
    Examples:
      | id |
      | 96 |


  @HS
  Scenario Outline: When a PATCH request containing invalid authorization credentials, the FAQ id to be updated, and the
  updated information of the FAQ (title, description) is sent to the /api/faqsUpdate/{id} endpoint, the expected status
  code returned should be 401, and the message in the response body should confirm: "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token
    * The api user sets "api/faqsUpdate/<id>" path parameters
    * The api user adds a key field "title" with the value "updatedTitle" to the request body
    * The api user adds a key field "description" with the value "updatedDescription" to the request body
    * The api user verifies that for "patch" request type the status code is 401 and the message information in the response body is "Unauthorized"
    Examples:
      | id |
      | 120 |

  @HS
  Scenario Outline: The updated_Id information in the response body from the /api/faqsUpdate/{id} endpoint should be
  verified to be the same as the id path parameter specified in the /api/faqsUpdate/{id} endpoint.

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/faqsUpdate/<id>" path parameters
    * The api user adds a key field "title" with the value "updatedTitle" to the request body
    * The api user adds a key field "title" with the value "updatedTitle" to the request body
    * The api user sends the "patch" request and saves the "Response"
    * The api user verifies that for "patch" request type the status code is 202 and the message information in the response body is "faqs updated successfully"
    * The api user verifies that the "updated_Id" information in the response body matches the id path parameter specified in the endpoint.

    Examples:
      | id  |
      | 120 |

  @HS
  Scenario Outline: The update of the FAQ record via the API should be verified through the API
  by sending a GET request to the /api/faqsDetails endpoint with the updated_Id returned in the response.

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/faqsDetails" path parameters
    * The api user adds a key field "id" with the value "updated_Id" to the request body
    * The api user sends the "getbody" request and saves the "Response"
    * The api user verifies the content of the data <id> in the response body at the "api/faqsDetails" endpoint
    Examples:
      |id |
      |120|