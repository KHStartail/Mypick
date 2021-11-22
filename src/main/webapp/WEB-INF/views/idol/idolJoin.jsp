<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이돌 추가</title>
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

.inbut{
	margin-left: 20px;
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
            <img id="img" />
        </div>
        	<form action="idolRegister.pick" method="post" enctype="multipart/form-data">
			<table class="idolmember" cellspacing="5">
				<tr>
					<td>아이돌이름 </td>
					<td class="inbut">
						<input type="text" id="idolName" name="idolName">
					</td>
				</tr>
				<tr>
					<td>그룹이름 </td>
					<td class="inbut">
						<input type="text" id="groupName" name="groupName">
					</td>
				</tr>
				<tr>
					<td>프로필등록 </td>
					<td class="inbut">
						<input id="input_img" type="file" size="50" name="uploadFile">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="프로필생성">
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