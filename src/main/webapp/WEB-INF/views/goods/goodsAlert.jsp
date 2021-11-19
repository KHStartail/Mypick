<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <link rel="stylesheet" href="assets/css/alert.css">
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
            <link rel="stylesheet" href="assets/css/payment.css">
            <link rel="stylesheet" href="assets/css/templatemo-klassy-cafe.css">
</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>
    <div class="alert-main">
        <div class="alert-line"></div>
        <div class="alert-logo">
            <!-- <img src="assets/images/mypic_logo.png" alt=""> -->
        </div>
        <div class="alert-text">
            <span>결제가 완료되었습니다!</span>
        </div>
        <div class="alert-btn">
            <button type="button"><a href="goodsList.pick">Goods</a></button>
            <button type="button"><a href="#">My Page</a></button>
        </div>
        <div class="alert-line"></div>
    </div>
    <jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>