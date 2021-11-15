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
	#btn-mutiupload{
		display:none;
	}
	#file-list{
	
	}
</style>
</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>
<h1>서포팅 등록</h1>
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
				<td><input type="text" size="50" id="during" data-range="true" data-multiple-dates-separator=" ~ " data-language="ko" class="datepicker-here"/>
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
				<td><input id="mainFile" type="file" name="uploadFile"></td>
			</tr>
			<tr>
				<td><span id="fileList">파일 추가 : 최대 5개까지 등록 가능합니다.</span></td>
				<td><input id="btn-multiUpload" type="file" name="subFile" multiple="multiple">  
			</tr>
			<tr>
				<td>이미지 미리보기</td>
               <td class="img_wrap"></td>
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
	

	//파일 현재 필드 숫자 totalCount랑 비교값
//	var fileCount = 0;
	//해당 숫자를 수정하여 전체 업로드 갯수를 정한다.
//	var totalCount = 5;
	//파일 고유넘버/
//	var fileNum = 0;
//	//첨부파일 배열
//	var list = new Array();//

//	function fileCheck(e) {
//		var files = e.target.files;
//		
//		// 파일 배열 담기
//		var filesArr = Array.prototype.slice.call(files);
	///call()은 상위 context를 변경하는 메소드, arguments는 함수의 매개변수에 접근할 수 있는 속성
	
		// 파일 개수 확인 및 제한
//		if (fileCount + filesArr.length > totalCount) {
//			$.alert('파일은 최대 '+totalCount+'개까지 업로드 할 수 있습니다.');
//			return;
//		} else {
//		 fileCount = fileCount + filesArr.length;
//		}//

		// 각각의 파일 배열담기 및 기타
//		filesArr.forEach(function (f) {
//		var reader = new FileReader();
//		reader.onload = function (e) {
//		file-list.push(f);
//		$('#fileUpload').append(
//				'<div id="removeFile' + fileNum + '" onclick="fileDelete(\'file' + fileNum + '\')">'
//				+ '<font style="font-size:12px">' + f.name + '</font>'  
//				+ '<img src="/img/icon_minus.png" style="width:20px; height:auto; vertical-align: middle; cursor: pointer;"/>' 
//				+ '<div/>'
//		);
//		fileNum ++;
///		};
//		reader.readAsDataURL(f);
//		});
//		console.log(fileList);
//		//초기화 한다.
//		$("#fileUpload").val("");
//		}/

		//파일 부분 삭제 함수
//		function fileDelete(fileNum){
//	/		var no = fileNum.replace(/[^0-9]/g, "");
//			fileList[no].is_delete = true;
//			$('#' + fileNum).remove();
//			fileCount --;
//			console.log(fileList);
//		}
//	 
	function registerAction(){
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
		
		//다중파일부분
	//	var form = $("#dataForm")[0];        
	// 	var formData = new FormData(form);
	//		for (var i = 0; i < fileList.length; i++) {
	//			// 삭제 안한것만 담아 준다. 
	//			if(fileList[i].is_delete){
	//				 formData.append("fileList", fileList[i]);
//				}
	//		}
			
		}
		

//
//		//대표파일 첨부 제한/
//		function fileCheck(uploadFile){
//			 max : 1,
//			 maxfile : 1024,
//			 maxsize: 1024,//
//			 STRING : {
//				 selected : "$file을 선택했습니다.",
//				 description : "대표이미지 업로드 파일은 1개만 가능합니다.",
//				 toomuch : "업로드 할 수 있는 최대 크기를 초과하였습니다($size)",
//				 toobig: "$file은 크기가 커서 업로드 할 수 없습니다.(max $size)",
//			 },
//	 	});
	
	/* if(scheduleDateVal.indexOf("AM")){
	var scheduleDate = scheduleDateVal.replace(scheduleCheck,""); //숫자
	console.log(scheduleDate);
	$("#scheduleDate").val(scheduleDate);
	return false;
}else if(scheduleDate.indexOf("PM")){
	var scheduleDate = scheduleDateVal.replace(scheduleCheck, "");
	var transPM = scheduleDate+1200;
	console.log(transPM);
	$("#scheduleDate").val(transPM);
	return false;
}  */
//		var DateCheck = /[^0-9]/g;
//		var supStartDate = sDateVal.replace(DateCheck,"");
//		var supEndDate = eDateVal.replace(DateCheck,""); //2021/11/03
//		$("#supStartDate").val(supStartDate);
//		$("#supEndDate").val(supEndDate);
	//	return false;//if~else로 성공시 넘어가게하고 hidden으로 만들기

	
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
 	
 	
       /*  // 사이즈체크
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
	} */
	
  	
</script>
</body>
</html>