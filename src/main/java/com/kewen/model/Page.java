package com.kewen.model;
import lombok.Data;
import java.util.List;
//封装分页查询数据的类
@Data
public class Page {
    private int pageNumber;  //页码
    private int pageSize;    //一页显示多少条记录
    private int totalCount;   //一共多少条
    private int totalPage;    //一共多少页

    private List<Object> list;   //返回数据  例如 返回商品 默认一页8个。

    //传入参数  一页显示多少，一共多少条记录，在该方法中求出一共多少页
    public void setPageSizeAndTotalCount(int pageSize,int totalCount)
    {
        this.pageSize=pageSize;
        this.totalCount=totalCount;
        totalPage= (int)Math.ceil((double)totalCount/pageSize);
    }

}
