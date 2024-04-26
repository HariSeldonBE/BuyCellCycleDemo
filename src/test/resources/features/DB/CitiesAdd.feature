Feature:US_002 Add a data containing the values (id,name,state_id,status,created_at) to the cities table. verify that the data has been added from the cities table.

  Background:Database connection
    * Database connection is established.


  Scenario: cities tablosuna (id,name,state_id,status,created_at) degerlerini iceren bir veri ekleyiniz.
  cities tablosu uzerinden verinin eklendigini dogrulayiniz.

    * Prepare a query that adds 1 data to the cities table in bulk.
    * cities tablosu uzerinden 1 adet verinin eklendigini dogrulayiniz.
    * Database connection is closed