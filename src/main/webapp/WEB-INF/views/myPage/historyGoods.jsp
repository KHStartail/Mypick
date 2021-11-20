<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
           <!-- Google Font -->
           <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700;800;900&display=swap"
           rel="stylesheet">
           <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800;900&display=swap"
           rel="stylesheet">
       
           <!-- Css Styles -->
           <link rel="stylesheet" href="assets/css/bootstrap.min.css" type="text/css">
           <link rel="stylesheet" href="assets/css/font-awesome.min.css" type="text/css">
           <link rel="stylesheet" href="assets/css/goodsStyle.css" type="text/css">
           <link rel="stylesheet" href="assets/css/header.css">
           <link rel="stylesheet" href="assets/css/login.css">
           <link rel="stylesheet" href="assets/css/mypageSideMenu.css">
           <link rel="stylesheet" href="assets/css/mypageHistory.css">
<style>
     @import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
</style>
</head>
<body>
 <jsp:include page="/header.jsp"></jsp:include>
    <!-- ---------------------------- -->
    <section id="main-section">
<jsp:include page="/mypageSideMenu.jsp"></jsp:include>
     <!-- 결제창------굿즈정보------------ -->
     <div class="col-lg-6 col-md-6 col-sm-6" style="max-width: 95%;">
        <div class="breadcrumb__links">
            <a href="/">Home</a>
            <a href="myPageMain.pick">My Page</a>
            <span>History - goods</span>
        </div>
    </div>
     <div id="contents-div">

         <div id="support-section">
            <div class="pay-label">
                <span>굿즈 결제 내역</span>
            </div>
            <div class="pay-info">
                <table class="pay-table">
                    <tr>
                        <th>상품정보</th>
                        <th>수량</th>
                        <th>주문금액</th>
                        <th>결제날짜</th>
                    </tr>
                   <c:forEach items="${pList }" var="pay">
                    <tr >
                        <td style="text-align: left;">
                            <img src="resources/goodsFiles/${pay.imgPath }" alt="" style="width: 250px;">
                            ${pay.goodsName }
                        </td>
                        <td>${pay.goodsAmount }</td>
                        <td>${pay.goodsPrice*pay.goodsAmount + goodsdelivery }</td>
                        <td>${pay.paymentDate }</td>
                    </tr>
                  </c:forEach>
                </table>
            </div>
        </div>
     </div>
    </section>
    <!-- ------------------------------------ -->
<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>