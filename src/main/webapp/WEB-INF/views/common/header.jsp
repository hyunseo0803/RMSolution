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
<body class="headerB">
<div class="headerRow" style="justify-content: space-between;margin-left: 5%;margin-right: 5%;">
    <div style="font-size: large">
        <a href="/" class="logo">RMsolution</a>
    </div>
    <div class="headerRow">
        <c:if test="${isLogin}">
            <a href="/dashBoard" class="textNodeco" style="color: black">
                    ${mid}님의 스토리지
            </a>
            <a href="/logout" class="logout">
                로그아웃
            </a>
        </c:if>
        <c:if test="${not isLogin}">
            <a href="login" class="textNodeco" style="color: black;margin-right: 15px;">
                로그인
            </a>
            <a href="/signup" class="textNodeco" style="color: coral;margin-right: 20px;">
                회원가입
            </a>
        </c:if>
    </div>
</div>
</body>
</html>