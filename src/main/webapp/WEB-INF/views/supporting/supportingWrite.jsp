<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서포팅 작성</title>
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
	#btn-mutiupload{
		display:none;
	}
	#file-list{
	
	}
	
	body{
		text-align : center;
	}
	table{
		border : 1px solid #eee;
		width : 800px;
	}
	input{
		border : 1px solid #eee;
	}
	textarea{
		border : 1px solid #eee;
	}
	#mainFile{
		width : 400px;
	}
	#btn-multiUpload {
		width : 400px;
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
	td:first-child{
		width:30%;
	}
	.btn{
	 	width : 100px;
	 	height: 40px;
	 	border : 1px solid;
	 	border-radius: 5px;
	 	padding : 10px 5px;
	 	margin-top: 5px;
	 	margin-bottom: 10px;
	  	background-color : #483CFA;
	  	color: white;
	 }
	 .img_wrap{
	 	height: 300px;
	 }
</style>
</head>
<body>
<jsp:include page="/header.jsp"></jsp:include><br><br>
<h1>서포팅 등록</h1><br>
<div class="contaier">
	<form name="dataForm" id="dataForm" onsubmit="return registerAction()" action ="supportingRegister.pick" method="post" enctype="multipart/form-data">
		<table align="center" border="1">
			<tr>
				<td>제목</td>
				<td><input type="text" size="50" name="supTitle"></td>
			</tr>
			<tr>
				<td>스케줄 날짜</td>
				<td><input type="text"  size="50"  id="datepicker" name="sDate"></td>
			</tr>
			<tr>
				<td>스케줄 장소</td>
				<td><input type="text" size="50" name="supPlace"></td>
			</tr>
			<tr>
				<td>그룹이름</td>
				<td><input type="text" size="50" name="groupName"></td>
			</tr>
			<tr>
				<td>목표금액</td>
				<td><input type="text" size="50" name="goalMoney" id="gMoney" value="숫자만 입력하세요. ex)10000"></td>
			</tr>
			<tr>
				<td>기간</td>
				<td><input type="text" placeholder="스케줄 날짜 이전의 날짜를 선택하세요." size="50" id="during" data-range="true" data-multiple-dates-separator=" ~ " data-language="ko" class="datepicker-here"/>
				</td>
			</tr>
			<tr>
			<td>
				<input type="hidden" id="supStartDate" name="startDate">
				<input type="hidden" id="supEndDate" name="endDate">
			</td>
			</tr>
		<!-- 	<tr>
				<td>서포팅 기간</td>
				<td><input type="text"  size="20"   class="during" id="sDate"  name="supStartDate"> ~ <input type="text" class="during" size="20"  id="eDate"  name="supEndDate"></td>
			</tr> -->
			<tr>
				<td>내용</td>
				<td><textarea rows="7" cols="50"  name="supContents"></textarea></td>
			</tr>
			<tr>
				<td>대표이미지 파일</td>
				<td><input id="mainFile" type="file" name="uploadFile" accept="image/*" onchange="setPreview(event);">
				</td>
			</tr>
			<tr>
				<td>대표이미지 미리보기</td>
				<td><div id="preview"></div></td>
			</tr>
			<tr>
				<td><span id="fileList">파일 추가 </span></td>
				<td><input id="btn-multiUpload" accept="image/*" type="file" name="subFile" multiple="multiple" onchange="setImgBox(event);">  
			</tr>
			<!-- tr>
				<td>이미지 미리보기</td>
               <td><div id="images_container"></div></td>
            </tr>
            -->
			<tr>
				<td colspan="2">
					<input type="submit" id="submit" value="등록"  class="btn" onclick="check()">
					<input type="reset" value="목록"   class="btn" onclick="location.href='presupportingList.pick'">
				</td>
			</tr>
		</table>
	</form>
</div><br><br>
<jsp:include page="/footer.jsp"></jsp:include>
<script>
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
	
	function setPreview(event){
		var reader = new FileReader();
		reader.onload = function(event){
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			img.setAttribute("class", "col-lg-6");
			document.querySelector("div#preview").appendChild(img);
		};
		reader.readAsDataURL(event.target.files[0]);
	}
	
	
	// 서포팅 날짜 체크
	$("#datepicker").datepicker({
			language: 'ko',
		    timepicker: true,
		    timeFormat: "hh:ii AA"
	}); 
/* 	
	$("#during").on("click", function(){
		var alram = confirm("시작일은 오늘 이후에, 마감일은 스케쥴 날짜 이전을 등록하세요. 시작일까지 목표인원이 채워진다면 실제 서포팅을 진행할 수 있게 처리됩니다. 문의사항은 고객센터로 연락주세요.");		
	}); */
	
	//오늘 날짜 구하기 년도월일 이후 일이 안들어감
	var today = new Date();
	var year = today.getFullYear();
	var month = today.getMonth() +1;
	var date  = today.getDate();
	var nowday = (10000*year)+(100*month)+date;//string이니까
	console.log("오늘날짜 :" +nowday);
	//20211130
	function registerAction(){
		//서포팅 날짜
		var scheduleCheck = /[^0-9]/g;
		var scheduleDateVal = $("#datepicker").val();
		var scheduleDate = scheduleDateVal.replace(scheduleCheck,""); //숫자
		$("#scheduleDate").val(scheduleDate);
		var scheduleDateVs = scheduleDate.substring(0,8);//임의
		console.log(scheduleDateVs);
		//20211030
		//서포팅 기간 시작일, 마감일 나누기
//		var Check = /[^0-9]/g;
		var during = $("#during").val();
	//	var duringVal = during.replace(Check, "");
		var sDateVal = during.substring(0,10);
		var eDateVal = during.substring(13);
		$("#supStartDate").val(sDateVal);
		$("#supEndDate").val(eDateVal);	
			console.log("시작일 : "+sDateVal);
			console.log("마감일 : "+eDateVal);
		//if(scheduleDateVs > eDateVal && nowday < sDateVal) {
		//		document.dataForm.submit();
		//}else if(nowday > sDateVal){
	//		alert("시작일까지 목표인원이 채워져야 합니다. 오늘 이후의 날짜를 고르세요.")
	//	}else if(scheduleDateVs < eDateVal){
	//		alert("종료일은 스케쥴 날짜보다 앞서야 합니다. 기간을 준수하세요.");
	//	} 
	}
	//
		//20211010/20211020
//다중파일
	/*function setImgBox(event){
		var reader = new FileReader();
		for(var i = 0; i < 6; i++) {
			reader.onload = function(event){
				var img = document.createElement("img");
				img.setAttribute("src", event.target.result);
				img.setAttribute("class", "col-lg-6");
				document.querySelector("div#images_container").appendChild(img);
			};
			reader.readAsDataURL(event.target.files[i]);
		}
	}
*/
	
</script>
</body>
</html>