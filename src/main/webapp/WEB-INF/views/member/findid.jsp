<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>아이디/ 비밀번호찾기 페이지</title>
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
	
	<script type="text/javascript">
	
// 	function(){
// 		var checkzId = function(){
// 		  var getphone = $("#userPhone").val().replace/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
		 
		
// 		  if($("#userPhone").val() == ""){
// 				alert("전화번호 입력바랍니다.");
// 				$("#userPhone").focus();
// 				return false;
// 			  }
// 		  if(!getphone.test($("#userPhone").val())) {
// 			  alert("형식에 맞춰서 전화번호를 입력바랍니다");
// 			  $("#userPhone").val("");
// 			  $("#userPhone").focus();
// 			  return false;
// 			  }
// //		  if(phone2 != "code2"){
// //		  alert("인증번호를 확인해주세요");
// //		  $("#phone2").val("");
// //		  $("#phone2").focus();
// //		  return false;
// //		}
// 		  return true;
//  	}
	
	
// };

function checkz() {
	  var getphone = $("#userPhone").val().replace/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
	 
	  
	  //아이디 공백 확인
	  if($("#userId").val() == ""){
		alert("아이디 입력바랍니다");
		$("#userId").focus();
		return false;
	  }
	  if($("#userPhone").val() == ""){
			alert("전화번호 입력바랍니다.");
			$("#userPhone").focus();
			return false;
		  }
	  if(!getphone.test($("#userPhone").val())) {
		  alert("형식에 맞춰서 전화번호를 입력바랍니다");
		  $("#userPhone").val("");
		  $("#userPhone").focus();
		  return false;
		  }
//	  if(phone2 != "code2"){
//			  alert("인증번호를 확인해주세요");
//			  $("#phone2").val("");
//			  $("#phone2").focus();
//			  return false;
//			}
	  return true;
	}


};

	</script>
</head>
<body class="login-page" style="background : none">
	


    <div class="login-wrap d-flex align-items-center flex-wrap justify-content-center">
		<div class="container">
			<div class="row align-items-center">
					<div class="login-box bg-white box-shadow border-radius-10">
						<div class="login-title">
							<h2 class="text-center text-primary">MyPick 아이디/ 비밀번호찾기</h2>
						</div>
							<div class="select-role">
								
									<div class="tab" style="background-color: white; border:"0";>
										<button class="tablinks">아이디찾기</button>
										<button class="tablinks">비밀번호찾기</button>
									</div>
								
							</div>
							
							<div  id="findid" class="tabcontent" >
							<!--form action="/findId.pick" method="post"-->
							<div class="input-group custom">						
								<input type="hidden" id="phoneDoubleCheck"/>
								<input id="userPhone" type="text" name="userPhone" class="form-control form-control-lg" placeholder="핸드폰번호를 입력해주세요. " required/>
								<div class="input-group-append custom">
									<span class="input-group-text"></span>
								</div>
                                <button type="button" id="phoneChk" class="doubleCheck">인증번호받기</button>        
							</div>
							<div class="input-group custom">
								<input id="pass"name="pass" type="text" class="form-control form-control-lg" placeholder="인증번호 입력">
								<div class="input-group-append custom">
									<span class="input-group-text"><i class="dw dw-padlock1"></i></span>
								</div>
							</div>
							
								<div class="row">
								<div class="col-sm-12">
									<div class="input-group mb-0">
										<button type="submit" onclick="findId()" id="phoneChk2" class="btn btn-outline-primary btn-lg btn-block">아이디찾기</button>
									</div><br>
									<div class="input-group mb-0">
										<a class="btn btn-outline-primary btn-lg btn-block" href="home.pick">취소</a>
									</div>
								</div>
							</div>
							
							<!-- /form -->
							<div class="input-group custom" id="searchId" style="display: none;">
								<div>아이디는 <span id="foundId"></span> 입니다.</div>
							</div>
							</div>
							
							
						
							
							<div id="findpwd" class="tabcontent" style="display: none;">
						<form onsubmit="return checkz()" action="/findPwd.pick" method="post">
							<div class="input-group custom">
								<input id="userId"name="userId" type="text" class="form-control form-control-lg" placeholder="아이디를 입력해주세요.">
								<div class="input-group-append custom">
									<span class="input-group-text"><i class="icon-copy dw dw-user1"></i></span>
								</div>
							</div>
							<div class="input-group custom">						
								<input type="hidden" id="phoneDoubleCheck"/>
								<input id="userPhone" type="text" name="userPhone" class="form-control form-control-lg" placeholder="핸드폰번호를 입력해주세요. " required/>
								<div class="input-group-append custom">
									<span class="input-group-text"></span>
								</div>
                                <button type="button" id="phoneChk" class="doubleCheck">인증번호받기</button>        
							</div>
							<div class="input-group custom">
								<input id="pass"name="pass" type="password" class="form-control form-control-lg" placeholder="인증번호를 입력해주세요">
								<div class="input-group-append custom">
									<span class="input-group-text"><i class="dw dw-padlock1"></i></span>
								</div>
							</div>
							
							
							<div class="row">
								<div class="col-sm-12">
									<div class="input-group mb-0">
										<input type="submit" id="checkzPwd" class="btn btn-outline-primary btn-lg btn-block" value="비밀번호 변경하기">
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
	
	   
	    $(".tablinks:eq(0)").addClass("active");
	    $("#findid").css('display', 'block');
	    $(".tablinks").click(function(event) {
	        let selectedIndex = $(this).index();
	        $(".tabcontent").each(function(index, item) {
	            if (index != selectedIndex) {
	                $(item).css('display', 'none');
	            } else {
	                $(item).css('display', 'block');
	            }

	        });
	        $(".tablinks").each(function(index, item) {
	            if (index != selectedIndex) {
	                $(item).removeClass("active");

	            } else {

	                $(this).addClass('active');
	            }

	        });
	    
	    	
	    });
	    
	    function findId(){
	    	console.log("findId start");
	    	
	    	var userPhone =  $("#userPhone").val();
	  		
	  		
		  		if(!userPhone){ 
		    		alert("phoneNumber 를 입력해주세요.");
		    		return ;
		    	}
		  		
	
	    	
	    	$.ajax({
	            type: "POST" ,
	            url: "/findId.pick",
	            data: { userPhone : userPhone },
	        	success : function(data) {
					if(data != null){
						$("#searchId").css("display", "block");
						$("#foundId").html(data);
						

					}else{
						alert("아이디가 없습니다")
					}
							
				},
				error : function() {
					alert("전화번호를 확인해주세요.")
				},
				complete : function(){
				 						
				}

	    	});
	    	
	    }
	</script>
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
			var userPhone = $("#userPhone").val();
			if(!userPhone){ 
	    		alert("phoneNumber 를 입력해주세요.");
	    		return ;
	    	}else{
	    		alert("인증번호 발송이 완료되었습니다. 휴대폰에서 인증번호 확인을 해주십시오");
	    	}
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