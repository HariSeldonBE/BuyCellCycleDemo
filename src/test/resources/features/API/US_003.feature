@US_3
Feature: As a user, I should be able to access the financial information of the customer via API connection.

  Scenario: When a GET request is sent to the /api/profile/get-customer-data endpoint
  with valid authorization credentials, the expected status code returned should be 200,
  and the message in the response body should confirm: "success".

    * The api user constructs the base url with the "customer" token
    * The api user sets "api/profile/get-customer-data" path parameters
    * The api user sends the "get" request and saves the "Response"
    * The api user verifies that for "get" request type the status code is 200 and the message information in the response body is "success"

  Scenario Outline: When a GET request is sent to the /api/profile/get-customer-data endpoint with valid authorization credentials,
  the data returned in the response body (wallet_running_balance, wallet_pending_balance, total_coupon, total_wishlist, total_cancel_order)
  should be validated.

    * The api user constructs the base url with the "customer" token
    * The api user sets "api/profile/get-customer-data" path parameters
    * The api user sends the "get" request and saves the "Response"
    * The api user verifies the content of the data <wallet_running_balance> <wallet_pending_balance> <total_coupon> <total_wishlist> <total_cancel_order> in the response body.

    Examples:
      | wallet_running_balance | wallet_pending_balance | total_coupon | total_wishlist | total_cancel_order |
      | 10                      | 0                      | 0            | 3              | 0                  |

  Scenario: When a GET request is sent to the /api/profile/get-customer-data endpoint with invalid authorization credentials,
  the expected status code returned should be 401, and the message in the response body should confirm: "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token
    * The api user sets "api/profile/get-customer-data" path parameters
    * The api user verifies that for "get" request type the status code is 401 and the message information in the response body is "Unauthorized"
