<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<html>
<head>
    <title>商品列表</title>
    <link type="text/css" rel="stylesheet" href="css/bootstrap.css">
    <link type="text/css" rel="stylesheet" href="css/default.css">
    <link type="text/css" rel="stylesheet" href="css/style_v2.css"/>
    <link type="text/css" rel="stylesheet" href="css/header.css"/>
    <link type="text/css" rel="stylesheet" href="css/footer.css"/>
    <!-- 引入全局 Ins 风样式 -->
    <link type="text/css" rel="stylesheet" href="css/ins-style.css"/>

    <script type="text/javascript" src="script/jquery.min.js"></script>
    <script type="text/javascript" src="script/cart.js"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="products" style="min-height:1080px;">
    <div class="container">

        <!-- 核心修改 1：标题动态展示 -->
        <div class="alert alert-danger">
            <c:choose>
                <c:when test="${not empty keyword}">搜索结果：${keyword}</c:when>
                <c:when test="${empty type.name}">全部商品</c:when>
                <c:otherwise>${type.name}</c:otherwise>
            </c:choose>
        </div>

        <div class="col-md-12 product-model-sec">
            <c:forEach items="${p.list}" var="g">
                <div class="product-grid">
                        <a href="#">
                            <div class="more-product"><span> </span></div>
                            <div class="product-img b-link-stripe b-animate-go thickbox">
                                <img src="${g.cover}" class="img-responsive" alt="${g.name}" width="240" height="240">
                                <div class="b-wrapper">
                                    <h4 class="b-animate b-from-left b-delay03">
                                        <button href="#">查看详情</button>
                                    </h4>
                                </div>
                            </div>
                        </a>
                        <div class="product-info simpleCart_shelfItem">
                            <div class="product-info-cust prt_name">
                                <h4>${g.name}</h4>
                                <span class="item_price">¥ ${g.price}</span>
                                <input type="button" class="item_add items" value="加入购物车" onclick="buy(${g.id})">
                                <div class="clearfix"> </div>
                            </div>
                        </div>
                    </div>
            </c:forEach>

            <!-- 核心修改 2：如果没有搜到商品，显示可爱提示 -->
            <c:if test="${empty p.list}">
                <div style="text-align: center; font-size: 20px; color: #FF69B4; margin-top: 50px; margin-bottom: 100px;">
                    没有找到相关毛绒玩具哦~
                </div>
            </c:if>
        </div>

        <!-- 核心修改 3：分页参数动态判断 -->
        <c:choose>
            <c:when test="${not empty keyword}">
                <!-- 如果是搜索，分页带上 keyword -->
                <jsp:include page="page.jsp">
                    <jsp:param name="url" value="/goods"></jsp:param>
                    <jsp:param name="param" value="&method=search&keyword=${keyword}"></jsp:param>
                </jsp:include>
            </c:when>
            <c:otherwise>
                <!-- 如果是正常分类，分页带上 id -->
                <jsp:include page="page.jsp">
                    <jsp:param name="url" value="/goods"></jsp:param>
                    <jsp:param name="param" value="&method=goodsList&id=${id}"></jsp:param>
                </jsp:include>
            </c:otherwise>
        </c:choose>

    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>