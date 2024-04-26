@US_4
Feature:BACKEND JDBC TESTING

  Background:Database connection
    * Database connection is established.

      # contacts tablosunda (id,name,email,query_type,message) bilgileri iceren
      #  bir veri ekleyip message bilgisini update ediniz.

  # query:
  # 1. STEP: INSERT INTO contacts VALUES (52, 'QA_abc', 'abc@gmail.com', 'query001', 'just do it','2024-04-19','2024-04-25', 'db_04');
  # 2. STEP: UPDATE contacts SET message = 'message is updated' WHERE id = 52;

  # manage class:

  #   private String contactsInsertData = "INSERT INTO contacts (id, name, email, query_type, message, created_at, updated_at, others) VALUES (?,?,?,?,?,?,?,?)";
  #   public String getContactsInsertData() {
  #   return contactsInsertData;
  #   }
  Scenario: US04_ Add a data containing (id,name,email,query_type,message) information in the contacts table. Update the message info.

    #* Prepare a query that adds data to the contacts table
    #* Update the message information
    * Database connection is closed

    # denemeeee