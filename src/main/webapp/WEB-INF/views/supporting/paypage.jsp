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
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-{SDK-최신버전}.js"></script>
<style>
	body {
		text-align : center;
		padding : 100px;
		height : 500px;
	}
</style>
</head>
<body>
	<h2>${userNickName}님의 결제페이지</h2><br><br><br>
	<div id="paymentInfo">
		${supporing.supTitle}을 결제하시겠습니까?
		아래 정보를 입력해주세요.
	</div>
	<div id="supportingPay">
		<ul>
			<li>실명 : <input type="text" name="userName"> </li>
			<li>전화번호  : <input type="text" name="userPhone"> </li>
			<li>이메일 : <input type="text" name="userEmail"></li>
		</ul>
	</div>
	<button onclick="requestPay()" value="결제하기"></button>
	<button onclick="resetBtn()" value="닫기"></button>
  <script>
  function resetBtn(){
	  opener.location.href="suppporting/supportingDetail.pick";
	  self.close();
  }
  function requestPay(){
		 var pay = $("money-check").checked.val();
		 var supNo = <c:out value="${Supporting.supNo}"/>
		 var supName = <c:out value="${Suppporting.supTitle}"/>
		 var userName =$("userName").val();
		 var userPhone =$("userPhone").val();
		 var userEmail = $("userEmail").val();
		 var IMP = window.IMP; // 생략 가능
		 IMP.init("{imp13335528}"); //가맹점 식별코드
		 IMP.request_pay({ // param
	         pg: "kakaopay",
	         pay_method: "card",
	         merchant_uid:"merchant_" + new Date().getTime(),
	         name: supName,
	         amount: pay,
	         buyer_email: userEmail,
	         buyer_name: userName,
	         buyer_tel: userPhone,
	     }, function (rsp) { // callback
	         if (rsp.success) {
	       	  // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
	             // jQuery로 HTTP 요청
	             jQuery.ajax({
	                 url: "movePayPage.pick", 
	                 method: "POST",
	                 headers: "json" ,
	                 data: {
	                    "supNo" : supNo,
	                    "supTitle" : supName,
	                    "supAmount" : pay,
	                    "userId" : userId,
	                    "userName" : userName,
	                    "userPhone" : userPhone,
	                    "paymentDate" : 
	                 }
	             }).done(function (data) {
	               // 가맹점 서버 결제 API 성공시 로직
	                 //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	                 if ( everythings_fine ) {
	                     msg = '결제가 완료되었습니다.';
	                     msg += '\n고유ID : ' + rsp.imp_uid;
	                     msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	                     msg += '\결제 금액 : ' + rsp.paid_amount;
	                     msg += '카드 승인번호 : ' + rsp.apply_num;
	                     alert(msg);
	                 } else {
	                    // alert="결제가 진행되지 않았습니다.";
	                    // alert = "결제금액과 요청금액이 달라 결제를 자동취소처리 하였습니다.";
	                     //[3] 아직 제대로 결제가 되지 않았습니다.
	                     alert="결제가 진행되지 않았습니다.";
	                     //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	                     alert = "결제금액과 요청금액이 달라 결제를 자동취소처리 하였습니다.";
	                 }
	             });
		              //성공시 이동할 페이지
		              location.href="/support/detail?supportNo="+${supportNo};
	             })
	           } else { 
	           	//결제실패시 로직
	               alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
	               //실패시 이동할 페이지
	               location.href="/support/detail?supportNo="+${supportNo};
//	            	history.back()
					alert(msg);
	           }
	     });
  });
</script>
</body>
</html>