package com.kewen.model;
import lombok.Data;
@Data
public class OrderItem {
    private int id;
    private int goods_id;
    private int amount;
    private float price;
    private Order order; //多对1

    // 🌟 新增：把商品对象也存进来，这样前端就能直接取商品名字和图片了
    private Goods goods;
}