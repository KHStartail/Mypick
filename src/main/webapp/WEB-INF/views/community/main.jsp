<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="assets/css/header.css">
<link rel="stylesheet" href="assets/css/lightbox.css">
<link rel="stylesheet" href="assets/css/templatemo-klassy-cafe.css">
<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/css/community-main.css">
<link
	rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/toastr.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/assets/js/toastr.min.js"></script>

<style>
.box {
	width: 150px;
	height: 150px;
	border-radius: 70%;
	overflow: hidden;
}

.profile {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

#nav {
	height: 200px;
	width: 150px;
	border: 1px solid black;
	background-color: rgb(240, 240, 106);
	position: fixed;
	bottom: 45%;
	left: 90%;
	border-radius: 30%;
}

#nav div {
	text-align: center;
	height: 50px;
	width: 125px;
	margin-left: 15px;
	margin-top: 25px;
	border: 1px solid black;
	background-color: #3498DB;
	font-weight: bold;
	line-height: 50px;
	border-radius: 9%;
}

#nav a {
	color: white;
	width: 100%;
	display: inline-block;
}
</style>
<title>커뮤니티메인페이지</title>
<jsp:include page="/header.jsp"></jsp:include>
</head>
<body>
	<form name="dataForm" id="dataForm">
		<div align="center" class="banana">
			<img id="main_Img" alt="아이돌배너" src="/resources/mainImgs/${mainImgName.mainImgName }">
			<input id="input_img" type="file" size="50" name="reloadFile"
				style="display: none;">
		</div>
	</form>
	<input type="hidden" id="groupName" value="${groupName}">
	
	
	<div class="box"
		style="background: #BDBDBD; position: relative; left: 48%; bottom: 80px">
		<img class="profile" src="/resources/idolImg/ban.png">
	</div>
	<div id="nav">
		<div id="nav1">
			<a href="#">캘린더</a>
		</div>
		<div id="nav2">
			<a href="index.jsp">메인으로</a>
		</div>
	</div>
	<table class="table table-hover"
		style="width: 60%; position: relative; left: 20%">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>닉네임</th>
				<th>조회수</th>
				<th>좋아요수</th>
				<th>작성날짜</th>
			</tr>
		</thead>
		<c:if test="${empty cList }">
			<tr>
				<td colspan="6" align="center">조회된 게시글이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty cList }">
			<c:forEach items="${cList }" var="Post">
				<tbody>
					<tr>
						<td>${Post.postNo }</td>
						<c:url var="cDetail" value="detailView.pick">
							<c:param name="postNo" value="${Post.postNo }"></c:param>
						</c:url>
						<td><a href="${cDetail }">${Post.postTitle }</a></td>
						<td>${Post.userNickName }</td>
						<td>${Post.viewsCount }<img src="/resources/img/eye.png"></td>
						<td>${Post.heartCount }<img src="/resources/img/heart.png"></td>
						<td>${Post.updateDate }</td>
					</tr>
			</c:forEach>
		</c:if>
		</tbody>
	</table>
	<hr />

	<nav aria-label="Page navigation example"
		style="position: relative; left: 20%; width: 100px; float: left">
		<ul class="pagination" style="width: 100px;">
			<c:url var="before" value="mainView.pick">
				<c:param name="page" value="${pi.currentPage - 1 }"></c:param>
			</c:url>
			<c:if test="${pi.currentPage <= 1 }">
				<li class="page-item"><a class="page-link"><</a></li>
			</c:if>
			<c:if test="${pi.currentPage > 1 }">
				<li class="page-item"><a class="page-link" href="${before }"><</a></li>
			</c:if>
			<c:forEach var="p" begin="${pi.startNavi }" end="${pi.endnavi }">
				<c:url var="pagination" value="mainView.pick">
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
			<c:url var="after" value="mainView.pick">
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
	<div class="container" style="position: relative; left: 20%;">
		<div class="row">
			<div id="custom-search-input">
				<div class="input-group col-md-12">
					<form action="postSearch.pick" method="get">
						<input type="text" class="  search-query form-control"
							placeholder="닉네임또는제목을입력해주세요" size="50" name="searchKeyword" /> <span
							class="input-group-btn">
							<button class="btn btn-danger" type="button">
								<span class=" glyphicon glyphicon-search"></span>
							</button>
						</span>
					</form>
				</div>
			</div>
		</div>
	</div>
	<c:if test="${not empty loginUser }">
		<a class="btn btn-primary" href="WriteView.pick"
			style="margin-left: 70%;">글쓰기</a>
	</c:if>
	<c:if test="${empty loginUser }">
		<a class="btn btn-primary"
			onclick="toastr.error('비회원', '로그인이후 작성가능합니다.');"
			style="margin-left: 70%;">글쓰기</a>
	</c:if>
	<input type="hidden" id="userId" value="${loginUser.userId }">

</body>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<jsp:include page="/footer.jsp"></jsp:include>
<script>
$(document).ready(function() {
    $("#input_img").on("change", handleImgFileSelect);
}); 

   if(self.name != 'reload'){
	   self.name= 'reload';
	   self.location.reload(true);
   }else{
	   self.name='';
   }
	toastr.options = {
			  "closeButton": false,
			  "debug": false,
			  "newestOnTop": false,
			  "progressBar": false,
			  "positionClass": "toast-top-full-width",
			  "preventDuplicates": false,
			  "onclick": null,
			  "showDuration": "300",
			  "hideDuration": "1000",
			  "timeOut": "5000",
			  "extendedTimeOut": "1000",
			  "showEasing": "swing",
			  "hideEasing": "linear",
			  "showMethod": "fadeIn",
			  "hideMethod": "fadeOut"
			}
	$(function () {
	    	if($("#userId").val() == 'admin'){
	    $('#main_Img').click(function (e) {
	    	console.log(userId);
	        e.preventDefault();
	        $('#input_img').click();
	    });
	    	}
	});
	
	 function handleImgFileSelect(e) {
         var files = e.target.files;
         var filesArr = Array.prototype.slice.call(files);

         filesArr.forEach(function(f) {
             if(!f.type.match("image.*")) {
                 alert("확장자는 이미지 확장자만 가능합니다.");
                 toastr.error('업로드에러', '확장자는 이미지 확장자만 가능합니다.');
                 return;
             }
             sel_file = f;
             var reader = new FileReader();
             reader.onload = function(e) {
                 $("#main_Img").attr("src", e.target.result);
                 goWrite()
             }
             reader.readAsDataURL(f);
         });
     }
	 
	 
	 function goWrite(){
		 var form = new FormData();
		 form.append( "mainImg", $("#input_img")[0].files[0] );
		 form.append("groupName",$("#groupName").val());
		 console.log($("#groupName").val());
	    	  $.ajax({
	    		  url : "mainImg.pick"
	    	           , type : "POST"
	    	           , processData : false
	    	           , contentType : false
	    	           , data : form,
	       	      success: function (data) {
	       	    	 toastr.success('성공', '이미지교체완료');
	                 console.log(response);
	             }
	             ,error: function (jqXHR) 
	             { 
	                 alert(jqXHR.responseText); 
	             }
	 });
	 }
</script>

</html>