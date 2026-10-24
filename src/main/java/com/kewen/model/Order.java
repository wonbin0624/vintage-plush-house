package com.kewen.model;
import com.kewen.utils.PriceUtils;
import lombok.Data;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Data
public class Order {
    private int id;
    private float total;
    private int amount;
    private int status;
    private int paytype;
    private String name;
    private String phone;
    private String address;
    private Date datetime;
    private int user_id;

    private Map<Integer,OrderItem> itemMap = new HashMap<Integer,OrderItem>();

    public void addGoods(Goods g){
        if(itemMap.containsKey(g.getId())){
            OrderItem orderItem = itemMap.get(g.getId());
            orderItem.setAmount(orderItem.getAmount() + 1);
        }else{
            OrderItem orderItem = new OrderItem();
            orderItem.setGoods_id(g.getId());
            orderItem.setPrice(g.getPrice());
            orderItem.setAmount(1);
            orderItem.setOrder(this);
            orderItem.setGoods(g); // 🌟 把商品对象存进去

            // 🚨 核心修复：把它放进 Map 里！！！
            itemMap.put(g.getId(), orderItem);
        }
        this.amount++;
        this.total = PriceUtils.add(g.getPrice(), this.total);
    }
    // 减少商品数量（如果数量减到0，就自动移除该商品）
    public void reduceGoods(Goods g) {
        if (itemMap.containsKey(g.getId())) {
            OrderItem orderItem = itemMap.get(g.getId());
            if (orderItem.getAmount() > 1) {
                orderItem.setAmount(orderItem.getAmount() - 1);
                this.amount--;
                // 注意金额要用 BigDecima l工具类相减，防止精度丢失
                this.total = PriceUtils.subtract(this.total, g.getPrice());
            } else {
                // 如果只有1件，减1就等于删除
                removeGoods(g);
            }
        }
    }

    // 彻底移除该商品（不管有多少件）
    public void removeGoods(Goods g) {
        if (itemMap.containsKey(g.getId())) {
            OrderItem orderItem = itemMap.get(g.getId());
            // 减去对应的总金额
            float itemTotalPrice = PriceUtils.add(0, orderItem.getPrice() * orderItem.getAmount());
            this.total = PriceUtils.subtract(this.total, itemTotalPrice);
            // 减去对应的总件数
            this.amount -= orderItem.getAmount();
            // 从 Map 中移除
            itemMap.remove(g.getId());
        }
    }
}