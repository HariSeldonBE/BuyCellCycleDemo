Feature:BACKEND JDBC TESTING

  Background:Database connection
    * Database connection is established.

      #carts tablosunda 2024-03-30 tarinden önce  is_buy_now=1 olan ürünlerin toplam bedelini hesaplayınız

  Scenario:Calculate the total cost of products with is_buy_now=1 before 2024-03-30 in the carts table

    * "Calculate_the_total_cost" query is prepared and executed.
    * Verify the total cost value of paid orders in the orders table.
    * Database connection is closed