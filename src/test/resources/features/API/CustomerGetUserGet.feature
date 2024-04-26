Feature:US_002 As a user, I should be able to access detailed information about the user who logged into the system via API connection.

  @[US_002-TC_001]

  Scenario Outline:When a GET request is sent to the /api/customerGetUser endpoint with valid authorization credentials, the expected status code returned should be 200, and the message in the response body should confirm: "success".

    * The api user constructs the base url with the "customer" token

    * The api user sets "api/customerGetUser" path parameters

    * The api user prepares a GET request containing the  <id> for which details are to be accessed

    * The api user sends the "getbody" request and saves the "Response"

    * The api user verifies that for "getbody" request type the status code is 200 and the message information in the response body is "success"
    Examples:

      |id |
      |55 |

  @[US_002-TC_002]



  Scenario Outline: When a GET request is sent to the /api/customerGetUser endpoint with valid authorization credentials, the data returned in the response body (first_name, last_name, email) should be validated to match the information of the user who logged into the system.
  (The values provided in the request body during registration at the /api/register endpoint should match the user information (first_name, last_name, email) returned in the response body at the /api/customerGetUser endpoint.).

    * The api user constructs the base url with the "customer" token

    * The api user sets "api/customerGetUser" path parameters

 #  * The api user prepares a GET request containing the  <id> for which details are to be accessed.
    * The api user sends the "get" request and saves the "Response"

      #  * The API user sends a GET request and records the response .
    * The api user verifies the content of the data "<first_name>", "<last_name>", "<email>" in the response body

   # * The api user validates the <id>, "<first_name>", "<last_name>", "<email>" of the response body .

    Examples:

      |id  | first_name               |last_name  |     email                           |
      |96  |Muhammed Yusuf SEVER     |  null      | customer.muhammed@buysellcycle.com  |


  @[US_002-TC_003]

  Scenario Outline:When a GET request is sent to the /api/customerGetUser endpoint with invalid authorization credentials, the expected status code returned should be 401, and the message in the response body should confirm: "Unauthenticated.".
    * The api user constructs the base url with the "invalid" token

    * The api user sets "api/customerGetUser" path parameters

    * The api user prepares a GET request containing the  <id> for which details are to be accessed

    * The api user verifies that for "getbody" request type the status code is 401 and the message information in the response body is "Unauthorized"


    Examples:
      | id |
      | 69 |
