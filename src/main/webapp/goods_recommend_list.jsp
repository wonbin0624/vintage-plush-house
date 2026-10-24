<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
  <title>首页</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link type="text/css" rel="stylesheet" href="css/bootstrap.css">
  <link type="text/css" rel="stylesheet" href="css/default.css">
  <link type="text/css" rel="stylesheet" href="css/style_v2.css"/>
  <link type="text/css" rel="stylesheet" href="css/header.css"/>
  <link type="text/css" rel="stylesheet" href="css/footer.css"/>
  <link type="text/css" rel="stylesheet" href="css/ins-style.css"/>

  <script type="text/javascript" src="script/jquery.min.js"></script>
  <script type="text/javascript" src="script/cart.js"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="products" style="min-height: 1080px">
  <div class="container">

    <!-- 这就是你要的标题色块！如果是热销就用粉色，新品就用蓝色 -->
    <div class="alert ${type == 2 ? 'alert-danger' : 'alert-info'}">
      <c:choose>
        <c:when test="${type == 2}">热销商品</c:when>
        <c:otherwise>新品商品</c:otherwise>
      </c:choose>
    </div>

    <!-- 保留了你原来的一排 4 个商品卡片结构 -->
    <div class="col-md-12 product-model-sec">
      <c:forEach items="${p.list}" var="g">
        <div class="product-grid">
          <a href="#">
            <div class="more-product"><span> </span></div>
            <div class="product-img b-link-stripe b-animate-go  thickbox">
              <img src="${g.cover}" class="img-responsive" alt="${g.name}" width="240" height="240">
              <div class="b-wrapper">
                <h4 class="b-animate b-from-left  b-delay03">
                  <button href="#">查看详情</button>
                </h4>
              </div>
            </div>
          </a>
          <div class="product-info simpleCart_shelfItem">
            <div class="product-info-cust prt_name">
              <h4>${g.name}</h4>
              <span class="item_price">¥ ${g.price}</span>
              <!-- 按钮加上去，依然可以正常加购 -->
              <input type="button" class="item_add items" value="加入购物车" onclick="buy(${g.id})">
              <div class="clearfix"> </div>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>

    <!-- 分页组件 -->
    <jsp:include page="page.jsp">
      <jsp:param name="url" value="/goods"></jsp:param>
      <jsp:param name="param" value="&method=goodsRecommendList&type=${type}"></jsp:param>
    </jsp:include>
  </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>