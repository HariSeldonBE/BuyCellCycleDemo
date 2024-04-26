Feature:BACKEND JDBC TESTING

  Background:Database connection
    * Database connection is established.

      #orders tablosunda ödemesi yapılmış siparişlerin (is_paid =1)
      # ortalama grand_total degerini hesaplayıp dogrulayınız.

  Scenario: Calculate and verify the average grand_total value of paid orders (is_paid =1) in the orders table.

    * "Calculate_the_average_grand_total" query is prepared and executed.
    * Verify the average grand_total value of paid orders (is_paid =1) in the orders table.
    * Database connection is closed