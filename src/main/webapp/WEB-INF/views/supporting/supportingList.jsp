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
 	  html,
      body {
        position: relative;
        height: 100%;
        text-align : center;
      }
/*

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
	
		.card-text{
			overflow : hidden;
			height : 200px;
		}	
		 p { margin:20px 0px; } */
		 
		 .carousel {
			margin-bottom: 0;
			padding: 0 40px 30px 40px;
		}
		
		.carousel-control {
			left: -12px;
		}
		.carousel-control.right {
			right: -12px;
		}
		
		.carousel-indicators {
			right: 50%;
			top: auto;
			bottom: 0px;
			margin-right: -19px;
		}
		
		.carousel-indicators li {
			background: #c0c0c0;
		}
		
		.carousel-indicators .active {
			background: #333333;
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
		<div class="well">
		    <div id="myCarousel" class="carousel slide">
		    <ol class="carousel-indicators">
		        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		        <li data-target="#myCarousel" data-slide-to="1"></li>
		        <li data-target="#myCarousel" data-slide-to="2"></li>
		    </ol>
     
		    <!-- Carousel items -->
		    <div class="carousel-inner">
			<c:forEach items="${sList}" var="Supporting">
			    <div class="item active">
			          <div class="row-fluid">
			            <div class="col-4">
			            	<div class="card" style="width: 18rem;">
					            <h3 class="card-title"><a href="${ssOne }">${Supporting.supTitle }</a></h3>
					            	<a href="${ssOne }" class="thumbnail">
					            	<img src="/resources/SupportingFiles/${Supporting.imgReName }" alt="Image" style="max-width:33.3%;" /><br>
					            	<div class="percentBox"></div>
					            		<c:url var="ssOne" value="supportingDetail.pick">
											<c:param name="supNo" value="${Supporting.supNo }"></c:param>
										</c:url>
					            	</a>
					        </div>
			            </div>
			            <div class="col-4">
			            	<div class="card" style="width: 18rem;">
				             	<h3 class="card-title"><a href="${ssOne }">${Supporting.supTitle }</a></h3>
				            	<a href="${ssDetail }" class="thumbnail">
				            	<img src="/resources/SupportingFiles/${Supporting.imgReName }" alt="Image" style="max-width:33.3%;" /><br>
				            	<div class="percentBox"></div>
				            		<c:url var="ssOne" value="supportingDetail.pick">
										<c:param name="supNo" value="${Supporting.supNo }"></c:param>
									</c:url>
				            	</a>
				            </div>
			            </div>
			            <div class="col-4">
			           		<div class="card" style="width: 18rem;">
				            <h3 class="card-title"><a href="${ssOne }">${Supporting.supTitle }</a></h3>
				            	<a href="${ssOne }" class="thumbnail">
				            	<img src="/resources/SupportingFiles/${Supporting.imgReName }" alt="Image" style="max-width:33.3%;" /><br>
				            	<div class="percentBox"></div>
			            			<c:url var="ssOne" value="supportingDetail.pick">
										<c:param name="supNo" value="${Supporting.supNo }"></c:param>
									</c:url>
				            	</a>
				            </div>
			            </div>
			        </div><!--/row-fluid-->
			    </div><!--/item-->
			     
			    <div class="item">
			          <div class="row-fluid">
			             <div class="col-4">
			            <h3 class="card-title"><a href="${ssOne }">${Supporting.supTitle }</a></h3>
			            	<a href="${ssOne }" class="thumbnail">
			            	<img src="/resources/supportingFiles/${Supporting.imgReName }" alt="Image" style="max-width:33.3%;" /><br>
			            	<div class="percentBox"></div>
		            			<c:url var="ssOne" value="supportingDetail.pick">
									<c:param name="supNo" value="${Supporting.supNo }"></c:param>
								</c:url>
			            	</a>
			            </div>
			            <div class="col-4">
			             	<h3 class="card-title"><a href="${ssOne }">${Supporting.supTitle }</a></h3>
			            	<a href="${ssOne }" class="thumbnail">
			            	<img src="/resources/supportingFiles/${Supporting.imgReName }" alt="Image" style="max-width:33.3%;" /><br>
			            	<div class="percentBox"></div>
			            		<c:url var="ssOne" value="supportingDetail.pick">
									<c:param name="supNo" value="${Supporting.supNo }"></c:param>
								</c:url>
			            	</a>
			            </div>
			             <div class="col-4">
			            <h3 class="card-title"><a href="${ssOne }">${Supporting.supTitle }</a></h3>
			            	<a href="${ssOne }" class="thumbnail">
			            	<img src="/resources/supportingFiles/${Supporting.imgReName }" alt="Image" style="max-width:33.3%;" /><br>
			            	<div class="percentBox"></div>
			            		<c:url var="ssOne" value="supportingDetail.pick">
									<c:param name="supNo" value="${Supporting.supNo }"></c:param>
								</c:url>
			            	</a>
			            </div>
			        </div><!--/row-fluid-->
			    </div><!--/item-->
			     
			    <div class="item">
			        <div class="row-fluid">
			            <div class="col-4">
			            <h3 class="card-title"><a href="${ssOne }">${Supporting.supTitle }</a></h3>
			            	<a href="${ssOne }" class="thumbnail">
			            	<img src="/resources/SupportingFiles/${Supporting.imgReName }" alt="Image" style="max-width:33.3%;" /><br>
			            	<div class="percentBox"></div>
			            		<c:url var="ssOne" value="supportingDetail.pick">
										<c:param name="supNo" value="${Supporting.supNo }"></c:param>
								</c:url>
			            	</a>
			            </div>
			            <div class="col-4">
			             	<h3 class="card-title"><a href="${ssOne }">${Supporting.supTitle }</a></h3>
			            	<a href="${ssOne}" class="thumbnail">
			            	<img src="/resources/SupportingFiles/${Supporting.imgReName }" alt="Image" style="max-width:33.3%;" /><br>
			            	<div class="percentBox"></div>
			            		<c:url var="ssOne" value="supportingDetail.pick">
										<c:param name="supNo" value="${Supporting.supNo }"></c:param>
								</c:url>
			            	</a>
			            </div>
			            <div class="col-4">
			            <h3 class="card-title"><a href="${ssOne }">${Supporting.supTitle }</a></h3>
			            	<a href="${ssOne }" class="thumbnail">
			            	<img src="/resources/SupportingFiles/${Supporting.imgReName }" alt="Image" style="max-width:33.3%;" /><br>
			            	<div class="percentBox"></div>
			            		<c:url var="ssOne" value="supportingDetail.pick">
										<c:param name="supNo" value="${Supporting.supNo }"></c:param>
								</c:url>
			            	</a>
			            </div>
			        </div><!--/row-fluid-->
			    </div><!--/item-->
		</c:forEach>
    	</div><!--/carousel-inner-->
	   <a class="left carousel-control" href="#myCarousel" data-slide="prev">PREV</a>
	   <a class="right carousel-control" href="#myCarousel" data-slide="next">NEXT</a>
	   </div><!--/myCarousel-->
    </div><!--/well--><br><br><br>
   </c:if>
	<jsp:include page="/footer.jsp"></jsp:include>
	<script>
	$("#searchBox").focus(function(){
		$("#searchBox").val("");
	});
	$(document).ready(function() {
		$('#myCarousel').carousel({
		interval: 10000
		})
	});
	</script>
</body>
</html>