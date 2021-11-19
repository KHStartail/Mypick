<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진행중 서포팅 상세</title>
 <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-klassy-cafe.css">
    <link rel="stylesheet" href="assets/css/lightbox.css">
    <link rel="stylesheet" href="assets/css/header.css">
    <link rel="stylesheet" href="assets/css/login.css">
<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous" type="text/javascript"></script>
<!-- 아임포트 -->
<script src ="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
<style>
	body{
	 text-align : center;
	}
	.container img{
		width : 30%;
		height: 360px;
		float: left;
		margin-right : 10px;
	}
	#contextBox{
		border : 1px solid #eee;
		width : 300px;
		padding : 10px 10px;
		height: 360px;
		float: left;
		margin-right : 10px;
	}
	#moneyBox{
		position : relative;
		width : 300px;
		float : left;
		background-color:#eee;
		padding : 5px 5px;
		margin-bottom : 8px;
	}
	.mbox{
		float: left;
		width : 50%;
	}
	.side{
		position : relative;
		border: 1px solid;
		width : 300px;
		float: left;
	}
	#aside{
		padding : 5px 5px;
	}
	p{
		font-style : bold;
	}
	.fListBox{
		border : 1px solid #eee;
		width: 100%;
		height: 300px;
		float: left;
		margin-top : 10px;
		margin-bottom : 10px;
	}
	.btn{
	 	width : 100px;
	 	height: 40px;
	 	border : 1px solid;
	 	border-radius: 5px;
	 	padding : 10px 5px;
	 	margin-top: 5px;
	  	background-color : #483CFA;
	  	color: white;
	 }
	 #paybtn{
	 	height: 35px;
	 	border : 1px solid;
	 	border-radius: 5px;
	 	padding : 5px 5px;
	 	margin-top: 5px;
	 	margin-buttom: 5px;
	  	background-color : #483CFA;
	  	color: white;
	 }
	 .left{
	 	text-align: left;
	 }
	 #btnCenter{
	 	 display: flex;
 		 justify-content: center;
	 }
</style>
</head>
<body>
<jsp:include page="/header.jsp"></jsp:include><br><br>
<h1>${supporting.supTitle}</h1><br>
<div class="container">
	<img src="/resources/supportingFiles/${supporting.imgReName}">
	<ul id="contextBox">
		<li>작성자  : ${userNickName}</li>
		<li>날짜 : ${supporting.scheduleDate}</li>
		<li>장소 : ${supporting.supPlace}</li>
		<li>내용 : ${supporting.supContents}</li>
		<li>서포팅 기간 :<fmt:formatDate pattern="yyyy년 MM월 dd일" value="${supporting.supStartDate}"/> ~ <fmt:formatDate pattern="yyyy년 MM월 dd일" value="${supporting.supEndDate}"/></li>
		<li id="percent">달성률</li>
	</ul>
	<div id="moneyBox">
		<div id="sumMoney" class="mbox">모인 금액<br>${supporting.sumMoney}</div>
		<div id="goalMoney" class="mbox">목표 금액<br>${supporting.goalMoney}</div>
	</div><br>
	<aside id="aside">
		<form onsubmit="moneyAction()" action="movePayPage.pick" method="post">
			<input type="hidden" name="supNo" value="${supporting.supNo }">
			<input type="hidden" name="supTitle" value="${supporting.supTitle }">
			<input type="hidden" name="userNickName" value="${userNickName }">
			<div class="side">
				<ul>
					<li><input type="radio" name="money-check" id="one" value="10000"><label for="10,000won">10,000원</label></li>
					<li><input type="radio" name="money-check" id="two"  value="20000"><label for="20,000won">20,000원</label></li>
					<li><input type="radio" name="money-check" id="three"  value="30000"><label for="30,000won">30,000원</label></li>
					<li><input type="radio" name="money-check" id="four"  value="40000"><label for="40,000won">40,000원</label></li>
					<li>기타입력<br><input type="text" name="money-check-etc" id="five" placeholder="추가금액을 입력해주세요"></li>
				</ul>
				<p>최소단위는 1,000원 입니다.<br>최소단위 이하는 서포팅이 취소될 시 환불되지 않습니다.</p>
				<input type="submit" id="paybtn" value="서포팅 결제하기">
			</div><br>
		</form><br>
	</aside>
	<button id="btnCenter" class="btn" onclick="location.href='supportingList.pick'">목록</button>
	<div class="fListBox">
		<c:forEach var="fList" items="${fList}">
			<div class="contentsBox">
				<img src="/resources/supportingFiles/${fList.fileReName }">
			</div>
		</c:forEach>
	</div>
	<br><br><br>
	<h3 class="left">댓글</h3><hr>
	<table align="center" id="reply">
		<tr>
			<td>
				<textarea rows="2" cols="55" id="rContents">최대 1000자 입력가능합니다.</textarea>
			</td>
			<td>
				<button class="btn" id="rSubmit">등록</button>
			</td>
		</tr>
	</table>
	<br><br>
	<!-- 댓글 목록 -->
	<table align="center" width="500" border="1" id="rtb">
		<thead>
			<tr>
				<!-- 댓글 개수 -->
				<td colspan="4"><b id="rCount"></b></td>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	<br><br>
</div>
<jsp:include page="/footer.jsp"></jsp:include>
<script>
	var userId = $("#Id").val();
	function showPopup(){
		 var userId = session.getAttribute("userId")
		 if(userId == "null"){
			 alert("로그인 후 결제가 가능합니다.");
		 }
	 };
	 //기타금액 숫자 유효성 체크
	 $("#five").keyup(function(e){
			var moneyCheck = /[^0-9]/g; //숫자외의것들 true
			var etc = $("#five").val();
			if(moneyCheck.test(etc)){
				alert("숫자만 입력가능합니다.");
				$("#five").val("");
			}
	});
// 	//기타 금액 보내기
	function moneyAction(){
		var etc = $("#five").val();
		if(etc == "")
		$("#five").val(0);
		//$("#etcMoney").value.val(etc);
 	}

	
	$("#rContents").focus(function(){
		$("#rContents").val("");
	});
	
	$("#five").focus(function(){
		$("#five").val("");
	});
	
	getReplyList(); //댓글바로 보이게 하는 것
	
	//댓글 등록
	$("#rSubmit").on("click", function(){
		var supNo = '${Supporting.supNo}';
		var rContents = $("#rContents").val(); 
		$.ajax({
			url : "addSupReply.pick",
			type : "post",
			data : {
				"supNo" : supNo,
				"supReContents" : rContents
			},
			success : function(data) {
				if(data == "success") {
					alert("댓글 등록 완료");
					getReplyList();
					$("#rContents").val("");
				}else {
					alert("댓글 등록 실패, 관리자에게 문의 바랍니다.");
				}
			},
			error : function() {
					alert("통신오류, 관리자에게 문의 바랍니다.");
			},
		});
	});
//댓글리스트	
	function getReplyList() {
	 var supNo = '${Supporting.supNo }';
		$.ajax({
			url : "supReplyList.pick",
			type : "get",
			data : { "supNo" : supNo },
			dataType : "json",
			success : function(data) {
			 var $tableBody = $("#rtb tbody"); //띄어쓰기로 후선 선택자를 이용해서
			 $tableBody.html(""); 
			 var $tr;   
			 var $rWriter;
			 var $rContent;
			 var $rCreateDate;
			 var $btnArea;
			 $("#rCount").text("댓글 (" + data.length +")");   //댓글갯수
			 if(data.length > 0) { 
				 for(var i in data){
					 $tr = $("<tr id='modifyTr'>"); 
					 $rWriter = $("<td width='100'>").text(data[i].supReWriter);
					 $rContent = $("<td>").text(data[i].supReContents);
					 $rCreateDate = $("<td width='100'>").text(data[i].supReDate);    
					 $btnArea = $("<td width='100'>").append("<a href='#' onclick='modifyReply(this,"+supNo+","+data[i].supReAllNo+",\""+data[i].supReContents+"\");'>수정</a>&nbsp;").append("<a href='#' onclick='removeReply("+supNo+","+data[i].supReAllNo+")'>삭제</a>&nbsp;").append("<a href='#' onclick='reportReply(this,"+supNo+","+data[i].supReAllNo");'>삭제</a>");  
					 $tr.append($rWriter);
				 	 $tr.append($rContent);
				 	 $tr.append($rCreateDate);
				 	 $tr.append($btnArea);
				 	 $tableBody.append($tr);
				 }
			 }
			},
			error : function() {
				 alert("통신오류, 관리자에게 문의하세요");
			}
		});
	}
	
	function modifyReply(obj, supNo, supReAllNo, supReContents) {
		$trModify = $("<tr>");
		$trModify.append("<td colspan='3'><input type='text' id='modifyReply' size='50' value='"+supReContents+"'></td>");
		$trModify.append("<td><button onclick='modifyReplyCommit("+supNo+","+supReAllNo+")'>수정완료</button></td>");
		$(obj).parent().parent().after($trModify); 
	}
	
	function modifyReplyCommit(supNo, supReAllNo) {
		var modifiedContent = $("#modifyReply").val();
		$.ajax({
			url : "modifySupReply.pick",
			type : "post",
			data : {
				"supNo" : supNo,
				"supReAllNo" : supReAllNo,
				"supReContents" : modifiedContent
			},
			success : function(data) {
				if(data == "success") {
					getReplyList();
				}else{
					alert("댓글 수정 실패");
				}
			},
			error : function() {
				alert("통신 실패, 관리자 문의바람");
			}
		});
	}
	
	function removeReply(supNo, supReAllNo) {
		$.ajax({
			url : "deleteSupReply.pick",
			type : "get",
			data : {"supNo" : supNo, "supReAllNo" : supReAllNo},
			success : function(data) {
				if(data == "success") {
					getReplyList();
				}else{
					alert("댓글 삭제 실패");
				}
			},error : function(){
				alert("통신 오류 , 관리자 문의 바람");
			}
		});
	}
	
	function reportReply(supNo, supReAllNo){
		$.ajax({
			url:"reportSupReply",
			type: "get",
			data : {
				"supNo" : supNo,
				"supReAllNo" : supReAllNo
			}
			success : function(data){
				if(data =="success"){
					alert("해당 댓글이 신고되었습니다.");
				}else{
					alert("댓글 신고 실패");
				}
			}
		});
	}
</script>
</body>
</html>