<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&display=swap" rel="stylesheet">

    <title>MyPick 메인</title>
<!--
TemplateMo 558 Klassy Cafe
https://templatemo.com/tm-558-klassy-cafe
-->
    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-klassy-cafe.css">
    <link rel="stylesheet" href="assets/css/owl-carousel.css">
    <link rel="stylesheet" href="assets/css/lightbox.css">
    <link rel="stylesheet" href="assets/css/header.css">
    <link rel="stylesheet" href="assets/css/login.css">
    <link rel="stylesheet" href="assets/css/detail.css">
    <script src="assets/js/search.js"></script>
    </head>
    
    <body>

    <!-- ***** Header Area Start ***** -->
    <jsp:include page="/header.jsp"></jsp:include>
    <!----------------------->
   <c:if test="${empty file }">
     <li>
        <input type="radio" id="slide1" name="slide" checked>
        <label for="slide1"></label>
        <img src="https://dribbble.s3.amazonaws.com/users/322/screenshots/872485/coldchase.jpg" alt="Panel 1">
    </li>
   </c:if>
   <c:if test="${not empty file }">
<ul class="slider" style="float:left">
   <c:forEach items="${file }" var="file" varStatus="index">
    <li>
        <input type="radio" id="slide${index.count }" name="slide" checked>
        <label for="slide${index.count }"></label>
        <img src="/resources/upload/${file.fileRename }" alt="Panel ${index.count }">
    </li>
    </c:forEach>
</ul>

   </c:if> 
		<div class="contents" style="overflow: auto">
			<h1 >${post.postTitle }</h1>
		<div id="contents">
		${post.postContents }
		</div>
		</div>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<form action="CommunityDelete.pick" method="get">
	<c:forEach items="${file }" var="file">
   <input type="hidden" value="${file.fileRename }" id="fileName" name="fileName">
	</c:forEach>
   <input type="hidden" value="${post.postNo }" id="postNo" name="postNo">   

	   		<table id="table" style="margin-left:5%; margin-top:2%;">
   			<tr>
			<td><c:url var="cModify"
					value="modifyView.pick">
					<c:param name="postNo" value="${post.postNo }"></c:param>
				</c:url> <a class="btn btn-primary" href="${cModify }">수정하기</a> <input type="submit" class="btn btn-primary" value="삭제하기"></td>   			
   			</tr>
   		</table>
</form>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <!-- ***** Footer Start ***** -->
 
	<jsp:include page="/footer.jsp"></jsp:include>
    <!-- jQuery -->
    <script src="assets/js/jquery-2.1.0.min.js"></script>

    <!-- Bootstrap -->
    <script src="assets/js/popper.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>

    <!-- Plugins -->
    <script src="assets/js/owl-carousel.js"></script>
    <script src="assets/js/accordions.js"></script>
    <script src="assets/js/datepicker.js"></script>
    <script src="assets/js/scrollreveal.min.js"></script>
    <script src="assets/js/waypoints.min.js"></script>
    <script src="assets/js/jquery.counterup.min.js"></script>
    <script src="assets/js/imgfix.min.js"></script> 
    <script src="assets/js/slick.js"></script> 
    <script src="assets/js/lightbox.js"></script> 
    <script src="assets/js/isotope.js"></script> 
    
    <!-- Global Init -->
    <script src="assets/js/custom.js"></script>
 
  </body>
</html>