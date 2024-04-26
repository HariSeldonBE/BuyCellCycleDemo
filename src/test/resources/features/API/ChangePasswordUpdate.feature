Feature:US_004 As a user, I should be able to edit my user information via API connection.



  @[US_004-TC_001]

  Scenario Outline:When a POST request with valid authorization credentials and correct data (old_password, password, password_confirmation) is sent to the /api/change-password endpoint, the expected status code returned should be 200, and the message
  in the response body should confirm: "password change successfully".

    * The api user constructs the base url with the "customer" token

    * The api user sets "api/change-password" path parameters

    * The api user prepares a POST request containing the "<old_password>" "<password>" "<password_confirmation>" information to send to the api holidayAdd endpoint.

    * The api user sends the "post" request and saves the "Response"

    * The api user verifies that for "post" request type the status code is 200 and the message information in the response body is "password change successfully"

    Examples:
      | old_password | password         | password_confirmation       |
      | 123123123 | 12345678 | 12345678 |


  @[US_004-TC_002]


  Scenario Outline:When a POST request with valid authorization credentials and incorrect old_password information is sent to the /api/change-password endpoint (old_password, password, password_confirmation), the expected status code returned should be 409,
  and the message in the response body should confirm: "Invalid Credintials.".


    * The api user constructs the base url with the "customer" token

    * The api user sets "api/change-password" path parameters

    * The api user prepares a POST request containing the "<old_password>" "<password>" "<password_confirmation>" information to send to the api holidayAdd endpoint.

    * The api user sends the "post" request and saves the "Response"

    * The api user verifies that for "post" request type the status code is 409 and the message information in the response body is "Invalid Credintials."




    Examples:
      | old_password | password         | password_confirmation       |
      | 1111111111 | 12345678 | 12345678 |


  @[US_004-TC_003]

  Scenario Outline:When a POST request with valid authorization credentials and mismatched password and password_confirmation information is sent to the /api/change-password endpoint (old_password, password, password_confirmation), the expected status code returned should be 422,
  and the message in the response body should confirm: "The password confirmation does not match.".


    * The api user constructs the base url with the "customer" token

    * The api user sets "api/change-password" path parameters

    * The api user prepares a POST request containing the "<old_password>" "<password>" "<password_confirmation>" information to send to the api holidayAdd endpoint.

    * The api user sends the "post" request and saves the "Response"

    * The api user verifies that for "post" request type the status code is 422 and the message information in the response body is "The password confirmation does not match."

    Examples:
      | old_password | password         | password_confirmation       |
        | 123123123 | 12345678 | 11111111 |



  @[US_004-TC_004]

  Scenario Outline:When a POST request with invalid authorization credentials and correct data (old_password, password, password_confirmation) is sent to the /api/change-password endpoint, the expected status code returned
  should be 401, and the message in the response body should confirm: "Unauthenticated.".


    * The api user constructs the base url with the "invalid" token

    * The api user sets "api/change-password" path parameters

    * The api user prepares a POST request containing the "<old_password>" "<password>" "<password_confirmation>" information to send to the api holidayAdd endpoint.

    * The api user sends the "post" request and saves the "Response"

    * The api user verifies that for "post" request type the status code is 401 and the message information in the response body is "Unauthorized"

    Examples:
      | old_password | password         | password_confirmation       |
      | 123123123 | 12345678 | 12345678 |
