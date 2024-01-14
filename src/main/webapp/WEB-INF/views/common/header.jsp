<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="/css/header.css">
<html>
<head>
    <title>home</title>
    <meta charset="UTF-8">
</head>
<body>
<div class="headerRow" style="justify-content: space-between">
    <div style="font-size: large">RMsolution</div>
    <div class="headerRow">
        <c:if test="${isLogin}">
            <a href="dashBoard">
                <button style="border: none;background-color: transparent">Go to DashBoard</button>
            </a>
            <%--        <div style="margin-left: 15px;">${mid}님, 환영합니다.</div>--%>
            <a href="/logout" style="margin-left: 15px;color: red">
                로그 아웃
            </a>
        </c:if>
        <c:if test="${not isLogin}">
            <a href="login">
                <button>로그인</button>
            </a>
            <a href="signup">
                <button>회원가입</button>
            </a>
        </c:if>
    </div>
</div>

</body>
</html>