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
           <link rel="stylesheet" href="assets/css/templatemo-klassy-cafe.css">
           <link rel="stylesheet" href="assets/css/mypageMain.css">
           
           <!--------------------------------->
           <link rel="stylesheet" href="assets/css/elegant-icons.css" type="text/css">
           <link rel="stylesheet" href="assets/css/nice-select.css" type="text/css">
           <link rel="stylesheet" href="assets/css/owl.carousel.min.css" type="text/css">
           <link rel="stylesheet" href="assets/css/slicknav.min.css" type="text/css">
           <link rel="stylesheet" href="assets/css/flaticon.css" type="text/css">
           <link rel="stylesheet" href="assets/css/barfiller.css" type="text/css">
           <link rel="stylesheet" href="assets/css/magnific-popup.css" type="text/css">
<style>
     @import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
</style>
</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>
    <!-- ---------------------------- -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__text">
                        <h2>My Page</h2>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__links">
                        <a href="/">Home</a>
                        <a href="myPageMain.pick">My Page</a>
                        <span>main</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <section id="first-section">
        <div id="intro">
            <p>userId</p>
            <div id="intro-img">
                <img src="assets/images/솔미2.png" alt="">
            </div>
            <p>nickName</p>
            <div id="update-btn">
                <button><a href="myPageModify.pick">정보수정</a></button>
            </div>
        </div>
    </section>
    <section id="second-section">
        <div class="mypage-menu">
            <div class="menu-icon" onclick="location.href='mypageCart.pick'">
                <img src="assets/images/menu-cart.png" alt="">
            </div>
            <p class="menu-label">장바구니</p>
        </div>
        <div class="mypage-menu">
            <div class="menu-icon" onclick="location.href='historySupport.pick'">
                <img src="assets/images/menu-pay.png" alt="">
            </div>
            <p class="menu-label">결제 내역</p>
        </div>
        <div class="mypage-menu">
            <div class="menu-icon" onclick="location.href='postSupport.pick'">
                <img src="assets/images/menu-bubble.png" alt="">
            </div>
            <p class="menu-label">게시글 관리</p>
        </div>
    </section>
<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>