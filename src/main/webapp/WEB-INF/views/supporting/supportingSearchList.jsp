<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진행중 서포팅 검색 목록</title>
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
	      .w-button{
	      	width : 100px;
	      	height: 30px;
	      	 margin: auto;
	 		 width: 50%;
	      } 
	      .card {
	      	margin-bottom : 30px;
	      	color: white;
	      }
	      .card-header{
	      	height: 100px;
	      	background-color : #FA908C;
	      }
	      .container img {
	      	height: 250px;
	      }
	      .searchButton{
			width : 100px;
	      	height:40px;
	      	border : 1px solid;
		 	border-radius: 5px;
		 	margin-top: 5px;
		 	margin-bottom: 10px;
		  	background-color : #483CFA;
		  	color: white;
			}
		.pagination{
	      	text-align : center;
	      	display: inline-block;
	      }
	      .sbox{
	      	background-color: #eee;
	      	height : 200px;
	      	text-align: center;
	      }
</style>
</head>
<body>
<script>
	$(document).ready(function() {
		function loginCheck() {
			alert("로그인하세요.");
			window.location.href = "supportingList.pick";
		}
		
		$("#searchBox").focus(function(){
			$("#searchBox").val("");
		});
		
		$('#myCarousel').carousel({
			interval: 10000
		})
		
		$("#check").on("click", function(){
			alert("로그인 후 이용해주세요");
			window.history.back();
		});
	});
</script>
<jsp:include page="/header.jsp"></jsp:include>
<div class="container"><br>
	<h1>진행중 서포팅  검색 목록</h1><br>
	<p>마감일이 가까운 순으로 먼저 보여집니다.</p><br>
	<form action="supportingSearch.pick" method="get">
		<input type="text" size="40" placeholder="그룹이름 또는 아이돌이름을 입력해주세요." value="${keyword }" id="searchBox" name="keyword" >
		<input type="submit" value="검색" id="search" class="searchButton"> <br><br>
	</form>
		<c:if test="${empty ssList}">
			<div class="sbox"><br><br><h3>검색한 아이돌의 서포팅이 없습니다.<br> 모집중 서포팅으로 가서 서포팅을 모집해보세요.</h3></div>
		</c:if>
		<c:if test="${not empty ssList }">
		<div class="row">
			<c:forEach items="${ssList}" var="Supporting">
				 <c:url var="ssOne" value="supportingDetail.pick">
						<c:param name="supNo" value="${Supporting.supNo}"></c:param>
				</c:url>
				<div class="col-3">
						<c:if test="${userId eq null }">
							<div class="card" style="cursor : pointer;" id="check">
				           		<div class="card-header" ><h3>${Supporting.supTitle }</h3></div><br>
								<div class="card-text"><img src="/resources/supportingFiles/${Supporting.imgReName }" alt="Image"></div>
				            	<div class="percentBox"></div>
							</div>
						</c:if>
						<c:if test="${userId ne null }">
							<c:url var="ssOne" value="supportingDetail.pick">
								<c:param name="supNo" value="${Supporting.supNo }"></c:param>
							</c:url>
							<div class="card" style="cursor : pointer;" onclick="location.href='${ssOne}';">
				           		<div class="card-header"><h3>${Supporting.supTitle }</h3></div><br>
								<div class="card-text"><img src="/resources/supportingFiles/${Supporting.imgReName }" alt="Image"></div>
				            	<div class="percentBox"></div>
							</div>
						</c:if>
					</div>
			</c:forEach>
			</div>
		</c:if>
		<br><br>
	</div>
<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>