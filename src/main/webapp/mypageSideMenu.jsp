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
           <link rel="stylesheet" href="assets/css/mypageSideMenu.css">

<style>
     @import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
</style>
</head>
<body>
    <div id="menu-section">
        <div id="profile-div">
            <div id="profile-img">
                <img src="assets/images/profile.png" alt="">
            </div>
            <p>${loginUser.userNickName }</p>
        </div>
        <div id="sideMenu-div">
            <ul id="main-ul">
                <li class="main-li"><a href="mypageCart.pick"><img src="assets/images/menu-cart.png">&nbsp;&nbsp;장바구니</a></li>
                <li class="main-li" id="pay-li"><a href="historySupport.pick"><img src="assets/images/menu-pay.png">&nbsp;&nbsp;결제 내역</a>
                    <ul id="pay-serv" class="serv-ul">
                        <li class="serv-li"><a href="historySupport.pick">서포팅</a></li>
                        <li class="serv-li"><a href="historyGoods.pick">굿즈</a></li>
                    </ul>
                </li>
                <li class="main-li" id="commu-li"><a href="postSupport.pick"><img src="assets/images/menu-bubble.png">&nbsp;&nbsp;게시글 관리</a>
                    <ul id="commu-serv" class="serv-ul">
                        <li class="serv-li"><a href="postSupport.pick">서포팅</a></li>
                        <li class="serv-li"><a href="postCommunity.pick">커뮤니티</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</body>
</html>