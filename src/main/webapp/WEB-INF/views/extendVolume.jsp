<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<form method="post" action="/extendVolume">
    <div class="container">
        <h1>스토리지 용량 늘리기</h1>
        얼마나 늘릴거임? : <input type="number" id="addvolume" name="addvolume">TB
        <button type="button" class="btn btn-primary" onclick="confirmService()">확인</button>
        <div id="confirmDiv" style="display: none">
            <div id="serviceInfo"></div>
            <div id="totalPrice"></div>
            <button type="button" onclick="confirmMsg()">용량 늘리기</button>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        function confirmMsg(){
            var confirmMessage = "정말 추가 하시겠습니까?";
            if (confirm(confirmMessage)) {
                document.forms[0].submit();
            }
        }
        function confirmService() {
            var addvolume = document.getElementById('addvolume').value;
            $.ajax({
                type: 'GET',
                url: '/confirmPay/'+addvolume,
                success: function (data) {
                    console.log(data)
                    if (data!==null) {
                        $('#serviceInfo').text('사용하는 서비스는 ' + data.servicename + '이고, ' + addvolume + 'TB 추가');
                        $('#totalPrice').text('총 ' + data.totalpay + '원');
                        $('#confirmDiv').show();
                    }
                }
            })
        }
    </script>
</form>