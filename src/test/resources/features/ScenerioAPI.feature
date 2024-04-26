Feature: As an administrator, I want to be able to List/Create/Update/Delete FAQ records via API connection.

#  Getting the List of All FAQs
  @SC
  Scenario: When a GET request with valid authorization information is sent to the /api/faqList endpoint the returned status code should be verified as 200, and the message in the response body should be verified as "success".
    * The api user constructs the base url with the "admin" token
    * The api user sets "api/faqsList" path parameters
    * The api user sends the "get" request and saves the "response"
    * The api user verifies that for "get" request type the status code is 200 and the message information in the response body is "success"

#  Creating a new FAQ
  @SC
  Scenario: When a POST request containing valid authorization credentials and necessary information (title, description) is sent to the /api/faqsAdd endpoint, the expected status code returned should be 201, and the message in the response body should confirm: "Faqs added successfully".
    * The api user constructs the base url with the "admin" token
    * The api user sets "api/faqsAdd" path parameters
    * The api user adds a key field "title" with the value "newFaqTitle" to the request body
    * The api user adds a key field "description" with the value "newFaqDescription" to the request body
    * The api user sends the "post" request and saves the "Response"
    * The api user verifies that for "post" request type the status code is 201 and the message information in the response body is "Faqs added successfully"

#  Verifying of Creation a new FAQ
  @SC
  Scenario: The creation of the new FAQ record via the API should be verified through the API itself by sending a GET request to the /api/faqsDetails endpoint with the added_item_id returned in the response body.
    * The api user constructs the base url with the "admin" token
    * The api user sets "api/faqsDetails" path parameters
    * The api user adds a key field "id" with the value "added_item_id" to the request body
    * The api user sends the "getbody" request and saves the "Response"
    * The api user verifies that "added_item_id" returned in the response body by sending a GET request to the "faqsDetails" endpoint

#  Updating FAQs
  @SC
  Scenario Outline: When a PATCH request containing valid authorization credentials, the FAQ id to be updated, and the updated information of the FAQ (title, description) is sent to the /api/faqsUpdate/{id} endpoint, the expected status code returned should be 202, and the message in the response body should confirm: "faqs updated successfully".
    * The api user constructs the base url with the "admin" token
    * The api user sets "api/faqsUpdate/<id>" path parameters
    * The api user adds a key field "title" with the value "updatedTitle" to the request body
    * The api user adds a key field "description" with the value "updatedDescription" to the request body
    * The api user sends the "patch" request and saves the "Response"
    * The api user verifies that for "patch" request type the status code is 202 and the message information in the response body is "faqs updated successfully"
    Examples:
      |id |
      |120|

#  Re-Listing All FAQs
  @SC
  Scenario: When a GET request with valid authorization information is sent to the /api/faqList endpoint the returned status code should be verified as 200, and the message in the response body should be verified as "success".
    * The api user constructs the base url with the "admin" token
    * The api user sets "api/faqsList" path parameters
    * The api user sends the "get" request and saves the "response"
    * The api user verifies that for "get" request type the status code is 200 and the message information in the response body is "success"

#  Deleting an existing FAQ
  @SC
  Scenario: When a DELETE request containing valid authorization credentials and the FAQ's id to be deleted is sent to the /api/faqsDelete endpoint, the expected status code returned should be 202, and the message in the response body should confirm: "faqs deleted successfully".
    * The api user constructs the base url with the "admin" token
    * The api user sets "api/faqsList" path parameters
    * The api user detects the id at the last index in the faqList endpoint response
    * The api user constructs the base url with the "admin" token
    * The api user sets "api/faqsDelete" path parameters
    * The api user adds a key field "id" with the value "lastItemId" to the request body
    * The api user sends the "delete" request and saves the "response"
    * The api user verifies that for "delete" request type the status code is 202 and the message information in the response body is "faqs deleted successfully"
