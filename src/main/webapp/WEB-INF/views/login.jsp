<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<form method="post" action="/loginProcess">
    <div class="container">
        <h1>로그인</h1>
        <div class="form-group">
            <label for="mid">mid</label>
            <input type="text" class="form-control" id="mid" name="mid" placeholder="사용자 아이디">
        </div>
        <div class="form-group">
            <label for="pw">pw</label>
            <input type="password" class="form-control" id="pw" name="pw" placeholder="사용자 비밀번호">
        </div>
        <button type="submit" class="btn btn-primary">로그인</button>
        <span id="duplicateMessage" style="color: red;"></span>
    </div>
</form>