Feature: As an administrator, I should be able to access detailed information
about the holiday with the specified id number via API connection.


  @HS
  Scenario Outline: When a GET request containing valid authorization credentials and the holiday id data for the
  desired detailed information is sent to the /api/holidayDetails endpoint, the expected status code returned
  should be 200, and the message in the response body should confirm: "success".

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/holidayDetails" path parameters
    * The api user prepares a GET request containing "an existing holiday" <id> to send to the api "holidayDetails" endpoint.
    * The api user sends the "getbody" request and saves the "response"
    * The api user verifies that for "getbody" request type the status code is 200 and the message information in the response body is "success"

    Examples:
      | id |
      | 2 |

  @HS
  Scenario Outline: When a GET request containing valid authorization credentials and the holiday id data for
  the desired detailed information is sent to the /api/holidayDetails endpoint, the data returned in the response
  body (id, year, name, type, date, created_at, updated_at) should be validated.

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/holidayDetails" path parameters
    * The api user prepares a GET request containing "an existing holiday" <id> to send to the api "holidayDetails" endpoint.
    * The api user sends the "getbody" request and saves the "response"
    * The api user validates the <id>, <year>, "<name>", <type>, "<date>", "<created_at>", "<updated_at>" of the response body.
    Examples:
      | id | year |  name  | type |    date    |        created_at           |          updated_at         |
      |  2 | 2025 | Spring |   0  |            | 2024-03-12T15:32:02.000000Z | 2024-04-19T13:31:47.000000Z |

  @HS
  Scenario Outline: When a GET request containing valid authorization credentials and an incorrect (non-existent in the system)
  holiday id is sent to the /api/holidayDetails endpoint, the expected status code returned should be 404,
  and the message in the response body should confirm: "holiday not found".

    * The api user constructs the base url with the "admin" token
    * The api user sets "api/holidayDetails" path parameters
    * The api user prepares a GET request containing "a non existing holiday" <id> to send to the api "holidayDetails" endpoint.
    * The api user verifies that for "getbody" request type the status code is 404 and the message information in the response body is "Not Found"


    Examples:
      | id |
      | 222222 |

  @HS
  Scenario Outline: When a GET request containing invalid authorization credentials and the holiday id data
  for the desired detailed information is sent to the /api/holidayDetails endpoint, the expected status code
  returned should be 401, and the message in the response body should confirm: "Unauthenticated.".

    * The api user constructs the base url with the "invalid" token
    * The api user sets "api/holidayDetails" path parameters
    * The api user prepares a GET request containing "holiday" <id> to send to the api "holidayDetails" endpoint.
    * The api user verifies that for "get" request type the status code is 401 and the message information in the response body is "Unauthorized"

    Examples:
      | id |
      | 2 |