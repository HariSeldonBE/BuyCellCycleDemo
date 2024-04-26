
@DB_15
Feature: BACKEND JDBC TESTING

  Background:Database connection
    * Database connection is established.

  Scenario: US_015  List the information of the first 3 data in the customer_coupon_stores table from the users table
   #customer_coupon_stores tablosunda bulunan ilk 3 verinin bilgilerini users tablosundan getirerek listeleyiniz.

    * "CustomerCouponStoresAndUsers" query is prepared and executed.
    * List the first 3 data in the customer_coupon_stores table by bringing them from the users table.
    * Database connection is closed