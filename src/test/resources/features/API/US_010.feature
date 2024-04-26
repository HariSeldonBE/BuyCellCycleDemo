Feature: As an administrator, I want to be able to update department information with
  the specified ID number via the API connection.

  @Ilteris
  Scenario Outline: When a PATCH request containing valid authorization credentials,
  the holiday id to be updated, and the updated holiday data (year, name, date) is sent to the /api/holidayUpdate/{id} endpoint,
  the expected status code returned should be 202,
  and the message in the response body should confirm: "holiday updated successfully".

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/holidayUpdate/<id>" path parameters
    * The api user prepares a PATCH request containing the "<year>","<name>","<date>" data to send to the api.
    * The api user sends the "patch" request and saves the "Response"
    * The api user verifies that for "patch" request type the status code is 202 and the message information in the response body is "holiday updated successfully"
    * The api user verifies that the updated id information in the response body matches the id path parameter specified in the endpoint.

    Examples:
      | id  | year | name     | date       |
      | 101 | 2027 | 22 nisan | 2027-01-09 |

  Scenario Outline: When a PATCH request containing valid authorization credentials,
  an incorrect (non-existent in the system) holiday id,
  and the updated holiday data (year, name, date) is sent to the /api/holidayUpdate/{id} endpoint,
  the expected status code returned should be 404,
  and the message in the response body should confirm: "holiday not found".

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/holidayUpdate/<id>" path parameters
    * The api user prepares a PATCH request containing the "<year>","<name>","<date>" data to send to the api.
    * The api user verifies that for "patch" request type the status code is 404 and the message information in the response body is "holiday not found"

    Examples:
      | id  | year | name     | date       |
      | 500 | 2030 | 24 mayis | 2030-01-02 |

  Scenario Outline: When a PATCH request containing invalid authorization credentials,
  the holiday id to be updated, and the updated holiday data (year, name, date) is sent to the /api/holidayUpdate/{id} endpoint,
  the expected status code returned should be 401,
  and the message in the response body should confirm: "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token
    * The api user sets "api/holidayUpdate/<id>" path parameters
    * The api user prepares a PATCH request containing the "<year>","<name>","<date>" data to send to the api.
    * The api user verifies that for "patch" request type the status code is 401 and the message information in the response body is "Unauthorized"

    Examples:
      | id  | year | name     | date       |
      | 101 | 2027 | 24 nisan | 2027-01-09 |

  Scenario Outline: The update of the desired department record via the API should be confirmed from the API itself.
  (The update of the record can be verified by sending a GET request to the /api/departmentDetails
  endpoint with the updated_Id returned in the response body.)

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/departmentDetails" path parameters
    * The api user prepares a GET request containing the  <id> for which details are to be accessed
    * The api user sends the "getbody" request and saves the "Response"
    * The api user verifies that the reason information in the response body "<updated_Id>".

    Examples:
      | id  | updated_Id |
      | 101 | 101        |

  Scenario Outline: When a PATCH request containing valid authorization credentials,
  the holiday id to be updated,
  and the holiday data (year, name, date) matching the previous records is sent to the /api/holidayUpdate/{id} endpoint,
  the expected status code returned should be 400,
  and the message in the response body should confirm: "dublicate holiday request".

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/holidayUpdate/<id>" path parameters
    * The api user prepares a PATCH request containing the "<year>","<name>","<date>" data to send to the api.
    * The api user sends the "patch" request and saves the "Response"
    * The api user verifies that for "patch" request type the status code is 400 and the message information in the response body is "dublicate holiday request."
   # * The API user records the response from the api holidayUpdate endpoint, confirming that the status code is 400 and the reason phrase is dublicate holiday request.



    Examples:
      | id  | year | name     | date       |
      | 101 | 2027 | 24 nisan | 2027-01-09 |