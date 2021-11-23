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
<!-- jquery ui -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
  <!-- count up -->
   <script src = "../assets/js/jquery.counterup.min.js"></script>
  <script src = "../assets/js/waypoints.min.js"></script>
   

<style>
	body{
	 text-align : center;
	}
	.container img{
		width : 400px;
		height: 360px;
		float: left;
		margin-right : 10px;
	}
	#contextBox{
		border : 1px solid #eee;
		width : 360px;
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
	 	float : left;
	 }
	 #btnCenter{
	 	 position: absolute;
		 left: 50%;
		 transform: translateX(-50%);
 		 text-align:center;
	 }
	 thead{
	 	border: #eee;
	 }
	 #noReply{
	 	background-color: #eee;
	 }
	 #modifyTr{
	 	border: #eee;
	 }
</style>
</head>
<body>
<jsp:include page="/header.jsp"></jsp:include><br><br>
<h1>${supporting.supTitle}</h1><br>
<div class="container">
	<img src="/resources/supportingFiles/${supporting.imgReName}">
	<ul id="contextBox">
		<li>아이돌이름 : ${supporting.groupName}</li>
		<li>작성자  : ${userNickName}</li>
		<li>날짜 : ${supporting.scheduleDate}</li>
		<li>장소 : ${supporting.supPlace}</li>
		<li>내용 : ${supporting.supContents}</li>
		<li>진행기간 :<fmt:formatDate pattern="yyyy년 MM월 dd일" value="${supporting.supStartDate}"/> ~ <fmt:formatDate pattern="yyyy년 MM월 dd일" value="${supporting.supEndDate}"/></li><br><br>
	</ul>
		<!-- 달성률 % -->
		<%-- <li class="progress-bar bg-warning" role="progressbar" background-color ="yellow" style="width: ${(supporting.goalMoney / supporting.sumMoney)*100 }%"></li>
		<li>달성률 : <fmt:formatNumber pattern = ".0">${(supporting.sumMoney/ supporting.goalMoney)*100 }</fmt:formatNumber>%</li> --%>
	<div id="moneyBox">
		<div id="sumMoney" class="mbox"><h5 class= "money"> 모인 금액<br><fmt:formatNumber type="currency">${supporting.sumMoney}</fmt:formatNumber></h5> </div>
		<div id="goalMoney" class="mbox"><h5 class= "money"> 목표 금액<br><fmt:formatNumber type="currency">${supporting.goalMoney}</fmt:formatNumber></h5></div>
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
					<li>기타입력<br><input type="text" name="money-check-etc" id="five" size="18" placeholder="추가금액을 입력해주세요"></li>
					<p>최소단위는 1,000원 입니다.<br>최소단위 이하는 서포팅이 취소될 시 환불되지 않습니다.</p>
				</ul>
				<input type="submit" id="paybtn" value="서포팅 결제하기">
			</div><br>
		</form><br>
	</aside><br><br><br>
	<button id="btnCenter" class="btn" onclick="location.href='supportingList.pick'">목록</button>
	<div class="fListBox">
		<c:forEach var="fList" items="${fList}">
			<div class="contentsBox">
				<img src="/resources/supportingFiles/${fList.fileReName }">
			</div>
		</c:forEach>
	</div>
	<br><br><br>
	<table align="center" id="reply">
		<tr>
			<td>
				<h3>댓글&nbsp;&nbsp;&nbsp;</h3>
			</td>
			<td>
				<textarea rows="2" cols="55" id="rContents" placeholder="최대 1000자 입력가능합니다."></textarea>
			</td>
			<td>
				<button class="btn" id="rSubmit">등록</button>
			</td>
		</tr>
	</table>
	<br><br>
	<input type="hidden" value="${loginUser.userNickName }" id="log">
	<!-- 댓글 목록 -->
	<table align="center" width="700px" border="1" id="rtb">
		<thead>
			<tr>
				<td width="150px">작성자</td>
				<td width="500px">댓글내용</td>
				<td width="100px">날짜</td>
				<td width="200px;"></td>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	<br><br>
</div>
<jsp:include page="/footer.jsp"></jsp:include>
<script>
	getReplyList(); //댓글바로 보이게 하는 것

	//기타금액 숫자 유효성 체크
	 $("#five").keyup(function(e){
			var moneyCheck = /[^0-9]/g; //숫자외의것들 true
			var etc = $("#five").val();
			if(moneyCheck.test(etc)){
				alert("숫자만 입력가능합니다.");
				$("#five").val("");
			}
	});
 	//기타 금액 보내기
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
	
	
	//댓글 등록
	$("#rSubmit").on("click", function(){
		var supNo = '${supporting.supNo}';
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
					alert("댓글 등록 실패");
				}
			},
			error : function() {
					alert("통신오류1, 관리자에게 문의 바랍니다.");
			},
			complete : function() {
				
			}
		});
	});
//댓글리스트	
	
	function getReplyList() {
	 var supNo = '${supporting.supNo }';
	 var loginUser = '${loginUser.userNickName }';
	 var $log = $("#log").val();
	 
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
				 if(data.length > 0) { 
					 for(var i in data){
					 console.log(data[i].supReWriter);
					 console.log(log);
						 $tr = $("<tr id='modifyTr'>"); 
						 $rWriter = $("<td>").text(data[i].supReWriter);
						 $rContent = $("<td>").text(data[i].supReContents);
						 $rCreateDate = $("<td>").text(data[i].supReDate);    
						 if($log == data[i].supReWriter){
						 	$btnArea = $("<td>").append("<a href='#' onclick='modifyReply(this,"+supNo+","+data[i].supReAllNo+",\""+data[i].supReContents+"\");'>수정</a>&nbsp;").append("<a href='#' onclick='removeReply(this,"+supNo+","+data[i].supReAllNo+")'>삭제</a>&nbsp;"); 
						 }
						 if($log != data[i].supReWriter){
						 	$btnArea = $("<td>").append("<a href='#' onclick='reportReply(this,"+supNo+","+data[i].supReAllNo+");'>신고</a>");
						 }
						 $tr.append($rWriter);
					 	 $tr.append($rContent);
					 	 $tr.append($rCreateDate);
					 	 $tr.append($btnArea);
					 	 $tableBody.append($tr);
					 	}
				}else{
					var $tableBody = $("#rtb tbody");
					 $("#tbody").text("<tr>댓글이 없습니다.</tr>");
					 $tableBody.append($tr);
				}
			},
			error : function() {
				 var $tr;
				 var $p;
					$tr = $("<tr id='noReply'>");
					$p = $('<p>').append("댓글이 없습니다.</p>");
			}
		});
	}
	
	function modifyReply(obj, supNo, supReAllNo, supReContents) {
		$trModify = $("<tr>");
		$trModify.append("<td colspan='3'><input type='text' id='modifyReply' size='50' value='"+supReContents+"'></td>");
		$trModify.append("<td><button class='btn' onclick='modifyReplyCommit("+supNo+","+supReAllNo+")'>수정완료</button></td>");
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
				}else if(data =="noMatch"){
					alert("작성자만 수정가능합니다");
				}else{
					alert("댓글 수정 실패");
				}
			},
			error : function() {
				alert("통신 실패3, 관리자 문의바람");
			}
		});
	}
	
	function removeReply(object,supNo, supReAllNo) {
		$.ajax({
			url : "deleteSupReply.pick",
			type : "get",
			data : {"supNo" : supNo, "supReAllNo" : supReAllNo},
			success : function(data) {
				if(data == "success") {
					getReplyList();
					alert("댓글을 삭제했습니다.");
				}else if(data =="noMatch"){
					alert("작성자만  삭제가능합니다");
					window.history.back();
				}else{
					alert("댓글 삭제 실패");
				}
			},error : function(){
				alert("통신 오류4 , 관리자 문의 바람");
			}
		});
	}
	
	function reportReply(object, supNo, supReAllNo){
		$.ajax({
			url:"reportSupReply.pick",
			type: "get",
			data : {
				"supNo" : supNo,
				"supReAllNo" : supReAllNo
			},
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