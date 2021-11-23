<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 정보 수정</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
.img_wrap {
	width: 150px;
	height: 150px;
}

#img {
	position: relative;
	width: 100%;
	height: 100%;
	border-radius: 70%;
	background-color: gray;
}

.idolmember {
	position: relative;
	left: 1000px;
	bottom: 178px
}

table {
	border-spacing: 10px;
	border-collapse: separate;
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
<script language="javascript"
	src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>

<!-- Mobile Specific Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
	rel="stylesheet">
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="assets/css/core.css">
<link rel="stylesheet" type="text/css"
	href="assets/css/icon-font.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/style.css">

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());

	gtag('config', 'UA-119386393-1');
</script>
</head>
<body>
	<jsp:include page="/header.jsp"></jsp:include>
	<div class="login-wrap d-flex align-items-center flex-wrap justify-content-center" style="margin-right : 600px;">
		<div class="container">
			<div class="row align-items-center">
				<div class="login-box bg-white box-shadow border-radius-10">
					<div class="login-title">
						<h2 class="text-center text-primary">회원 정보수정</h2>
					
					</div>
					<div class="img_wrap">
						<img id="img"
							src="../../../resources/proFiles/${loginUser.filePath }">
					</div>
					프로필등록<input id="input_img" type="file" size="50" name="reloadFile"><br>
					<form action="myPageProfile.pick" method="GET"
						enctype="multipart/form-data">
						<input type="hidden" name="userNo" value="${loginUser.userNo }">

						<div class="input-group custom">
							<input id="userId" name="userId" type="text"
								class="form-control form-control-lg"
								value="${loginUser.userId }" readonly>
							<div class="input-group-append custom">
								<span class="input-group-text"><i
									class="icon-copy dw dw-user1"></i></span>
							</div>
						</div>
						<div class="input-group custom">
							<input id="userPwd" name="userPwd" type="password"
								class="form-control form-control-lg"
								value="${loginUser.userPwd }">
							<div class="input-group-append custom">
								<span class="input-group-text"><i class="dw dw-padlock1"></i></span>
							</div>
						</div>
						<div class="input-group custom">
							<input id="userNickName" name="userNickName" type="text"
								class="form-control form-control-lg"
								value="${loginUser.userNickName }" readonly>
							<div class="input-group-append custom">
								<span class="input-group-text"><i
									class="icon-copy dw dw-user1"></i></span>
							</div>
						</div>
						<div class="input-group custom">
							<input id="userEmail" name="userEmail" type="text"
								class="form-control form-control-lg"
								value="${loginUser.userEmail }">
							<div class="input-group-append custom">
								<span class="input-group-text"><i
									class="icon-copy dw dw-user1"></i></span>
							</div>
						</div>

						<c:forTokens items="${loginUser.userAddr }" delims="," var="addr"
							varStatus="status">
							<c:if test="${status.index eq 0 }">
								<div class="input-group custom">
									<input id="userAddr" name="post" type="text"
										class="postcodify_postcode5" value=${addr }>
									<div class="input-group-append custom">
										<span class="input-group-text"></span>
									</div>
									<button type="button" id="postcodify_search_button">검색</button>
								</div>
							</c:if>
							<c:if test="${status.index eq 1 }">
								<div class="input-group custom">
									<input id="userAddr" name="address1" type="text"
										class="postcodify_address" value=${addr }>
									<div class="input-group-append custom">
										<span class="input-group-text"></span>
									</div>
								</div>
							</c:if>
							<c:if test="${status.index eq 2 }">
								<div class="input-group custom">
									<input id="userAddr" name="address2" type="text"
										class="postcodify_extra_info" value=${addr }>
									<div class="input-group-append custom">
										<span class="input-group-text"></span>
									</div>
								</div>
							</c:if>
						</c:forTokens>
						<div class="input-group custom">
							<input type="hidden" id="phoneDoubleCheck" /> <input
								id="userPhone" type="text" name="userPhone"
								class="form-control form-control-lg"
								value="${loginUser.userPhone }" required />
							<div class="input-group-append custom">
								<span class="input-group-text"></span>
							</div>
							
						</div>

						
						<button type="submit" 
							class="btn btn-outline-primary btn-lg btn-block">수정하기</button>
						<button type="reset"
							class="btn btn-outline-primary btn-lg btn-block" href="#userId">취소</button>
						<button type="button"
							class="btn btn-outline-primary btn-lg btn-block"
							onclick="location.href='memberDelete.kh?userId=${loginUser.userId}';">탈퇴하기</button>
					</form>
				</div>
			</div>
		</div>
	</div>




	<script>
		var sel_file;

		$(document).ready(function() {
			$("#input_img").on("change", handleImgFileSelect);
		});

		function handleImgFileSelect(e) {
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);

			filesArr.forEach(function(f) {
				if (!f.type.match("image.*")) {
					alert("확장자는 이미지 확장자만 가능합니다.");
					return;
				}
				sel_file = f;
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#img").attr("src", e.target.result);
				}
				reader.readAsDataURL(f);
			});
		}
		 $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); 
			$("#userId").on("blur",function(){
				var userId = $("#userId").val();
				$.ajax({
					url:"checkDupId.pick",
					data:{"userId" : userId},
					success : function(result){
						//console.log(result);
						if(result != 0){
							$(".guide.ok").hide();
							$(".guide.error").show();
						}else{
							$(".guide.ok").show();
							$(".guide.error").hide();
						}
					},
					error : function(){
						alert("ajax 전송실패! 관리자에게 문의하세요!")
					},
				});
			});
	</script>

</body>

</html>