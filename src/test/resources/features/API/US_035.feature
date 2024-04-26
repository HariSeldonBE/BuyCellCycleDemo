Feature: As a user, I want to be able to update the information of the address in my profile with the specified ID number through the API connection.


  Scenario:When a PATCH request body containing valid authorization credentials, the desired address ID to be updated, and necessary data (name, email, address, phone, city, state, country, postal_code, address_type) is sent to the /api/profile/customerAddressUpdate/{id} endpoint, the returned status code should be validated as 202, and the message information in the response body should confirm as "address updated successfully".
    * The api user constructs the base url with the "admin" token
    * The api user sets "api/profile/customerAddressUpdate/<id>" path parameters




  Scenario:When a valid authorization information and an incorrect (non-existent in the system) address ID are included in the PATCH request body (name, email, address, phone, city, state, country, postal_code, address_type) sent to the /api/profile/customerAddressUpdate/{id} endpoint, the expected status code to return is 404, and the message in the response body should confirm that "address not found".





  Scenario:When a PATCH request body is sent to the /api/profile/customerAddressUpdate/{id} endpoint with valid authorization credentials, containing the desired address ID for update, and an invalid email (not containing '@'), along with fields: name, email, address, phone, city, state, country, postal_code, address_type, the expected status code returned should be 422, and the message in the response body should validate as "The email must be a valid email address.".





  Scenario:When a PATCH request body containing invalid authorization credentials, the desired address ID to be updated, and necessary data (name, email, address, phone, city, state, country, postal_code, address_type) is sent to the /api/profile/customerAddressUpdate/{id} endpoint, the returned status code should be validated as 401, and the message information in the response body should confirm as "Unauthenticated.".





  Scenario:The updated_Id information in the response body returned from the /api/profile/customerAddressUpdate/{id} endpoint should be verified to match the id path parameter specified in the  /api/profile/customerAddressUpdate/{id} endpoint.





  Scenario:"The update of the address record via the API should be confirmed through the API itself.
  (The updated_Id returned in the response body can be used to send a GET request to the /api/profile/customerDetailsAddres endpoint to confirm that the record has been updated.)"
