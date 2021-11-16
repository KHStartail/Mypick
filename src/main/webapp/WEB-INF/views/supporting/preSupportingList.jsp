<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모집중 서포팅 목록</title>
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/header.css">
<link rel="stylesheet" href="assets/css/lightbox.css">
<link rel="stylesheet" href="assets/css/templatemo-klassy-cafe.css">
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
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
        width: 100%;
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
      .btn{
      	width: 200px;
      	height:200px;
      }
      #searchBox{
      	height: 30px;
      }
      .searchButton{
      	height: 30px;
      	text-align:center;
      }
      p { margin:20px 0px; }
      
      .btn-p{
      	width: 200px;
      	height: 100px;
      	border : 2px solid ;
      	background-color: blue;
      	border-radius : 5px;
      	font-color : white;
      		
      }
      
      .w-button{
      	width : 100px;
      	height: 30px;
      }
    </style>
  </head>
<body>
<jsp:include page="/header.jsp"></jsp:include>
<br><br><br><br>
<div class="container">
	<h1>모집중 서포팅 목록</h1>
	<h3>일정 인원수가 달성시, 서포팅이 진행됩니다!</h3><br><br><br>
	<input type="text" value="그룹이름을 입력해주세요." id="searchBox" size="30">
	<input type="submit" value="검색" class="searchButton"><br><br><br><br>
	<!-- Slider main container -->
	<c:if test="${empty pList }"><br><br><br>
		<h1>조회된 게시글이 없습니다.</h1>
	</c:if>
	<c:if test="${not empty pList }">
	<body>
    <!-- Swiper -->
    <div class="swiper mySwiper">
      <div class="swiper-wrapper">
        <div class="swiper-slide">
        	<!-- list로 내용불러오기 
        	이미지 경로설정, 리스트 가로세로 3개씩 총 한번에 9개 한 슬라이드에 넣기
        	-->
 		<c:forEach items="${pList}" var="Supporting">
        	<div class="col-4">
	        	<div class="card">
				   	<div class="card-body">
		        			<h3 class="card-title"><a href="${psOne }">${Supporting.supTitle }</a></h3>
					    	<img src="/resources/supportingFiles/${Supporting.imgReName }" alt="IMG">
					    	<div class="percentBox"></div><br>
					    	<p class="card-text">
						    	<c:url var="psOne" value="presupportingDetail.pick">
									<c:param name="supNo" value="${Supporting.supNo }"></c:param>
								</c:url>
					    	</p>
					    	<a href="getParticipation.pick" class="btn-p">참여하기</a>
					</div>
				</div>
			</div>
		</c:forEach>
        </div>
        <div class="swiper-slide">
        </div>
        <div class="swiper-slide">
        </div>
        <div class="swiper-slide">
        </div>
        <div class="swiper-slide">
        </div>
        <div class="swiper-slide">
        </div>
        <!-- <div class="swiper-slide">
        Slide 2
        </div> -->
    </div>
	      <div class="swiper-button-next"></div>
	      <div class="swiper-button-prev"></div>
	      <div class="swiper-pagination"></div>
    </div>
	<button class="w-button" onclick="location.href='supportingWriteView.pick';">서포팅모집</button><br><br><br><br>
	</c:if>
</div>
<jsp:include page="/footer.jsp"></jsp:include>
	<script>
	//검색
	var search = document.getElementById("#searchBox");
	$("#searchBox").focus(function(){
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