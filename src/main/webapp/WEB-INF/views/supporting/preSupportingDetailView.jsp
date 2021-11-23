<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	body {
		text-align:center;
	}
	ul{
		text-align:center;
	}
	li{
		display:inline-block;	
	}
	 img{
	 	margin-right : 5px; 
	 	width : 45%;
	 	margin-left : 20px;
	 	margin-bottom : 10px;
	 }
	 .row img:first-child{
	 }
	 #contextBox{
	 	padding : 30px;
	 	border : 1px solid #eee;
	 	width: 50%;
	 	float : left;
	 	margin-bottom : 10px;
 	 }
	 .filesBox {
	 	margin-top: 10px;
		padding : 10px;
	 	display : flex;
	 	justify-content : center;
	 	align-items: center;
	 }
	 .filesBox img{
	 	height :600px;
	 	width: 300px;
	 }
	 .center {
	 	width: 100%;
	 	text-align : center;
	 	display : flex;
	 	justify-content : center;
	 	align-items: center;
	 }
	 .btn{
	 	width : 100px;
	 	height: 40px;
	 	border : 1px solid;
	 	border-radius: 5px;
	 	padding : 10px 5px;
	  	background-color : #483CFA;
	  	color: white;
	 }
	 .partiwon{
	 	background-color : #eee;
	 	color: white;
	 }
	 .row img{
	 	height: 400px;
	 }
</style>
<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous" type="text/javascript"></script>

</head>
<body>
<jsp:include page="/header.jsp"></jsp:include><br><br>
<h1>${supporting.supTitle }</h1>
<div class="container"><br><br>
	<input type="hidden" value="${supporting.supNo }" id="supNo">
	<div class="row">
		<img src="/resources/supportingFiles/${supporting.imgReName }">
		<div id="contextBox">
		<ul>
			<li>작성자 : ${userNickName }</li>
			<br><li>날짜 : ${supporting.scheduleDate}</li>
			<br><li>아이돌이름 : ${supporting.groupName}</li>
			<br><li>장소 : ${supporting.supPlace} </li>
			<br><li>참여마감일 : <fmt:formatDate pattern="yyyy-MM-dd" value="${supporting.supStartDate}"/></li>
			<br><li>참여/목표인원 : ${supporting.supPartiwon} / 20명</li>
			<br><li>내용 : ${supporting.supContents}</li>
		</ul><br><br>
		<button class="btn" id="participation" onclick="participation()">참여하기</button>
		</div><br><br>
		<div class="hidden"><input type="hidden" value="${ participation }"></div>
		<div class="center">
		<c:if test="${loginUser.userNo eq supporting.userNo }">
			<c:url var ="sModify" value="modifySupportingView.pick">
				<c:param name="supNo" value="${supporting.supNo }"></c:param>
			</c:url>
			<c:url var ="sDelete" value="supportingDelete.pick">
				<c:param name="supNo" value="${supporting.supNo }"></c:param>
			</c:url>
			<a href="${sModify }" class="btn" onclick="return check();">수정</a>&nbsp;&nbsp;&nbsp;
			<a href="${sDelete }" class="btn" onclick="return check();">삭제</a>&nbsp;&nbsp;&nbsp;
			<a href="presupportingList.pick" class="btn">목록</a><br><br><br>
		</c:if>
		<c:if test="${loginUser.userNo ne supporting.userNo }">
			<a href="presupportingList.pick" class="btn">목록</a>
		</c:if>
		</div>
			<c:forEach items="${fList}" var="files">
				<div class="filesBox">
					<img src="/resources/supportingFiles/${files.fileReName }">
				</div>
			</c:forEach>
	</div>
</div>
<jsp:include page="/footer.jsp"></jsp:include>
<script>
var user ='${loginUser.userNickName}';
function participation(){
	var supNo = "${supporting.supNo }";
	var userId = '${loginUser.userId }';
 	if(userId == "") { 
		alert("참여는 로그인 후 이용가능합니다.");
	}else{ 
		$.ajax({
			url : "addParticipation.pick",
			type : "get",
			data : {
				"supNo" : supNo
			},
			success : function(data) {
				if(data == "success1") {
					alert("해당 서포팅이 실제 서포팅으로 이뤄집니다.");
				}else if(data=="success2"){
					alert("참여 완료되었습니다");
				}else if(data=="success3"){
					alert("참여 취소되었습니다.");
				}else{
					alert("에러");
				}
			},
			error : function() {
				alert("통신오류, 관리자에게 문의 바랍니다.");
			}
		});
	}
}
</script>
</body>
</html>