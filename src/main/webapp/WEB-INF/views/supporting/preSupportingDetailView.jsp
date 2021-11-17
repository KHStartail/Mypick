<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모집중 서포팅 상세</title>
	<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">
	<link rel="stylesheet" href="assets/css/templatemo-klassy-cafe.css">
	<link rel="stylesheet" href="assets/css/owl-carousel.css">
	<link rel="stylesheet" href="assets/css/lightbox.css">
	<link rel="stylesheet" href="assets/css/header.css">
	<link rel="stylesheet" href="assets/css/login.css">
<style>
	body {
		text-align:center;
	}
	ul{
		text-align:center;
	}
	li{
		display:inline-block;	
	}
	 img{
	 	margin-right : 5px; 
	 	width : 45%;
	 	margin-left : 20px;
	 	margin-bottom : 10px;
	 }
	 .row img:first-child{
	 }
	 #contextBox{
	 	padding : 30px;
	 	border : 1px solid #eee;
	 	width: 50%;
	 	float : left;
	 	margin-bottom : 10px;
 	 }
	 .filesBox {
		width : 100%;
	 	margin-top: 10px;
		padding : 10px;
	 	heigth : 500px;
	 	display : flex;
	 	justify-content : center;
	 	align-items: center;
	 }
	 .center {
	 	width: 100%;
	 	text-align : center;
	 	display : flex;
	 	justify-content : center;
	 	align-items: center;
	 }
	 .btn{
	 	width : 100px;
	 	height: 40px;
	 	border : 1px solid;
	 	border-radius: 5px;
	 	padding : 10px 5px;
	  	background-color : #483CFA;
	  	color: white;
	 }
</style>
</head>
<body>
<jsp:include page="/header.jsp"></jsp:include><br><br>
<h1>${supporting.supTitle }</h1>
<div class="container"><br><br>
	<input type="hidden" value="${supporting.supNo }" id="supNo">
	<div class="row">
		<img src="/resources/supportingFiles/${supporting.imgReName }">
		<div id="contextBox">
		<ul>
			<li>작성자 : ${userNickName }</li>
			<br><li>날짜 : ${supporting.scheduleDate}</li>
			<br><li>장소 : ${supporting.supPlace} </li>
			<br><li>참여마감일 : <fmt:formatDate pattern="yyyy-MM-dd" value="${supporting.supStartDate}"/></li>
			<br><li>목표인원 : ${supporting.supPartiwon} / 20명</li>
			<br><li>내용 : ${supporting.supContents}</li>
	        <br><li id="percent">참여인원percent </li> <!-- percent 고민좀 해보기 -->
		</ul><br><br>
		<button class="btn" id="participation">참여하기</button>
		</div><br><br>
		<div class="center">
		<!-- 수정/삭제버튼 sessionUserId가 작성자랑 동일시에 보이게 -->
			<c:url var ="sModify" value="modifySupportingView.pick">
				<c:param name="supNo" value="${supporting.supNo }"></c:param>
			</c:url>
			<c:url var ="sDelete" value="supportingDelete.pick">
				<c:param name="supNo" value="${supporting.supNo }"></c:param>
			</c:url>
			<a href="${sModify }" class="btn">수정</a>&nbsp;&nbsp;&nbsp;
			<a href="${sDelete }" class="btn">삭제</a>&nbsp;&nbsp;&nbsp;
			<a href="presupportingList.pick" class="btn">목록</a>
		</div>
		<div class="filesBox">
			<c:forEach items="${fList}" var="files">
				<img src="/resources/supportingFiles/${files.fileReName }">
			</c:forEach>
		</div>
	</div>
</div>
<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>