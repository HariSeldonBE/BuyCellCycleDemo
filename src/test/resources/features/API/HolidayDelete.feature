Feature:US_011 As an administrator, I want to be able to delete Refund&Reason information with the specified ID number
  via the API connection.


  @[US_011-TC_001]
  Scenario Outline: When a DELETE request containing valid authorization credentials and the holiday id to be deleted is sent to the /api/holidayDelete endpoint, the expected status code returned should be 202, and the message
  in the response body should confirm: "holiday deleted successfully".

    * The api user constructs the base url with the "admin" token

    * The api user sets "api/holidayDelete" path parameters

    * The api user prepares a GET request containing the  <id> for which details are to be accessed

    * The api user sends the DELETE request and saves the response returned from the api refundReasonDelete endpoint.

    * The api user verifies that the status code is 202

    * The api user verifies that the message information in the response body is "holiday deleted successfully"

    * The api user verifies that the Deleted id information in the response body is the same as the id information in the request body.

    Examples:
      | id |
      | 56 |


  @[US_011-TC_002]

  Scenario Outline:When a DELETE request containing valid authorization credentials and an incorrect (non-existent in the system) holiday id is sent to the /api/holidayDelete endpoint, the expected status code returned should be
  404, and the message in the response body should confirm: "holiday not found".

    * The api user constructs the base url with the "admin" token

    * The api user sets "api/holidayDelete" path parameters

    * The api user prepares a GET request containing the  <id> for which details are to be accessed

    * The API user records the response from the api refundReasonDelete endpoint, confirming that the status code is '404' and the reason phrase is Not Found.



    Examples:
      | id |
      | 641 |

  @[US_011-TC_003]
    Scenario Outline:When a DELETE request containing invalid authorization credentials and the holiday id to be deleted is sent to the /api/holidayDelete endpoint, the expected status code returned should
    be 401, and the message in the response body should confirm: "Unauthenticated.".

      * The api user constructs the base url with the "invalid" token

      * The api user sets "api/holidayDelete" path parameters

      * The api user prepares a GET request containing the  <id> for which details are to be accessed

      * The API user saves the response from the api refundReasonDelete endpoint, verifying that the status code is '401' and the reason phrase is Unauthorized.




      Examples:
        | id |
        | 64 |

  @[US_011-TC_004]


  Scenario Outline:The Deleted_Id information in the response body returned from the /api/holidayDelete endpoint should be verified to be the same as the 'id' information
  in the DELETE request body sent to the /api/holidayDelete endpoint.

    * The api user constructs the base url with the "admin" token

    * The api user sets "api/holidayDelete" path parameters

    * The api user prepares a GET request containing the  <id> for which details are to be accessed


    * The API user records the response from the api refundReasonDetails endpoint, verifying that the status code is '404' and the reason phrase is Not Found.



    Examples:
      | id |
      | 64 |


  Scenario Outline:The deletion of the holiday record via the API should be verified through the API itself.
  (The deletion of the record can be verified by sending a GET request to the /api/holidayDetails endpoint with the Deleted_Id returned in the response body.

    * The api user constructs the base url with the "invalid" token

    * The api user sets "api/holidayDelete" path parameters

    * The api user prepares a GET request containing the  <id> for which details are to be accessed

    * The API user saves the response from the api refundReasonDelete endpoint, verifying that the status code is '401' and the reason phrase is Unauthorized.


    Examples:
      | id |
      | 25 |

