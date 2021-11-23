<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<!-- Mobile Specific Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
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
<body class="login-page" style="background: none">




	<div
		class="login-wrap d-flex align-items-center flex-wrap justify-content-center">
		<div class="container">
			<div class="row align-items-center">
				<div class="login-box bg-white box-shadow border-radius-10">
					<div class="login-title">
						<h2 class="text-center text-primary">MyPick 로그인</h2>
					</div>

					<div class="input-group custom">
						<input id="userId" name="userId" type="text"
							class="form-control form-control-lg" placeholder="아이디">
						<div class="input-group-append custom">
							<span class="input-group-text"><i
								class="icon-copy dw dw-user1"></i></span>
						</div>
					</div>
					<div class="input-group custom">
						<input id="userPwd" name="userPwd" type="password"
							class="form-control form-control-lg" placeholder="**********">
						<div class="input-group-append custom">
							<span class="input-group-text"><i class="dw dw-padlock1"></i></span>
						</div>
					</div>

					<div class="row pb-30">
						<div class="col-6">
							<div class="forgot-password"
								style="position: absolute; top: 50%; left: 25%; width: 150%; text-align: center;">
								<a href="findIdPwdView.pick">아이디 찾기/비밀번호 찾기</a>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<div class="input-group mb-0">


								<input class="btn btn-primary btn-lg btn-block" type="button"
									onclick="login()" value="로그인">

								<!-- 										<input class="btn btn-primary btn-lg btn-block" type="submit" style="background : #fb5849dc" value="로그인"> -->
							</div>
							<br> <a href="https://kauth.kakao.com/oauth/authorize?client_id=4ed73170af27965ff058307a6bec5eda&redirect_uri=http://localhost:9999/kakoLogin.pick&response_type=code">
							<img src="https://t1.daumcdn.net/cfile/tistory/99BEE8465C3D7D1214">
								</a>
							<div class="font-16 weight-600 pt-10 pb-10 text-center"
								data-color="#707373">OR</div>
							<div class="input-group mb-0">
								<a class="btn btn-outline-primary btn-lg btn-block"
									href="enrollView.pick">회원가입</a> 
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- js -->
	<script src="vendors/scripts/core.js"></script>
	<script src="vendors/scripts/script.min.js"></script>
	<script src="vendors/scripts/process.js"></script>
	<script src="vendors/scripts/layout-settings.js"></script>
	<script>
		function login() {
			var userId = $("#userId").val();
			var userPwd = $("#userPwd").val();
			$.ajax({
				url : '/login.pick',
				type : 'post',
				data : {
					"userId" : userId,
					"userPwd" : userPwd
				},
				success : function(data) {
					if (data == "success") {
						window.location = document.referrer;

					} else {
						alert("아이디나 비밀번호를 다시 확인해주세요.");
					}
				},
				error : function() {
					alert("로그인 실패");
				}
			})
		};
	</script>


</body>
</html>