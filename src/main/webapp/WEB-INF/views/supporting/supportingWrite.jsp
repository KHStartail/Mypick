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
body{
	text-align : center;
}
	#f-btn{
		width: 100px;
		height: 50px;
	}
</style>
</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>
<h1>서포팅 등록</h1>
	<form onsubmit="return test1()"action ="supportingRegister.pick" method="get" enctype="multipart/form-data">
		<table align="center" border="1">
			<tr>
				<td>제목</td>
				<td><input type="text" size="50" name="supTitle"></td>
			</tr>
			<tr>
				<td>스케줄 날짜</td>
				<td><input type="text"  size="50"  id="datepicker" name="schedule"></td>
			</tr>
			<tr>
				<td>스케줄 날짜test</td>
				<td><input type="text" name="scheduleDate"></td>
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
				<td><input type="text" size="50" id="during" data-range="true" data-multiple-dates-separator=" ~ " data-language="ko" class="datepicker-here"/>
				</td>
			</tr>
			<tr>
			<td>
				<input type="hidden" id="supStartDate" name="supStartDate">
				<input type="hidden" id="supEndDate" name="supEndDate">
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
				<td>첨부파일</td>
				<td><input type="file" name="uploadFile" onclick="fileCheck(this.form.uploadFile)"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" id="submit" value="등록">
					<input type="reset" value="목록" onclick="location.href='presupportingList.pick'">
				</td>
			</tr>
		</table>
	</form>
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

	// 서포팅 날짜 체크
	$("#datepicker").datepicker({
			language: 'ko',
		    timepicker: true,
		    timeFormat: "hh:ii AA"
	}); 
	
	
	function test1(){
		//서포팅 날짜
		var scheduleDate = $("#schedule").val();
		console.log(scheduleDate);
		if(scheduleDate.indexOf("AM")){
			scheduleDate.replace("AM", "");
			$("#scheduleDate").val(scheduleDate);
		}else if(scheduleDate.indexOf("PM")){
			scheduleDate.replace("PM",12);
			$("#scheduleDate").val(scheduleDate);
		}
			
		//서포팅 기간 시작일, 마감일 나누기
		var during = $("#during").val();
		sDateVal = during.substring(0,10);
		eDateVal = during.substring(13);
		var DateCheck = /[^0-9]/g;
		var supStartDate = sDateVal.replace(DateCheck,"/");
		var supEndDate = eDateVal.replace(DateCheck,"/"); //2021/11/03
		$("#supStartDate").val(supStartDate);
		$("#supEndDate").val(supEndDate);
		return false;//if~else로 성공시 넘어가게하고 hidden으로 만들기
	}

	
	/* $("#during").on("blur", function(){
		var during = $("#during").val();
		supStartDate = during.substring(0,11);
		supEndDate = during.substring(13);
		console.log(supStartDate, supEndDate);
	}); */
	
	/* //이중달력 
	datePickerSet($("#sDate"), $("#eDate"), true); //다중은 시작하는 달력 먼저, 끝달력 2번째
	function datePickerSet(sDate, eDate, flag) {

	    //시작 ~ 종료 2개 짜리 달력 datepicker	
	    if (!isValidStr(sDate) && !isValidStr(eDate) && sDate.length > 0 && eDate.length > 0) {
	        var sDay = sDate.val();
	        var eDay = eDate.val();

	        if (flag && !isValidStr(sDay) && !isValidStr(eDay)) { //처음 입력 날짜 설정, update...			
	            var sdp = sDate.datepicker().data("datepicker");
	            sdp.selectDate(new Date(sDay.replace(/-/g, "/")));  //익스에서는 그냥 new Date하면 -을 인식못함 replace필요

	            var edp = eDate.datepicker().data("datepicker");
	            edp.selectDate(new Date(eDay.replace(/-/g, "/")));  //익스에서는 그냥 new Date하면 -을 인식못함 replace필요
	        }

	        //시작일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
	        if (!isValidStr(eDay)) {
	        	$("#sDate").datepicker({
	                maxDate: new Date(eDay.replace(/-/g, "/"))
	            });
	        }
	        $("#sDate").datepicker({
	            language: 'ko',
	            autoClose: true,
	            onSelect: function () {
	                datePickerSet(sDate, eDate);
	            }
	        });

	        //종료일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
	        if (!isValidStr(sDay)) {
	        	$("#eDate").datepicker({
	                minDate: new Date(sDay.replace(/-/g, "/"))
	            });
	        }
	        $("#eDate").datepicker({
	            language: 'ko',
	            autoClose: true,
	            onSelect: function () {
	                datePickerSet(sDate, eDate);
	            }
	        });
 */
	    
	        
	//파일 첨부 제한
	function fileCheck(uploadFile){
        // 사이즈체크
        var maxSize  = 5 * 1024 * 1024    //30MB
        var fileSize = 0;
	
		// 브라우저 확인
		var browser=navigator.appName;
		
		// 익스플로러일 경우
		if (browser=="Microsoft Internet Explorer"){
			var oas = new ActiveXObject("Scripting.FileSystemObject");
			fileSize = oas.getFile( file.value ).size;
		}
		// 익스플로러가 아닐경우
		else{
			fileSize = file.files[0].size;
		}
		alert("파일사이즈 : "+ fileSize +", 최대파일사이즈 : 5MB");
        if(fileSize > maxSize) {
            alert("첨부파일 사이즈는 5MB 이내로 등록 가능합니다.");
            return;
        }
        document.fileForm.submit();
	}
	
  	
</script>
</body>
</html>