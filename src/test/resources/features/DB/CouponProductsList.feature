@DB06
Feature:BACKEND JDBC TESTING

  Background:Database connection
    * Database connection is established.

   Scenario: US_006 Group the coupon_products table by coupon_id and find how many products there are for each coupon
      #coupon_products tablosunu coupon_id'ye göre gruplayarak her kupon için kaç ürün olduğunu bulunuz.

     * "coupon_products_group_by" query is prepared and executed.
     * List how many products there are for each coupon, grouped by coupon_id
     * Database connection is closed