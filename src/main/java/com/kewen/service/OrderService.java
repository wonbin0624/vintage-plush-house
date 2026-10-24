package com.kewen.service;

import com.kewen.dao.OrderDao;
import com.kewen.model.Order;
import com.kewen.model.OrderItem;
import com.kewen.utils.DataSourceUtils;

import java.sql.Connection;
import java.sql.SQLException;

public class OrderService {
    private OrderDao oDao = new OrderDao();

    public boolean submitOrder(Order order) {
        Connection conn = null;
        try {
            // 1. 获取连接，关闭自动提交，开启事务
            conn = DataSourceUtils.getConnection();
            conn.setAutoCommit(false);

            // 2. 插入订单主表，拿到返回的订单ID
            int orderId = oDao.addOrder(conn, order);
            order.setId(orderId);

            // 3. 遍历订单项，插入详情表，并扣减库存
            for (OrderItem item : order.getItemMap().values()) {
                oDao.addOrderItem(conn, item);

                // 扣减库存，如果返回 0，说明库存不足，直接抛异常回滚
                int rows = oDao.updateStock(conn, item.getGoods_id(), item.getAmount());
                if (rows == 0) {
                    throw new RuntimeException("商品 [" + item.getGoods().getName() + "] 库存不足，下单失败！");
                }
            }

            // 4. 所有操作成功，提交事务
            conn.commit();
            return true;

        } catch (Exception e) {
            // 5. 发生任何异常（比如库存不足），回滚事务，保证数据一致性
            if (conn != null) {
                try { conn.rollback(); } catch (SQLException ex) { ex.printStackTrace(); }
            }
            e.printStackTrace();
            return false;
        } finally {
            // 6. 恢复自动提交并释放连接
            if (conn != null) {
                try {
                    conn.setAutoCommit(true);
                    conn.close();
                } catch (SQLException e) { e.printStackTrace(); }
            }
        }
    }
}