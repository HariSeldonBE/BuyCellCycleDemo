Feature: US_003 Delete

  Background:Database connection
    * Database connection is established.

  @DB03
  Scenario: aa
    * Prepare a query that adds 1 data to the cities table in bulk.
    * Verify that 1 information has been created.
    * Prepare delete Query from cities table is prepared and executed.
    * Verify that it has been deleted.
    * Database connection is closed
