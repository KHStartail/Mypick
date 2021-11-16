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
 #imgBox{
 	border : 1px solid;
 	float: left;
 	width: width: 50%;
 }
 #contextBox{
 	border : 1px solid;
 	width: 50%;
 	float : left;
 }
 .filesBox {
 	heigth : 500px;
 	display : flex;
 	justify-content : center;
 	align-items: center;
 	border : solid 1px gray;
 }
</style>
</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>
<div class="container">
<input type="hidden" value="${supporting.supNo }" id="supNo">
		<h1>${supporting.supNo }</h1>
		<div id="imgBox"><img src="resources/supportingFiles/${supporting.imgPath }"></div>
		<ul id="contextBox">
			<li>작성자 : ${supporting.writer }</li>
			<li>날짜 : ${supporting.scheduleDate}</li>
			<li>장소 : ${supporting.supPlace} </li>
			<li>참여마감일 : <fmt:formatDate pattern="yyyy-MM-dd" value="${supporting.supStartDate}"/></li>
			<li>목표인원 : ${supporting.supPartiwon} / 20명</li>
			<li>내용 : ${supporting.supContents}</li>
		</ul><br>
		<div id="percent">참여인원percent </div> <!-- percent 고민좀 해보기 -->
		<button id="participation">참여하기</button>
		<div class="filesBox">
			<c:forEach items="${fList}" var="files">
				<img src="${files.filePath }">
			</c:forEach>
		</div>
		<c:url var ="sModify" value="modifySupportingView.pick">
			<c:param name="supNo" value="${supporting.supNo }"></c:param>
		</c:url>
		<c:url var ="sDelete" value="supportingDelete.pick">
			<c:param name="supNo" value="${supporting.supNo }"></c:param>
		</c:url>
		<a href="${sModify }">수정</a>&nbsp;&nbsp;&nbsp;
		<a href="${sDelete }">삭제</a>&nbsp;&nbsp;&nbsp;
		<a href="presupportingList.pick">목록</a>
<jsp:include page="/footer.jsp"></jsp:include>
</div>
</body>
</html>