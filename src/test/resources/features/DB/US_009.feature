@US_9
Feature:BACKEND JDBC TESTING

  Background:Database connection
    * Database connection is established.

      # log_activity tablosunda ip='46.2.239.35' adresiyle method='Delete'
      # edilen konuların kac tane oldugunu hesaplayıp dogrulayiniz.

  # query:
  # SELECT COUNT(subject) AS subject_count FROM log_activity WHERE ip = '46.2.239.35' AND method = 'Delete';
  # result: 0

  Scenario: US09_In the log_activity table, calculate and verify the number of topics with ip='46.2.239.35' and method='Delete'.
    *
    *
    * Database connection is closed



  #