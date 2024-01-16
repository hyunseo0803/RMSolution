<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="/css/storage.css">
<html style="overflow: hidden">
<head>
    <title>스토리지 업로드</title>
</head>
<body>
<div style="display: flex;flex-direction: row;height: 100vh;">
    <div>
        <%@include file="common/MemberHeader.jsp" %>
    </div>
    <div style="width: 100%;justify-content:center; align-items:center;display: flex">
        <%--* 파일 올릴때 확인할 것--%>
        <%-- 1. 용량 초과 안되는지 --%>
        <%-- 2. 구독 기간 안끝났는지 --%>
        <c:if test="${isService}">
            <div style="margin-top: 3vh;height:90%;">
                <h1>STORAGE</h1>
                <div>
                    <form action="/storageUpload" method="post" enctype="multipart/form-data">
                        <input type="file" name="file" id="file"/><br/>
                        <button style="border: 1px solid cornflowerblue;background-color: transparent;width: 260px;height: 40px;margin-top: 10px;border-radius: 10px;font-size:large;color: cornflowerblue"
                                type="button" onclick="uploadCheck()">업로드
                        </button>
                    </form>
                </div>
                <div>
                    <table>
                        <thead style="background-color:cornflowerblue;display: block;">
                        <tr>
                            <th style="width:80vh;">파일 이름
                            </th>
                            <th style="width: 17vh;">날짜
                            </th>
                            <th style="width: 12vh;">크기
                            </th>
                            <th style="width: 12vh;">다운로드
                            </th>
                            <th style="width: 12vh;">삭제
                            </th>
                        </tr>
                        </thead>
                        <tbody class="tablediv" style="display: block;overflow-y: auto;height: 55vh;">
                        <c:forEach var="fl" items="${filelist}">
                            <tr>
                                <td style="  padding: 5px;width: 80vh;text-align: center;font-size: 0.95em;">${fl.filename}</td>
                                <td style="color: rgb(128, 128, 128);  padding: 5px;width: 17vh;text-align: center;font-size: 0.83em;">${fl.datetime}</td>
                                <td style="color: rgb(128, 128, 128);  padding: 5px;width: 12vh;text-align: center;font-size: 0.83em;">${fl.convertsize}</td>
                                <td style="width: 12vh;text-align: center;font-size: 0.82em;">
                                    <a style="text-decoration: none" href="<%= request.getContextPath() %>/storageDownload?num=${fl.num}">Download</a>
                                </td>
                                <td style="  padding: 5px;width: 12vh;text-align: center;font-size: 0.875em;">
                                    <button style="border-radius: 10px;border: none;background-color: red;color: white;padding: 7px;letter-spacing: 1px"
                                            type="button" onclick="confirmDelete(${fl.num})">Delete
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </c:if>
        <c:if test="${not isService}">
            <div style="display: flex;flex-direction:column;height:90%;align-items: center;justify-content:center;margin-top: 4vh;">
                <h1>STORAGE</h1>
                <div>
                    현재 구독 중인 서비스가 없습니다.
                </div>
                <div style="margin: 15px">
                    <a href="service_apply">
                        신규 구독 신청하기
                    </a>
                </div>
            </div>
        </c:if>
    </div>
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
            var fileinputsize = fileinput.files[0].size;

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
</html>


