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
		body{	
			text-align:center;
		}
      .swiper {
        width: 100%;
        height: 100%;
        margin-left: auto;
        margin-right: auto;
      }

      .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;
        height: calc((100% - 30px) / 2);

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
      .w-button{
      	width : 100px;
      	height: 30px;
      } 
      .card {
      	width: 300px;
      	height: 400px;
      	margin-bottom : 30px;
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
	<c:if test="${empty pList }"><br><br><br>
		<h1>조회된 게시글이 없습니다.</h1>
	</c:if>
	<c:if test="${not empty pList }">
		<div class="row"> 
			<c:forEach items="${pList}" var="Supporting" varStatus="sLength">
				<c:url var="psOne" value="presupportingDetail.pick">
					<c:param name="supNo" value="${Supporting.supNo}"></c:param>
				</c:url>
			<div class="col-4">
				<div class="card">
				<a href="${psOne }"> 
					<img src="${Supporting.imgPath }" class="card-img-top" alt="img">
					<div class="card-body"> 
						<h5 class="card-title">${Supporting.supTitle }</h5>
						<p class="card-text">${Supporting.supContents }</p> 
						<a href="#" class="btn btn-primary">참여하기</a> 
					</div>
				</a> 
				</div>
			</div>
			</c:forEach>		
		</div>
	<div class="swiper-pagination"></div>
   	<button class="w-button" onclick="location.href='supportingWriteView.pick';">서포팅모집</button><br><br><br><br>
	</c:if>
<jsp:include page="/footer.jsp"></jsp:include>
<script>
//검색
var search = document.getElementById("#searchBox");
$("#searchBox").focus(function(){
	$("#searchBox").val("");
});
	var swiper = new Swiper(".mySwiper", {
    slidesPerView: 3,
    grid: {
      rows: 2,
    },
    spaceBetween: 30,
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
    },
  });
</script>
</body>
</html>