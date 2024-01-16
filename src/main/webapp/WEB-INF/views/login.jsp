<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<link type="text/css" rel="stylesheet" href="/css/login.css">
<body>
<form method="post" action="/loginProcess">
    <div class="container">
        <h2>로그인</h2>
        <div class="inputDiv">
            <input type="text" class="input" id="mid" name="mid" placeholder="ID">
        </div>
        <div class="inputDiv">
            <input type="password" class="input" id="pw" name="pw" placeholder="PW">
        </div>

        <button type="submit" class="submit">로그인</button>
        <div style="margin: 10px">
        <a href="/signup" style="font-size: 14px">
            회원가입
        </a>
        </div>
    </div>
</form>
</body>