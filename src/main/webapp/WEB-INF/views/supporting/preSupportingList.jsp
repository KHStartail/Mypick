<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모집중 서포팅 목록</title>
<<<<<<< HEAD
<!-- swiper-js CDN -->
<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
<style>
	.swiper {
	  width: 600px;
	  height: 300px;
	}
</style>
</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>
	<h1>모집중 서포팅 리스트</h1>
	<h2>일정 인원수가 달성시, 서포팅이 진행됩니다!</h2>
	<input type="text" value="그룹이름을 입력해주세요." id="searchBox">
	<input type="submit" value="검색" id="button"> <br><br>
	<!-- Slider main container -->
	<div class="swiper">
		  <!-- Additional required wrapper -->
	  	<div class="swiper-wrapper">
			    <!-- Slides -->
				<!-- list로 내용불러오기 -->
			   <c:forEach items="${psList}" var="preSupporting">
				    <div class="swiper-slide">
				    	<div class="ImgBox"></div><br>
				    	<div class="percentBox"></div><br>
				    	<div class="textBox">
					    	<h4><a href="${psDetail }">${supporting.supTitle }</a></h4>
					    	<div class="contents"><a href="${psDetail }">${supporting.supContents }</a></div>
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
	<button onclick="location.href='support/supportWrite';"></button><br><br>
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
=======
</head>
<body>

>>>>>>> 7faefa9e80cf69dc7ead6238be72867079960b20
</body>
</html>