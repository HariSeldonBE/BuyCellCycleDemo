package stepdefinitions;

import com.github.javafaker.Faker;
import config_Requirements.ConfigReader;
import hooks.HooksAPI;
import io.cucumber.java.en.Given;
import io.restassured.path.json.JsonPath;
import io.restassured.response.Response;
import org.json.JSONObject;
import org.junit.Assert;
import pojos.Pojo;
import utilities.API_Utilities.API_Methods;

import java.util.*;
import static hooks.HooksAPI.spec;
import static io.restassured.RestAssured.given;
import static java.lang.Integer.parseInt;
import static org.hamcrest.Matchers.equalTo;
import static org.junit.Assert.*;

public class API_Stepdefinitions {


    public static Response response2;
    public static int id;
    public static String fullPath;
    public JSONObject requestBody = new JSONObject();
    JsonPath jsonPath;
    HashMap<String, Object> reqBody = new HashMap<>();
    Pojo requestPojo;
    Faker faker = new Faker();
    public static String email_class_level;
    public static String postId;
    public static String postId2;
    public static String addedItemId;
    public static String updatedId;
    public static int DeletedId;
    public static int deletedId;
    public static int lastItemId;

    @Given("The api user sets {string} path parameters")
    public void the_api_user_sets_path_parameters(String rawPaths) {
        String[] paths = rawPaths.split("/"); // [api,refundReasonUpdate,25]

        System.out.println(Arrays.toString(paths));

        StringBuilder tempPath = new StringBuilder("/{");


        for (int i = 0; i < paths.length; i++) {

            String key = "pp" + i;
            String value = paths[i].trim();

            spec.pathParam(key, value);

            tempPath.append(key + "}/{");

            if (value.matches("\\d+")) {  // value.matches("\\d+") burada value rakam iceriyorsa dedik
                id = parseInt(value);
            }
        }
        tempPath.deleteCharAt(tempPath.lastIndexOf("/"));
        tempPath.deleteCharAt(tempPath.lastIndexOf("{"));

        fullPath = tempPath.toString();
        System.out.println("fullPath = " + fullPath); // /{pp0}/{pp1}
        System.out.println("id : " + id);
    }

    @Given("The api user constructs the base url with the {string} token")
    public void the_api_user_constructs_the_base_url_with_the_token(String token) {
        HooksAPI.setUpApi(token);
    }


    @Given("The api user validates the {string} of the response body with index {int}.")
    public void the_api_user_validates_the_of_the_response_body_with_index(String reason, int dataIndex) {

        API_Methods.response.then()
                .assertThat()
                .body("refundReason[" + dataIndex + "].reason", equalTo(reason));
    }

    @Given("The API user records the response from the api refundReasonList endpoint, confirming that the status code is '401' and the reason phrase is Unauthorized.")
    public void the_apı_user_records_the_response_from_the_api_refund_reason_list_endpoint_confirming_that_the_status_code_is_and_the_reason_phrase_is_unauthorized() {

        Assert.assertTrue(API_Methods.tryCatchGet().equals(ConfigReader.getProperty("unauthorizedExceptionMessage", "api")));

    }


    @Given("The api user verifies the content of the data {int}, {string}, {string}, {string} in the response body.")
    public void the_api_user_verifies_the_content_of_the_data_in_the_response_body(int id, String reason, String created_at, String updated_at) {
        jsonPath = API_Methods.response.jsonPath();

        assertEquals(id, jsonPath.getInt("refundReasonDetails[0].id"));
        assertEquals(reason, jsonPath.getString("refundReasonDetails[0].reason"));
        assertEquals(created_at, jsonPath.getString("refundReasonDetails[0].created_at"));
        assertEquals(updated_at, jsonPath.getString("refundReasonDetails[0].updated_at"));
        // Assert.assertNull(jsonPath.get("refundReasonDetails[0].updated_at"));
    }

    @Given("The api user prepares a PATCH request containing the {string} data to send to the api refundReasonUpdate endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_the_data_to_send_to_the_api_refund_reason_update_endpoint(String reason) {
        requestBody = new JSONObject();
        requestBody.put("reason", reason);
    }

    @Given("The api user verifies that the updated id information in the response body matches the id path parameter specified in the endpoint.")
    public void the_api_user_verifies_that_the_updated_id_information_in_the_response_body_matches_the_id_path_parameter_specified_in_the_endpoint() {
        // 1. adim
        jsonPath = API_Methods.response.jsonPath();
        assertEquals(id, jsonPath.getInt("updated_Id"));

        // 2. adim
        API_Methods.response.then()
                .assertThat()
                .body("updated_Id", equalTo(id));
    }

    @Given("The api user verifies that the reason information in the response body is {string}.")
    public void the_api_user_verifies_that_the_reason_information_in_the_response_body_is(String reasonValue) {
        jsonPath = API_Methods.response.jsonPath();

        assertEquals(reasonValue, jsonPath.getString("refundReasonDetails[0].reason"));
    }
    @Given("The api user verifies that the Deleted id information in the response body is the same as the id information in the request body.")
    public void the_api_user_verifies_that_the_deleted_id_information_in_the_response_body_is_the_same_as_the_id_information_in_the_request_body() {
        jsonPath = API_Methods.response.jsonPath();

        assertEquals(requestBody.get("id"), jsonPath.getInt("Deleted_Id"));
    }

    @Given("The API user saves the response from the api refundReasonDelete endpoint, verifying that the status code is '401' and the reason phrase is Unauthorized.")
    public void the_apı_user_saves_the_response_from_the_api_refund_reason_delete_endpoint_verifying_that_the_status_code_is_and_the_reason_phrase_is_unauthorized() {
        Assert.assertTrue(API_Methods.tryCatchDelete(requestBody.toString()).equals(ConfigReader.getProperty("unauthorizedExceptionMessage", "api")));
    }
    // ================================= US_05 GET =============================

    @Given("The api user validates the {int}, {string}, {string}, {string}, {string} of the response body with index {int}.")
    public void the_api_user_validates_the_of_the_response_body_with_index(int id, String first_name, String username, String email, String name, int dataIndex) {
        //The api user validates the <id> "<first_name>" "<username>" "<email>" "<phone>" "<name>"of the response body with index <dataIndex>.
        jsonPath = API_Methods.response.jsonPath();

        assertEquals(id, jsonPath.getInt("user[" + dataIndex + "].id"));
        assertEquals(first_name, jsonPath.getString("user[" + dataIndex + "].first_name"));
        assertEquals(username, jsonPath.getString("user[" + dataIndex + "].username"));
        assertEquals(email, jsonPath.getString("user[" + dataIndex + "].email"));
        Assert.assertNull(jsonPath.get("user[" + dataIndex + "].phone"));
        Assert.assertTrue(jsonPath.getString("user[" + dataIndex + "].name").contains(name));
    }


    //========================== US28 GET =========================

    @Given("The api user validates the {int}, {string}, {string}, {int}, {string}, {string}, {int}, {int}, {int}, {int}, {int}, {int}, {int}, {int}, {string}, {string} of the response body .")
    public void the_api_user_validates_the_of_the_response_body(int id, String title, String coupon_code, int coupon_type, String start_date, String end_date, int discount, int discount_type, int minimum_shopping, int maximum_discount, int created_by, int updated_by, int is_expire, int is_multiple_buy, String created_at, String updated_at) {
        jsonPath = API_Methods.response.jsonPath();
        // * The api user validates the <id>, "<title>", "<coupon_code>", <coupon_type>, "<start_date>", "<end_date>", <discount>, <discount_type>, <minimum_shopping>, <maximum_discount>, <created_by>, <updated_by>, <is_expire>, <is_multiple_buy>, "<created_at>", "<updated_at>" of the response body .

        assertEquals(id, jsonPath.getInt("couponDetails[0].id"));
        assertEquals(title, jsonPath.getString("couponDetails[0].title"));
        assertEquals(coupon_code, jsonPath.getString("couponDetails[0].coupon_code"));
        assertEquals(start_date, jsonPath.getString("couponDetails[0].start_date"));
        assertEquals(end_date, jsonPath.getString("couponDetails[0].end_date"));
        assertEquals(coupon_type, jsonPath.getInt("couponDetails[0].coupon_type"));
        assertEquals(discount, jsonPath.getInt("couponDetails[0].discount"));
        assertEquals(discount_type, jsonPath.getInt("couponDetails[0].discount_type"));
        assertEquals(minimum_shopping, jsonPath.getInt("couponDetails[0].minimum_shopping"));
        assertEquals(maximum_discount, jsonPath.getInt("couponDetails[0].maximum_discount"));
        assertEquals(created_by, jsonPath.getInt("couponDetails[0].created_by"));
        assertEquals(updated_by, jsonPath.getInt("couponDetails[0].updated_by"));
        assertEquals(is_expire, jsonPath.getInt("couponDetails[0].is_expire"));
        assertEquals(is_multiple_buy, jsonPath.getInt("couponDetails[0].is_multiple_buy"));

        assertEquals(created_at, jsonPath.getString("couponDetails[0].created_at"));
        assertEquals(updated_at, jsonPath.getString("couponDetails[0].updated_at"));
    }


//============================= US_37 GET ==================

    @Given("The api user validates the  confirm that the country with an ID of {int} has the following attributes: {string}: TR and {string}: Turkey.")
    public void the_api_user_validates_the_confirm_that_the_country_with_an_ıd_of_has_the_following_attributes_and(int id,String code,String name) {
        jsonPath = API_Methods.response.jsonPath();
        assertEquals(id,jsonPath.getInt("addresses[222].id"));
        assertEquals(code,jsonPath.getString("addresses[222].code"));
        assertEquals(name,jsonPath.getString("addresses[222].name"));
    }
    //============================= US_07 GET ==================
    @Given("The api user verifies the content of the data {int}, {string}, {string}, in the response body.")
    public void the_api_user_verifies_the_content_of_the_data_in_the_response_body(int id, String year, String name) {
        jsonPath=API_Methods.response.jsonPath();

        assertEquals(id,jsonPath.getInt("holiday[0].id"));
        assertEquals(year,jsonPath.getString("holiday[0].year"));
        assertEquals(name,jsonPath.getString("holiday[0].name"));

    }
    //----------------------------simge----------------------------------

    @Given("The api user prepares a GET request containing the  {int} for which details are to be accessed")
    public void the_api_user_prepares_a_get_request_containing_the_for_which_details_are_to_be_accessed(int id) {
        requestBody = new JSONObject();
        requestBody.put("id",id);
        System.out.println(requestBody.toString());

    }
    @Given("The api user prepares a POST request containing the {string}, {string}, {string}, {string}, {string}, {string},{string} information to send to the api register endpoint")
    public void the_api_user_prepares_a_post_request_containing_the_information_to_send_to_the_api_register_endpoint(String firstname, String lastname, String password, String passwordconfirm, String usertype, String refferalcode, String email) {

        requestBody = new JSONObject();
        requestBody.put("first_name",firstname);
        requestBody.put("last_name",lastname);
        requestBody.put("password",password);
        requestBody.put("password_confirmation",passwordconfirm);
        requestBody.put("user_type",usertype);
        requestBody.put("referral_code",refferalcode);
        if (email.equalsIgnoreCase("email")){
            email = faker.internet().emailAddress();
            email_class_level=email;
            requestBody.put("email",email);
        } else if (email.equalsIgnoreCase("gecersizemail")) {
            email="api@api.com";
            requestBody.put("email",email);
        }
    }
    @Given("The api user prepares a PATCH request containing the {int}, {string}, {string}, {string}, {string}, {string},{string},{string},{string},{string} information to send to the api register endpoint")
    public void the_api_user_prepares_a_patch_request_containing_the_information_to_send_to_the_api_register_endpoint(int customer_id, String name, String email, String address, String phone, String city, String state, String country, String postal_code, String address_type) {
        requestBody = new JSONObject();
        requestBody.put("customer_id",customer_id);
        requestBody.put("name",name);
        requestBody.put("email",email);
        requestBody.put("address",address);
        requestBody.put("phone",phone);
        requestBody.put("city",city);
        requestBody.put("state",state);
        requestBody.put("country",country);
        requestBody.put("postal_code",postal_code);
        requestBody.put("address_type",address_type);
    }
    @Given("The api user verifies the content of the data {string}, {string}, {string} in the response body")
    public void the_api_user_verifies_the_content_of_the_data_in_the_response_body(String firstname, String lastname, String email) {
        jsonPath = API_Methods.response.jsonPath();
        if (email_class_level != null){
            email=email_class_level;
        }
        if (Objects.equals(lastname, "null")){
            Assert.assertNull(lastname, jsonPath.getString("user.last_name"));
        }
        if (!Objects.equals(lastname, "null")){
            assertEquals(lastname, jsonPath.getString("user.last_name"));
        }
        assertEquals(firstname, jsonPath.getString("user.first_name"));
        assertEquals(email, jsonPath.getString("user.email"));
    }

    @Given("The api user sends the {string} request and saves the {string}")
    public void the_api_user_sends_the_request_and_saves_the(String requestType, String response) {

        switch ((requestType+response).toLowerCase()){
            case   "postresponse": response2=API_Methods.postResponse(requestBody.toString());
                postId =  response2.jsonPath().getString("user.id");
                addedItemId = response2.jsonPath().getString("added_item_id");
                System.out.println(postId);
                System.out.println("addedItemId: "+ addedItemId); break;

            case   "patchresponse": response2=API_Methods.patchResponse(requestBody.toString());
                updatedId = response2.jsonPath().getString("updated_Id");break;
            case   "deleteresponse": response2=API_Methods.deleteResponse(requestBody.toString());
                DeletedId = response2.jsonPath().getInt("Deleted_Id");break;
            case   "getbodyresponse":response2=API_Methods.getBodyResponse(requestBody.toString()); break;
            case   "getresponse": response2=API_Methods.getResponse(); System.out.println("selam");break;
//              response2=API_Methods.getResponse(); System.out.println("selam"); break;
        }
        postId2 = postId;
    }
    @Given("The api user verifies the content of data {int} {string} {string} in the response body")
    public void the_api_user_verifies_the_content_of_data_in_the_response_body(int id, String name, String details) {
        jsonPath = API_Methods.response.jsonPath();
        assertEquals(id, jsonPath.getInt("departments[0].id"));
        assertEquals(name, jsonPath.getString("departments[0].name"));
        assertEquals(details, jsonPath.getString("departments[0].details"));
    }
    @Given("The api user verifies the content of data {int} {string} {string} {string} {string} in the response body")
    public void the_api_user_verifies_the_content_of_data_in_the_response_body(int id, String title, String coupon_code, String start_date, String end_date) {
        jsonPath = API_Methods.response.jsonPath();
        assertEquals(id, jsonPath.getInt("coupons[0].id"));
        assertEquals(title, jsonPath.getString("coupons[0].title"));

        assertEquals(coupon_code, jsonPath.getString("coupons[0].coupon_code"));
        assertEquals(start_date, jsonPath.getString("coupons[0].start_date"));
        assertEquals(end_date, jsonPath.getString("coupons[0].end_date"));

    }
    @Given("The api user verifies the content of the data {string}, {string}, {string}, {string}, {string}, {string} in the response body")
    public void the_api_user_verifies_the_content_of_the_data_in_the_response_body(String first_name, String last_name, String password, String password_confirmation, String user_type, String referral_code) {
        jsonPath = API_Methods.response.jsonPath();
        assertEquals(first_name, jsonPath.getString("user.first_name"));
        assertEquals(last_name, jsonPath.getString("user.last_name"));
        assertEquals(password, jsonPath.getString("user.password"));
        assertEquals(first_name, jsonPath.getString("user.first_name"));
    }

    @Given("The api user verifies the content of the data id in the response body")
    public void the_api_user_verifies_the_content_of_the_data_id_in_the_response_body() {
        System.out.println(postId2);
        Assert.assertTrue(response2.jsonPath().getString("user.id").contains(postId2));
    }
    @Given("The api user verifies that for {string} request type the status code is {int} and the message information in the response body is {string}")
    public void the_api_user_verifies_that_for_request_type_the_status_code_is_and_the_message_information_in_the_response_body_is(String requestType, int code, String message) {
        if(code==401 && message.equals("Unauthorized")) {
            switch (requestType.toLowerCase()){
                case "getbody":
                    assertEquals(API_Methods.tryCatchGetBody(requestBody.toString()), ConfigReader.getProperty("unauthorizedExceptionMessage", "api"));
                    break;
                case "get":
                    assertEquals(API_Methods.tryCatchGet(), ConfigReader.getProperty("unauthorizedExceptionMessage", "api"));
                    break;
                case "delete":
                    assertEquals(API_Methods.tryCatchDelete(requestBody.toString()), ConfigReader.getProperty("unauthorizedExceptionMessage", "api"));
                    break;
                case "patch":
                    assertEquals(API_Methods.tryCatchPatch(requestBody.toString()), ConfigReader.getProperty("unauthorizedExceptionMessage", "api"));
                    break;
                default:
                    System.out.println("!!!!!!!!!!Dinamik değişkenlerden biri hatalı!!!!!!!!!!!!");
                    break;
            }
        }
        else if(code==404 && message.equals("Not Found")) {
            switch (requestType.toLowerCase()){
                case "getbody":
                    assertEquals(API_Methods.tryCatchGetBody(requestBody.toString()), ConfigReader.getProperty("notFoundExceptionMessage", "api"));
                    break;
                case "get":
                    assertEquals(API_Methods.tryCatchGet(), ConfigReader.getProperty("notFoundExceptionMessage", "api"));
                    break;
                case "delete":
                    assertEquals(API_Methods.tryCatchDelete(requestBody.toString()), ConfigReader.getProperty("notFoundExceptionMessage", "api"));
                    break;
                case "patch":
                    assertEquals(API_Methods.tryCatchPatch(requestBody.toString()), ConfigReader.getProperty("notFoundExceptionMessage", "api"));
                    break;
                default: System.out.println("!!!!!!!!!!Dinamik değişkenlerden biri hatalı!!!!!!!!!!!!");
                    break;
            }
        } else  {

            API_Methods.messageAssert(message);
            API_Methods.statusCodeAssert(code);

        }

    }

    @Given("The api user verifies the content of the data {int} in the response body at the {string} endpoint")
    public void the_api_user_verifies_the_content_of_the_data_in_the_response_body_at_the_endpoint(int id, String endpoint) {

        jsonPath = API_Methods.response.jsonPath();
        if (endpoint.equalsIgnoreCase("list")){
            assertEquals(id, jsonPath.getInt("addresses[0].id"));}
        else if (endpoint.equalsIgnoreCase("nonList")){
            assertEquals(id, jsonPath.getInt("updated_Id"));
        }
    }

    //----------------------US_006 GET--------------------------------------
    @Given("The api user validates the {int}, {string}, {string}, {int}, {int}, {int}, {string}, {int}, {string}, {string} of the response body")
    public void the_api_user_validates_the_of_the_response_body(int id, String first_name, String last_name, int role_id, int is_verified, int is_active, String lang_code, int currency_id, String currency_code, String name) {
        jsonPath = API_Methods.response.jsonPath();
        assertEquals(id, jsonPath.getInt("user[0].id"));
        assertEquals(first_name, jsonPath.getString("user[0].first_name"));
        assertEquals(last_name, jsonPath.getString("user[0].last_name"));
        assertEquals(role_id, jsonPath.getInt("user[0].role_id"));
        assertEquals(currency_code, jsonPath.getString("user[0].currency_code"));
        assertEquals(lang_code, jsonPath.getString("user[0].lang_code"));
        assertEquals(is_verified, jsonPath.getInt("user[0].is_verified"));
        assertEquals(is_active, jsonPath.getInt("user[0].is_active"));
        assertEquals(currency_id, jsonPath.getInt("user[0].currency_id"));
        assertEquals(name , jsonPath.getString("user[0].name"));
    }

    // =========================  Z  =========================================================================
    @Given("The api user validates the {int} {int}  {string}  {string}  {string} {string}  {string}  {string} {string} {string} {string} {string} {string} of the response body with index {int}.")
    public void the_api_user_validates_the_of_the_response_body_with_index(int id, int customer_id, String name, String email, String phone, String address, String city, String state, String country, String is_shipping_default, String is_billing_default, String created_at, String updated_at, int dataindex) {

        jsonPath = API_Methods.response.jsonPath();
        assertEquals(id, jsonPath.getInt("addresses["+dataindex+"].id"));
        assertEquals(customer_id, jsonPath.getInt("addresses["+dataindex+"].customer_id"));
        assertEquals(email, jsonPath.getString("addresses["+dataindex+"].email"));
        assertEquals(phone, jsonPath.getString("addresses["+dataindex+"].phone"));
        assertEquals(address, jsonPath.getString("addresses["+dataindex+"].address"));
        assertEquals(state, jsonPath.getString("addresses["+dataindex+"].state"));
        assertEquals(country, jsonPath.getString("addresses["+dataindex+"].country"));

        if (!(jsonPath.getString("addresses[0].is_shipping_default")==null)){

            assertEquals(is_shipping_default, jsonPath.getString("addresses["+dataindex+"].is_shipping_default"));
            assertEquals(is_billing_default, jsonPath.getString("addresses["+dataindex+"].is_billing_default"));
            assertEquals(created_at, jsonPath.getString("addresses["+dataindex+"].created_at"));
            assertEquals(updated_at, jsonPath.getString("addresses["+dataindex+"].updated_at"));
        }
    }
    @Given("The api user prepares a POST request containing the {string}, {string}, {string} information to send to the api departmentAdd endpoint.")
    public void the_api_user_prepares_a_post_request_containing_the_information_to_send_to_the_api_department_add_endpoint(String name, String details, String status) {
        reqBody = new HashMap<>();
        reqBody.put("name",name);
        reqBody.put("details", details);
        reqBody.put("status", status);



    }
    @Given("The api user sends a GET request and saves the response returned from the api departmentAdd endpoint")
    public void the_api_user_sends_a_get_request_and_saves_the_response_returned_from_the_api_department_add_endpoint() {
        API_Methods.postResponse(reqBody);

    }

    @Given("The api user prepares a PATCH request containing the {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string} data to send to the api endpoint")
    public void the_api_user_prepares_a_patch_request_containing_the_data_to_send_to_the_api_endpoint(String name, String email, String address, String phone, String city, String state, String country, String postal_code, String address_type) {


        requestBody.put("name", name);
        requestBody.put("email", email);
        requestBody.put("address", address);
        requestBody.put("phone", phone);
        requestBody.put("city", city);
        requestBody.put("state", state);
        requestBody.put("country", country);
        requestBody.put("postal_code", postal_code);
        requestBody.put("address_type", address_type);

        System.out.println(requestBody);

    }

    @Given("The api user sends the PATCH request and saves the response returned from the api endpoint.")
    public void the_api_user_sends_the_patch_request_and_saves_the_response_returned_from_the_api_endpoint() {

        API_Methods.patchResponse(requestBody.toString());

    }

    @Given("The API user records the response from the api refundReasonUpdate endpoint, confirming that the status code is '404' and the address is not found.")
    public void the_apı_user_records_the_response_from_the_api_refund_reason_update_endpoint_confirming_that_the_status_code_is_and_the_address_is_not_found() {
        Assert.assertTrue(API_Methods.tryCatchPatch(requestBody.toString()).equals(ConfigReader.getProperty("invalidEmailAddressExeption", "api")));
    }

    @Given("The api user prepares a DELETE request containing the refund reason {int} to be deleted to send to the api endpoint")
    public void the_api_user_prepares_a_delete_request_containing_the_refund_reason_to_be_deleted_to_send_to_the_api_endpoint(int id) {
        requestBody = new JSONObject();
        requestBody.put("id", id);
    }


    @Given("The api user sends the DELETE request and saves the response returned from the api endpoint.")
    public void the_api_user_sends_the_delete_request_and_saves_the_response_returned_from_the_api_endpoint() {
        API_Methods.deleteResponse(requestBody.toString());
    }
    @Given("The api user verifies that the info in the response body is {string}.")
    public void the_api_user_verifies_that_the_info_in_the_response_body_is(String name) {
        jsonPath = API_Methods.response.jsonPath();

        assertEquals(name, jsonPath.getString("addresses[0].name"));
    }

    @Given("The api user prepares a DELETE request containing the data {int} to be deleted to send to the api endpoint")
    public void the_api_user_prepares_a_delete_request_containing_the_data_to_be_deleted_to_send_to_the_api_endpoint(int id) {
        requestBody = new JSONObject();
        requestBody.put("id", id);
    }

    @Given("The api user sends the DELETE request and saves the response returned from the api addressDelete endpoint.")
    public void the_api_user_sends_the_delete_request_and_saves_the_response_returned_from_the_api_address_delete_endpoint() {
        API_Methods.deleteResponse(requestBody.toString());
    }





    @Given("The api user validates the {int}, {string}, {string}, {string} of the response body .")
    public void the_api_user_validates_the_of_the_response_body(int id, String first_name, String last_name, String email) {

        assertEquals(id, jsonPath.getInt("user[0].id"));
        assertEquals(first_name, jsonPath.getString("user[0].first_name"));
        assertEquals(last_name, jsonPath.getString("user[0].last_name"));
        assertEquals(email, jsonPath.getInt("user[0].email"));



    }
    // US_09_POST_REQUEST_Kevser
    @Given("The api user prepares a POST request containing the {string} {string} {string} information to send to the api holidayAdd endpoint.")
    public void the_api_user_prepares_a_post_request_containing_the_information_to_send_to_the_api_holiday_add_endpoint(String holidayYear, String holidayName, String holidayDate) {
        reqBody = new HashMap<>();
        reqBody.put("year",holidayYear);
        reqBody.put("name",holidayName);
        reqBody.put("date",holidayDate);
    }

    // US_29_POST_REQUEST_Kevser
    @Given("The api user prepares a POST request containing the {string} {string} {int} {string} {string} {int} {int} {int} {int} {int} {int} information to send to the api coupon CouponAdd endpoint.")
    public void the_api_user_prepares_a_post_request_containing_the_information_to_send_to_the_api_coupon_coupon_add_endpoint(String couponTitle, String couponCode, int couponType, String startDate, String endDate, int discount, int discountType, int minShopping, int maxDiscount, int isExpire, int isMultipleBuy) {
        reqBody = new HashMap<>();
        reqBody.put("title",couponTitle);
        reqBody.put("coupon_code",couponCode);
        reqBody.put("coupon_type",couponType);
        reqBody.put("start_date",startDate);
        reqBody.put("end_date",endDate);
        reqBody.put("discount",discount);
        reqBody.put("discount_type",discountType);
        reqBody.put("minimum_shopping",minShopping);
        reqBody.put("maximum_discount",maxDiscount);
        reqBody.put("is_expire",isExpire);
        reqBody.put("is_multiple_buy",isMultipleBuy);
    }

    // US_03_GET_REQUEST_Kevser
    @Given("The api user verifies the content of the data {int} {int} {int} {int} {int} in the response body.")
    public void the_api_user_verifies_the_content_of_the_data_in_the_response_body(int runningBalance, int pendingBalance, int totalCoupon, int totalWishlist,int canceledOrder) {
        jsonPath = API_Methods.response.jsonPath();
        assertEquals(runningBalance, jsonPath.getInt("wallet_running_balance"));
        assertEquals(pendingBalance, jsonPath.getInt("wallet_pending_balance"));
        assertEquals(totalCoupon, jsonPath.getInt("total_coupon"));
        assertEquals(totalWishlist, jsonPath.getInt("total_wishlist"));
        assertEquals(canceledOrder, jsonPath.getInt("total_cancel_order"));
    }

    // US_30_PATCH_Kevser
    @Given("The api user prepares a PATCH request containing the {string} {string} {int} {string} {string} {int} {int} {int} {int} {int} {int} data to send to the api coupon couponUpdate endpoint.")
    public void the_api_user_prepares_a_patch_request_containing_the_data_to_send_to_the_api_coupon_coupon_update_endpoint(String couponTitle, String couponCode, int couponType, String startDate, String endDate, int discount, int discountType, int minShop, int maxDiscount, int isExpire, int isMultipleBuy) {
        requestBody = new JSONObject();
        requestBody.put("title", couponTitle);
        requestBody.put("coupon_code", couponCode);
        requestBody.put("coupon_type", couponType);
        requestBody.put("start_date", startDate);
        requestBody.put("end_date", endDate);
        requestBody.put("discount", discount);
        requestBody.put("discount_type", discountType);
        requestBody.put("minimum_shopping", minShop);
        requestBody.put("maximum_discount", maxDiscount);
        requestBody.put("is_expire", isExpire);
        requestBody.put("is_multiple_buy", isMultipleBuy);
    }
    @Given("The api user verifies that the title information in the response body is {string}.")
    public void the_api_user_verifies_that_the_title_information_in_the_response_body_is(String title) {
        jsonPath = API_Methods.response.jsonPath();
        assertEquals(title, jsonPath.getString("couponDetails[0].title"));
    }



    @Given("The api user verifies the content of the data {int}, {string}, {int}, {string}, {string}, {string} in the response body.")
    public void the_api_user_verifies_the_content_of_the_data_in_the_response_body(int id, String name, int status, String details, String created_at, String updated_at) {
        JsonPath jsonPath=API_Methods.response.jsonPath();

        assertEquals(id,jsonPath.getInt("departmentDetails[0].id"));
        assertEquals(name,jsonPath.getString("departmentDetails[0].name"));
        assertEquals(status,jsonPath.getInt("departmentDetails[0].status"));
        assertEquals(details,jsonPath.getString("departmentDetails[0].details"));
        Assert.assertNull(jsonPath.getString("departmentDetails[0].created_at"));
        Assert.assertNull(jsonPath.getString("departmentDetails[0].updated_at"));
    }
    //----------------------US_008 GET HariSeldon--------------------------------------
    @Given("The api user validates the {int}, {int}, {string}, {int}, {string}, {string}, {string} of the response body.")
    public void the_api_user_validates_the_response_body(int id, int year, String name, int type, String date, String created_at, String updated_at)
    {
        jsonPath=API_Methods.response.jsonPath();

        assertEquals(id,jsonPath.getInt("holidayDetails[0].id"));
        assertEquals(year,jsonPath.getInt("holidayDetails[0].year"));
        assertEquals(name,jsonPath.getString("holidayDetails[0].name"));
        assertEquals(type,jsonPath.getInt("holidayDetails[0].type"));
        assertEquals(date,jsonPath.getString("holidayDetails[0].date"));
        assertEquals(created_at,jsonPath.getString("holidayDetails[0].created_at"));
        assertEquals(updated_at,jsonPath.getString("holidayDetails[0].updated_at"));
    }

    @Given("The api user validates the {int} , {string}  of the response body")
    public void the_api_user_validates_the_of_the_response_body(int id, String name) {
        jsonPath = API_Methods.response.jsonPath();

        assertEquals(id, jsonPath.getInt("addresses[6].id"));
        assertEquals(name, jsonPath.getString("addresses[6].name"));
    }

    //===================== US_ 34 _POST =======================

    @Given("The api user prepares a POST request containing the {string},{string},{string},{string},{string},{string},{string},{string},{string} information to send to the api.")
    public void the_api_user_prepares_a_post_request_containing_the_information_to_send_to_the_api (String
                                                                                                            name, String email, String address, String phone, String city, String state, String country, String
                                                                                                            postal_code, String address_type){
        // * The api user prepares a POST request containing the "<name>","<email>","<address>","<phone>","<city>","<state>","<country>","<postal_code>","<address_type>" information to send to the api.
        requestBody = new JSONObject();
        requestBody.put("name", name);
        requestBody.put("email", email);
        requestBody.put("address", address);
        requestBody.put("phone", phone);
        requestBody.put("city", city);
        requestBody.put("state", state);
        requestBody.put("country", country);
        requestBody.put("postal_code", postal_code);
        requestBody.put("address_type", address_type);

    }
    //============================= US_25 PATCH =========================

    @Given("The api user prepares a PATCH request containing the {string} data to send to the api.")
    public void the_api_user_prepares_a_patch_request_containing_the_data_to_send_to_the_api (String name){
        requestBody = new JSONObject();
        requestBody.put("name", name);

    }

    @Given("The api user verifies that the reason information in the response body {string}.")
    public void the_api_user_verifies_that_the_reason_information_in_the_response_body (String nameValue){
        jsonPath = API_Methods.response.jsonPath();

        assertEquals(nameValue, jsonPath.getString("departmentDetails[0].name"));
    }

//============================= US_42 POST ==================

    @Given("The api user prepares a POST request containing the {int}, {string}, {string}, {string}, {int}, {string}, {string}, {string}, {int}, {string} informations to send to the api desired endpoint.")
    public void the_api_user_prepares_a_post_request_containing_the_informations_to_send_to_the_api_desired_endpoint(int customer_id, String name, String email, String address, int phone, String city, String state, String country, int postal_code, String address_type) {
        requestBody=new JSONObject();
        requestBody.put("customer_id", customer_id);
        requestBody.put("name", name);
        requestBody.put("email", email);
        requestBody.put("address", address);
        requestBody.put("phone", phone);
        requestBody.put("city", city);
        requestBody.put("state", state);
        requestBody.put("country", country);
        requestBody.put("postal_code", postal_code);
        requestBody.put("address_type", address_type);

    }
    //============================= US_40 GET ==================
    @Given("The api user prepares a GET request containing {string} {int} to send to the api {string} endpoint.")
    public void get_request_containing_the_id_for_which_details_are_to_be_accessed_to_send_to_the_api_desired_endpoint(String data, int id, String endpoint) {
        System.out.println("The api user sent a GET request with " + data + " id: " + id + " to the " + endpoint + " endpoint and the request response result is as below: ");
        String attribute;
        if (data.contains("state"))         {attribute = "state_id";}
        else if (data.contains("country"))  {attribute= "country_id";}
        else {attribute= "id";}
//        reqBody=new HashMap<>();
        reqBody.put(attribute,id);
//        requestBody = new JSONObject();
        requestBody.put(attribute, id);
    }
    @Given("The api user verifies the content of the data {int}, {string} in the response body.")
    public void the_api_user_verifies_the_content_of_the_data_in_the_response_body(int cityID, String cityName) {
        jsonPath = API_Methods.response.jsonPath();
        assertEquals(cityID, jsonPath.getInt("addresses[12].id"));
        assertEquals(cityName, jsonPath.getString("addresses[12].name"));
    }


    //==================================US_21 Delete ======================

    @Given("The api user verifies the content of the data {int}, null, {string}, {string}, {int}, {string}, {string} in the response body.")
    public void the_api_user_verifies_the_content_of_the_data_null_in_the_response_body(int id, String title, String description, int status, String created_at, String updated_at) {
        jsonPath= API_Methods.response.jsonPath();
        Assert.assertEquals(id,jsonPath.getInt("FaqsDetails[0].id"));
        Assert.assertEquals(title,jsonPath.getString("FaqsDetails[0].title"));
        Assert.assertEquals(description,jsonPath.getString("FaqsDetails[0].description"));
        Assert.assertEquals(status,jsonPath.getInt("FaqsDetails[0].status"));
        Assert.assertEquals(created_at,jsonPath.getString("FaqsDetails[0].created_at"));
        Assert.assertEquals(updated_at,jsonPath.getString("FaqsDetails[0].updated_at"));
    }

    //==================================US_10 Patch ======================

    @Given("The api user prepares a PATCH request containing the {string},{string},{string} data to send to the api.")
    public void the_api_user_prepares_a_patch_request_containing_the_data_to_send_to_the_api(String year, String name, String date) {

        requestBody = new JSONObject();
        requestBody.put("year", year);
        requestBody.put("name", name);
        requestBody.put("date", date);
    }
  /*  @Given("The API user records the response from the api holidayUpdate endpoint, confirming that the status code is 400 and the reason phrase is dublicate holiday request.")
    public void the_apı_user_records_the_response_from_the_api_holiday_update_endpoint_confirming_that_the_status_code_is_and_the_reason_phrase_is_dublicate_holiday_request() {

        Assert.assertTrue(API_Methods.tryCatchPatch(requestBody.toString()).equals(ConfigReader.getProperty("dublicateholidayMessage", "api")));
    }*/

    @Given("The api user adds a key field {string} with the value {string} to the request body")
    public void the_api_user_prepares_the_request_body(String key, String value) {
        if (value.equals("added_item_id")){
            requestBody.put(key,addedItemId);
            System.out.println(requestBody.toString());}
        else if (value.equals("updated_Id")) {requestBody.put(key,updatedId);
            System.out.println(requestBody.toString());}
        else if (value.equals("Deleted_Id")) {requestBody.put(key,DeletedId);
            System.out.println(requestBody.toString());}
        else if (key.equals("id")) {
            if (value.equals("lastItemId")) {requestBody.put(key, lastItemId);}
//            else if (value.equals("nonList")) {}
            else {id=parseInt(value);requestBody.put(key,value);}
            System.out.println(requestBody.toString());}
        else {requestBody.put(key,value);}
    }
    @Given("The api user verifies that {string} returned in the response body by sending a GET request to the {string} endpoint")
    public void the_api_user_verifies_response_body(String key, String endpoint) {
        switch (endpoint){
            case "holidayDetails":Assert.assertTrue(API_Methods.response.jsonPath().getString("holidayDetails[0].id").contains(addedItemId));break;
            case "faqsDetails": Assert.assertTrue(API_Methods.response.jsonPath().getString("FaqsDetails[0].id").contains(addedItemId));break;
            case "refundReasonDetails":Assert.assertTrue(API_Methods.response.jsonPath().getString("refundReasonDetails[0].id").contains(addedItemId));break;
            case "departmentDetails":Assert.assertTrue(API_Methods.response.jsonPath().getString("departmentDetails[0].id").contains(addedItemId));break;
            case "couponDetails":Assert.assertTrue(API_Methods.response.jsonPath().getString("couponDetails[0].id").contains(addedItemId));break;
            case "customerDetailsAddress":Assert.assertTrue(API_Methods.response.jsonPath().getString("addresses[0].id").contains(addedItemId));break;
            case "addressDetails":Assert.assertTrue(API_Methods.response.jsonPath().getString("addresses[0].id").contains(addedItemId));break;
        }
    }

    @Given("The api user verifies that the {string} information in the response body matches the id path parameter specified in the endpoint.")
    public void the_api_user_verifies_that_the_id_information_in_the_response_body_matches_with_the_id_path_parameter_specified_in_the_endpoint(String key) {

        switch (key){
            case "updated_Id": jsonPath = API_Methods.response.jsonPath(); assertEquals(id, jsonPath.getInt(key));break;
            case "Deleted_Id": jsonPath = API_Methods.response.jsonPath(); assertEquals(DeletedId, jsonPath.getInt(key));break;
        }


//        // 2. adim
//        API_Methods.response.then()
//                .assertThat()
//                .body("Deleted_Id", equalTo(id));
    }
    @Given("The api user adds a requestKey field {string} with the requestValue {string} to the request body")
    public void the_api_user_prepares_the_requestbody(String requestKey, String requestValue) {
        switch (requestKey){
            case "id" : id=parseInt(requestValue);
                requestBody.put(requestKey,id);
                System.out.println(requestBody.toString());break;
            case "":
        }



//        if (requestValue.equals("added_item_id")){
//            requestBody.put(requestKey,addedItemId);
//            System.out.println(requestBody.toString());}
//        else if (requestValue.equals("updated_Id")) {requestBody.put(requestKey,updatedId);
//            System.out.println(requestBody.toString());}
//        else if (requestValue.equals("Deleted_Id")) {requestBody.put(requestKey,DeletedId);
//            System.out.println(requestBody.toString());}
//        else if (requestKey.equals("id")) {id=parseInt(requestValue);requestBody.put(requestKey,requestValue);
//            System.out.println(requestBody.toString());}
//        else {requestBody.put(requestKey,requestValue);}
    }
    @Given("The api user detects the id at the last index in the response")
    public void the_api_user_detects_the_id_at_the_last_index(){
        lastItemId = given().spec(spec).when().get(fullPath).jsonPath().getInt("coupons[-1].id");
        System.out.println("lastId= "+ lastItemId);
    }
    @Given("The api user detects the id at the last index in the faqList endpoint response")
    public void the_api_user_detects_id_at_the_last_index(){
        lastItemId = given().spec(spec).when().get(fullPath).jsonPath().getInt("Faqs[-1].id");
        System.out.println("lastId= "+ lastItemId);
    }
}









