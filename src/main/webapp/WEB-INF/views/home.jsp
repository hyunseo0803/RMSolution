<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="/css/home.css">
<body style="margin: 0px">
<%@include file="common/header.jsp" %>
<div style="background-color: black;justify-content: center;align-items: center;display: flex;padding: 15px">
    <div>
        <div><h1 class="coment" style="color: coral">RMsolution</h1></div>
        <div><h1 class="coment" style="color: coral">대한민국 No.1 서비스 구독 플랫폼</h1></div>
    </div>
</div>
<div style="display: flex;flex-direction: column;align-items: center;">
    <div><h1>Service</h1></div>
    <div style="display: flex;flex-direction: row">
        <div class="serviceDiv">
            <div style="text-align: center;margin: 10px;"><h2>Basic</h2></div>
            <div class="checkImgDiv"><img class="checkImg" src="/img/checkimg.svg" alt="checkmark"/><div>3TB 무료</div></div>
            <div class="checkImgDiv"><img class="checkImg" src="/img/checkimg.svg" alt="checkmark"/><div>PDF 약 500,000개(6MB 기준)</div></div>
            <div class="checkImgDiv"><img class="checkImg" src="/img/checkimg.svg" alt="checkmark"/><div>1TB 당 4,000원</div></div>
            <div style="text-align: center;margin: 10px;"><h3>23,000원</h3></div>
        </div>
        <div class="serviceDiv">
            <div style="text-align: center;margin: 10px;"><h2>Standard</h2></div>
            <div class="checkImgDiv"><img class="checkImg" src="/img/checkimg.svg" alt="checkmark"/><div> 6TB 무료</div></div>
            <div class="checkImgDiv"><img class="checkImg" src="/img/checkimg.svg" alt="checkmark"/><div>PDF 약 1,000,000개(6MB 기준)</div></div>
            <div class="checkImgDiv"><img class="checkImg" src="/img/checkimg.svg" alt="checkmark"/><div>1TB 당 6,000원</div></div>
            <div style="text-align: center;margin: 10px;"><h3>36,000원</h3></div>
        </div>
        <div class="serviceDiv">
            <div style="text-align: center;margin: 10px;"><h2>Premium</h2></div>
            <div class="checkImgDiv"><img class="checkImg" src="/img/checkimg.svg" alt="checkmark"/><div>10TB 무료</div></div>
            <div class="checkImgDiv"><img class="checkImg" src="/img/checkimg.svg" alt="checkmark"/><div>PDF 약 1,667,000개(6MB 기준)</div></div>
            <div class="checkImgDiv"><img class="checkImg" src="/img/checkimg.svg" alt="checkmark"/><div>1TB 당 8,000원</div></div>
            <div style="text-align: center;margin: 10px;"><h3>59,000원</h3></div>
        </div>

    </div>
</div>

<%@include file="common/footer.jsp" %>
</body>

