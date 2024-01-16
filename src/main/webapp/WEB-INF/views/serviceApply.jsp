<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<link type="text/css" rel="stylesheet" href="/css/serviceApply.css">
<body>
<div class="container">
    <form style="width: 90%;justify-content: center;display: flex;flex-direction: column" method="post" action="/service_apply">
        <h1 style="text-align:center">서비스 구독 신청</h1>
        <div style="margin: 10px;">
            <div style="color: #f11f1f;margin: 5px;padding: 3px;">필수 정보</div>
            <div style="padding: 5px;">
                <div style="display: flex;flex-direction: row;align-items: center;margin-bottom: 6px;">
                    <div style="margin: 3px;width: 90px;">서비스 형태:</div>
                    <div style="width:78px;">
                        <input type="radio" id="basic" name="kindof" value="basic" checked> Basic
                    </div>
                    <div style="width:100px;">
                        <input type="radio" id="standard" name="kindof" value="standard">Standard
                    </div>
                    <div style="width:100px;">
                        <input type="radio" id="premium" name="kindof" value="premium">Premium
                    </div>
                </div>
                <div style="display: flex;flex-direction: row;margin-bottom: 6px;">
                    <div style="width: 90px;margin: 3px;"> 신청자 이름:</div>
                    <input style="width: 150px" type="text" id="username" name="username"></div>
                <div style="display: flex;flex-direction: row;margin-bottom: 6px;">
                    <div style="width: 90px;margin:3px;">구독 기간:</div>
                    <input style="width: 150px;margin-right: 5px;" type="number" id="month" name="month"
                           placeholder="개월">개월
                </div>
            </div>
        </div>
        <div style="margin: 10px;">
            <div style="color: #0000ab;margin: 5px;padding: 3px;">부가 정보</div>
            <div style="padding: 5px;">
                <div style="display: flex;flex-direction: row;align-items: center;margin-bottom: 6px;">
                    <div style="width:90px;margin:3px;">회사명:</div>
                    <input style="width: 200px" type="text" id="company" name="company"></div>
                <div style="display: flex;flex-direction: row;margin-bottom: 6px;">
                    <div style="width: 90px;margin:3px;">전화번호:</div>
                    <input style="width: 200px" type="number" id="phone" name="phone" placeholder="하이픈(-) 없이 입력해주세요.">
                </div>
                <span style="color:red;display: none;font-size: 14px;" id="phoneMsg">올바른 전화번호를 입력해주세요.</span>

                <div style="display: flex;flex-direction: row">
                    <div style="width: 90px;margin:3px;">이메일:</div>
                    <input style="width: 200px" type="text" id="email" name="email" placeholder="@example.com">
                </div>
                <span style="color:red;display: none;font-size: 14px;" id="emailMsg">올바른 이메일 형식을 입력해주세요.</span>

            </div>
        </div>
        <div id="totalpay" style="margin: 15px;">총 결제 금액: 23,000 원</div>
        <button style="margin: 15px;border: none;height: 37px;background-color: #4F46E5;color: white;border-radius: 10px" type="button" class="btn btn-primary" onclick="submitForm()">신청 하기</button>
    </form>

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
</body>