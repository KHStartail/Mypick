<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>로그인 페이지</title>
   <style type="text/css">
   .tab button {
	float: left;
	outline: none;
	cursor: pointer;
	padding: 14px 16px;
	font-size: 13px;
	background-color: #918c0038;
	font-family: 'Inter',sans-serif;
    letter-spacing: 0;
    font-weight: 500;
    line-height: 1.5;
    border-radius: 0.3rem;
    color: #fb5849dc;
    border-color: #fb5849dc;
    background-color: transparent;
    border: 1px solid transparent;
	}
	
	.tab button.active {
		background-color: #fb5849dc;
		color: white;
	}
	
	.tabcontent {
		padding: 6px 12px;
		border-top: none;
	}
   
   </style>
	<!-- Mobile Specific Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
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
	


    <div class="login-wrap d-flex align-items-center flex-wrap justify-content-center">
		<div class="container">
			<div class="row align-items-center">
					<div class="login-box bg-white box-shadow border-radius-10">
						<div class="login-title">
							<h2 class="text-center text-primary">MyPick 비밀번호변경하기</h2>
						</div>
							
							<div id="findpwd" class="tabcontent">
						<form action="modifyPwd.pick" method="post">
						<input type="hidden" value="${member }" name="userId">
							<div class="input-group custom">
								<input id="userPwd"name="userPwd" type="password" class="form-control form-control-lg" placeholder="새로운 비밀번호를 입력해주세요">
								<div class="input-group-append custom">
									<span class="input-group-text"></span>
								</div>
							</div>
							<div class="input-group custom">
								<input id="cpass"name="cpass" type="password" class="form-control form-control-lg" placeholder="새로운 비밀번호를 재입력해주세요">
								<div class="input-group-append custom">
									<span class="input-group-text"></span>
								</div>
								
							</div>							
							<div class="row">
								<div class="col-sm-12">
									<div class="input-group mb-0">
										<button  type="submit" class="btn btn-outline-primary btn-lg btn-block">비밀번호 변경하기</button>
									</div><br>
									<div class="input-group mb-0">
										<a class="btn btn-outline-primary btn-lg btn-block" href="home.pick">취소</a>
									</div>
								</div>
							</div>
						</form>
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
	<script type="text/javascript">
	
	   
// 	    $(".tablinks:eq(0)").addClass("active");
// 	    $("#findid").css('display', 'block');
// 	    $(".tablinks").click(function(event) {
// 	        let selectedIndex = $(this).index();
// 	        $(".tabcontent").each(function(index, item) {
// 	            if (index != selectedIndex) {
// 	                $(item).css('display', 'none');
// 	            } else {
// 	                $(item).css('display', 'block');
// 	            }

// 	        });
// 	        $(".tablinks").each(function(index, item) {
// 	            if (index != selectedIndex) {
// 	                $(item).removeClass("active");

// 	            } else {

// 	                $(this).addClass('active');
// 	            }

// 	        });
	    
	    	
// 	    });
	    
// 	    function findId(){
// 	    	console.log("findId start");
	    	
// 	    	var userPhone =  $("#userPhone").val();
	    	
// 	    	if(!userPhone){ 
// 	    		alert("phoneNumber 를 입력해주세요.");
// 	    		return;
// 	    	}
	    	
// 	    	$.ajax({
// 	            type: "POST" ,
// 	            url: "/findId.pick",
// 	            data: { userPhone : userPhone },
// 	        	success : function(data) {
// 					if(data != null){
// 						$("#searchId").css("display", "block");
// 						$("#foundId").html(data);
						

// 					}else{
// 						alert("아이디가 없습니다")
// 					}
							
// 				},
// 				error : function() {
// 					alert("Ajax 통신오류... 관리자에게 문의하세요.")
// 				},
// 				complete : function(){
				 						
// 				}

// 	    	});
	    	
// 	    }
	</script>
</body>
</html>