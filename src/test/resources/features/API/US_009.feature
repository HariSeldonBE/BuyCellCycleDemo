@US_9
Feature: As an administrator, I want to add a new holiday record for staff via API connection.

  Scenario Outline: When a valid authorization information and necessary holiday data
  (year, name, date) are sent in the POST body to the /api/holidayAdd endpoint,
  it should be verified that the returned status code is 201 and
  the message information in the response body is "holiday added successfully".
    * The api user constructs the base url with the "admin" token
    * The api user sets "api/holidayAdd" path parameters
    * The api user prepares a POST request containing the "<year>" "<name>" "<date>" information to send to the api holidayAdd endpoint.
    * The api user sends the "post" request and saves the "Response"
    * The api user verifies that for "post" request type the status code is 201 and the message information in the response body is "holiday added successfully"

    Examples:
      | year | name         | date       |
      | 2024 | Yağmur Tatili | 20-04-2024 |

  Scenario Outline: The creation of the new holiday record via the API should be verified through the API itself.
    * The api user constructs the base url with the "admin" token
    * The api user sets "api/holidayDetails" path parameters
    * The api user prepares a GET request containing the  <id> for which details are to be accessed
    * The api user sends the "post" request and saves the "Response"
    * The api user verifies that for "post" request type the status code is 200 and the message information in the response body is "success"

    Examples:
      | id |
      | 85 |

  Scenario Outline: When a POST request containing valid authorization credentials and holiday data
  (year, name, date) already existing in the system is sent to the /api/holidayAdd endpoint,
  the expected status code returned should be 400, and the message in the response body should confirm: "dublicate holiday request".
    * The api user constructs the base url with the "admin" token
    * The api user sets "api/holidayAdd" path parameters
    * The api user prepares a POST request containing the "<year>" "<name>" "<date>" information to send to the api holidayAdd endpoint.
    * The api user sends the "post" request and saves the "Response"
    * The api user verifies that for "post" request type the status code is 400 and the message information in the response body is "dublicate holiday request"

    Examples:
      | year | name        | date       |
      | 2024 | Kafa Tatili | 28-04-2024 |


  Scenario Outline: When a POST request containing invalid authorization credentials and holiday data (year, name, date)
  is sent to the /api/holidayAdd endpoint, the expected status code returned should be 401,
  and the message in the response body should confirm: "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token
    * The api user sets "api/holidayAdd" path parameters
    * The api user prepares a POST request containing the "<year>" "<name>" "<date>" information to send to the api holidayAdd endpoint.
    * The api user sends the "post" request and saves the "Response"
    * The api user verifies that for "post" request type the status code is 401 and the message information in the response body is "Unauthorized"

    Examples:
      | year | name        | date       |
      | 2024 | Kafa Tatili | 28-04-2024 |