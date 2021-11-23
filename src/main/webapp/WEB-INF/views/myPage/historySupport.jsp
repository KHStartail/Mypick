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
            <span>History - support</span>
        </div>
    </div>
     <div id="contents-div">

  		<div id="pay-section">
            <div class="pay-label">
                <span>서포팅 결제 내역</span>
            </div>
            <div class="support-info">
                <table class="support-table">
                <c:if test="${empty ph }"><br><br><br>
					<h1>조회된 글이 없습니다.</h1>
				</c:if>
				<c:if test="${not empty ph }">
                    <tr>
                        <th>상품제목</th>
                        <th>주문금액</th>
                        <th>결제일</th>
                    </tr>
	                <c:forEach items="${ph}" var="payment">
                    <tr>
                    	<td>{payment.supTitle}</td>
                    	<td>{payment.supAmount}</td>
                    	<td>{payment.paymentDate}</td>
                    </tr>
                    </c:forEach>
                  </c:if>
                    <!--
                        <td style="text-align: left;">
                            <img src="assets/images/air.png" alt="" style="width: 250px;">
                        </td>
                    -->
                </table>
            </div>
        </div>
     </div>
    </section>
    <!-- ------------------------------------ -->
<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>