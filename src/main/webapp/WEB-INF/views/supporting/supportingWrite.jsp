<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서포팅 작성</title>
</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>
<h1>서포팅 등록</h1>
	<form action ="supportingRegister.pick" method="post" enctype="multipart/form-data">
		<table align="center" border="1">
			<tr>
				<td>제목</td>
				<td><input type="text" size="50" name="supTitle"></td>
			</tr>
			<tr>
				<td>날짜</td>
				<td><input type="text" size="50" name="scheduleDate"></td>
			</tr>
			<tr>
				<td>스케쥴장소</td>
				<td><input type="text" size="50" name="supPlace"></td>
			</tr>
			<tr>
				<td>그룹이름</td>
				<td><input type="text" size="50" name="groupName"></td>
			</tr>
			<tr>
				<td>목표금액</td>
				<td><input type="text" size="50" name="goalMoney"></td>
			</tr>
			<tr>
				<td>서포팅 시작일</td>
				<td><input type="text" size="50" name="supStartDate"></td>
			</tr>
			<tr>
				<td>서포팅 마감일</td>
				<td><input type="text" size="50" name="supEndDate"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="7" cols="50"  name="supContents"></textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name="uploadFile"><button value="파일첨부" onclick="fileCheck(this.form.uploadFile)"></button></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="등록">
					<input type="reset" value="목록" onclick="location.href='presupportingList.pick'">
				</td>
			</tr>
		</table>
	</form>
<jsp:include page="/footer.jsp"></jsp:include>
<script>
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