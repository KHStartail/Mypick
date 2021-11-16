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
	<h1>진행중 서포팅 리스트</h1>
	<h2>울애긔 기살리자!</h2>
	<input type="text" value="그룹이름을 입력해주세요." id="searchBox">
	<input type="submit" value="검색" id="button"> <br><br>
	<c:if test="${empty sList }">
	<br><br><br>
		<h1>조회된 게시글이 없습니다.</h1>
	</c:if>
	<c:if test="${not empty sList }">
	<div class="row"> 
			<c:forEach items="${sList}" var="Supporting" varStatus="sLength">
				<c:url var="psOne" value="presupportingDetail.pick">
					<c:param name="supNo" value="${Supporting.supNo}"></c:param>
				</c:url>
				<div class="col-3">
					<div class="card" onclick="return check()">
						<c:url var="ssOne" value="supportingDetail.pick">
							<c:param name="supNo" value="${Supporting.supNo }"></c:param>
						</c:url>
		           		<h3 class="card-title"><a href="${supporting}">${Supporting.supTitle }</a></h3>
		            	<img src="/resources/supportingFiles/${Supporting.imgReName }" alt="Image" style="max-width:33.3%;" /><br>
		            	<div class="percentBox"></div>
					</div>
				</div>
			</c:forEach>		
		</div>
   	<button class="w-button" onclick="location.href='supportingWriteView.pick';">서포팅모집</button><br><br><br><br>
	</c:if>
	<jsp:include page="/footer.jsp"></jsp:include>
	<script>
	$(document).ready(function() {
		function check() {
			if(${loginUser}==null){
				alert("로그인하세요.");
				window.location = "supportingList.pick";
			}
		}
		
		$("#searchBox").focus(function(){
			$("#searchBox").val("");
		});
		$('#myCarousel').carousel({
			interval: 10000
		})
	});
	</script>
</body>
</html>