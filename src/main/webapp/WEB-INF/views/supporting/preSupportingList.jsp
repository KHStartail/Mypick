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
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- swiper-js CDN -->
<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<!-- 부트스트랩 css -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<style>
		body{	
			text-align:center;
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
		p{
			height: 80px;
			overflow:hidden;
		}
      .w-button{
      	width : 100px;
      	height: 50px;
      	border : 1px solid;
	 	border-radius: 5px;
	 	margin-top: 5px;
	 	margin-bottom: 10px;
	  	background-color : #483CFA;
	  	color: white;
      } 
      .card {
      	width: 300px;
      	height: 350px;
      	margin-bottom : 30px;
      }
      
      img.card-img-top{
      	width : 100%;
      	height: 200px;
      }
      .card body{
      	height : 100px;
      }
      .card-text{
      	height : 80px;
      	overflow: hidden;
      	margin-bottom: 0px;
      }
      .pagination{
      	text-align : center;
      	display: inline-block;
      }
      .card-title {
      overflow:hidden;
       height:25px;
      }
    </style>
  </head>
<body>
<jsp:include page="/header.jsp"></jsp:include>
<br><br><br><br>
<div class="container">
	<h1>모집중 서포팅 목록</h1>
	<h3>일정 인원수가 달성시, 서포팅이 진행됩니다!</h3><br><br><br>
	<form action="presupportingSearch.pick" method="get">
		<input type="text" placeholder="그룹이름 또는 아이돌이름을 입력해주세요." name="keyword" id="searchBox" size="40" value="${keyword }">
		<input type="submit" value="검색" class="searchButton"><br><br><br><br>
	</form>
	
	<c:if test="${empty pList }"><br><br><br>
		<h1>조회된 글이 없습니다.</h1>
	</c:if>
	<c:if test="${not empty pList }">
		<div class="row"> 
			<c:forEach items="${pList}" var="Supporting" varStatus="sLength">
				<c:url var="psOne" value="presupportingDetail.pick">
					<c:param name="supNo" value="${Supporting.supNo}"></c:param>
				</c:url>
			<div class="col-4">
				<div class="card" style="cursor : pointer;" onclick="location.href='${psOne }';">
					<img src="/resources/supportingFiles/${Supporting.imgReName }" class="card-img-top" alt="Image">
					<div class="card-body"> 
						<h5 class="card-title">${Supporting.supTitle }</h5>
						<p class="card-text">${Supporting.supContents }</p> 
						<a href="#" class="btn btn-primary" id="partiwon" onclick="participation()">참여하기</a>
					</div>
				</div>
			</div>
			</c:forEach>		
		</div>
	<div class="pagination">
		<table align="center">
			<tr align="center" height="20">
				<td colspan="6">
					<c:url var="before" value="presupportingList.pick">
						<c:param name="page" value="${pi.currentPage - 1}"></c:param>
					</c:url>
					<c:if test="${pi.currentPage <= 1}">
						[이전]
					</c:if>
					<c:if test="${pi.currentPage > 1}">
						<a href="${before }">[이전]</a>
					</c:if>
					<c:forEach var="p" begin="${pi.startNavi }" end="${pi.endNavi }">
						<c:url var="pagination" value="presupportingList.pick">
							<c:param name="page" value="${p }"></c:param>
						</c:url>
						<c:if test="${p eq pi.currentPage }">
							<font color="red" size="4">[${p }]</font>
						</c:if>
						<c:if test="${p ne pi.currentPage }">
							<a href="${pagination }">${p }</a>&nbsp;
						</c:if>
					</c:forEach>
					<c:url var="after" value="presupportingList.pick">
						<c:param name="page" value="${pi.currentPage + 1}"></c:param>
					</c:url>
					<c:if test="${pi.currentPage >= pi.maxPage}">
						[다음]
					</c:if>
					<c:if test="${pi.currentPage < pi.maxPage }">
						<a href="${after }">[다음]</a>
					</c:if>
				</td>
			</tr>
		</table>
	</div><br>
	</c:if>
	<button class="w-button" onclick="check()">서포팅모집</button><br><br><br><br>
</div>
<jsp:include page="/footer.jsp"></jsp:include>
<script>
	//검색
	var search = document.getElementById("#searchBox");
	$("#searchBox").focus(function(){
		$("#searchBox").val("");
	});
	//서포팅모집
	function check(){
		var userId = '${loginUser.userId}';
		console.log(userId);
		if(userId == ""){
			alert("로그인 후 이용해주세요")
		}else{
			location.href='supportingWriteView.pick';
		}
	}
	//서포팅 참여
	function participation(){
		var userId = '${loginUser.userId }';
	 	var supNo = '${Supporting.supNo}';
		
		if(userId == "") { 
			alert("참여는 로그인 후 이용가능합니다.");
			return;
		}else{
			$.ajax({
				url : "addParticipation.pick",
				type : "get",
				data : {
					"supNo" : supNo,
				},
				success : function(data) {
					if(data == "success1") {
						alert("해당 서포팅이 실제 서포팅으로 이뤄집니다.");
					}else if(data=="success2"){
						alert("참여 완료되었습니다");
					}else if(data=="success3"){
						alert("참여 취소되었습니다.");
					}else{
						alert("에러");
					}
				},
				error : function() {
						alert("통신오류, 관리자에게 문의 바랍니다.");
				},
				complete : function() {
					
				}
			});
		}
	}
</script>
</body>
</html>