<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="common/MemberHeader.jsp" %>
<head>
    <title>대시보드</title>
</head>
<body>

<h1>회원전용 대시보드</h1>
접속 아이디: ${mid}
<c:if test="${isService}">
    서비스 이름: ${sName}
    구독 기간: ${sStartdate}-${sEnddate}
    <a href="/service_extend">
        <button>기간 연장</button>
    </a>
    <c:if test="${isScompany}">회사: ${sCompany}</c:if>
    <c:if test="${isSphone}">전화 번호: ${sPhone}</c:if>
    <c:if test="${isSemail}">이메일: ${sEmail}</c:if>
</c:if>
<c:if test="${not isService}">
    현재 구독 중인 서비스가 없습니다.

    <a href="service_apply">
        신규 구독 신청하기
    </a>
</c:if>
</body>


