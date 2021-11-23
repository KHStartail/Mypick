<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제페이지</title>
<!-- import결제 라이브러리 추가 -->
<!-- jQuery -->
 <!--  
 <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  -->
  <!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
	body {
		text-align : center;
		padding : 100px;
		height : 500px;
	}
	ul li{
		list-style:none;
	}
</style>
</head>
<body>
<form id="form">
	<input type="hidden" value="${supporting.supNo }" name="supNo" id="supNo">
	<input type="hidden" value="${supporting.supTitle }" name="supTitle" id="supTitle">
	<input type="hidden" value="${nickName }" name="userNickName" id="userNickName">
	<input type="hidden" value="${money+plusMoney }" name="money">
	<input type="hidden" value="card" name="paymentMethod" id="paymentMethod">
	<h1>${nickName}님의 결제페이지</h1><br><br><br>
	<h3>${nickName}님</h3>
	<div id="paymentInfo">
		[${supporting.supTitle}] : ${money+plusMoney}원 결제하시겠습니까?
		아래 정보를 입력해주세요.
	</div>
	<div id="supportingPay">
		<ul>
			<li>실명 : <input type="text" name="userName" id="userName"> </li>
			<li>전화번호  : <input type="text" name="userPhone" id="userPhone"> </li>
			<li>이메일 : <input type="text" name="userEmail" id="userEmail"></li>
		</ul>
	</div>
</form>
	<button onclick="check()">결제하기</button>
	<button onclick="resetBtn()">닫기</button>
  <script>
 
  function resetBtn(){
	  history.back();
  }
  
  
  function pay(){
		 var userNickName = '<c:out value="${nickName}"/>';
		 var money = '<c:out value="${money+plusMoney}"/>';
		 var supNo = '<c:out value="${supporting.supNo}"/>';
		 var supTitle = '<c:out value="${supporting.supTitle}"/>';
		 var userName =$("#userName").val();
		 var userPhone =$("#userPhone").val();
		 var userEmail = $("#userEmail").val();
		 console.log("닉네임 "+userNickName);
		 console.log("결제금액"+money);
		 console.log("서포팅번호"+supNo);
		 console.log("서포팅제목"+supTitle);
		 console.log("결제자이름"+userName);
		 console.log("결제자번호"+userPhone);
		 console.log("이메일"+userEmail);
		 var IMP = window.IMP; // 생략 가능
		 IMP.init("imp13335528"); //가맹점 식별코드
		 IMP.request_pay({ 
	         pg: "inicis",
	         pay_method: 'card',
	         merchant_uid:"merchant_" + new Date().getTime(),
	         name: supTitle,
	         amount: money,
	         buyer_email: userEmail,
	         buyer_name: userName,
	         buyer_tel: userPhone
	     }, function (rsp) { // callback
	         if (rsp.success) {
	       	  // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
	       	  
				msg = '결제가 완료되었습니다.';
		        msg += '\n고유ID : ' + rsp.imp_uid;
		        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		        msg += '\n결제 금액 : ' + rsp.paid_amount;
		        msg += '\n카드 승인번호 : ' + rsp.apply_num;
		        alert(msg);
		    	var queryString = $("#form").serialize();
			    console.log(queryString);
		        $.ajax({
			    	//성공시 이동할 페이지
			        type: "POST",
			        url : "getPayment.pick",
			        data : queryString,
			        success: function(data) {
			        	if(data == "failed") {
			        		alert("결제 실패");
			        	}else{
			        		//성공시 
			        		alert("결제 성공");
			        		location.href="supportingDetail.pick?supNo="+supNo;
			        		
			        	}
			        }
		        });
		     } else {
		             var msg = '결제에 실패하였습니다.';
			         alert(msg);
			         location.href="supportingList.pick";
		     }
	     }
	)};
  
  function check(){
	  if(form.userName.value == ""){
          form.userName.focus();

          return false;
      }
	  if(form.userPhone.value == ""){
          form.userPhone.focus();

          return false;
      }
	  if(form.userEmail.value == ""){
          form.userEmail.focus();

          return false;
      }
	  pay();
	//유효성검사
	//		var pExg  = /^[0-9]/g;
//	 	var phone = $("#userPhone").val();
//	 	if(pExg.test(phone)){
//			alert("숫자만 입력가능합니다.");
//	 	};
//	  
//	  if($("#userName").val().length<=1){
//		alert("이름을 정확히 입력해주세요");
//	  };
//	  
//	  var nExg  = /^[가-힣]{2,15}$/;
//	  var Name = $("#userName").val();
//	  if(nExg.test(Name)){
//		alert("실명을 입력해주세요.");
//	  };
//	  
//	  var eExg  = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
//	  var Email = $("#userEmail").val();
//	  if(eExg.test(Email)){
//		  $("#userEmail").keyup(function(e){
//			alert("이메일을 입력해주세요.");
//		  });
//	  };
	
  }
	  

</script>
</body>
</html>