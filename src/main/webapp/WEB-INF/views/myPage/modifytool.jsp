<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<style type="text/css">
   #input_img {
	float: left;
	outline: none;
	cursor: pointer;
	padding: 14px 16px;
	font-size: 13px;
	background-color: #918c0038;
	font-family: 'Inter',sans-serif;
    letter-spacing: 0;
    font-weight: 500;
    line-height: 1.5;
    border-radius: 0.3rem;
    color: #fb5849dc;
    border-color: #fb5849dc;
    background-color: transparent;
    border: 1px solid transparent;
	}
	
	
   
   </style>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
           <!-- Google Font -->
           <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700;800;900&display=swap"
           rel="stylesheet">
           <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800;900&display=swap"
           rel="stylesheet">
       
           <!-- Css Styles -->
           <link rel="stylesheet" href="assets/css/bootstrap.min.css" type="text/css">
           <link rel="stylesheet" href="assets/css/font-awesome.min.css" type="text/css">
           <link rel="stylesheet" href="assets/css/goodsStyle.css" type="text/css">
           <link rel="stylesheet" href="assets/css/header.css">
           <link rel="stylesheet" href="assets/css/login.css">
           <link rel="stylesheet" href="assets/css/goods.css">
           <link rel="stylesheet" href="assets/css/goods_detail.css">
           <link rel="stylesheet" href="assets/css/templatemo-klassy-cafe.css">
           <link rel="stylesheet" href="assets/css/mypageModify.css">
           
           <!--------------------------------->
           <link rel="stylesheet" href="assets/css/elegant-icons.css" type="text/css">
           <link rel="stylesheet" href="assets/css/nice-select.css" type="text/css">
           <link rel="stylesheet" href="assets/css/owl.carousel.min.css" type="text/css">
           <link rel="stylesheet" href="assets/css/slicknav.min.css" type="text/css">
           <link rel="stylesheet" href="assets/css/flaticon.css" type="text/css">
           <link rel="stylesheet" href="assets/css/barfiller.css" type="text/css">
           <link rel="stylesheet" href="assets/css/magnific-popup.css" type="text/css">
<style>
     @import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
</style>
</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>
    <!-- ---------------------------- -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__text">
                        <h2>Profile</h2>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__links">
                        <a href="/">Home</a>
                        <a href="myPageMain.pick">My Page</a>
                        <span>modify</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <section id="first-section">
        <div id="intro">
            <div id="part-img">
                <div id="intro-id">
                    ${loginUser.userId}
                </div>
                <form action="myPageProfile.pick" method="POST" enctype="multipart/form-data">
                <div id="intro-img">
                     <img id="img" src="../../../resources/proFiles/${loginUser.filePath }">                
                </div>

                <div id="update-btn">
        	<input type="hidden" name="userNo" value="${loginUser.userNo }">
                <label>프로필등록</label>
                <input id="input_img" type="file" size="50" name="reloadFile"><br>
                  
                </div>
            </div>
            <div id="part-text">
                <div id="profile-div">
                    <label>닉네임</label><input type="text" id="userNickName" name="userNickName" value="${loginUser.userNickName }">
					<label>비밀번호</label><input type="text" name="userPwd" name="userPwd"value="${loginUser.userPwd }">
					<label>핸드폰번호</label><input type="text" name="userPhone" name="userPhone" value="${loginUser.userPhone }">
					<label>주소</label><input type="text" name="userAddr" name="userAddr" value="${loginUser.userAddr }">
					<label>이메일</label><input type="text" name="userEmail" name="userEmail" value="${loginUser.userEmail }">
                </div>
                <div id="part-btn">
                    <button type="submit">수정 완료</button>
                    <button><a href="memberDelete.pick?userId=${loginUser.userId}">회원 탈퇴</a></button>
                </div>
            </div>
                </form>
        </div>
    </section>
    
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
    <!-- -------------- -->
<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>