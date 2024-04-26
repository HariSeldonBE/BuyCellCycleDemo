Feature: As a user, I want to add a new address record to my profile via API connection

  @zehra

  Scenario Outline: When a valid POST body containing authorization credentials and necessary data
  (name, email, address, phone, city, state, country, postal_code, address_type) is sent to the
  /api/profile/address-store endpoint, the returned status code should be validated as 201,
  and the message information in the response body should confirm as "address added successfully".

    * The api user constructs the base url with the "customer" token
    * The api user sets "api/profile/address-store" path parameters
    * The api user prepares a POST request containing the "<name>","<email>","<address>","<phone>","<city>","<state>","<country>","<postal_code>","<address_type>" information to send to the api.
    * The api user sends the "post" request and saves the "Response"
    * The api user verifies that for "post" request type the status code is 201 and the message information in the response body is "address added successfully"

    Examples:
      | name  | email       | address | phone    | city     | state           | country | postal_code | address_type |
      | zehra | zehra@zd.zd | Günesli | 55555555 | Istanbul | Istanbul Avrupa | Turkey  | 34212       | 34           |


  Scenario Outline: The creation of the new address record via the API should be verified through the API itself.
  (The creation of the record can be confirmed by sending a GET request to the
  /api/profile/customerDetailsAddress endpoint with the added_item_id returned in the response body.)

    * The api user constructs the base url with the "customer" token
    * The api user sets "api/profile/customerDetailsAddress" path parameters
    * The api user prepares a GET request containing the  <id> for which details are to be accessed
    * The api user sends the "getbody" request and saves the "Response"
    * The api user verifies that for "getbody" request type the status code is 200 and the message information in the response body is "success"

    Examples:
      | id  |
      | 404 |

  Scenario Outline: When a valid authorization information and an invalid email (not containing '@')
  are sent in the POST body (name, email, address, phone, city, state, country, postal_code, address_type)
  to the /api/profile/address-store endpoint, the expected status code to return is 422,
  and the message in the response body should confirm that "The email must be a valid email address.".

    * The api user constructs the base url with the "customer" token
    * The api user sets "api/profile/address-store" path parameters
    * The api user prepares a POST request containing the "<name>","<email>","<address>","<phone>","<city>","<state>","<country>","<postal_code>","<address_type>" information to send to the api.
    * The api user sends the "post" request and saves the "Response"
    * The api user verifies that for "post" request type the status code is 422 and the message information in the response body is "The email must be a valid email address."

    Examples:
      | name  | email       | address | phone    | city     | state           | country | postal_code | address_type |
      | zehra | zehrazd.zd | Günesli | 55555555 | Istanbul | Istanbul Avrupa | Turkey  | 34212       | 34           |




  Scenario Outline: When an invalid POST body containing necessary data (name, email, address, phone,
  city, state, country, postal_code, address_type) and invalid authorization credentials are sent to the /api/profile/address-store endpoint, the returned status code should be validated as 401,
  and the message information in the response body should confirm as "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token
    * The api user sets "api/profile/address-store" path parameters
    * The api user prepares a POST request containing the "<name>","<email>","<address>","<phone>","<city>","<state>","<country>","<postal_code>","<address_type>" information to send to the api.
    * The api user sends the "post" request and saves the "Response"
    * The api user verifies that for "post" request type the status code is 401 and the message information in the response body is "Unauthorized"

    Examples:
      | name  | email       | address | phone    | city     | state           | country | postal_code | address_type |
      | zehra | zehra@zd.zd | Günesli | 55555555 | Istanbul | Istanbul Avrupa | Turkey  | 34212       | 34           |
