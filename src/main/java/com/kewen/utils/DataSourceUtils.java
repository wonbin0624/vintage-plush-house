package com.kewen.utils;
import com.mchange.v2.c3p0.ComboPooledDataSource;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;
public class DataSourceUtils {
    //DataSource类，就是数据源对象
    private static DataSource ds = new ComboPooledDataSource();
    //获得数据源对象
    public static DataSource getDataSource(){
        return ds;
    }

    public static Connection getConnection() {
//解决1： 使用try-catch进行异常处理
//解决2： 不处理异常，直接抛出 给调用者 throws SQLException
        try {
            return ds.getConnection();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
        System.out.println(DataSourceUtils.getConnection());
    }
}