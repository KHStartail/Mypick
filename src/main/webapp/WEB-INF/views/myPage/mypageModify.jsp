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
           <link rel="stylesheet" href="assets/css/mypageModify.css">
           
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
                        <h2>Profile</h2>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__links">
                        <a href="/">Home</a>
                        <a href="myPageMain.pick">My Page</a>
                        <span>modify</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <section id="first-section">
        <div id="intro">
            <div id="part-img">
                <div id="intro-id">
                    user01
                </div>
                <div id="intro-img">
                    <img src="assets/images/솔미2.png" alt="">
                </div>
                <div id="update-btn">
                    <button><a href="#">사진 변경</a></button>
                </div>
            </div>
            <div id="part-text">
                <div id="profile-div">
                    <label>닉네임</label><input type="text" name="" id=""><br>
                    <label>비밀번호</label><input type="text" name="" id=""><br>
                    <label>핸드폰번호</label><input type="text" name="" id=""><button>인증</button><br>
                    <label>주소</label><input type="text" name="" id=""><button>검색</button><br>
                    <label>이메일</label><input type="text" name="" id="">
                </div>
                <div id="part-btn">
                    <button>수정 완료</button>
                    <button>회원 탈퇴</button>
                </div>
            </div>
        </div>
    </section>
    <!-- -------------- -->
<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>