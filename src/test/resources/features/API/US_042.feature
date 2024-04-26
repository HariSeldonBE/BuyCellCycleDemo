Feature: As an administrator, I want to be able to add a new address record for a customer specified by customer_id via the API connection.

  @42/1
  Scenario Outline:When a POST body containing valid authorization credentials and necessary data
  (customer_id, name, email, address, phone, city, state, country, postal_code, address_type)
  is sent to the /api/profile/addressAdd endpoint, the returned status code should be validated as 201,
  and the message information in the response body should confirm as "address added successfully".

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/profile/addressAdd" path parameters
    * The api user prepares a POST request containing the <customer_id>, "<name>", "<email>", "<address>", <phone>, "<city>", "<state>", "<country>", <postal_code>, "<address_type>" informations to send to the api desired endpoint.
    * The api user sends the POST request and saves the response returned from the api desired endpoint.
    * The api user verifies that the status code is 201
    * The api user verifies that the message information in the response body is "address added successfully"

    Examples:
      | customer_id | name      | email                   | address | phone       | city      | state     | country   | postal_code | address_type |
      | 001         | Beytullah | beytullah@beytullah.com | abc     | 05551231212 | beytullah | beytullah | beytullah | 00001       | home         |

  @42/2
  Scenario Outline: The creation of the new address record via the API using the customer ID should be verified through the API itself.
  (The creation of the record can be confirmed by sending a GET request to the
  /api/profile/addressDetails endpoint with the added_item_id returned in the response body.)

    * The api user constructs the base url with the "admin" token
    # APi kullanicisi "admin" token ile base urli olusturur
    * The api user sets "api/profile/addressDetails" path parameters
     # APi kullanicisi "api/refundReasonDetails" path parametrelerini olusturur
    * The api user prepares a GET request containing the  <id> for which details are to be accessed
    # Api kullanicisi api istenen endpointe gondermek icin detaylarina erisilmek istenen refund reason idsini iceren bir get request hazirlar
    * The api user sends a GET request and saves the response returned from the api desired endpoint.
    # Api kullanicisi get request gonderir ve api refundReasonDetails endpointinden donen responsei kaydeder
    * The api user verifies that the message information in the response body is "success"

    Examples:
      | id  |
      | 270 |


  @42/3
  Scenario Outline: When a POST body containing valid authorization credentials and an invalid email (not containing '@')
  is sent to the /api/profile/addressAdd endpoint,along with fields: customer_id, name, email, address, phone, city, state,
  country, postal_code, address_type,the expected status code returned should be 422, and the message in the response body
  should confirm as "The email must be a valid email address.".

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/profile/addressAdd" path parameters
    * The api user prepares a POST request containing the <customer_id>, "<name>", "<email>", "<address>", <phone>, "<city>", "<state>", "<country>", <postal_code>, "<address_type>" informations to send to the api desired endpoint.
    * The api user sends the POST request and saves the response returned from the api desired endpoint.
    * The api user verifies that the status code is 422
    * The api user verifies that the message information in the response body is "The email must be a valid email address."

    Examples:
      | customer_id | name      | email         | address | phone       | city      | state     | country   | postal_code | address_type |
      | 001         | Beytullah | beytullah.com | abc     | 05551231212 | beytullah | beytullah | beytullah | 00001       | home         |


  @42/4
  Scenario Outline: a POST body containing invalid authorization credentials and necessary data
  (customer_id, name, email, address, phone, city, state, country, postal_code, address_type)
  is sent to the /api/profile/addressAdd endpoint, the returned status code should be validated as 401,
  and the message information in the response body should confirm as "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token
    * The api user sets "api/profile/addressAdd" path parameters
    * The api user prepares a POST request containing the <customer_id>, "<name>", "<email>", "<address>", <phone>, "<city>", "<state>", "<country>", <postal_code>, "<address_type>" informations to send to the api desired endpoint.
    * The api user sends the "post" request and saves the "Response"
    * The api user verifies that for "post" request type the status code is 401 and the message information in the response body is "Unauthenticated."

    Examples:
      | customer_id | name      | email                   | address | phone       | city      | state     | country   | postal_code | address_type |
      | 001         | Beytullah | beytullah@beytullah.com | abc     | 05551231212 | beytullah | beytullah | beytullah | 00001       | home         |
