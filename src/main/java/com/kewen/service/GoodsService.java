package com.kewen.service;

import com.kewen.dao.GoodsDao;
import com.kewen.model.Goods;
import com.kewen.model.Page;

import java.util.List;
import java.util.Map;

public class GoodsService {
    private GoodsDao gDao=new GoodsDao();

    public Goods getGoodsById(int goodsId){
        Goods goods =null;
        try {
            goods = gDao.getGoodsById(goodsId);
        }catch (Exception e ) {
            throw new RuntimeException(e);
        }
        return goods;
    }
    //根据分类编号
   /* public List<Goods> selectGoodsList(int id){
        List<Goods> list=null;
        try {
            list = gDao.selectGoodsList(id);
        } catch(Exception e){
            throw new RuntimeException(e);
        }
        return list;
    }

    */
    //重新定义分页查询
    public Page selectPageGoodsList(int id, int pageNumber){
        Page p=new Page();
        p.setPageNumber(pageNumber);
        int totalCount=0;
        try {
            totalCount=gDao.getCountOfGoodsByTypeId(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        p.setPageSizeAndTotalCount(8,totalCount);
        List list=null;
        try {
            list=gDao.selectGoodsList(id,pageNumber,8);
        } catch (Exception e) {
            e.printStackTrace();
        }
        p.setList(list);
        return p;
    }
    public List<Map<String,Object>> getGoodsList(int recommendType,int count){
        List<Map<String,Object>> list=null;
        try {
            list=gDao.getGoodsList(recommendType,count);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public Page selectRecommendGoodsList(int type,int pageNumber){
        Page p = new Page();
        p.setPageNumber(pageNumber);
        int totalCount =0;
        try {
            totalCount = gDao.getRecommendCountByTypeId(type);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        p.setPageSizeAndTotalCount(8,totalCount);
        List list = null;
        try {
            list = gDao.selectRecommendGoodsList(type,pageNumber,8);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        p.setList(list);
        return p;
    }

    // 关键字分页搜索
    public Page selectPageGoodsListByKeyword(String keyword, int pageNumber) {
        Page p = new Page();
        p.setPageNumber(pageNumber);
        int totalCount = 0;
        try {
            totalCount = gDao.getCountOfGoodsByKeyword(keyword);
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 每页显示 8 个，和分类列表保持一致
        p.setPageSizeAndTotalCount(8, totalCount);
        List list = null;
        try {
            list = gDao.selectGoodsListByKeyword(keyword, pageNumber, 8);
        } catch (Exception e) {
            e.printStackTrace();
        }
        p.setList(list);
        return p;
    }
}
