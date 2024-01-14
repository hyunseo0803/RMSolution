<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@include file="common/MemberHeader.jsp" %>--%>

<head>
    <title>대시보드</title>
</head>
<body>
<div style="display: flex;flex-direction: row">
    <div style="background-color: red;height:97vh">
        <%@include file="common/MemberHeader.jsp"%>
    </div>
    <div>
        <h1>회원전용 대시보드</h1>
        <c:if test="${isService}">
            서비스 이름: ${sName}
            신청자 이름: ${sUsername}
            구독 기간: ${sStartdate}-${sEnddate}
            사용량: ${sUsage} / ${sVolume}TB
            <br>
            <input type="number" id="periodExtend" name="periodExtend" oninput="checkPeriodExtend()"> 개월
            <button type="button" onclick="extendPeriod()" disabled>구독 기간 연장</button>
            <br>
            <a href="/volume_extend">
                <button>용량 늘리기</button>
            </a>
            <br>
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

    </div>
</div>

</body>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>

    function checkPeriodExtend() {
        var periodExtendInput = document.getElementById('periodExtend');
        var extendButton = document.querySelector('button[type="button"]');

        if (periodExtendInput.value !== '') {
            extendButton.disabled = false;
        } else {
            extendButton.disabled = true;
        }
    }
    function extendPeriod() {
        var howMonth = document.getElementById('periodExtend').value;

        $.ajax({
                type: 'POST',
                url: "/extendPeriod",
                data: {howMonth: howMonth},
                success: function (data) {
                    if (data.check) {
                        alert("기간이 성공적으로 연장되었습니다.")
                        location.reload();
                    } else {
                        alert("실패하였습니다. 관리자에게 문의해주세요.")
                    }
                },
                error: function () {
                    alert('서버 에러 발생');
                }
            }
        );
    }
</script>


