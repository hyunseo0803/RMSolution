<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@include file="common/MemberHeader.jsp" %>--%>
<head>
    <title>스토리지 업로드</title>
</head>
<body>
<div style="display: flex;flex-direction: row">
    <div style="background-color: red;height:97vh">
        <%@include file="common/MemberHeader.jsp" %>
    </div>
    <div>
        <h1>파일 리스트 조회 및 파일 첨부</h1>
        <%--* 파일 올릴때 확인할 것--%>
        <%-- 1. 용량 초과 안되는지 --%>
        <%-- 2. 구독 기간 안끝났는지 --%>
        <c:if test="${isService}">
            <form action="/storageUpload" method="post" enctype="multipart/form-data">
                <input type="file" name="file" id="file"/><br/>
                <button type="button" onclick="uploadCheck()">업로드</button>
            </form>
            <c:forEach var="fl" items="${filelist}">
                <div style="display: flex">
                    <div style="margin-right: 30px">${fl.filename}</div>
                    <div style="color: rgb(128,128,128)">${fl.datetime}</div>
                    <div style="color: rgb(128,128,128)">${fl.size}Byte</div>
                    <a href="<%= request.getContextPath() %>/storageDownload?num=${fl.num}">Download</a>
                    <button type="button" onclick="confirmDelete(${fl.num})">Delete</button>
                </div>
                <br>
            </c:forEach>
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
    function confirmDelete(fileNum) {
        var confirmMessage = "정말 삭제하시겠습니까?";
        if (confirm(confirmMessage)) {
            deleteFile(fileNum);
        }
    }

    function deleteFile(fileNum) {
        $.ajax({
            type: 'DELETE',
            url: '/deleteFile/' + fileNum,
            success: function () {
                location.reload();
            },
            error: function (error) {
                console.error('삭제 실패:', error);
            }
        });
    }

    function uploadCheck() {
        var fileinput = document.getElementById('file')
        if (fileinput.files.length === 1) {
            var fileinputsize = fileinput.files[0].size; // 선택한 파일의 크기 (바이트 단위)

            $.ajax({
                type: 'GET',
                url: '/uploadCheck',
                data: {fileinputsize: fileinputsize},
                success: function (data) {
                    if (data.check) {
                        document.forms[0].submit();
                    } else {
                        alert("스토리지 용량을 초과했습니다. 용량을 늘리거나 파일 용량을 줄여주세요.");
                    }
                },
                error: function () {
                    alert('서버 에러 발생');
                }
            });
        }
    }
</script>


