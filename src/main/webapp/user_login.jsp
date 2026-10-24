<%@ page isELIgnored="false" contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>用 户 登 录</title>
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
            <c:if test="${remainingAttempts != null && remainingAttempts > 0}">
                <div class="alert alert-warning">
                    密码错误，您还有 ${remainingAttempts} 次尝试机会
                </div>
            </c:if>
            <c:if test="${accountLocked != null}">
                <div class="alert alert-danger">
                    密码错误次数过多，您的账户已被禁用，请联系管理员
                </div>
        </c:if>
        <form action="/user?method=login" method="post">
            <div class="register-top-grid">
                <h3 class="text-center">用户登录</h3>
                <div class="input-box">
                    <span>用户名/邮箱地址<label style="color: red">*</label></span>
                    <input type="text" name="ue" placeholder="请输入用户名或邮箱地址" required="required" />
                </div>
                <div class="input-box">
                    <span>密码<label style="color:red;">*</label></span>
                    <input type="password" name="password" placeholder="请输入密码" required="required" />
                </div>
            </div>
            <div class="register-but text-center">
                <input type="submit" value="提交">
            </div>
        </form>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>