package com.kewen.model;
import lombok.Data;
@Data
public class Goods {
    private int id;
    private String name;
    private String cover;
    private String image1;
    private String image2;
    private float price;
    private String intro;
    private int stock;
    private int type_id;
}