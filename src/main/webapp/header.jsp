<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/font-awesome.css">
    <link rel="stylesheet" href="/css/templatemo-klassy-cafe.css">
    <link rel="stylesheet" href="/css/owl-carousel.css">
    <link rel="stylesheet" href="/css/lightbox.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/login.css">

</head>
<body>
<div class="main-header">
        <nav>
            <!-- <div id="login">
                <button type="button" id="login-btn">LOGIN</button>
                    <div class="black-bg"></div>
                    <div class="modal-wrap">
                    <div class="login-close"><a href="#">close</a></div>
                    <div id="main-login">
                        <div id="head-login"><p>PERIPERA</p></div>
                        <div id="serv-login">
                            <div id="idpw">
                                ID&nbsp;&nbsp;&nbsp;<input type="text" name="" id="" placeholder="Id를 입력해주세요"><br><br>
                                PW&nbsp;</label><input type="password" name="" id="" placeholder="Pw를 입력해주세요">
                            </div>
                            <div id="loginBtn">
                                <button id="btn">LOGIN</button>
                            </div>
                        </div>
                        <div id="footer-login">
                            <button class="btn2"><a href="#">Create account</a></button><br>
                            <button class="btn2"><a href="#">I've forgot my password</a></button>
                        </div>
                        <div id="blank-login"></div>
                    </div>
                </div>
                 <button type="button" id="join-btn"><a href="../mypick/login.html">JOIN</a></button> -->
        </nav>
        <div id="h-1">
            <ul id="h-ul">
                <li class="b-ul">SUPPORTING</li>
                <li><a href="presupportingList.pick" class="m-list">모집중</a></li>
                <li><a href="supportingList.pick" class="m-list">진행중</a></li>
                <li class="b-ul"><a href="../mypick/find.html" class="m-list">GOODS</a></li>
            </ul>
        </div>
        <div class="logo">
            <a href="index.jsp"><img src="assets/images/mypic_logo.png" alt=""></a>
        </div>
        <div class="mypage">
            <ul class="main-ul">
                <li class="main-li">
                    <div>
                       
                    </div>
                    <ul class="serv-ul">
                        <li class="serv-li" onclick="location.href='/loginView.kh';">로그인</li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
        <header class="header-area header-sticky">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav class="main-nav">
                        <!-- ***** Logo Start ***** -->
                        <a href="index.html" class="logo">
                            <img src="assets/images/mypic_logo.png" style="width: 80px; margin-right: 200px;">
                        </a>
                        <!-- ***** Logo End ***** -->
                        <!-- ***** Menu Start ***** -->
                        <ul class="nav">
                            <li class="scroll-to-section"><a href="/" class="active">Home</a></li>
                            <li class="submenu">
                                <a href="javascript:;">Supporting</a>
                                <ul>
                                    <li><a href="presupportingList.pick">모집중 서포팅</a></li>
                                    <li><a href="supportingList.pick">진행중 서포팅</a></li>
                                 </ul>
                            </li>
                            <li class="scroll-to-section"><a href="#">Goods</a></li>
                            <!-- <li class="submenu">
                                <a href="javascript:;">MyPage<a>
                                <ul>
                                    <li><a href="#">Drop Down Page 1</a></li>
                                 </ul>
                            </li> -->
                            <!-- <li class=""><a rel="sponsored" href="https://templatemo.com" target="_blank">External URL</a></li> -->
                        </ul>        
                        <a class='menu-trigger'>
                            <span>Menu</span>
                        </a>
                        <!-- ***** Menu End ***** -->
                    </nav>
                </div>
            </div>
        </div>
    </header>
</body>
</html>