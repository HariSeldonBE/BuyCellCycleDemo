Feature: As an administrator,
  I want to be able to access the details of the FAQ with the specified id number via API connection.

  @Ilteris
  Scenario Outline: When a GET request containing valid authorization credentials
  and the id of the FAQ to be accessed is sent to the /api/faqsDetails endpoint,
  the expected status code returned should be 200,
  and the message in the response body should confirm: "success".

    * The api user constructs the base url with the "admin" token

    * The api user sets "api/faqsDetails" path parameters

    * The api user prepares a GET request containing the  <id> for which details are to be accessed

    * The api user sends the "getbody" request and saves the "Response"

    * The api user verifies that for "getbody" request type the status code is 200 and the message information in the response body is "success"


    * The api user verifies the content of the data <id>, <user_id>, "<title>", "<description>", <status>, "<created_at>", "<updated_at>" in the response body.

    Examples:
      | id | id |user_id  | title                                |description                                                                                            |status| created_at                  | updated_at                  |
      | 2  | 1  | null    | How do I know when my order is here? | A representative will call you as soon as they are at your house to let you know about your delivery. |  1   | 2024-01-22T23:18:58.000000Z | 2024-01-22T23:18:58.000000Z |


  Scenario Outline: When a GET request containing valid authorization information and an incorrect (non-existent in the system)
  refund&reason ID is sent to the /api/refundReasonDetails endpoint, the returned status code should be 404,
  and the message information should be validated as "refund Reason  not found".

    * The api user constructs the base url with the "admin" token

    * The api user sets "api/faqsDetails" path parameters

    * The api user prepares a GET request containing the  <id> for which details are to be accessed

    * The api user sends the "getbody" request and saves the "Response"

    * The api user verifies that for "getbody" request type the status code is 404 and the message information in the response body is "Faqs not found"


    Examples:
      | id |
      | 20 |


  Scenario Outline: When a GET request body containing invalid authorization information and the refund&reason ID to access
  detailed information is sent to the /api/refundReasonDetails endpoint, the returned status code should be 401,
  and the message information in the response body should be validated as "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token
    # APi kullanicisi "invalid" token ile base urli olusturur
    * The api user sets "api/refundReasonDetails" path parameters
    # APi kullanicisi "api/refundReasonDetails" path parametrelerini olustur
    * The api user prepares a GET request containing the  <id> for which details are to be accessed
    # Api kullanicisi api refundReasonDetails endpointine gondermek icin detaylarina erisilmek istenen refund reason idsini iceren bir get request hazirlar
    * The API user records the response from the api refundReasonDetails endpoint, confirming that the status code is '401' and the reason phrase is Unauthorized.
    # Api kullanicisi api refundReasonDetails endpointinden donen responsei kaydeder, status code '401' ve reason phrase Unauthorized oldugunu dogrular
    * The api user verifies that for "getbody" request type the status code is 200 and the message information in the response body is "success"
    Examples:
      | id |
      | 1  |