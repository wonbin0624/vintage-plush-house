package com.kewen.servlet;

import com.kewen.model.Order;
import com.kewen.model.User;
import com.kewen.service.OrderService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.kewen.service.GoodsService;
import com.kewen.model.Goods;

@WebServlet(urlPatterns = "/order")
public class OrderServlet extends BaseServlet {
    private OrderService oService = new OrderService();

    public void submit(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Order order = (Order) session.getAttribute("order");

        // 安全校验：没登录或没购物车不能提交
        if (user == null) {
            response.sendRedirect("/user_login.jsp");
            return;
        }
        if (order == null || order.getItemMap().isEmpty()) {
            request.setAttribute("msg", "购物车为空，无法提交订单！");
            request.getRequestDispatcher("/goods_cart.jsp").forward(request, response);
            return;
        }

        // 绑定用户和订单信息
        order.setUser_id(user.getId());
        order.setName(user.getName());
        order.setPhone(user.getPhone());
        order.setAddress(user.getAddress());

        // 校验一下有没有收货信息
        if (order.getAddress() == null || order.getAddress().trim().isEmpty()) {
            request.setAttribute("msg", "请先在个人中心完善收货信息！");
            request.getRequestDispatcher("/goods_cart.jsp").forward(request, response);
            return;
        }

        // 调用 Service 开启事务下单
        boolean isSuccess = oService.submitOrder(order);

        if (isSuccess) {
            // 下单成功，清空 Session 里的购物车
            session.removeAttribute("order");
            // 转发到成功页面（或者直接用 JS 弹窗跳转）
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().print("<script>alert('下单成功！感谢您的购买~'); window.location.href='/index';</script>");
        } else {
            // 下单失败（库存不足等）
            request.setAttribute("msg", "库存不足或系统繁忙，下单失败！");
            request.getRequestDispatcher("/goods_cart.jsp").forward(request, response);
        }
    }

    // 增加数量
    public void addAmount(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int goodsId = Integer.parseInt(request.getParameter("id"));
        Order order = (Order) request.getSession().getAttribute("order");
        if (order != null) {
            // 需要查一下商品实体，因为加减法需要用到商品的价格
            GoodsService gService = new GoodsService();
            Goods goods = gService.getGoodsById(goodsId);
            order.addGoods(goods);
        }
        response.sendRedirect("/goods_cart.jsp"); // 操作完刷新购物车页面
    }

    // 减少数量
    public void reduceAmount(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int goodsId = Integer.parseInt(request.getParameter("id"));
        Order order = (Order) request.getSession().getAttribute("order");
        if (order != null) {
            GoodsService gService = new GoodsService();
            Goods goods = gService.getGoodsById(goodsId);
            order.reduceGoods(goods);
        }
        response.sendRedirect("/goods_cart.jsp");
    }

    // 删除商品
    public void remove(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int goodsId = Integer.parseInt(request.getParameter("id"));
        Order order = (Order) request.getSession().getAttribute("order");
        if (order != null) {
            GoodsService gService = new GoodsService();
            Goods goods = gService.getGoodsById(goodsId);
            order.removeGoods(goods);
        }
        response.sendRedirect("/goods_cart.jsp");
    }
}