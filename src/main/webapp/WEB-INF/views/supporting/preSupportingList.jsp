<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모집중 서포팅 목록</title>
<link rel="stylesheet" href="assets/css/header.css">
<link rel="stylesheet" href="assets/css/lightbox.css">
<link rel="stylesheet" href="assets/css/templatemo-klassy-cafe.css">
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/community-main.css">
<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- swiper-js CDN -->
<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<style>
 	  html,
      body {
        position: relative;
        height: 100%;
        text-align : center;
      }

      body {
        background: #eee;
        font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
        font-size: 14px;
        color: #000;
        margin: 0;
        padding: 0 0 100px 0;
      }
      .swiper {
        width: 80%;
        height: 100%;
      }

      .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;

        /* Center slide text vertically */
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
      }

      .swiper-slide img {
        display: block;
        width: 100%;
        height: 100%;
        object-fit: cover;
      }
    </style>
  </head>
<body>
<jsp:include page="/header.jsp"></jsp:include>
	<h1>모집중 서포팅 리스트</h1>
	<h3>일정 인원수가 달성시, 서포팅이 진행됩니다!</h3>
	<input type="text" value="그룹이름을 입력해주세요." id="searchBox">
	<input type="submit" value="검색" class="btn"> <br><br>
	<!-- Slider main container -->
	<c:if test="${empty pList }">
		<h1>조회된 게시글이 없습니다.</h1>
	</c:if>
	<c:if test="${not empty pList }">
	<body>
    <!-- Swiper -->
    <div class="swiper mySwiper">
      <div class="swiper-wrapper">
        <div class="swiper-slide">
        	<!-- list로 내용불러오기 -->
		   	<c:forEach items="${pList}" var="presupporting">
	    	<div class="ImgBox">${Supporting.ImgNo}</div><br>
	    	<div class="percentBox"></div><br>
	    	<div class="textBox">
		    	<h4><a href="${psDetail }">${Supporting.supTitle }</a></h4>
		    	<div class="contents"><a href="${psDetail }">${Supporting.supContents }</a></div>
	    	</div>
			</c:forEach>
        </div>
        <div class="swiper-slide">
        Slide 2
        </div>
        <div class="swiper-slide">
        Slide 7
        </div>
        <div class="swiper-slide">
        Slide 9
        </div>
    </div>
	      <div class="swiper-button-next"></div>
	      <div class="swiper-button-prev"></div>
	      <div class="swiper-pagination"></div>
    </div>
	</c:if>
	<button class="btn" onclick="location.href='support/supportWriteView.pick';"></button><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>f<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<jsp:include page="/footer.jsp"></jsp:include>
	<script>
	//검색
	var search = document.getElementById("#searchBox");
	$("#searchBox").on('keydown', function(){
		$("#searchBox").val("");
	});
	
	 //swiper js
	// Initialize Swiper
	     var swiper = new Swiper(".mySwiper", {
	       cssMode: true,
	       navigation: {
	         nextEl: ".swiper-button-next",
	         prevEl: ".swiper-button-prev",
	       },
	       pagination: {
	         el: ".swiper-pagination",
	       },
	       mousewheel: true,
	       keyboard: true,
	     });
	</script>
</body>
</html>