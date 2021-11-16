<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<style>
	body{
	 text-align : center;
	}
</style>
</head>
<body>
		<jsp:include page="/header.jsp"></jsp:include>
		<div id="imgBox"></div>
		<ul id="contextBox">
			<li>날짜 : ${Supporting.scheduleDate}</li>
			<li>장소 : ${Supporting.supPlace}</li>
			<li>내용 : ${Supporting.supContents}</li>
			<li>서포팅기간 : ${Supporting.supStartDate} ~ ${Supporting.supEndDate }</li>
		</ul>
		<div id="moneyBox">
			<div id="sumMoney">모인 금액<br>${Supporting.sumMoney}</div>
			<div id="goalMoney">목표 금액<br>${Supporting.goalMoney}</div>
		</div>
		<div id="percent">달성률</div>
		<div class="contentsBox">
			${SupFile.fileName }
		</div>
		<button onclick="location.href='supportingList.pick'">목록</button>
		<div class="side">
			<input type="radio" name="money-check" id="one"><label for="10,000won">10,000원</label>
			<input type="radio" name="money-check" id="two"><label for="20,000won">20,000원</label>
			<input type="radio" name="money-check" id="three"><label for="30,000won">30,000원</label>
			<input type="radio" name="money-check" id="four"><label for="40,000won">40,000원</label>
			기타입력<br><input type="text" name="money-check" id="five" value="추가금액을 입력해주세요.">
		</div>
		<div class="point"><p>최소단위는 1,000원 입니다.<br>최소단위 이하는 서포팅이 취소될 시 환불되지 않습니다.</p></div>
		<div class="payment"><button id="paybtn">서포팅 결제하기</button></div>
		<table align="center" border="1" id="reply">
			<tr>
				<td>
					<textarea rows="3" cols="55" id="rContents">최대 1000자 입력가능합니다.</textarea>
				</td>
				<td>
					<button id="rSubmit">등록</button>
				</td>
			</tr>
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
<jsp:include page="/footer.jsp"></jsp:include>
<script>
$("#rContents").focus(function(){
	$("#rContents").val("");
});

$("#five").focus(function(){
	$("#five").val("");
});

getReplyList(); //댓글바로 보이게 하는 것

$("#rSubmit").on("click", function(){
//	alert("test");
//	var boardNo = $("#boardNo").val(); //2가지 방법 
	var supNo = '${Supporting.supNo}';
	var rContents = $("#rContents").val(); //ajax 데이터를 보내는 방식 form대신
	
	$.ajax({
		url : "addReply.pick",
		type : "post",
		data : {//400에러 주로 나는 부분
			//객체이름 : js내 정의한 화면상 부분
			"supNo" : supNo,
			"supReContents" : supReContents
		},
		success : function(data) {
			if(data == "success") {
				//responseBody로 붙여서 보낼것
				alert("댓글 등록!");
				//댓글 불러오기
				getReplyList();
				//작성 후 내용 초기화(깜박이지 않아서 초기화해줘야됨)
				$("#rContents").val("");
			}else {
				alert("댓글 등록 실패!");
			}
		},
		error : function() {
				alert("AJAX 통신오류.. 관리자에게 문의하세요");
		},
		complete : function() {
			
		}
	});
});

function getReplyList() {
	//console.log("목록 출력!");
//function호출해야지만 ajax실행
 var supNo = '${Supporting.supNo }';
 
	$.ajax({
		url : "replyList.pick",
		type : "get",
		data : { "supNo" : supNo },
		dataType : "json",
		// [{}, {}, {}]형태로 넘어옴
		//json형태로 하기위해서 결과값받을때사용
		success : function(data) {
		//	console.log(data);
		 var $tableBody = $("#rtb tbody"); //띄어쓰기로 후선 선택자를 이용해서
		 $tableBody.html(""); //중복으로 append되지 않게 하는 
		 var $tr;   // = $("<tr>"); //$열고 닫기 자동생김 또는 밑에처럼
		 var $rWriter;
		 var $rContent;
		 var $rCreateDate;
		 var $btnArea;
		 $("#rCount").text("댓글 (" + data.length +")");   //댓글갯수
		 if(data.length > 0) { //data.length = 댓글의 갯수
			 for(var i in data){
				 $tr = $("<tr id='modifyTr'>"); //id값이 여러개 생긴다 > this로 해결
				 $rWriter = $("<td width='100'>").text(data[i].replyWriter);
				 //json data라 댓글이 나오는것
				 //배열이기때문에 인덱스로 보내야 되는것(객체화해서 받아오는것)
				 //key값을 통해 value값을 받아오는 것
				 $rContent = $("<td>").text(data[i].replyContents);
				 $rCreateDate = $("<td width='100'>").text(data[i].rCreateDate);    
				 $btnArea = $("<td width='100'>").append("<a href='#' onclick='modifyReply(this,"+supNo+","+data[i].supReAllNo+",\""+data[i].replyContents+"\");'>수정</a>&nbsp;").append("<a href='#' onclick='removeReply("+supNo+","+data[i].supReAllNo+")'>삭제</a>");  
			 	//<a href="#" onclick="modifyReply(this,12,10,&quot;test1231231&quot;);">수정</a>을 jQuery객체로 만들면 탐색이 가능하다
				 $tr.append($rWriter);
			 	$tr.append($rContent);
			 	$tr.append($rCreateDate);
			 	$tr.append($btnArea);
			 	$tableBody.append($tr);
			 }
		 }
		},
		error : function() {
			alert("AJAX 통신오류.. 관리자에게 문의하세요");
		}
	});
}

function modifyReply(obj, supNo, supReAllNo, supReContents) {
//	console.log(boardNo+","+replyNo+","+replyContents);
	$trModify = $("<tr>");
	$trModify.append("<td colspan='3'><input type='text' id='modifyReply' size='50' value='"+supReContents+"'></td>");
	$trModify.append("<td><button onclick='modifyReplyCommit("+supNo+","+supReAllNo+")'>수정완료</button></td>");
	$(obj).parent().parent().after($trModify); // obj : this를 가져온다, $("#modifyTr").after($trModify);
	//td : parent(), tr : parent().parent() 
}

function modifyReplyCommit(supNo, supReAllNo) {
	var modifiedContent = $("#modifyReply").val();
	$.ajax({
		url : "modifyReply.kh",
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
				alert("댓글 수정 실패!");
			}
		},
		error : function() {
			alert("Ajax통신 실패");
		}
	});
}

function removeReply(supNo, supReAllNo) {
	$.ajax({
		url : "deleteReply.pick",
		type : "get",
		data : {"supNo" : supNo, "supReAllNo" : supReAllNo },
		success : function(data) {
			if(data == "success") {
				getReplyList();
			}else{
				alert("댓글 삭제 실패!");
			}
		}
	});
}
</script>
</body>
</html>