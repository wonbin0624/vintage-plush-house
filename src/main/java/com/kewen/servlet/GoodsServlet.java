package com.kewen.servlet;

import com.kewen.model.Goods;
import com.kewen.model.Order;
import com.kewen.model.Page;
import com.kewen.model.Type;
import com.kewen.service.GoodsService;
import com.kewen.service.TypeService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@WebServlet(urlPatterns = "/goods")
public class GoodsServlet extends BaseServlet {
    private GoodsService gService = new GoodsService();
    private TypeService tService = new TypeService();

    public void buy(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Order o = null;
        HttpSession session = request.getSession();

        if (session.getAttribute("user")!=null){
            if (session.getAttribute("order")!=null){
                o = (Order) session.getAttribute("order");

            }else {
                o = new Order();
                session.setAttribute("order",o);
            }

            int goodsId = Integer.parseInt(request.getParameter("goodsId"));
            Goods goods = gService.getGoodsById(goodsId);
            if (goods.getStock()>0){
                o.addGoods(goods);
                response.getWriter().print("ok");
            }else {
                response.getWriter().print("error");
            }

        }else {
            response.getWriter().print("login");
        }
    }

    public void goodsList(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int id = 0, pageNumber = 0;
        if (request.getParameter("id") != null) {
            id = Integer.parseInt(request.getParameter("id"));
        }
        if (request.getParameter("pageNumber") != null) {
            pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
        }
        if (pageNumber <= 0) {
            pageNumber = 1;
        }

        if (id != 0) {
            Type type = tService.selectTypeNameById(id);
            request.setAttribute("type", type);

        }
//List<Goods> list = gService.selectGoodsList(id);
        Page page = gService.selectPageGoodsList(id, pageNumber);
        request.setAttribute("p", page);
        request.setAttribute("id", id);
        request.getRequestDispatcher("goods_list.jsp").forward(request, response);

    }


    public void goodsRecommendList(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int type = Integer.parseInt(request.getParameter("type"));
        int pageNumber = 0;
        if (request.getParameter("pageNumber") != null) {
            pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
        }
        if (pageNumber <= 0) {
            pageNumber = 1;
        }
        Page page = gService.selectRecommendGoodsList(type, pageNumber);
        request.setAttribute("p", page);
        request.setAttribute("type", type);
        request.getRequestDispatcher("goods_recommend_list.jsp").forward(request, response);
    }

    public void search(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // 获取搜索关键字
        String keyword = request.getParameter("keyword");
        if (keyword == null || keyword.trim().isEmpty()) {
            // 如果关键字为空，重定向到全部商品列表
            response.sendRedirect("/goods?method=goodsList");
            return;
        }

        // 处理分页页码
        int pageNumber = 1;
        if (request.getParameter("pageNumber") != null) {
            pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
        }

        // 调用 Service 层搜索
        Page page = gService.selectPageGoodsListByKeyword(keyword, pageNumber);

        // 将分页数据和关键字存入 request
        request.setAttribute("p", page);
        request.setAttribute("keyword", keyword); // 传给 JSP，用于回显和分页

        // 转发到商品列表页展示（复用 goods_list.jsp）
        request.getRequestDispatcher("goods_list.jsp").forward(request, response);
    }
}