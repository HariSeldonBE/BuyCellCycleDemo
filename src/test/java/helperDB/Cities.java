package helperDB;

import com.github.javafaker.Faker;

import java.util.ArrayList;
import java.util.List;

public class Cities {
    static Faker faker = new Faker();
    private static  String name;
    private static  int state_id;
    private static  int status;
    private static String created_at;


    public static String getName() {
        return name;
    }

    public static int getState_id() {
        return state_id;
    }

    public static int getStatus() {
        return status;
    }

    public static String getCreated_at() {
        return created_at;
    }

    public Cities(String name, int state_id, int status, String created_at ){


        this.name = name;
        this.state_id= state_id;
        this.status = status;
        this.created_at = created_at;

    }
    public static List<Cities> generateCities (int count) {
        List<Cities> cities = new ArrayList<>();
        for (int i = 0; i < count; i++) {
            Cities cities1 = new Cities(
                    faker.name().fullName(),
                    faker.number().numberBetween(0, 100),
                    faker.number().numberBetween(0, 3),
                    null
            );
            cities.add(cities1);

        }
        return cities;


    }}
