<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이돌 수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
.img_wrap{
	width: 300px;
    height: 300px; 
}

#img{
	position: relative;
	margin-left: 550px;
	width: 100%;
    height: 100%; 
    border-radius: 70%;
    background-color: gray;
}

.idolmember{
	position: relative;
	left: 1000px;
	bottom: 178px
	
}

table {
  border-spacing: 10px;
  border-collapse: separate;
}



</style>
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-klassy-cafe.css">
    <link rel="stylesheet" href="assets/css/owl-carousel.css">
    <link rel="stylesheet" href="assets/css/lightbox.css">
    <link rel="stylesheet" href="assets/css/header.css">
    <link rel="stylesheet" href="assets/css/login.css">
    <script src="assets/js/search.js"></script>
</head>
<body>
   <jsp:include page="/header.jsp"></jsp:include>
<div class="centerText">
        <div class="img_wrap">
            <img id="img" src="../../../resources/idolloadFiles/${idol.filePath }">
        </div>
        	<form action="idolUpdate.pick" method="post" enctype="multipart/form-data">
        	<input type="hidden" name="idolNo" value="${idol.idolNo }">
			<table class="idolmember">
				<tr>
					<td>아이돌이름</td>
					<td>
						<input type="text" id="idolName" name="idolName" value="${idol.idolName }">
					</td>
				</tr>
				<tr>
					<td>그룹이름</td>
					<td>
						<input type="text" name="groupName" name="groupName" value="${idol.groupName }">
					</td>
				</tr>
				<tr>
					<td>프로필등록</td>
					<td>
						<input id="input_img" type="file" size="50" name="reloadFile">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="수정">
						<input type="reset" value="취소">
					</td>
				</tr>						
			</table>
		</form>
	</div>
	
	

	
	<script>
     var sel_file;
     
     $(document).ready(function() {
         $("#input_img").on("change", handleImgFileSelect);
     }); 

     function handleImgFileSelect(e) {
         var files = e.target.files;
         var filesArr = Array.prototype.slice.call(files);

         filesArr.forEach(function(f) {
             if(!f.type.match("image.*")) {
                 alert("확장자는 이미지 확장자만 가능합니다.");
                 return;
             }
             sel_file = f;
             var reader = new FileReader();
             reader.onload = function(e) {
                 $("#img").attr("src", e.target.result);
             }
             reader.readAsDataURL(f);
         });
     }
	</script>
	
</body>
<jsp:include page="/footer.jsp"></jsp:include>
</html>