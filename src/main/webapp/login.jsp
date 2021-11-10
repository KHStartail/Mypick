<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>로그인 페이지</title>
	<!-- Mobile Specific Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
	<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="assets/css/core.css">
	<link rel="stylesheet" type="text/css" href="assets/css/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="assets/css/style.css">

	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag(){dataLayer.push(arguments);}
		gtag('js', new Date());

		gtag('config', 'UA-119386393-1');
	</script>
</head>
<body class="login-page" style="background : none">
	
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>

window.Kakao.init("79860c3d8a4b70e0635ac04e1d7ac333");

function kakaoLogin(){
    window.Kakao.Auth.login({
        scope:'profile_nickname, profile_image, account_email',
        success:function(authobj){
            console.log(authobj);
            window.Kakao.API.request({
                url: '/v2/user/me',
                seccess: res =>{
                    const kakao_account = res/kakao_account;
                    console.log(kakao_account);
                }
            });
        }
    });
}

    </script>


    <div class="login-wrap d-flex align-items-center flex-wrap justify-content-center">
		<div class="container">
			<div class="row align-items-center">
					<div class="login-box bg-white box-shadow border-radius-10">
						<div class="login-title">
							<h2 class="text-center text-primary">MyPick 로그인</h2>
						</div>
						<form>
							<div class="select-role">
								<div class="btn-group btn-group-toggle" data-toggle="buttons">
									<label class="btn active">
										<input type="radio" name="options" id="admin">
										<div class="icon"><img src="assets/images/briefcase.svg" class="svg" alt=""></div>
										<span>　</span>
										매니저로그인
									</label>
									<label class="btn">
										<input type="radio" name="options" id="user">
										<div class="icon"><img src="assets/images/person.svg" class="svg" alt=""></div>
										<span>　</span>
										회원로그인
									</label>
								</div>
							</div>
							<div class="input-group custom">
								<input type="text" class="form-control form-control-lg" placeholder="아이디">
								<div class="input-group-append custom">
									<span class="input-group-text"><i class="icon-copy dw dw-user1"></i></span>
								</div>
							</div>
							<div class="input-group custom">
								<input type="password" class="form-control form-control-lg" placeholder="**********">
								<div class="input-group-append custom">
									<span class="input-group-text"><i class="dw dw-padlock1"></i></span>
								</div>
							</div>
							<div class="row pb-30">
								<div class="col-6">
									<div class="forgot-password" style="position: absolute; top: 50%; left: 25%; width: 150%; text-align: center;"><a href="forgot-id.html">아이디 찾기</a>/<a href="forgot-password.html">비밀번호 찾기</a></div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<div class="input-group mb-0">
										<!--
											use code for form submit
											<input class="btn btn-primary btn-lg btn-block" type="submit" value="Sign In">
										-->
										<a class="btn btn-primary btn-lg btn-block" href="index.html" style="background : #fb5849dc" >로그인</a>
									</div><br>
                                    <a href="javascript:kakaoLogin();"><img src="https://t1.daumcdn.net/cfile/tistory/99BEE8465C3D7D1214"></a>

									<div class="font-16 weight-600 pt-10 pb-10 text-center" data-color="#707373">OR</div>
									<div class="input-group mb-0">
										<a class="btn btn-outline-primary btn-lg btn-block" href="memberjoin.html">회원가입</a>
									</div>
								</div>
							</div>
						</form>
					</div>
			</div>
		</div>
	</div>
	<!-- js -->
	<script src="vendors/scripts/core.js"></script>
	<script src="vendors/scripts/script.min.js"></script>
	<script src="vendors/scripts/process.js"></script>
	<script src="vendors/scripts/layout-settings.js"></script>
</body>
</html>