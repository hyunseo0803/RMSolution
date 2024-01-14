<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<link type="text/css" rel="stylesheet" href="/css/serviceApply.css">
<form method="post" action="/service_apply">
    <div class="container">
        <h1>서비스 구독 신청</h1>
        <div>필수 정보 입력
            서비스 형태:
            <input type="radio" id="basic" name="kindof" value="basic" checked> Basic
            <input type="radio" id="standard" name="kindof" value="standard">Standard
            <input type="radio" id="premium" name="kindof" value="premium">Premium
            신청자 이름: <input type="text" id="username" name="username">
            구독 기간: <input type="number" id="month" name="month" placeholder="개월">개월
        </div>
        <div>부가 정보 입력
            회사명: <input type="text" id="company" name="company">
            전화번호: <input type="number" id="phone" name="phone" placeholder="하이픈(-) 없이 입력해주세요.">
            <span style="color:red;display: none" id="phoneMsg">올바른 전화번호를 입력해주세요.</span>

            이메일: <input type="text" id="email" name="email" placeholder="@example.com">
            <span style="color:red;display: none" id="emailMsg">올바른 이메일 형식을 입력해주세요.</span>
        </div>
        <div id="totalpay">총 결제 금액: 23,000 원</div>

    </div>
    <button type="button" class="btn btn-primary" onclick="submitForm()">신청 하기</button>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        document.getElementById('email').addEventListener('input', handleInputChangeE);

        function handleInputChangeE() {
            var email = document.getElementById('email').value;
            var isEmail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9]+\.[a-zA-Z.]+$/.test(email);

            if (email !== "" && !isEmail) {
                $('#emailMsg').show();
            } else {
                $('#emailMsg').hide();
            }
        }

        document.getElementById('phone').addEventListener('input', handleInputChangeP);

        function handleInputChangeP() {
            var phone = document.getElementById('phone').value;
            var isPhone = /^(010)-?\d{4}-?\d{4}$/.test(phone);

            if (phone !== "" && !isPhone) {
                $('#phoneMsg').show();
            } else {
                $('#phoneMsg').hide();
            }
        }


        document.querySelectorAll('input[name="kindof"]').forEach(function (radio) {
            radio.addEventListener('change', handleInputChange);
        });


        function handleInputChange() {
            var kindof = document.querySelector('input[name="kindof"]:checked').value;

            console.log(kindof)
            if (kindof !== null) {
                var totalpayText = "";

                if (kindof === "basic") {
                    totalpayText = '23,000 원';
                } else if (kindof === "standard") {
                    totalpayText = '36,000 원';
                } else if (kindof === "premium") {
                    totalpayText = '59,000 원';
                }

                document.getElementById('totalpay').textContent = '총 결제 금액: ' + totalpayText;

            }
        }

        function isNotnull() {
            var sUsername = document.getElementById('username').value;
            var sMonth = document.getElementById('month').value;
            var isAvailable = sUsername.trim() !== '' && sMonth.trim() !== '';
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