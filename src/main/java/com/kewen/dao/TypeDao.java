package com.kewen.dao;
import com.kewen.model.Type;
import com.kewen.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import java.util.List;
public class TypeDao {
    public List<Type> getAllType() throws Exception{
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "SELECT * FROM type";
// 1条记录 1个实体类对象 new BeanHandler<>()
// n条记录 n个实体类对象(存List集合)
        return r.query(sql,new BeanListHandler<Type>(Type.class));
    }

    public Type selectTypeNameById(int id) throws Exception{
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from type where id = ?";
        return r.query(sql,new BeanHandler<Type>(Type.class),id);
    }
}