package manage;

import com.github.javafaker.Faker;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import org.json.JSONObject;
import pojos.Pojo;
import stepdefinitions.DB_Stepdefinitions;

import java.util.HashMap;

public class Manage {
   //********************************** API Test Variables and Parameters **************************************************************************
                             //************************** From Stepdefinitions Class **************************//
    public static Response response2;
    public static int id;
    public static String fullPath;
    public JSONObject requestBody = new JSONObject();
    public JsonPath jsonPath;
    public HashMap<String, Object> reqBody = new HashMap<>();
    public Pojo requestPojo;
    public Faker faker = new Faker();
    public static String email_class_level;
    public static String postId;
    public static String postId2;
    public static String addedItemId;
    public static String updatedId;
    public static int DeletedId;
    public static int deletedId;
                             //************************** From Stepdefinitions Class **************************//

        //********************************** API Test Variables and Parameters **************************************************************************

    private String verify_opening_balance_updated_with_negative_value = "UPDATE bank_accounts SET opening_balance = -1000000000 where bank_name= 'banka1';";
    private String verify_the_name_value_of_categories="Select  name from categories Where slug='fashion';";
    private String list_the_unique_id = "SELECT user_id, count(user_id)=1 from u168183796_qabuysell.support_tickets where reference_no like '%-%' group by user_id;";
    private String list_the_unique_id_not_contains = "SELECT user_id, count(user_id)=1 from u168183796_qabuysell.support_tickets where reference_no NOT like '%-%' group by user_id;";
    private String ps_cities_veri_ekleme = "INSERT INTO cities (name, state_id, status, created_at) VALUES (?, ?, ?, ?);";
    private String bank_account_insert_data="Insert Into bank_accounts (id,bank_name,branch_name,account_name,account_number,opening_balance,description,status) Values(?,?,?,?,?,?,?,?)";
    private String cities_veri_ekleme = "INSERT INTO cities (name, state_id, status, created_at) VALUES (?, ?, ?, ?);";
    private String  refund_reasons_null  ="SELECT * FROM refund_reasons where reason is null;";
    private String  calculate_grand_total_average  ="SELECT AVG(grand_total) AS 'Ortalama grand_total' from u168183796_qabuysell.orders where is_paid=1;";
    private String sum_of_the_total_price ="select SUM(total_price) as sum_total_price from u168183796_qabuysell.carts where created_at <'2024-03-30' and is_buy_now=1;";
    private String verify_seller_products = "SELECT * FROM u168183796_qabuysell.seller_products where discount = 0 limit 3;";
    private String customerCouponStoresAndUsers  = "SELECT users.*, customer_coupon_stores.* FROM customer_coupon_stores LEFT JOIN users ON customer_coupon_stores.id = users.id LIMIT 3;";
    private String list_ids_with_shipping_address = "select id from order_address_details where shipping_address='Switzerland';";
    private String  email_address_from_the_attendances = "select email from users where id IN (select id from attendances where year<2022 and id=5);";
    private String  insert_Into_cities = "INSERT INTO cities (name,state_id,status,created_at) VALUES(?, ?, ?, ?);";
    private String  delete_the_data_in_the_cities_table = "delete from u168183796_qabuysell.cities where id=?;";
    private String couponProductsGroup ="SELECT coupon_id, COUNT(*) AS product_count FROM coupon_products GROUP BY coupon_id;";
    private String   shipping_address="SELECT COUNT(*) AS user_count FROM order_address_details WHERE shipping_address <> billing_address;";
    private String email_template_types_Grouping = "SELECT module, COUNT(*) AS type_count" + "FROM email_template_types" + "WHERE module IS NOT NULL" + "GROUP BY module;";
    private String  wallet_balances="SELECT SUM(amount) AS total_amount FROM wallet_balances WHERE type = 'Referral' AND id BETWEEN 10 AND 20;";
    private String attendances="Select DISTINCT note from attendances group by day";
    private String numberOfOrdersByOrderId = "SELECT count(order_id) AS number_of_orders FROM guest_order_details;";
    private String UpdateShippingName = "UPDATE guest_order_details SET shipping_name = 'Updated Name' WHERE order_id = 2;";
    private String addNewDeviceTokens = "INSERT INTO device_tokens (id, user_id, device_token) VALUES (?, ?, ?);";


    public String getWallet_balances() {return wallet_balances;}
    public String getAttendances() {return attendances;}
    public String getList_the_unique_id_not_contains() {return list_the_unique_id_not_contains;}
    public String getSum_of_the_total_price() {return sum_of_the_total_price;}
    public String getCalculate_grand_total_average() {return calculate_grand_total_average;}
    public String getList_the_unique_id() {return list_the_unique_id;}
    public String getVerify_the_name_value_of_categories() {return verify_the_name_value_of_categories;}
    public String getBank_account_insert_data() { return bank_account_insert_data; }
    public String getps_cities_veri_ekleme() {return ps_cities_veri_ekleme;}
    public String getCities_veri_ekleme() {return cities_veri_ekleme;}
    public String getRefund_reasons_null() {return refund_reasons_null;}
    public String getVerify_seller_products() { return verify_seller_products; }
    public String getCustomerCouponStoresAndUsers() { return customerCouponStoresAndUsers; }
    public String getEmail_template_types_Grouping() {return email_template_types_Grouping;}
    public String getShipping_address() { return shipping_address;}
    public String getList_ids_with_shipping_address() {return list_ids_with_shipping_address;}
    public String getEmail_address_from_the_attendances() {return email_address_from_the_attendances;}
    public String getDelete_the_data_in_the_cities_table() {return delete_the_data_in_the_cities_table;}
    public String getPs_cities_veri_ekleme() {return ps_cities_veri_ekleme;}
    public String getVerify_opening_balance_updated_with_negative_value() {return verify_opening_balance_updated_with_negative_value;}
    public String getCouponProductsGroup() { return couponProductsGroup;}
    public String getNumberOfOrdersByOrderId() {return numberOfOrdersByOrderId;}
    public String getUpdateShippingName() {return UpdateShippingName;}
    public String getAddNewDeviceTokens() {return addNewDeviceTokens;}
    public String getInsert_Into_cities() {return insert_Into_cities;}

}

