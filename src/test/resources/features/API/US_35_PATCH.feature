Feature: As a user, I want to be able to update the information of the address in my profile with the specified ID number through the API connection.


  Scenario Outline:When a PATCH request body containing valid authorization credentials, the desired address ID to be updated,
  and necessary data (name, email, address, phone, city, state, country, postal_code, address_type) is sent to the /api/profile/customerAddressUpdate/{id} endpoint,
  the returned status code should be validated as 202, and the message information in the response body should confirm as "address updated successfully".

    * The api user constructs the base url with the "customer" token
    * The api user sets "api/profile/customerAddressUpdate/<id>" path parameters
    * The api user prepares a PATCH request containing the "<name>", "<email>", "<address>", "<phone>", "<city>", "<state>", "<country>", "<postal_code>", "<address_type>" data to send to the api endpoint
    * The api user sends the "patch" request and saves the "Response"
    * The api user verifies that for "patch" request type the status code is 202 and the message information in the response body is "address updated successfully"

    Examples:
      | id  | name          | email              | address | phone     | city    | state | country | postal_code | address_type |
      | 313 | Eminegül Özen | eminegul@gmail.com | Bornova | 543256225 | Bornove | İzmir | Türkiye | 38001       | 13           |


  Scenario Outline:When a valid authorization information and an incorrect (non-existent in the system) address ID are included in the PATCH request body
  (name, email, address, phone, city, state, country, postal_code, address_type) sent to the /api/profile/customerAddressUpdate/{id} endpoint,
  the expected status code to return is 404, and the message in the response body should confirm that "address not found".

    * The api user constructs the base url with the "customer" token
    * The api user sets "api/profile/customerAddressUpdate/<id>" path parameters
    * The api user prepares a PATCH request containing the "<name>", "<email>", "<address>", "<phone>", "<city>", "<state>", "<country>", "<postal_code>", "<address_type>" data to send to the api endpoint
    * The api user sends the "patch" request and saves the "Response"
    * The API user records the response from the api refundReasonUpdate endpoint, confirming that the status code is '404' and the address is not found.


    Examples:
      | id   | name          | email              | address | phone      | city    | state | country | postal_code | address_type |
      | 1000 | Eminegül Özen | eminegul@gmail.com | Bornova | 5432562251 | Bornova | Izmir | Turkey  | 38000       | 11           |


  Scenario Outline:When a PATCH request body is sent to the /api/profile/customerAddressUpdate/{id} endpoint with valid authorization credentials,
  containing the desired address ID for update, and an invalid email (not containing '@'),
  along with fields: name, email, address, phone, city, state, country, postal_code, address_type,
  the expected status code returned should be 422, and the message in the response body should validate as "The email must be a valid email address.".

    * The api user constructs the base url with the "customer" token
    * The api user sets "api/profile/customerAddressUpdate/<id>" path parameters
    * The api user prepares a PATCH request containing the "<name>", "<email>", "<address>", "<phone>", "<city>", "<state>", "<country>", "<postal_code>", "<address_type>" data to send to the api endpoint
    * The api user sends the "patch" request and saves the "Response"
    * The api user verifies that for "patch" request type the status code is 422 and the message information in the response body is "The email must be a valid email address."


    Examples:
      | id  | name          | email             | address | phone      | city    | state | country | postal_code | address_type |
      | 313 | Eminegül Özen | eminegulgmail.com | Bornova | 5432562251 | Bornova | Izmir | Turkey  | 38000       | 11           |


  Scenario Outline:When a PATCH request body containing invalid authorization credentials, the desired address ID to be updated,
  and necessary data (name, email, address, phone, city, state, country, postal_code, address_type) is sent to the /api/profile/customerAddressUpdate/{id} endpoint,
  the returned status code should be validated as 401, and the message information in the response body should confirm as "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token
    * The api user sets "api/profile/customerAddressUpdate/<id>" path parameters
    * The api user prepares a PATCH request containing the "<name>", "<email>", "<address>", "<phone>", "<city>", "<state>", "<country>", "<postal_code>", "<address_type>" data to send to the api endpoint
    * The api user sends the "patch" request and saves the "Response"
    * The api user verifies that for "patch" request type the status code is 401 and the message information in the response body is "Unauthenticated"

    Examples:
      | id  | name                 | email               | address  | phone      | city    | state | country | postal_code | address_type |
      | 313 | Zeliha Eminegül Özen | eeminegul@gmail.com | Bornovaa | 5432562251 | Bornova | Izmir | Turkey  | 38000       | 11           |


  Scenario Outline:The updated_Id information in the response body returned from the /api/profile/customerAddressUpdate/{id} endpoint
  should be verified to match the id path parameter specified in the  /api/profile/customerAddressUpdate/{id} endpoint.

    * The api user constructs the base url with the "customer" token
    * The api user sets "api/profile/customerAddressUpdate/<id>" path parameters
    * The api user prepares a PATCH request containing the "<name>", "<email>", "<address>", "<phone>", "<city>", "<state>", "<country>", "<postal_code>", "<address_type>" data to send to the api endpoint
    * The api user sends the "patch" request and saves the "Response"
    * The api user verifies that for "patch" request type the status code is 202 and the message information in the response body is "address updated successfully"
    * The api user verifies that the updated id information in the response body matches the id path parameter specified in the endpoint.

    Examples:
      | id  | name          | email              | address | phone     | city    | state  | country | postal_code | address_type |
      | 313 | Eminegül Özen | eminegul@gmail.com | Bornova | 543256225 | Bornove | Ankara | Türkiye | 38001       | 13           |


  Scenario Outline:"The update of the address record via the API should be confirmed through the API itself.
  (The updated_Id returned in the response body can be used to send a GET request to the /api/profile/customerDetailsAddres endpoint
  to confirm that the record has been updated.)"

    * The api user constructs the base url with the "customer" token
    * The api user sets "api/profile/customerDetailsAddress" path parameters
    * The api user prepares a GET request containing the  <id> for which details are to be accessed
    * The api user sends the "get" request and saves the "Response"
    * The api user verifies that the info in the response body is "<name>".

    Examples:
      | id  | name          |
      | 313 | Eminegül Özen |