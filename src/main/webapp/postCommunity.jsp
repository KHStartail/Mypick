<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700;800;900&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="assets/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="assets/css/goodsStyle.css" type="text/css">
<link rel="stylesheet" href="assets/css/header.css">
<link rel="stylesheet" href="assets/css/login.css">
<link rel="stylesheet" href="assets/css/goods.css">
<link rel="stylesheet" href="assets/css/goods_detail.css">
<link rel="stylesheet" href="assets/css/mypageSideMenu.css">
<link rel="stylesheet" href="assets/css/mypagePost.css">
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
</style>
</head>
<body>
	<jsp:include page="/header.jsp"></jsp:include>
	<!-- ---------------------------- -->
	<section id="main-section">
		<jsp:include page="/mypageSideMenu.jsp"></jsp:include>
		<!-- 정보------------ -->
		<div class="col-lg-6 col-md-6 col-sm-6" style="max-width: 95%;">
			<div class="breadcrumb__links">
				<a href="/">Home</a> <a href="myPageMain.pick">My Page</a> <span>Post
					- Community</span>
			</div>
		</div>
		<div id="contents-div">

			<div id="commu-section">
				<div class="commu-label">
					<span>커뮤니티 게시글</span>
				</div>
				<div class="commu-info">
					<table class="commu-table">
						<tr>
							<th>제목</th>
							<th>조회수</th>
							<th>좋아요</th>
							<th>등록날짜</th>
						</tr>
						<c:if test="${not empty pList }">
						<c:forEach items="${pList }" var="Post">
							<tr style="height: 50px; border-bottom : 1px solid rgba(128, 128, 128, 0.548);">
						<c:url var="cDetail" value="detailView.pick">
							<c:param name="postNo" value="${Post.postNo }"></c:param>
						</c:url>
								<td><a href="${cDetail }">${Post.postTitle }</a></td>
								<td>${Post.viewsCount }</td>
								<td>${Post.heartCount }</td>
								<td>${Post.createDate }</td>
							</tr>
						</c:forEach>
						</c:if>
						<c:if test="${empty pList }">
							<tr style="height: 50px; border-bottom : 1px solid rgba(128, 128, 128, 0.548);">
								<td colspan="4">작성하신 게시글이 없습니다.</td>
							</tr>
						</c:if>
					</table>
				</div>
			</div>
		</div>
		<c:if test="${not empty pList }">
		<nav aria-label="Page navigation example"
		style="position: relative; top : 5%;left: 10%; width: 100px; float: left; background-color: white;">
		<ul class="pagination" style="width: 100px;">
			<c:url var="before" value="postCommunity.pick?userId=${loginUser.userId }">
				<c:param name="page" value="${pi.currentPage - 1 }"></c:param>
			</c:url>
			<c:if test="${pi.currentPage <= 1 }">
				<li class="page-item"><a class="page-link"><</a></li>
			</c:if>
			<c:if test="${pi.currentPage > 1 }">
				<li class="page-item"><a class="page-link" href="${before }"><</a></li>
			</c:if>
			<c:forEach var="p" begin="${pi.startNavi }" end="${pi.endnavi }">
				<c:url var="pagination" value="postCommunity.pick?userId=${loginUser.userId }">
					<c:param name="page" value="${p }"></c:param>
				</c:url>
				<c:if test="${p eq pi.currentPage }">
					<li class="page-item active"><a class="page-link">${p }</a></li>
				</c:if>
				<c:if test="${p ne pi.currentPage }">
					<li class="page-item"><a class="page-link"
						href="${pagination }">${p }</a></li>
				</c:if>
			</c:forEach>
			<c:url var="after" value="postCommunity.pick?userId=${loginUser.userId }">
				<c:param name="page" value="${pi.currentPage + 1 }"></c:param>
			</c:url>
			<c:if test="${pi.currentPage >= pi.maxPage }">
				<li class="page-item"><a class="page-link">></a></li>
			</c:if>
			<c:if test="${pi.currentPage < pi.maxPage }">
				<li class="page-item"><a class="page-link" href="${after }">></a></li>
			</c:if>

		</ul>
	</nav>
	</c:if>
	</section>
	<!-- ------------------------------------ -->
	<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>