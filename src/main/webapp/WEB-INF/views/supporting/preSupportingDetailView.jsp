<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모집중 서포팅 상세</title>
	<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">
	<link rel="stylesheet" href="assets/css/templatemo-klassy-cafe.css">
	<link rel="stylesheet" href="assets/css/owl-carousel.css">
	<link rel="stylesheet" href="assets/css/lightbox.css">
	<link rel="stylesheet" href="assets/css/header.css">
	<link rel="stylesheet" href="assets/css/login.css">
<style>
 body{
 	text-align:center;
 }
</style>
</head>
<body>
		<jsp:include page="/header.jsp"></jsp:include>
		<input type="hidden" value="${Supporting.supNo }" id="supNo">
		<h1>${Supporting.supNo }번 게시글 상세</h1>
		<div id="imgBox">${Supporting.imgReName}</div>
		<ul id="contextBox">
			<li>날짜 : ${Supporting.scheduleDate}</li>
			<li>장소 : ${Supporting.supPlace} </li>
			<li>참여마감일 : ${Supporting.supStart}</li>
			<li>목표인원 : ${Supporting.supPartiwon}/20명</li>
			<li>내용 : ${Supporting.supContents}</li>
		</ul>
		<button id="participation">참여하기</button>
		<div id="percent">참여인원 </div> <!-- percent 고민좀 해보기 -->
		<div class="filesBox">
			${SupFile.fileName }  
		</div>
		<c:url var ="sModify" value="supportingModify.pick">
			<c:param name="supNo" value="${Supporting.supNo }"></c:param>
		</c:url>
		<c:url var ="sDelete" value="supportingDelete.pick">
			<c:param name="supNo" value="${Supporting.supNo }"></c:param>
		</c:url>
		<button class="btn" onclick="${sModify}">수정</button>
		<button class="btn" onclick="${sDelete}">삭제</button>
		<button class="btn" onclick="location.href='presupportingList.pick'">목록</button>
		<br><br>
		<table align="center" width="500" border="1">
			<tr>
				<td>
					<textarea rows="3" cols="55" id="rContents"></textarea>
				</td>
				<td><button id="rSubmit">등록하기</button>
			</tr>
		</table>
		<!-- 댓글 목록 -->
		<table align="center" width="500" border="1" id="rtb">
			<thead>
				<tr>
					<!-- 댓글 개수 -->
					<td colspan="4"><b id="rCount"></b></td>
				</tr>
			</thead>
		<tbody>
		<%-- 	<c:url var ="rModify" value="supReplyModify.pick">
				<c:param name="supNo" value="${SupReply.supNo }"></c:param>
				<c:param name="rNum" value="${SupReply.supReAllNo }"></c:param>
			</c:url>
			<c:url var ="rDelete" value="supportingDelete.pick">
				<c:param name="supNo" value="${SupReply.supNo }"></c:param>
				<c:param name="rNum" value="${SupReply.supReAllNo }"></c:param>
			</c:url>
			<a href="${rModify}">수정하기</a>
			<a href="${rDelete}">삭제하기</a>  --%>
		</tbody>
	</table>
	<jsp:include page="/footer.jsp"></jsp:include>
		
<script>
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