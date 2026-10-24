package com.kewen.dao;

import com.kewen.model.Order;
import com.kewen.model.OrderItem;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.Connection;
import java.sql.SQLException;

public class OrderDao {

    // 1. 插入订单主表
    public int addOrder(Connection conn, Order order) throws SQLException {
        QueryRunner r = new QueryRunner();
        // 🌟 核心修改：严格对齐你截图里的字段 (amount代表总金额, order_date代表时间)
        String sql = "INSERT INTO orders (user_id, order_date, amount, status) VALUES (?,?,?,?)";

        // 参数对应：
        // 1. user_id
        // 2. order_date (当前时间)
        // 3. amount (订单总金额)
        // 4. status (默认填个字符串 "待支付" 或者用实体类的)
        return r.insert(conn, sql, new ScalarHandler<Long>(),
                order.getUser_id(),
                new java.sql.Timestamp(System.currentTimeMillis()),
                order.getTotal(),
                "待支付" // 你的数据库里 status 是 varchar，填个中文字符串就行
        ).intValue();
    }

    // 2. 插入订单详情表 (保持原样不变)
    public void addOrderItem(Connection conn, OrderItem item) throws SQLException {
        QueryRunner r = new QueryRunner();
        String sql = "INSERT INTO orderitem (order_id, goods_id, amount, price) VALUES (?,?,?,?)";
        r.update(conn, sql, item.getOrder().getId(), item.getGoods_id(), item.getAmount(), item.getPrice());
    }

    // 3. 扣减库存 (保持原样不变)
    public int updateStock(Connection conn, int goodsId, int amount) throws SQLException {
        QueryRunner r = new QueryRunner();
        String sql = "UPDATE goods SET stock = stock - ? WHERE id = ? AND stock >= ?";
        return r.update(conn, sql, amount, goodsId, amount);
    }
}