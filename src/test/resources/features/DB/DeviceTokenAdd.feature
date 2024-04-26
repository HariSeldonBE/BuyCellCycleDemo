Feature: US_020 Enter 10 data into the device_tokens table at the same time and verify that it is added to the table.

  Background:Database connection
    * Database connection is established.

  @HS
  Scenario: Enter 10 data into the device_tokens table at the same time and verify that it is added to the table.

    * "Entering 10 data to the device_tokens table at the same time and verify the add" query is prepared and executed.
    * Verify that "opening_balance" field is updated with a "negative" value.
    * Prepare a query that adds 10 data to the bank_accounts table in bulk.
    * 10 Enter the data in bulk. Check that it is added to the table.
    * Database connection is closed
