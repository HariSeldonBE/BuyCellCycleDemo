Feature:US_038 As an administrator, I want to be able to access the state information registered in the system with the specified country_id via the API connection.

  @[US_038-TC_001]



  Scenario Outline:When a GET request body containing valid authorization credentials and the desired country id to access state information is sent to the /api/profile/countryStates endpoint, the returned status code should be validated as 200, and the message information in the response body should confirm as "success".


    * The api user constructs the base url with the "admin" token

    * The api user sets "api/profile/countryStates" path parameters

    * The api user prepares a GET request containing the  <id> for which details are to be accessed


    * The API user sends a GET request and records the response .

    * The api user verifies that the status code is 200

    * The api user verifies that the message information in the response body is "success"


    Examples:
      | id |
      | 3663 |

  @[US_038-TC_002] #BUG!!!
  Scenario Outline:As an administrator, I want to be able to access the state information registered
  in the system with the specified country_id via the API connection.


    * The api user constructs the base url with the "admin" token

    * The api user sets "api/profile/countryStates" path parameters

    * The api user prepares a GET request containing the  <id> for which details are to be accessed

    * The API user sends a GET request and records the response .

    * The api user validates the <id> , "<name>"  of the response body


    Examples:
      | id |id    |name  |
      | 223        | 3669 |Ankara|

  @[US_038-TC_003]
  Scenario Outline:When a GET request body containing valid authorization credentials and an incorrect (not found in the system) country id is sent to the /api/profile/countryStates endpoint, the returned status code should be validated as 404, and the message
  information in the response body should confirm as "address not found".


    * The api user constructs the base url with the "admin" token

    * The api user sets "api/profile/countryStates" path parameters

    * The api user prepares a GET request containing the  <id> for which details are to be accessed

    * The API user records the response , verifying that the status code is '404' and message coupon not found.

    Examples:
      | id |
      | 1000 |


  @[US_038-TC_004]

  Scenario Outline: When a GET request body containing invalid authorization credentials and the desired country id to access state information is sent to the /api/profile/countryStates endpoint, the returned status code should be validated as 401, and the message
  information in the response body should confirm as "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token

    * The api user sets "api/profile/countryStates" path parameters

    * The api user prepares a GET request containing the  <id> for which details are to be accessed

    * The API user records the response , confirming that the status code is '401' and the message is Unauthorized.

    Examples:
      | id |
      | 3669 |

