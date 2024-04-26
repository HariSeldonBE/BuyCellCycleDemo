Feature: As an administrator, I want to be able to update the existing address information of a customer with the specified address ID number and belonging customer_id via the API connection.
   @simge1
   Scenario Outline:  When a PATCH request body, containing the address ID and the correct customer_id, along with valid authorization information, is sent to the /api/profile/addressUpdate/{id} endpoint for update, with fields (customer_id, name, email, address, phone, city, state, country, postal_code, address_type),
   the returned status code should be 202, and the message in the response body should confirm that it is "address updated successfully".

      * The api user constructs the base url with the "admin" token
      * The api user sets "api/profile/addressUpdate/<id>" path parameters
      * The api user prepares a PATCH request containing the <customer_id>, "<name>", "<email>", "<address>", "<phone>", "<city>","<state>","<country>","<postal_code>","<address_type>" information to send to the api register endpoint
      * The api user sends the "patch" request and saves the "Response"
      * The api user verifies that for "patch" request type the status code is 202 and the message information in the response body is "address updated successfully"
      Examples:
         |id | customer_id  | name  | email                   | address| phone   | city |state |country |postal_code |address_type |
         |271| 110          | Simge | simge@buysellcycle.com  | ankara | 5555555 | 06   |06    |09      |10600       |100          |

   @simge2
   Scenario Outline: When a PATCH request body containing valid authorization information and an incorrect (non-existent in the system) address ID is sent to the /api/profile/addressUpdate/{id} endpoint, with fields (customer_id, name, email, address, phone, city, state, country, postal_code, address_type),
   the returned status code should be 404, and the message in the response body should confirm that it is "address not found".

      * The api user constructs the base url with the "admin" token
      * The api user sets "api/profile/addressUpdate/<id>" path parameters
      * The api user prepares a PATCH request containing the <customer_id>, "<name>", "<email>", "<address>", "<phone>", "<city>","<state>","<country>","<postal_code>","<address_type>" information to send to the api register endpoint
      #* The api user sends the "patch" request and saves the "Response"
      * The api user verifies that for "patch" request type the status code is 404 and the message information in the response body is "Not Found"
      Examples:
         |id | customer_id  | name  | email                   | address| phone   | city |state |country |postal_code |address_type |
         |270| 110          | Simge | simge@buysellcycle.com  | ankara | 5555555 | 06   |06    |09      |10600       |100          |
   @simge3
   Scenario Outline: When a PATCH request body containing valid authorization information and an incorrect customer_id is sent to the /api/profile/addressUpdate/{id} endpoint, with fields (customer_id, name, email, address, phone, city, state, country, postal_code, address_type),
   the returned status code should be 404, and the message in the response body should confirm that it is "address not found".

      * The api user constructs the base url with the "admin" token
      * The api user sets "api/profile/addressUpdate/<id>" path parameters
      * The api user prepares a PATCH request containing the <customer_id>, "<name>", "<email>", "<address>", "<phone>", "<city>","<state>","<country>","<postal_code>","<address_type>" information to send to the api register endpoint
      * The api user verifies that for "patch" request type the status code is 404 and the message information in the response body is "Not Found"
      Examples:
         |id | customer_id  | name  | email                   | address| phone   | city |state |country |postal_code |address_type |
         |271| 119          | Simge | simge@buysellcycle.com  | ankara | 5555555 | 06   |06    |09      |10600       |100          |
   @simge4
   Scenario Outline: When a PATCH request body containing invalid authorization information is sent to the /api/profile/addressUpdate/{id} endpoint, with the address ID to be updated and the correct customer_id (customer_id, name, email, address, phone, city, state, country, postal_code, address_type),
   including  the expected status code upon response verification should be 401, and the message in the response body should confirm as '"Unauthenticated.".

      * The api user constructs the base url with the "invalid" token
      * The api user sets "api/profile/addressUpdate/<id>" path parameters
      * The api user prepares a PATCH request containing the <customer_id>, "<name>", "<email>", "<address>", "<phone>", "<city>","<state>","<country>","<postal_code>","<address_type>" information to send to the api register endpoint
     # * The api user sends the "patch" request and saves the "Response"
      * The api user verifies that for "patch" request type the status code is 401 and the message information in the response body is "Unauthorized"
      Examples:
         |id | customer_id  | name  | email                   | address| phone   | city |state |country |postal_code |address_type |
         |271| 110          | Simge | simge@buysellcycle.com  | ankara | 5555555 | 06   |06    |09      |10600       |100          |
   @simge5
   Scenario Outline: The updated_Id information in the response body from the /api/profile/addressUpdate/{id}
   endpoint should be verified to be the same as the id path parameter specified in the /api/profile/addressUpdate/{id} endpoint.

      * The api user constructs the base url with the "admin" token
      * The api user sets "api/profile/addressUpdate/<id>" path parameters
      * The api user prepares a PATCH request containing the <customer_id>, "<name>", "<email>", "<address>", "<phone>", "<city>","<state>","<country>","<postal_code>","<address_type>" information to send to the api register endpoint
      * The api user sends the "patch" request and saves the "Response"
      * The api user verifies the content of the data <id> in the response body at the "nonList" endpoint
      Examples:
         |id | customer_id  | name  | email                   | address| phone   | city |state |country |postal_code |address_type |
         |271| 110          | Simge | simge@buysellcycle.com  | ankara | 5555555 | 06   |06    |09      |10600       |100          |
   @simge6
   Scenario Outline: The update of the address record should be confirmed through the API.
   (The updated_Id returned in the response body can be used to send a GET request to the /api/profile/addressDetails endpoint in order to verify that the record has been updated.)

      * The api user constructs the base url with the "admin" token
      * The api user sets "api/profile/addressDetails" path parameters
      * The api user sends the "getbody" request and saves the "Response"
      * The api user verifies the content of the data <id> in the response body at the "list" endpoint
      Examples:
         |id |
         |271|