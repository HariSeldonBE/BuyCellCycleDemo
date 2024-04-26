Feature:BACKEND JDBC TESTING

  Background:Database connection
  @US024
  Scenario: In the orders table, list the data that does not contain "customer" in customer_email data and whose sub_total is less than 2000 in reverse order of "order_number".


    * Verify the name value of a categorie Query is prepared and executed.

    * Database connection is closed