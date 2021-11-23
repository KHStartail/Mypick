<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이돌 리스트</title>
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
</style>
<style type="text/css">
#profile {
	width: 300px;
	height: 300px;
	border-radius: 70%;
}

#idolName {
	font-size: 25px;
}

.joinIdol {
	width: 100px;
	height: 50px;
	float: left;
	margin-left: 100px;
}

.joinIdol button {
	width: 100%;
	height: 100%;
	border-radius: 10%;
	float: left;
	color: #ffffff;
	border: 0px;
	outline: 0px;
}

.Tboard a {
	font-family: 'Jeju Gothic', sans-serif;
}

a:link {
	color: black;
	ext-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: underline;
}
</style>

<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/css/font-awesome.css">
<link rel="stylesheet" href="assets/css/templatemo-klassy-cafe.css">
<link rel="stylesheet" href="assets/css/owl-carousel.css">
<link rel="stylesheet" href="assets/css/lightbox.css">
<link rel="stylesheet" href="assets/css/header.css">
<link rel="stylesheet" href="assets/css/login.css">
<script src="assets/js/search.js"></script>

</head>
<body>
	<jsp:include page="/header.jsp"></jsp:include>
	<br>
	<br>
	<c:if test="${loginUser.userGrade eq 'manager'}">
	<div class="joinIdol">
		<button onclick="location.href='idolJoinView.pick'"
			style="background-color: #fb5849dc;">아이돌 등록</button>
	</div>
	</c:if>
	<div class="Tboard">
		<table align="center" width="600" cellspacing="0"
			style="clear: right;">
			<tr>
				<th></th>
				<th></th>
			</tr>
			<c:if test="${ empty iList }">
				<tr>
					<td colspan="3" align="center">조회된 아이돌이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty iList }">
				<c:forEach items="${iList }" var="idol">
					<tr>
						<td align="center"><img
							src="../../../resources/idolloadFiles/${idol.filePath }"
							id="profile"><br>
						<br>
						</td>
						
						<td align="center">
							<c:url var="community" value="mainView.pick">
							<c:param name="groupName" value="${idol.groupName }"></c:param>
							</c:url> 
							<a href="${community }" id="idolName">${idol.idolName }</a>
						</td>
						<c:if test="${loginUser.userGrade eq 'manager'}">
						<td align="right">
							<c:url var="iModify" value="idolModify.pick">
							<c:param name="idolNo" value="${idol.idolNo }"></c:param>
							</c:url>
							
						<c:url var="iDelete" value="idolDelete.pick">
						<c:param name="idolNo" value="${idol.idolNo }"></c:param>
						</c:url>
						<a href="${iModify }">수정하기 </a>
						<a href="${iDelete }">삭제하기</a>
						</td>
						</c:if>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
</body>
<jsp:include page="/footer.jsp"></jsp:include>
</html>