@DB_14
Feature: BACKEND JDBC TESTING

  Background:Database connection
    * Database connection is established.

  Scenario:Verify whether there is data in the refund_reasons table with a 'reason' value of Null
 #refund_reasons tablosunda 'reason' degeri Null olan veri olup olmadigini dogrulayiniz.

    * "Refund_reasons_null" query is prepared and executed.
    * Verify the "reason" information result are obtained.
    * Database connection is closed