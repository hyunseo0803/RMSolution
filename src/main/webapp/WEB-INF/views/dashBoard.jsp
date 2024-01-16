<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="/css/dashboard.css" rel="stylesheet" type="text/css">
<html style="overflow:hidden;">
<head>
    <title>대시보드</title>
</head>
<body>
<div style="display: flex;flex-direction: row;height: 100vh;">
    <div>
        <%@include file="common/MemberHeader.jsp" %>
    </div>
    <div class="columCenter" style="width: 100%;">
        <div style="margin: 10px;">
            <h1>DASHBOARD</h1>
        </div>
        <c:if test="${isService}">
        <div class="columCenter"
             style="padding: 20px;margin: 15px;width:66%;height: 15vh;box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);">
            <div style="display: flex;flex-direction: row;align-items: end">
                <div style="font-size:20px;margin-right: 20px;">
                        ${sUsername}님이 구독 중인 서비스는
                </div>
                <div style="font-size: 30px;margin-right: 20px;color: #e76a3d">
                        ${sName}
                </div>
                <div>입니다.</div>
            </div>
            <div style="margin-top: 20px;display: flex;flex-direction: row">
                <c:if test="${not empty sCompany}">
                    <div style="margin: 5px;">회사: ${sCompany}</div>
                </c:if>
                <c:if test="${not empty sPhone}">
                    <div style="margin: 5px;">전화 번호: ${sPhone}</div>
                </c:if>
                <c:if test="${not empty sEmail}">
                    <div style="margin: 5px;">이메일: ${sEmail}</div>
                </c:if>
            </div>
        </div>
        <div style="display: flex;flex-direction: row;width: 100%;justify-content: center">
            <div class="shadowDiv">
                <div style="text-align: center"><h3>구독 기간</h3></div>
                <div style="text-align: center;font-size: 25px;padding: 5px;margin-top:8%;">
                        ${sStartdate} ~ ${sEnddate}
                </div>
                <div style="text-align: center;margin-top: 35px">
                    <div class="rowCenter">
                        <input class="numberInput" style="width: 150px;margin-right: 10px" type="number"
                               id="periodExtend" name="periodExtend" oninput="checkPeriodExtend()">
                        <div>개월</div>
                    </div>
                    <button class="periodBtn"
                            style="border-radius: 7px;width: 60%; height: 30px;border: none;margin-top: 15px"
                            type="button" onclick="extendPeriod()" disabled>구독 기간 연장
                    </button>
                </div>
            </div>
            <div class="shadowDiv">
                <div style="text-align: center">
                    <h3>스토리지 사용량</h3>
                </div>
                <div style="font-size: 25px;text-align: center;padding: 10px">
                        ${sUsage} / ${sVolume} TB
                </div>
                <div class="columCenter" style="margin: 20px">
                    <div class="rowCenter">
                        <input style="width: 60%;padding: 3px;" class="numberInput" type="number" id="addvolume"
                               name="addvolume" placeholder="늘릴 용량">
                        <div style="margin-left: 5px;">TB</div>
                        <button style="width: 25%;margin-left: 10px;border-radius: 7px;border: none;background-color: coral"
                                type="button" class="btn btn-primary" onclick="confirmService()">확인
                        </button>
                    </div>
                    <div id="confirmDiv" class="columCenter" style="display: none;margin-top: 15px;">
                        <div id="serviceInfo"></div>
                        <div id="totalPrice"></div>
                        <button style="width: 200px;height: 30px;border-radius: 7px;border: none;margin: 10px;background-color: coral"
                                type="button" onclick="confirmMsg()">용량 늘리기
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</c:if>
<c:if test="${not isService}">
    현재 구독 중인 서비스가 없습니다.
    <div style="margin: 15px">
        <a href="service_apply">
            신규 구독 신청하기
        </a>
    </div>
</c:if>
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

    function confirmMsg() {
        var addvolume = document.getElementById('addvolume').value;

        var confirmMessage = "정말 추가 하시겠습니까?";
        if (confirm(confirmMessage)) {
            $.ajax({
                    type: 'POST',
                    url: "/extendVolume",
                    data: {addvolume: addvolume},
                    success: function (data) {
                        if (data.check) {
                            alert("용량이 성공적으로 확장되었습니다.")
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
    }

    function confirmService() {
        var addvolume = document.getElementById('addvolume').value;
        $.ajax({
            type: 'GET',
            url: '/confirmPay/' + addvolume,
            success: function (data) {
                console.log(data)
                if (data !== null) {
                    $('#serviceInfo').text(addvolume + 'TB 추가');
                    $('#totalPrice').text('총 ' + data.totalpay + '원');
                    $('#confirmDiv').show();
                }
            }
        })
    }
</script>
</html>


