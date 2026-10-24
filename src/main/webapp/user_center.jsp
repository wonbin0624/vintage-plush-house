<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link type="text/css" rel="stylesheet" href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="css/style_v2.css"/>
    <link type="text/css" rel="stylesheet" href="css/header.css"/>
    <link type="text/css" rel="stylesheet" href="css/footer.css"/>
    <link type="text/css" rel="stylesheet" href="css/register.css"/>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="page">
    <div class="register">
        <c:if test="${msg !=null}">
            <div class="alert alert-success">${msg}</div>
        </c:if>
        <c:if test="${error !=null}">
            <div class="alert alert-danger">${error}</div>
        </c:if>
        <div class="register-top-grid">
            <h3 class="text-center">个人中心</h3>
            <form action="/user?method=changeAddress" method="post">
                <h4>收货信息</h4>
                <div class="input-box">
                    <span>收货人<label></label></span>
                    <input type="text" name="name" value="${user.name}" placeholder="请输入收货人"/>
                </div>
                <div class="input-box">
                    <span>收货电话<label></label></span>
                    <input type="text" name="phone" value="${user.phone}" placeholder="请输入收货电话"/>
                </div>
                <div class="input-box">
                    <span>收货地址<label></label></span>
                    <input type="text" name="address" value="${user.address}" placeholder="请输入收货地址"/>
                </div>
                <div class="register-but text-center">
                    <input type="submit" value="提交">
                </div>
            </form>
            <hr />
            <form action="/user?method=changePwd" method="post">
                <h4>安全信息</h4>
                <div class="input-box">
                    <span>原密码<label></label></span>
                    <input type="password" name="password" placeholder="请输入原密码" required="required"/>
                </div>

                <div class="input-box">
                    <span>新密码<label></label></span>
                    <input type="password" name="newPassword" placeholder="请输入新密码" required="required"/>
                </div>
                <div class="input-box">
                    <span>确认新密码<label></label></span>
                    <input type="password" name="confirmPwd" placeholder="请输入新密码" required="required"/>
                </div>
                <div class="register-but text-center">
                    <input type="submit" value="提交"/>
                </div>
            </form>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>