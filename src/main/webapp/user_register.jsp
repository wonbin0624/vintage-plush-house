<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>用 户 注 册</title>
    <link type="text/css" rel="stylesheet" href="css/style_v2.css"/>
    <link type="text/css" rel="stylesheet" href="css/header.css"/>
    <link type="text/css" rel="stylesheet" href="css/register.css"/>
    <link type="text/css" rel="stylesheet" href="css/footer.css"/>
    <link type="text/css" rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css"/>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="page">
    <div class="register">
        <c:if test="${msg !=null}">
            <div class="alert alert-danger" >${msg}</div>
        </c:if>

        <form action="/user?method=register" method="post">
            <div class="register-top-grid">
                <h3 class="text-center">注册新用户</h3>
                <div class="input-box">
                    <span>用户名<label style="color: red;">*</label></span>
                    <input type="text" name="username" placeholder="请输入用户名" required="required" />
                </div>
                <div class="input-box">
                    <span>邮箱<label style="color: red;">*</label></span>
                    <input type="text" name="email" placeholder="请输入邮箱地址" required="required" />
                </div>
                <div class="input-box">
                    <span>密码<label style="color: red;">*</label></span>
                    <input type="password" name="password" placeholder="请输入密码" required="required" />
                </div>
                <div class="input-box">
                    <span>收货人</span>
                    <input type="text" name="name" placeholder="请输入收货人" />
                </div>
                <div class="input-box">
                    <span>收货电话</span>
                    <input type="text" name="phone" placeholder="请输入收货电话" />
                </div>
                <div class="input-box">
                    <span>收货地址</span>
                    <input type="text" name="address" placeholder="请输入收货地址" />
                </div>
            </div>
            <div class="register-but text-center">
                <input type="submit" value="提交" />
            </div>
        </form>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>