Feature: As a user/administrator, I should be able to create a new customer record in the system via API connection.

  Scenario Outline: When a POST body consisting of valid data (first_name,last_name, email, password, password_confirmation, user_type, referral_code)
  is sent to the /api/register endpoint, the expected status code returned should be 201, and the response message should confirm: "Successfully registered".

    * The api user constructs the base url with the "customer" token
    * The api user sets "api/register" path parameters
    * The api user prepares a POST request containing the "<first_name>", "<last_name>", "<password>", "<password_confirmation>", "<user_type>", "<referral_code>","email" information to send to the api register endpoint
    * The api user sends the "post" request and saves the "Response"
    * The api user verifies that for "post" request type the status code is 201 and the message information in the response body is "Successfully registered"

    Examples:
      | first_name  | last_name| password  | password_confirmation| user_type | referral_code |
      | registerApi | TestApi  | 123123123 | 123123123            | customer  | 0101010101    |

  Scenario: The creation of a customer via API should be verified to confirm whether the customer exists in the customer list using API connection.
  (The existence of a customer record can be confirmed by comparing the id returned in the response body of the /api/register endpoint with the customer records
  returned in the response body of the /api/get-users endpoint.)

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/get-users" path parameters
    * The api user sends the "get" request and saves the "Response"
    * The api user verifies the content of the data id in the response body

  Scenario Outline: When a valid POST body containing data fields (first_name, last_name, email, password, password_confirmation, user_type, referral_code) is sent to the /api/register endpoint,
  the data in the response body (first_name, last_name, email) should be verified to match the data sent in the request body.

    * The api user constructs the base url with the "customer" token
    * The api user sets "api/register" path parameters
    * The api user prepares a POST request containing the "<first_name>", "<last_name>", "<password>", "<password_confirmation>", "<user_type>", "<referral_code>","email" information to send to the api register endpoint
    * The api user sends the "post" request and saves the "Response"
    * The api user verifies the content of the data "<first_name>", "<last_name>", "email" in the response body
    Examples:
      | first_name  | last_name| password  | password_confirmation| user_type | referral_code |
      | registerApi | TestApi  | 123123123 | 123123123            | customer  | 0101010101    |


  Scenario Outline: When an invalid email (an existing email) from the data is sent in the POST body (first_name, last_name, email, password, password_confirmation, user_type, referral_code) to the /api/register endpoint,
  the expected status code returned should be 422, and the response message should confirm: "The email has already been taken.".

    * The api user constructs the base url with the "customer" token
    * The api user sets "api/register" path parameters
    * The api user prepares a POST request containing the "<first_name>", "<last_name>", "<password>", "<password_confirmation>", "<user_type>", "<referral_code>","invalidEmail" information to send to the api register endpoint
    * The api user sends the "post" request and saves the "Response"
    * The api user verifies that for "post" request type the status code is 422 and the message information in the response body is "The email has already been taken."
    Examples:
      | first_name  | last_name| password  | password_confirmation| user_type | referral_code |
      | registerApi | TestApi  | 123123123 | 123123123            | customer  | 0101010101    |

  Scenario Outline: When a POST body with incomplete data (missing email) consisting of (first_name, last_name, email, password, password_confirmation, user_type, referral_code) is sent to the /api/register endpoint,
  the expected status code returned should be 422, and the response message should confirm: "The email field is required.".

    * The api user constructs the base url with the "customer" token
    * The api user sets "api/register" path parameters
    * The api user prepares a POST request containing the "<first_name>", "<last_name>", "<password>", "<password_confirmation>", "<user_type>", "<referral_code>","missingEmail" information to send to the api register endpoint
    * The api user sends the "post" request and saves the "Response"
    * The api user verifies that for "post" request type the status code is 422 and the message information in the response body is "The email field is required."
    Examples:
      | first_name  | last_name| password  | password_confirmation| user_type | referral_code |
      | registerApi | TestApi  | 123123123 | 123123123            | customer  | 0101010101    |

  Scenario Outline: When a POST body with incomplete data (missing password) consisting of (first_name, last_name, email, password, password_confirmation, user_type, referral_code) is sent to the /api/register endpoint,
  the expected status code returned should be 422, and the response message should confirm: "The password field is required.".

    * The api user constructs the base url with the "customer" token
    * The api user sets "api/register" path parameters
    * The api user prepares a POST request containing the "<first_name>", "<last_name>", "<password>", "<password_confirmation>", "<user_type>", "<referral_code>","email" information to send to the api register endpoint
    * The api user sends the "post" request and saves the "Response"
    * The api user verifies that for "post" request type the status code is 422 and the message information in the response body is "The password field is required."
    Examples:
      | first_name  | last_name| password  | password_confirmation| user_type | referral_code |
      | registerApi | TestApi  |           | 123123123            | customer  | 0101010101    |

  Scenario Outline: When a POST body containing mismatched password and password_confirmation is sent to the /api/register endpoint (first_name, last_name, email, password, password_confirmation, user_type, referral_code),
  the expected status code returned should be 422, and the response message should confirm: "The password confirmation does not match.".

    * The api user constructs the base url with the "customer" token
    * The api user sets "api/register" path parameters
    * The api user prepares a POST request containing the "<first_name>", "<last_name>", "<password>", "<password_confirmation>", "<user_type>", "<referral_code>","email" information to send to the api register endpoint
    * The api user sends the "post" request and saves the "Response"
    * The api user verifies that for "post" request type the status code is 422 and the message information in the response body is "The password confirmation does not match."
    Examples:
      | first_name  | last_name| password  | password_confirmation| user_type | referral_code |
      | registerApi | TestApi  | 11111111  | 123123123            | customer  | 0101010101    |

  Scenario Outline: When a POST body containing a password with fewer than 8 characters is sent to the /api/register endpoint (first_name, last_name, email, password, password_confirmation, user_type, referral_code),
  the expected status code returned should be 422, and the response message should confirm: "The password field minimum 8 character.".

    * The api user constructs the base url with the "customer" token
    * The api user sets "api/register" path parameters
    * The api user prepares a POST request containing the "<first_name>", "<last_name>", "<password>", "<password_confirmation>", "<user_type>", "<referral_code>","email" information to send to the api register endpoint
    * The api user sends the "post" request and saves the "Response"
    * The api user verifies that for "post" request type the status code is 422 and the message information in the response body is "The password field minimum 8 character."
    Examples:
      | first_name  | last_name| password  | password_confirmation| user_type | referral_code |
      | registerApi | TestApi  | 123123    | 123123               | customer  | 0101010101    |
