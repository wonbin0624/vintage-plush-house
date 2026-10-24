package com.kewen.servlet;
import com.kewen.service.GoodsService;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;
@WebServlet(urlPatterns = "/index")
public class IndexServlet extends BaseServlet {
    private GoodsService gService = new GoodsService();
    public void home(HttpServletRequest request, HttpServletResponse response) throws
            Exception{
        System.out.println("查询首页显示的商品数据");
//新品 recommendType 是3,
        List<Map<String, Object>> newList = gService.getGoodsList(3,8);
        request.setAttribute("newList",newList);
//热销 recommandType 是2
        List<Map<String, Object>> hotList = gService.getGoodsList(2,6);
        request.setAttribute("hotList",hotList);
        System.out.println(hotList);
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }
}