<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<form method="post" action="/service_apply">
    <div class="container">
        <h1>서비스 구독 신청</h1>
        <div>필수 정보 입력
            서비스 형태: <input type="text" id="kindof" name="kindof" placeholder="(Basic/Standard/Premium)">
            사용 인원: <input type="number" id="usercnt" name="usercnt"> 명
            구독 기간: <input type="number" id="month" name="month" placeholder="개월">개월
        </div>
        <div>부가 정보 입력
            회사명: <input type="text" id="company" name="company">
            전화번호: <input type="number" id="phone" name="phone" placeholder="하이픈(-) 없이 입력해주세요.">
            이메일: <input type="text" id="email" name="email" placeholder="@example.com">
        </div>
        <button type="button" class="btn btn-primary" onclick="submitForm()">신청 하기</button>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        function isNotnull() {
            var sName = document.getElementById('kindof').value;
            var sUsercnt = document.getElementById('usercnt').value;
            var sMonth = document.getElementById('month').value;

            var isAvailable = sName.trim() !== '' && sUsercnt.trim() !== '' && sMonth.trim() !== '';
            return isAvailable;
        }

        function submitForm() {
            console.log(isNotnull())
            if (isNotnull()) {
                document.forms[0].submit();
            } else {
                alert('필수 정보를 모두 입력해주세요.');
            }
        }
    </script>
</form>