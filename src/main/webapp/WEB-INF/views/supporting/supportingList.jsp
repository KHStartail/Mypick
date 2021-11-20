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
		}
		
	});
</script>
<jsp:include page="/header.jsp"></jsp:include>
<div class="container">
	<h1>진행중 서포팅 리스트</h1><br>
	<h2>울애긔 기살리자!</h2>
	<p>마감일이 가까운 순으로 먼저 보여집니다.</p><br>
	<input type="text" value="그룹이름을 입력해주세요." id="searchBox">
	<input type="submit" value="검색" class="searchButton"> <br><br>
	<div class="row">
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
				</c:forEach><br>
			</div>
			<div class="pagination">
				<table>
				<tr align="center" height="20">
					<td colspan="6">
					<!-- RequestParam의 page를 가져온다 -->
						<c:url var="before" value="supportingList.pick">
							<c:param name="page" value="${pi.currentPage - 1}"></c:param>
						</c:url>
						<c:if test="${pi.currentPage <= 1}">
							[이전]
						</c:if>
						<c:if test="${pi.currentPage > 1}">
							<a href="${before }">[이전]</a>
						</c:if>
						
						<c:forEach var="p" begin="${pi.startNavi }" end="${pi.endNavi }">
							<c:url var="pagination" value="supportingList.pick">
								<c:param name="page" value="${p }"></c:param>
							</c:url>
							<c:if test="${p eq pi.currentPage }">
								<font color="red" size="4">[${p }]</font>
							</c:if>
							<c:if test="${p ne pi.currentPage }">
								<a href="${pagination }">${p }</a>&nbsp;
							</c:if>
						</c:forEach>
						<c:url var="after" value="supportingList.pick">
							<c:param name="page" value="${pi.currentPage + 1}"></c:param>
						</c:url>
						<c:if test="${pi.currentPage >= pi.maxPage}">
							[다음]
						</c:if><c:if test="${pi.currentPage < pi.maxPage }">
							<a href="${after }">[다음]</a>
						</c:if>
					</td>
				</tr>
				</table>
			</div><br>
		</c:if>
	</div>
</div>
<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>