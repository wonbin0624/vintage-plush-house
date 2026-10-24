<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<title>购 物 车</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
	<link type="text/css" rel="stylesheet" href="css/default.css">
	<link type="text/css" rel="stylesheet" href="css/style.css"/>
	<link type="text/css" rel="stylesheet" href="css/header.css"/>
	<link type="text/css" rel="stylesheet" href="css/footer.css"/>
    <link type="text/css" rel="stylesheet" href="css/ins-style.css"> <!-- 引入你的新样式 -->
	<script type="text/javascript" src="script/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="cart-items">
		<div class="container">
			<h2 style="text-align: center; color: #FF69B4; margin-bottom: 30px;">我的购物车</h2>
			<!-- 显示后端返回的提示信息 -->
            <c:if test="${not empty msg}">
                <div style="text-align: center; font-size: 18px; color: red; margin-bottom: 20px; font-weight: bold;">
                    ⚠️ ${msg}
                </div>
            </c:if>

            <!-- 判断购物车是否为空 (itemMap 是否为空) -->
            <c:choose>
                <c:when test="${empty order || empty order.itemMap}">
                    <div style="text-align: center; font-size: 20px; color: #FF69B4; margin-top: 50px; margin-bottom: 200px;">
                        购物车空空如也，快去挑选喜欢的毛绒玩具吧~ <br><br>
                        <a href="/index" class="btn btn-info">去逛逛</a>
                    </div>
                </c:when>

                <c:otherwise>
                    <!-- 循环遍历 Map 里的 values 集合 -->
                    <c:forEach items="${order.itemMap.values()}" var="item">
                        <div class="cart-header col-md-6">
                            <div class="cart-sec simpleCart_shelfItem">
                                <div class="cart-item cyc">
                                    <a href="#">
                                        <!-- 动态获取商品封面 -->
                                        <img src="${item.goods.cover}" class="img-responsive" alt="${item.goods.name}">
                                    </a>
                                </div>
                                <div class="cart-item-info">
                                    <h3><a href="#">${item.goods.name}</a></h3>
                                    <h3><span>单价: ¥ ${item.price}</span></h3>
                                    <div style="margin-top: 10px; display: flex; align-items: center; gap: 10px;">
                                        <span style="font-size: 18px; font-weight: bold; color: #5C4033;">数量: ${item.amount}</span>

                                        <!-- 加减操作区 -->
                                        <div style="display: flex; gap: 5px;">
                                            <a class="btn btn-warning" style="border-radius: 50%; width: 30px; height: 30px; line-height: 15px; padding: 0;"
                                               href="/order?method=reduceAmount&id=${item.goods_id}">-</a>

                                            <a class="btn btn-info" style="border-radius: 50%; width: 30px; height: 30px; line-height: 15px; padding: 0;"
                                               href="/order?method=addAmount&id=${item.goods_id}">+</a>
                                        </div>

                                        <!-- 删除按钮 -->
                                        <a class="btn btn-danger" style="margin-left: 20px; border-radius: 20px; padding: 4px 12px; font-size: 12px;"
                                           href="/order?method=remove&id=${item.goods_id}"
                                           onclick="return confirm('确定要移除这个宝贝吗？');">删除</a>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </c:forEach>

                    <!-- 底部总金额和结算 -->
                    <div class="cart-header col-md-12" style="margin-top: 30px; padding-top: 20px; border-top: 2px dashed #FFB6C1;">
                        <h3 style="text-align: right; color: #FF69B4;">订单总金额: ¥ ${order.total}</h3>
                        <a class="btn btn-success btn-lg" style="float: right; margin-bottom: 50px;" href="/order?method=submit">提交订单</a>
                        <div class="clearfix"></div>
                    </div>
                </c:otherwise>
            </c:choose>

		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
	<script>
        // 强行计算高度，把页脚推到屏幕最底下
        window.addEventListener('load', function() {
            // 获取浏览器窗口高度
            var windowHeight = window.innerHeight;
            // 获取导航栏高度
            var headerHeight = document.querySelector('.header').offsetHeight;
            // 获取页脚高度
            var footerHeight = document.querySelector('.footer').offsetHeight;
            // 获取中间内容区
            var contentBox = document.querySelector('.cart-items');

            if (contentBox) {
                // 计算中间应该有多高：窗口高度 - 导航栏高度 - 页脚高度 - 一些余量
                var targetHeight = windowHeight - headerHeight - footerHeight - 100;
                // 给中间区域强行赋值高度
                contentBox.style.minHeight = targetHeight + 'px';
            }
        });
    </script>
</body>
</html>