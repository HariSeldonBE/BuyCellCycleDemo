Feature:Scenario DB

  Background:Database connection
    * Database connection is established.

# cities tablosuna (id,name,state_id,status,created_at) degerlerini iceren bir veri ekleyiniz. cities tablosu uzerinden verinin eklendigini dogrulayiniz.
  Scenario: Add a data containing the values (id,name,state_id,status,created_at) to the cities table.
  verify that the data has been added from the cities table.

    * Prepare a query that adds 1 data to the cities table in bulk.
    * cities tablosu uzerinden 1 adet verinin eklendigini dogrulayiniz.
    * Database connection is closed

# order_address_details tablosunda shipping_address = 'Switzerland' olan id leri orders tablosuna göre listeleyin.
  Scenario: US_016 List ids with shipping_address = 'Switzerland' in the order_address_details table according to the orders table.

    * Verify order_address_details Query is prepared and executed.
    * Verify the id information results are listed with shipping_address using order_address_details table
    * Database connection is closed

# bank_accounts tablosunda bank_name=? olan verinin opening_balance degerinin negatif değer ile update edilmedigini dogrulayınız.
  Scenario: Verify that the opening_balance value of the data with bank_name=? in the bank_accounts table is not updated with a negative value.

    * "Update the opening_balance with a negative value" query is prepared and executed.
    * Verify that "opening_balance" field is updated with a "negative" value.
    * Database connection is closed