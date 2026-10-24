package com.kewen.dao;

import com.kewen.model.Goods;
import com.kewen.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import java.util.List;
import java.util.Map;

public class GoodsDao {
    public Goods getGoodsById(int goodsId) throws Exception{
        QueryRunner r=new QueryRunner(DataSourceUtils.getDataSource());
        String sql ="select * from goods where id = ?";
        return r.query(sql,new BeanHandler<Goods>(Goods.class),goodsId);
    }

    public int getCountOfGoodsByTypeId(int typeId) throws Exception{
        if (typeId==0){
            QueryRunner r=new QueryRunner(DataSourceUtils.getDataSource());
            String sql="select count(*) from goods ";
            return r.query(sql, new ScalarHandler<Long>()).intValue();
        }else {
            QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
            String sql = "select count(*) from goods where type_id = ? ";
            return r.query(sql, new ScalarHandler<Long>(), typeId).intValue();
        }
    }
    public List<Goods> selectGoodsList(int id,int pageNumber,int pageSize) throws Exception {
        if (id==0){
            QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
            String sql = "select * from goods ORDER BY price DESC limit ?,?";
            return r.query(sql, new BeanListHandler<Goods>(Goods.class), (pageNumber - 1) * pageSize, pageSize);

        }else {
            QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
            String sql = "select * from goods where type_id = ? ORDER BY price DESC limit ?,?";
                                                                       /*第一个？：偏移量，指定从哪条记录开始返回*/
                                                                       /*第二个？：每页数量，指定返回多少条记录*/
            return r.query(sql, new BeanListHandler<Goods>(Goods.class), id, (pageNumber - 1) * pageSize, pageSize);
        }
    }
    public List<Map<String,Object>> getGoodsList(int recommendType, int count) throws Exception{
        QueryRunner r=new QueryRunner(DataSourceUtils.getDataSource());
        String sql="SELECT g.id,g.name,g.cover,g.price,t.name typename FROM recommend r,goods g,type t WHERE type=? AND r.goods_id=g.id AND g.type_id=t.id LIMIT 0,?";
        return r.query(sql,new MapListHandler(),recommendType,count);

    }
    public int getRecommendCountByTypeId(int type) throws Exception{
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select count(*) from recommend WHERE type = ?";
        return r.query(sql,new ScalarHandler<Long>(),type).intValue();
    }

    public List<Goods> selectRecommendGoodsList(int type,int pageNumber,int pageSize) throws Exception{
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql ="SELECT g.* FROM goods g,recommend r WHERE r.goods_id = g.id and r.type = ? LIMIT ?,?";
        return r.query(sql,new BeanListHandler<Goods>(Goods.class),type,(pageNumber- 1)*pageSize,pageSize);
    }

    // 1. 根据关键字查询商品总数（用于分页）
    public int getCountOfGoodsByKeyword(String keyword) throws Exception {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "SELECT count(*) FROM goods WHERE name LIKE ?";
        return r.query(sql, new ScalarHandler<Long>(), "%" + keyword + "%").intValue();
    }

    // 2. 根据关键字分页查询商品列表
    public List<Goods> selectGoodsListByKeyword(String keyword, int pageNumber, int pageSize) throws Exception {
        QueryRunner r = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "SELECT * FROM goods WHERE name LIKE ? ORDER BY price DESC LIMIT ?, ?";
        return r.query(sql, new BeanListHandler<Goods>(Goods.class), "%" + keyword + "%", (pageNumber - 1) * pageSize, pageSize);
    }
}
