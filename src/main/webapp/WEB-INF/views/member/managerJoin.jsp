<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자 회원가입</title>
<style type="text/css">

#userAddr{
	border-radius: 0.25rem;
    padding-right: 50px;
    height: 45px;
    color: #131e22;
    border-color: #d4d4d4;
    
}
	span.guide{
		display : none;
		font-size : 12px;
		top : 12px;
		right : 10;
	}
	span.ok{color:green}
	span.error{color:red}
	
	button{
	width: 80px;
	}
</style>
<script language="javascript" src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>

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
	 <script>
 
	 	function checkz() {
		  var getaddr = $("#userAddr").val().replace(/\s|/gi,'');
		  var hobbyCheck = false;
		  var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		  var getName= RegExp(/^[가-힣]+$/);
		  var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
		  var getphone = $("#userPhone").val().replace(/^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}/gi,'');
		  var businessNo =  RegExp(/^[0-9]$/);
		  //아이디 공백 확인
		  if($("#userId").val() == ""){
			alert("아이디 입력바람");
			$("#userId").focus();
			return false;
		  }
	 
		 
	 
		  //비밀번호
		  if(!getCheck.test($("#userPwd").val())) {
		  alert("형식에 맞춰서 PW를 입력해줘용");
		  $("#userPwd").val("");
		  $("#userPwd").focus();
		  return false;
		  }
	 
		  //아이디랑 비밀번호랑 같은지
		  if ($("#userId").val()==($("#userPwd").val())) {
		  alert("비밀번호가 ID와 똑같으면 안!대!");
		  $("#userPwd").val("");
		  $("#userPwd").focus();
		}
	 
		  //비밀번호 똑같은지
		  if($("#userPwd").val() != ($("#cpass").val())){ 
		  alert("비밀번호가 틀렸네용.");
		  $("#userPwd").val("");
		  $("#cpass").val("");
		  $("#userPwd").focus();
		  return false;
		 }
		//이름의 유효성 검사
		if(!getCheck.test($("#userId").val())){
				alert("형식에 맞게 입력해주세요");
				$("#userId").val("");
				$("#userId").focus();
				return false;
			}
		 //이메일 공백 확인
		  if($("#userEmail").val() == ""){
			alert("이메일을 입력해주세요");
			$("#userEmail").focus();
			return false;
		  }
			   
		  //이메일 유효성 검사
		  if(!getMail.test($("#userEmail").val())){
			alert("이메일형식에 맞게 입력해주세요")
			$("#userEmail").val("");
			$("#userEmail").focus();
			return false;
		  }
	 
		  //이름 유효성
		  if (!getName.test($("#userNickName").val())) {
			alert("이름 똑띠 쓰세용");
			$("#userNickName").val("");
			$("#userNickName").focus();
			return false;
		  }
		 
	 
		
		//공백이 있다면 안됨.
		if(getaddr==""){
		  alert("주소를 입력해주세요");
		  $("#userAddr").val("");
		  $("#userAddr").focus();
		  return false;
		}
		if(businessNo==""){
			  alert("사업자번호를 입력해주세요");
			  $("#businessNo").val("");
			  $("#businessNo").focus();
			  return false;
			}
		if(getphone==""){
			  alert("핸드폰번호를 입력해주세요");
			  $("#userPhone").val("");
			  $("#userPhone").focus();
			  return false;
			}
// 		if(phone2 != "code2"){
// 			  alert("인증번호를 확인해주세요");
// 			  $("#phone2").val("");
// 			  $("#phone2").focus();
// 			  return false;
// 			}
	 
		return true;
	 	}

		
			
		
	 
	  </script>
</head>
<body class="login-page">
	<!-- method="post" action="memberRegister.kh" enctype="text/plain" -->
<!-- 	<form action="#" method="post" id="login"> -->
	<div class="login-wrap d-flex align-items-center flex-wrap justify-content-center">
		<div class="container">
			<div class="row align-items-center">
					<div class="login-box bg-white box-shadow border-radius-10">
						<div class="login-title">
							<h2 class="text-center text-primary">Login To DeskApp</h2>
						</div>

							<div class="select-role">
								<div class="btn-group btn-group-toggle" data-toggle="buttons">
									<label class="btn active">
									<a href="#userId">
										<input type="radio" name="options" id="admin">
										<div class="icon"><img src="assets/images/briefcase.svg" class="svg" alt=""></div>
										<span>I'm</span>
										Manager
									</a>
									</label>
									<label class="btn">
									<a href="enrollView.pick">
										<input type="radio" name="options" id="user">
										<div class="icon"><img src="assets/images/person.svg" class="svg" alt=""></div>
										<span>I'm</span>
										Employee
									</a>
									</label>
								</div>
							</div>
							<form onsubmit="return checkz()" action="memberRegister.pick" method="post">
							<span class="guide ok">이 아이디는 사용 가능합니다.</span>
							<span class="guide error">이 아이디는 사용이 불가능합니다.</span>	
							<div class="input-group custom">	
								<input id="userId" name="userId" type="text" class="form-control form-control-lg" placeholder="아이디를 입력해주세요.">									
								<div class="input-group-append custom">
									<span class="input-group-text"><i class="icon-copy dw dw-user1"></i></span>
								</div>
							</div>
							<div class="input-group custom">
								<input id="userPwd" name="userPwd" type="password" class="form-control form-control-lg" placeholder="비밀번호를 입력해주세요.">
								<div class="input-group-append custom">
									<span class="input-group-text"><i class="dw dw-padlock1"></i></span>
								</div>
							</div>
								<div class="input-group custom">
								<input id="cpass" name="cpass" type="password" class="form-control form-control-lg" placeholder="비밀번호를 재입력해주세요.">
								<div class="input-group-append custom">
									<span class="input-group-text"><i class="dw dw-padlock1"></i></span>
								</div>
							</div>
							
							<div class="input-group custom">
								<input id="userNickName" name="userNickName" type="text" class="form-control form-control-lg" placeholder="닉네임을 입력해주세요.">
								<div class="input-group-append custom">
									<span class="input-group-text"><i class="icon-copy dw dw-user1"></i></span>
								</div>
							</div>
                            <div class="input-group custom">
								<input id="userEmail" name="userEmail" type="text" class="form-control form-control-lg" placeholder="이메일을 입력해주세요.">
								<div class="input-group-append custom">
									<span class="input-group-text"><i class="icon-copy dw dw-user1"></i></span>
								</div>
							</div>
							<div class="input-group custom">
								<input id="userAddr" name="post" type="text" class="postcodify_postcode5" placeholder="우편번호를 입력해주세요.">
								<div class="input-group-append custom">
									<span class="input-group-text"></span>
								</div>
                                <button type="button" id="postcodify_search_button">검색</button>
							</div>
							<div class="input-group custom">
								<input id="userAddr" name="address1" type="text" class="postcodify_address" placeholder="도로명주소를 입력해주세요.">
								<div class="input-group-append custom">
									<span class="input-group-text"></span>
								</div>
							</div>
							<div class="input-group custom">
								<input id="userAddr" name="address2" type="text" class="postcodify_extra_info" placeholder="상세주소를 입력해주세요.">
								<div class="input-group-append custom">
									<span class="input-group-text"></span>
								</div>
							</div>
							<div class="input-group custom">
								<input id="businessNo" name="businessNo" type="text" class="postcodify_extra_info" placeholder="사업자번호를 입력해주세요.">
								<div class="input-group-append custom">
									<span class="input-group-text"></span>
								</div>
							</div>
							<div class="input-group custom">						
								<input type="hidden" id="phoneDoubleCheck"/>
								<input id="userPhone" type="text" name="userPhone" class="form-control form-control-lg" placeholder="핸드폰번호를 입력해주세요. " required/>
								<div class="input-group-append custom">
									<span class="input-group-text"></span>
								</div>
                                <button type="button" id="phoneChk" class="doubleCheck">인증번호 보내기</button>        
							</div>
								<div class="input-group custom">
								<input  id="phone2" type="text" name="phone2" class="form-control form-control-lg" placeholder="인증번호를 입력해주세요. " disabled required//>
								<div class="input-group-append custom">
									<span class="input-group-text"></span>
								</div>
								<button id="phoneChk2" class="doubleCheck">본인인증</button>
							</div>
							
							<div class="row">
								<div class="col-sm-12">
									
									
									<div class="input-group mb-0">
										<button type="submit" id="btn" class="btn btn-outline-primary btn-lg btn-block" href="home.pick">가입하기</button>
										<button type="reset" class="btn btn-outline-primary btn-lg btn-block" href="#userId">취소</button>
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
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script type="text/javascript">
	
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
		
		var code2 ="";
		$("#phoneChk").click(function(){
			alert("인증번호 발송이 완료되었습니다. 휴대폰에서 인증번호 확인을 해주십시오");
			var userPhone = $("#userPhone").val();
			$.ajax({
				type:"GET",
				url:"phoneCheck.pick?userPhone=" + userPhone,
						cache : false,
						success:function(data){
							if(data =="error"){
								alert("휴대폰 번호가 올바르지 않습니다.")
								$("successPhoneChk").text("유효한 번호를 입력해주세요.");
								$("successPhoneChk").css("color","red");
								$("#userPhone").attr("autofocus",true);
							
							}else{
								alert("성공")
								$("#phone2").attr("disabled",false);
								$("#phoneChk2").css("display","inline-block");
								$(".successPhoneChk").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
								$(".successPhoneChk").css("color","green"); 
								$("#userPhone").attr("readonly",true);
								code2=data;

							}
						}
				
			})
			
		});
		$("#phoneChk2").click(function(){
			
			if($("#phone2").val() == code2){ 
				$(".successPhoneChk").text("인증번호가 일치합니다.");
				$(".successPhoneChk").css("color","green");
				$("#phoneDoubleChk").val("true"); 
				$("#phone2").attr("disabled",true);
			}else{
				$(".successPhoneChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다."); 
				$(".successPhoneChk").css("color","red");
				$("#phoneDoubleChk").val("false");
				$(this).attr("autofocus",true);

				
			}

		
		});
	</script>
	
</body>
</html>