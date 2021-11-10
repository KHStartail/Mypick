<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
		<jsp:include page="/header.jsp"></jsp:include>
		<div id="imgBox"></div>
		<ul id="contextBox">
			<li>날짜 : {supporting.scheduleDate}</li>
			<li>장소 : {supporting.supPlace} </li>
			<li>참여마감일 : {supporting.supStart}</li>
			<li>목표인원 : {supporting.supPartiwon}/20명</li>
			<li>내용 : {supporting.supContents}</li>
		</ul>
		<button id="participation">참여하기</button>
		<div id="percent">참여인원 </div> <!-- percent 고민좀 해보기 -->
		<div class="contentsBox">
			첨부파일
		</div>
		<button class="btn" onclick="location.href='supportingModify.pick'">수정</button>
		<button class="btn" onclick="location.href='supportingDelete.pick'">삭제</button>
		<button class="btn" onclick="location.href='presupportingList.pick'">목록</button>
		<br><br>
		<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>