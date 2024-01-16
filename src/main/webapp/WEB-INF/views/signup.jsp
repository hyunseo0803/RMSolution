
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<link type="text/css" rel="stylesheet" href="/css/login.css">
<body>
<form method="post" action="/signup">
    <div class="container">
        <h1>회원가입</h1>
        <div class="inputDiv">
            <input type="text" class="input" id="mid" name="mid" placeholder="사용자 아이디">
            <button type="button" class="duplicateBtn" onclick="checkDuplicate()">중복 체크</button>
        </div>
        <span id="duplicateMessage" style="color: red;"></span>
        <div class="inputDiv">
            <input type="password" class="input" id="pw" name="pw" placeholder="사용자 비밀번호">
        </div>
        <button type="button" class="submit" onclick="submitForm()">가입 완료</button>
    </div>
</form>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
    var isDuplicateChecked = false;
    var isAvailable = false;

    function isNotnullId() {
        var memberId = document.getElementById('mid').value;
        return memberId.trim() === '';
    }

    function checkDuplicate() {
        var memberId = document.getElementById('mid').value;
        if (isNotnullId()) {
            alert('사용자 아이디를 입력하세요.');
            return;
        }
        $.ajax({
            type: 'GET',
            url: '/checkDuplicate',
            data: { memberId: memberId },
            success: function (data) {
                console.log(data)
                if (!data.idcheck) {
                    $('#duplicateMessage').text('사용 가능한 아이디입니다.');
                    isDuplicateChecked = true;
                    isAvailable = true;
                } else {
                    $('#duplicateMessage').text('이미 사용 중인 아이디입니다.');
                    isAvailable = false;
                }
            },
            error: function () {
                alert('서버 에러 발생');
            }
        });

    }

    function submitForm() {
        var pw = document.getElementById('pw').value;
        if (pw.trim() !== '' && !isNotnullId() && isDuplicateChecked && isAvailable) {
            document.forms[0].submit();
        } else {
            if (!isDuplicateChecked) {
                alert('아이디 중복 확인을 해주세요.');
            } else {
                alert('아이디와 비밀번호를 모두 입력하세요.');
            }
        }
    }
</script>

</body>
