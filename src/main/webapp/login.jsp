<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<form method="post" action="/loginSuccess">
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
        <button type="button" class="btn btn-primary" onclick="submitForm()">로그인</button>
        <span id="duplicateMessage" style="color: red;"></span>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>

        function submitForm() {
            var pw = document.getElementById('pw').value;
            var mid = document.getElementById("mid").value;
            //빈 값이 없을 경우,
            if (pw.trim() !== '' && mid.trim() !== '') {
                $.ajax({
                    type: 'POST',
                    url: '/isUser',
                    data: {
                        mid: mid,
                        pw: pw
                    },
                    success: function (data) {
                        console.log(data.isUser)
                        if (data.isUser) {
                            document.forms[0].submit();
                        } else {
                            $('#duplicateMessage').text('아이디와 비밀번호가 틀렸습니다.');
                        }
                    },
                    error: function () {
                        alert('서버 에러 발생');
                    }
                });
            }
            //빈 값이 있을 경우,
            else {
                alert('아이디와 비밀번호를 모두 입력해 주세요.');
            }

        }
    </script>
</form>