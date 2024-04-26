Feature: US_021 Calculate the number of orders placed according to the order_id in the guest_order_details table.
Update the shipping_name information of the data with order number (order_id=?).

  Background: Database connection
    * Database connection is established.

  @HSDB
  Scenario: Calculate the number of orders placed according to the order_id in the guest_order_details table. Update the
  shipping_name information of the data with order number (order_id=?).

    * "Number of orders placed according to the order_id" query is prepared and executed.
    * "Guest Order Details Update" query is prepared and executed.
    * Verify that "shipping_name" field is updated with a "new" value.
    * Database connection is closed
