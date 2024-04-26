Feature:BACKEND JDBC TESTING

  Background:Database connection
    * Database connection is established.

      #support_tickets tablosunda reference_no bilgilerinde '-' içeren ve
      # içermeyen dataların benzersiz user_id'lerini listeleyiniz.
  @01
  Scenario: In the support_tickets table, list the unique user_ids of the data with and without '-' in reference_no.

    * "List_the_unique_ID_contains" query is prepared and executed.
    * List the unique user_id information results are obtained.
    * Database connection is closed
  Scenario: In the support_tickets table, list the unique user_ids of the data with and without '-' in reference_no.

    * "List_the_unique_ID_notContains" query is prepared and executed.
    * List the unique user_id information results are obtained.
    * Database connection is closed