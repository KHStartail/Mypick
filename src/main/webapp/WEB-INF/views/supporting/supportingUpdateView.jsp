<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서포팅 수정</title>
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/header.css">
<link rel="stylesheet" href="assets/css/lightbox.css">
<link rel="stylesheet" href="assets/css/templatemo-klassy-cafe.css">
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.6.0.js" ></script>
<!-- 달력 라이브러리 -->
 <!-- 값 제어를 위해 jquery -->
 <link href="assets/air-datepicker/dist/css/datepicker.min.css" rel="stylesheet" type="text/css" media="all">
 <!-- Air datepicker css -->
 <script src="assets/air-datepicker/dist/js/datepicker.js"></script> <!-- Air datepicker js -->
 <script src="assets/air-datepicker/dist/js/lang/datepicker.ko.js"></script> <!-- 달력 한글 추가를 위해 커스텀 -->
<style>
	body{
		text-align : center;
	}
	#f-btn{
		width: 100px;
		height: 50px;
	}
	#btn-mutiupload{
		display:none;
	}
	#file-list{
	
	}
</style>
</head>
<body>
<script>
	window.onload = function() {
		//서포팅 날짜 체크
		$("#sDate").datepicker({
				language: 'ko',
			    timepicker: true,
			    timeFormat: "hh:ii AA"
		}); 
		//목표금액 설정
		$("#gMoney").focus(function(){
			$("#gMoney").val("");
		});
	
		$("#gMoney").keyup(function(e){
			var mCheck = /[^0-9]/g; //숫자외의것들 true
			var goalMoney = $(this).val();
			if(mCheck.test(goalMoney)){
				alert("숫자만 입력가능합니다.");
			}
		});

		
		function check(){
			//서포팅 날짜
			var scheduleCheck = /[^0-9]/g;
			var scheduleDateVal = $("#datepicker").val();
			var scheduleDate = scheduleDateVal.replace(scheduleCheck,""); //숫자
			console.log(scheduleDate);
			$("#scheduleDate").val(scheduleDate);
			
			//서포팅 기간 시작일, 마감일 나누기
			var during = $("#during").val();
			sDateVal = during.substring(0,10);
			eDateVal = during.substring(13);
			$("#supStartDate").val(sDateVal);
			$("#supEndDate").val(eDateVal);
		}
	}
</script>	
<jsp:include page="/header.jsp"></jsp:include>
<h1>서포팅 수정</h1>
<h1>${supporting.supNo }번</h1>
	<form action="supportingUpdate.pick" onsubmit="return check()" method="post" enctype="multipart/form-data">
	<input type="hidden" name ="supNo" value="${supporting.supNo }">
	<input type="hidden" name="imgName" value="${supporting.imgName }">
	<input type="hidden" name="imgReName" value="${supporting.imgReName }">
		<table align="center" border="1">
			<tr>
				<td>제목</td>
				<td><input type="text" size="50" name="supTitle" value="${supporting.supTitle}"></td>
			</tr>
			<tr>
				<td>스케줄 날짜</td>
				<td><input type="text" size="50" id="sDate" name="sDate"></td>
			</tr>
			<tr>
				<td>스케줄 장소</td>
				<td><input type="text" size="50" name="supPlace" value="${supporting.supPlace}"></td>
			</tr>
			<tr>
				<td>그룹이름</td>
				<td><input type="text" size="50" name="groupName"  value="${supporting.groupName}"></td>
			</tr>
			<tr>
				<td>목표금액</td>
				<td><input type="text" size="50" name="goalMoney" id="gMoney" value="${supporting.goalMoney}"></td>
			</tr>
			<tr>
				<td>기간</td>
				<td><input type="text" size="50" id="during" data-range="true" data-multiple-dates-separator=" ~ " data-language="ko" class="datepicker-here"/>
				</td>
			</tr>
			<tr>
			<td>
				<input type="hidden" id="supStartDate" name="startDate">
				<input type="hidden" id="supEndDate" name="endDate">
			</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="7" cols="50"  name="supContents">${supporting.supContents }</textarea></td>
			</tr>
			<tr>
				<td>대표이미지 파일</td>
				<td><input id="mainFile" type="file" name="reloadFile"></td>
			</tr>
			<tr>
				<td><span id="fileList">파일 추가 : 최대 5개까지 등록 가능합니다.</span></td>
				<td><input id="btn-multiUpload" type="file" name="subFile" multiple="multiple"></td>  
			</tr>
			<tr>
				<td>이미지 미리보기</td>
               <td class="img_wrap"></td>
            </tr>
			<tr>
				<td colspan="2">
					<input type="submit" id="submit" value="수정">
					<input type="reset" value="취소" onclick="location.href='presupportingList.pick'">
				</td>
			</tr>
		</table>
	</form>
<jsp:include page="/footer.jsp"></jsp:include>
	
</body>
</html>