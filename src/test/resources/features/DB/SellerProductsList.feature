@DB_13
Feature:BACKEND JDBC TESTING



  Background:Database connection
    * Database connection is established.

    Scenario: US_13 List and validate the first 3 products that are not associated with any coupon in the seller_products table.
       #"seller_products tablosunda hiçbir kuponla ilişkilendirilmemiş olan ilk 3 ürünü listeleyip dogrulayiniz.

    * "Verify_seller_products" query is prepared and executed.
    * List and verify 3 items without coupons.
    * Database connection is closed
