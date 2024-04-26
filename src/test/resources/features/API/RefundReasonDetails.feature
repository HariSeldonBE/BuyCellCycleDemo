Feature: As an administrator, I want to access the details of the Refund&Reason with the specified ID number via the
  API connection.


  Scenario Outline: When a GET request body containing valid authorization information and the refund&reason ID to access detailed
  information is sent to the /api/refundReasonDetails endpoint, the returned status code should be 200 and the
  message information in the response body should be verified as "success".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/refundReasonDetails" path parameters
    # APi kullanicisi "api/refundReasonDetails" path parametrelerini olusturur
    * The api user prepares a GET request containing the refund reason <id> for which details are to be accessed, to send to the api refundReasonDetails endpoint.
    # Api kullanicisi api refundReasonDetails endpointine gondermek icin detaylarina erisilmek istenen refund reason idsini iceren bir get request hazirlar
    * The api user sends a GET request and saves the response returned from the api refundReasonDetails endpoint.
    # Api kullanicisi get request gonderir ve api refundReasonDetails endpointinden donen responsei kaydeder
    * The api user verifies that the status code is 200
    # Api kullanicisi status codeun 200 oldugunu dogrular
    * The api user verifies that the message information in the response body is "success"
    # Api kullanicisi response bodydeki message bilgisinin "success" oldugunu dogrular
    * The api user verifies the content of the data <id>, "<reason>", "<created_at>", "<updated_at>" in the response body.
    # API kullanicisi response bodydeki data <id>, "<reason>", "<created_at>", "<updated_at>"  içeriklerini doğrular.

    Examples:
      | id | id | reason           | created_at                  | updated_at                  |
      | 1  | 1  | Product mismatch | 2024-01-22T23:19:00.000000Z | 2024-01-22T23:19:00.000000Z |


  Scenario Outline: When a GET request containing valid authorization information and an incorrect (non-existent in the system)
  refund&reason ID is sent to the /api/refundReasonDetails endpoint, the returned status code should be 404,
  and the message information should be validated as "refund Reason  not found".

    * The api user constructs the base url with the "admin" token.
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/refundReasonDetails" path parameters
    # APi kullanicisi "api/refundReasonDetails" path parametrelerini olusturur
    * The api user prepares a GET request containing the refund reason <id> for which details are to be accessed, to send to the api refundReasonDetails endpoint.
    # Api kullanicisi api refundReasonDetails endpointine gondermek icin detaylarina erisilmek istenen refund reason idsini iceren bir get request hazirlar
    * The API user records the response from the api refundReasonDetails endpoint, verifying that the status code is '404' and the reason phrase is Not Found.
    # Api kullanicisi api refundReasonDetails endpointinden donen responsei kaydeder, status code '404' ve reason phrase Not Found oldugunu dogrular

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
    * The api user prepares a GET request containing the refund reason <id> for which details are to be accessed, to send to the api refundReasonDetails endpoint.
    # Api kullanicisi api refundReasonDetails endpointine gondermek icin detaylarina erisilmek istenen refund reason idsini iceren bir get request hazirlar
    * The API user records the response from the api refundReasonDetails endpoint, confirming that the status code is '401' and the reason phrase is Unauthorized.
    # Api kullanicisi api refundReasonDetails endpointinden donen responsei kaydeder, status code '401' ve reason phrase Unauthorized oldugunu dogrular

    Examples:
      | id |
      | 1  |