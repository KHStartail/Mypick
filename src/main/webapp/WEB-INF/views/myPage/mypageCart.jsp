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
           <link rel="stylesheet" href="assets/css/goods.css">
           <link rel="stylesheet" href="assets/css/goods_detail.css">
           <link rel="stylesheet" href="assets/css/mypageSideMenu.css">
           <link rel="stylesheet" href="assets/css/mypageCart.css">
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
             <span>Cart</span>
         </div>
     </div>
     <div id="contents-div">
         <div id="goods-section">
            <div class="pay-label">
                <span>장바구니</span>
            </div>
            <div class="goods-info">
                <table class="goods-table">
                    <tr>
                        <th>상품정보</th>
                        <th>수량</th>
                        <th>배송비</th>
                        <th>주문금액</th>
                    </tr>
                    <tr >
                        <td style="text-align: left;">
                            <img src="assets/images/air.png" alt="" style="width: 250px;">
                            누군지 모르는 아이돌의 Airpot
                        </td>
                        <td>1</td>
                        <td>3000</td>
                        <td>33000</td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            상품합계 ₩30000 &nbsp;&nbsp;➕&nbsp;&nbsp;배송비 ₩3000
                        </td>
                        <td>
                            |&nbsp;&nbsp;총 합계 <span>₩ 33000</span>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="btn-div">
            <button type="button">삭제</button>
            <button type="button">결제하기</button>
        </div>
     </div>
    </section>
    <!-- ------------------------------------ -->
<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>