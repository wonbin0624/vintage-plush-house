<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>中古毛绒屋ɞ</title>
    <meta name="Cache-Control" content="no-cache, no-store, must-revalidate">
    <meta name="Pragma" content="no-cache, no-cache">
    <link type="text/css" rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="css/default.css">
    <link type="text/css" rel="stylesheet" href="css/style_v2.css"/>
    <link type="text/css" rel="stylesheet" href="css/header.css"/>
    <link type="text/css" rel="stylesheet" href="css/footer.css"/>
    <!-- 引入全局 Ins 风样式 -->
    <link type="text/css" rel="stylesheet" href="css/ins-style.css"/>

    <script type="text/javascript" src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript" src="script/cart.js"></script>
    <style>
        .subscribe2 {
            background: url(images/slid2.jpg) no-repeat 0px 0px fixed;
            background-size: cover;
            text-align: center;
            padding: 7em 0;
            border-radius: 30px; /* 给顶部大图加个圆角 */
            margin: 0 15px;
            box-shadow: 0 4px 15px rgba(255, 182, 193, 0.4);
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="subscribe2"></div>
<div class="index-box">
    <div class="gallery">
        <div class="container">
            <!-- 使用原来 alert 的类名，CSS 会自动把它变成可爱的虚线标签 -->
            <div class="alert alert-danger">热销推荐</div>
            <c:forEach items="${hotList}" var="g">
                <div class="gallery-grids">
                    <div class="col-md-4 gallery-grid glry-two">
                        <a href="#">
                            <img src="${g.cover}" class="img-responsive" alt="${g.name}" width="350" height="350"/>
                        </a>
                        <div class="gallery-info galrr-info-two">
                            <p>
                                <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                                <a href="#">查看详情</a>
                            </p>
                            <a class="shop" href="javascript:;" onclick="buy(${g.id})">立刻购买</a>
                            <div class="clearfix"></div>
                        </div>
                        <div class="galy-info">
                            <p>${g.typename} > ${g.name}</p>
                            <div class="galry">
                                <div class="prices">
                                    <h5 class="item_price">¥ ${g.price}</h5>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <div class="clearfix"></div>

            <div class="alert alert-info">新品推荐</div>
            <c:forEach items="${newList}" var="n">
                <div class="gallery-grids">
                    <div class="col-md-3 gallery-grid ">
                        <a href="#">
                            <img src="${n.cover}" class="img-responsive" alt="${n.name}"/>
                        </a>
                        <div class="gallery-info">
                            <p>
                                <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                                <a href="#">查看详情</a>
                            </p>
                            <a class="shop" href="javascript:;" onclick="buy(${n.id})">立刻购买</a>
                            <div class="clearfix"></div>
                        </div>
                        <div class="galy-info">
                            <p>${n.typename} > ${n.name}</p>
                            <div class="galry">
                                <div class="prices">
                                    <h5 class="item_price">¥ ${n.price}</h5>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<div class="subscribe"></div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>