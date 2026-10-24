<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css" href="css/ins-style.css">

<div class="header">
    <div class="container">
        <nav class="navbar">
            <ul class="navbar-nav">
                <li><a href="/index">首页</a></li>
                <li class="dropdown">
                    <a href="#" id="btn">
                        商品分类 <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu" id="menu">
                        <li>
                            <h4>商品分类</h4>
                            <ol>
                                <li><a href="/goods?method=goodsList">全部系列</a></li>
                                <c:forEach items="${typeList}" var="type">
                                    <li><a href="/goods?method=goodsList&id=${type.id}">${type.name}</a></li>
                                </c:forEach>
                            </ol>
                        </li>
                    </ul>
                </li>
                <li><a href="/goods?method=goodsRecommendList&type=2">热销</a></li>
                <li><a href="/goods?method=goodsRecommendList&type=3">新品</a></li>
                <c:choose>
                    <c:when test="${user == null}">
                        <li><a href="user_register.jsp">注册</a></li>
                        <li><a href="user_login.jsp">登录</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="#">我的订单</a></li>
                        <li><a href="user_center.jsp">个人中心</a></li>
                        <li><a href="/user?method=logout">退出</a></li>
                    </c:otherwise>
                </c:choose>
                <c:if test="${user!=null && user.isadmin}">
                    <li><a href="#">后台管理</a></li>
                </c:if>
            </ul>
        </nav>

        <div class="header-info">
            <div class="search-box">
                <!-- 加了 id="mySearchBtn" 拦截点击 -->
                <a href="javascript:;" id="mySearchBtn">
                    <svg class="custom-icon" viewBox="0 0 24 24" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="11" cy="11" r="8"></circle>
                        <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                    </svg>
                </a>
                <!-- 加了 id="mySearchForm" -->
                <div class="search-form" id="mySearchForm">
                    <form class="navbar-form" action="/goods" method="get">
                        <input type="hidden" name="method" value="search">
                        <input type="text" name="keyword" placeholder="搜索宝贝..." required />
                        <button type="submit" class="btn-default">搜索</button>
                    </form>
                </div>
            </div>

            <div class="cart-box">
                <a href="goods_cart.jsp">
                    <svg class="custom-icon" viewBox="0 0 24 24" width="26" height="26" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                        <circle cx="9" cy="21" r="1"></circle>
                        <circle cx="20" cy="21" r="1"></circle>
                        <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path>
                    </svg>
                    <c:if test="${order != null && order.amount > 0}">
                        <span class="cart-num">${order.amount}</span>
                    </c:if>
                </a>
            </div>
        </div>
    </div>
</div>

<script>
    // 1. 商品分类下拉菜单
    document.getElementById('btn').addEventListener('click',function(e){
        e.preventDefault();
        const obj = document.getElementById('menu');
        if(obj.style.display == 'block'){
            obj.style.display = 'none';
        }else{
            obj.style.display = 'block';
        }
    });

    // 2. 暴力接管搜索框显示逻辑，无视原项目的滚动隐藏
    var mySearchBtn = document.getElementById('mySearchBtn');
    var mySearchForm = document.getElementById('mySearchForm');
    var isSearchOpen = false;

    mySearchBtn.addEventListener('click', function(e) {
        e.preventDefault();
        e.stopPropagation(); // 阻止冒泡，防止原项目JS捣乱
        if (isSearchOpen) {
            mySearchForm.style.setProperty('display', 'none', 'important');
            isSearchOpen = false;
        } else {
            mySearchForm.style.setProperty('display', 'block', 'important');
            isSearchOpen = true;
        }
    });

    // 3. 强制锁死：不管原项目怎么监听滚动，只要状态是 open，就强行覆盖 display 属性
    window.addEventListener('scroll', function() {
        if (isSearchOpen) {
            mySearchForm.style.setProperty('display', 'block', 'important');
        }
    }, { passive: true });
</script>