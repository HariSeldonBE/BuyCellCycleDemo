Feature: As an administrator, I want to be able to delete Refund&Reason information with the specified ID number
  via the API connection.

  @Ilteris
  Scenario Outline: When a DELETE body containing valid authorization credentials and
  the ID of the address to be deleted is sent to the /api/profile/customerDeleteAddress endpoint,
  the returned status code should be validated as 202,
  and the message information in the response body should confirm as "address deleted successfully".

    * The api user constructs the base url with the "customer" token
    * The api user sets "api/profile/customerDeleteAddress" path parameters
    * The api user prepares a GET request containing the  <id> for which details are to be accessed
    * The api user sends the "delete" request and saves the "Response"
    * The api user verifies that the status code is 202
    * The api user verifies that the message information in the response body is "address deleted successfully"
    * The api user verifies that the Deleted id information in the response body is the same as the id information in the request body.
    # Api kullanicisi response body icindeki Deleted Id bilgisinin request body icindeki id bilgisi ile ayni oldugu dogrular

    Examples:
      | id  |
      | 317 |


  Scenario Outline: When a DELETE body containing valid authorization credentials and
  an incorrect (non-existent in the system) address ID is sent to the /api/profile/customerDeleteAddress endpoint,
  the returned status code should be validated as 404,
  and the message information in the response body should confirm as "address not found".

    * The api user constructs the base url with the "customer" token
    * The api user sets "api/profile/customerDeleteAddress" path parameters
    * The api user prepares a GET request containing the  <id> for which details are to be accessed
      #* The api user prepares a "delete" request containing the  <id> for which details are to be accessed
    * The api user verifies that for "delete" request type the status code is 404 and the message information in the response body is "address not found"

    Examples:
      | id  |
      | 999 |


  Scenario Outline: When a DELETE body containing invalid authorization credentials and
  the ID of the address to be deleted is sent to the /api/profile/customerDeleteAddress endpoint,
  the returned status code should be validated as 401,
  and the message information in the response body should confirm as "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token
    * The api user sets "api/profile/customerDeleteAddress" path parameters
    * The api user prepares a GET request containing the  <id> for which details are to be accessed
    * The api user verifies that for "delete" request type the status code is 401 and the message information in the response body is "Unauthorized."

    Examples:
      | id  |
      | 317 |


  Scenario Outline: The deletion of the address record via the API should be confirmed through the API itself.
  (The Deleted_Id returned in the response body can be used to send a GET request to the
  /api/profile/customerDetailsAddress endpoint to confirm that the record has been deleted.)

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/profile/customerDetailsAddress" path parameters
    * The api user prepares a GET request containing the  <id> for which details are to be accessed
    * The API user records the response from the api refundReasonDetails endpoint, verifying that the status code is '404' and the reason phrase is Not Found.

    Examples:
      | id  |
      | 317 |