Feature: US_020 Enter 10 data into the device_tokens table at the same time and verify that it is added to the table

  Background:Database connection
    * Database connection is established.

  @HSDB
  Scenario: In the support_tickets table, list the unique user_ids of the data with and without '-' in reference_no.
    * "" query is prepared and executed.

    * Database connection is closed