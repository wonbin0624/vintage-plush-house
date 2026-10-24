package com.kewen.model;

import lombok.AllArgsConstructor;
import lombok.Data;

/*User实体类---映射数据库user表*/
@Data
public class User {
    private int id;
    private String username;
    private String password;
    private String email;
    private String name;
    private String phone;
    private String address;
    private boolean isadmin=false;
    private boolean isIsvalidate=false;



}
