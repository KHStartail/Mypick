<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진행중 서포팅 목록</title>
<link rel="stylesheet" href="assets/css/header.css">
<link rel="stylesheet" href="assets/css/lightbox.css">
<link rel="stylesheet" href="assets/css/templatemo-klassy-cafe.css">
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- swiper js CDN -->
<link  rel="stylesheet"  href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
</head>
<body>
	<jsp:include page="/header.jsp"></jsp:include>
	<h1>진행중 서포팅 리스트</h1>
	<h2>울애긔 기살리자!</h2>
	<input type="text" value="그룹이름을 입력해주세요." id="searchBox">
	<input type="submit" value="검색" id="button"> <br><br>
	<c:if test="${empty sList }">
	<br><br><br>
		<h1>조회된 게시글이 없습니다.</h1>
	</c:if>
	<c:if test="${not empty sList }">
	<div class="swiper">
		  <!-- Additional required wrapper -->
	  	<div class="swiper-wrapper">
			    <!-- Slides -->
				<!-- list로 내용불러오기 -->
			   <c:forEach items="${sList}" var="presupporting">
				    <div class="swiper-slide">
				    	<div class="ImgBox">${Supporting.ImgRename}</div><br>
				    	<div class="percentBox"></div><br>
				    	<div class="textBox">
					    	<h4><a href="${ssDetail }">${Supporting.supTitle }</a></h4>
					    	<div class="contents"><a href="${ssDetail }">${Supporting.supContents }</a></div>
				    	</div>
				    </div>
				</c:forEach>
	  	</div>
		  <!-- If we need pagination -->
	  	<div class="swiper-pagination"></div>
		  <!-- If we need navigation buttons -->
		<div class="swiper-button-prev"></div>
		<div class="swiper-button-next"></div>
		<!-- If we need scrollbar -->
		<div class="swiper-scrollbar"></div>
	</div>
	</c:if>

	<jsp:include page="/footer.jsp"></jsp:include>
	<script>
	 //swiper js
		const swiper = new Swiper('.swiper', {
			  // Optional parameters
			  direction: 'vertical',
			  loop: true, //슬라이드 반복
	
			  // If we need pagination
			  pagination: {
			    el: '.swiper-pagination',
			  },
	
			  // Navigation arrows
			  navigation: {
			    nextEl: '.swiper-button-next',
			    prevEl: '.swiper-button-prev',
			  },
	
			  // And if we need scrollbar
			  scrollbar: {
			    el: '.swiper-scrollbar',
			  },
			});
	</script>
</body>
</html>