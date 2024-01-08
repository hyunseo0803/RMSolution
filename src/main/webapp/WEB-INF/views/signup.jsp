<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<form method="post" action="/signup">
    <div class="container">
        <h1>회원가입</h1>
        <div class="form-group">
            <label for="mid">mid</label>
            <input type="text" class="form-control" id="mid" name="mid" placeholder="사용자 아이디">
            <button type="button" class="btn btn-secondary" onclick="checkDuplicate()">중복 체크</button>
        </div>
        <span id="duplicateMessage" style="color: red;"></span>
        <div class="form-group">
            <label for="pw">pw</label>
            <input type="password" class="form-control" id="pw" name="pw" placeholder="사용자 비밀번호">
        </div>
        <button type="button" class="btn btn-primary" onclick="submitForm()">가입 완료</button>
    </div>
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
                url: '/checkDuplicate/' + memberId, // 실제 서버의 경로로 변경
                success: function (data) {
                    if (!data.checking) {
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
</form>