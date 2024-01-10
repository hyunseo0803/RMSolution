<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
<%@include file="common/header.jsp"%>
<h1>home</h1>
<c:if test="${isLogin}"><h3>${mid}</h3>
    <a href="dashBoard">
        <button>대시보드로 이동하기</button>
    </a>
    <a href="/logout">
        <button>로그 아웃</button>
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

<h1>서비스 설명 불라불라</h1>


<%@include file="common/footer.jsp"%>
</body>

