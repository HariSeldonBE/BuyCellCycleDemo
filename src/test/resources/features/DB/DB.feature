#ö

Feature:BACKEND JDBC TESTING

  Background:Database connection
    * Database connection is established.

      #Categories tablosunda 'slug = fashion' olan bir categorie'nin name değerini dogrulayınız.

  Scenario: US01_Verify the name value of a categorie with 'slug = fashion' in the categories table.
    * Verify the name value of a categorie Query is prepared and executed.
    * Verify the "name" information Results are obtained.
    * Database connection is closed

    #bank_accounts tablosuna toplu olarak 5 veri girip eklendiğini dogrulayiniz.

  Scenario: Enter 5 data in bulk to the bank_accounts table and verify that it is added.

    * Prepare a query that adds 5 data to the bank_accounts table in bulk.
    * 5 Enter the data in bulk. Check that it is added to the table.
    * Database connection is closed