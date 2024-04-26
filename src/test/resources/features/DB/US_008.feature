@US_8
Feature:BACKEND JDBC TESTING

  Background:Database connection
    * Database connection is established.

  #  delivery_processes tablosunda ilk 5 verinin name bilgilerinin tersten sırasıyla
  #  (Shipped,Recieved,Processing,Pending,Delivered) oldugunu dogrulayiniz.

  # query:
  # SELECT name FROM delivery_processes ORDER BY name DESC LIMIT 5;

  Scenario: US08_Verify that the first 5 data names in the delivery_processes table are in reverse order
  (Shipped, Recieved, Processing, Pending, Delivered).

    *
    *
    * Database connection is closed