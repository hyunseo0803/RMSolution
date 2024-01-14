<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<div style="display: flex;flex-direction: column">
    <div> 접속 아이디: ${mid}
    </div>
    <a href="/dashBoard">DashBoard</a>
    <a href="/storageUpload">
        <button>스토리지 공간으로 이동</button>
    </a>
    <a href="/">대시보드에서 나가기</a>
    <a href="/logout" style="margin-left: 15px">
        로그 아웃
    </a>

</div>