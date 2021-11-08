<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Goods | insert</title>
                <!-- Google Font -->
                <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700;800;900&display=swap"
                rel="stylesheet">
                <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800;900&display=swap"
                rel="stylesheet">
            
                <!-- Css Styles -->
                <link rel="stylesheet" href="assets/css/bootstrap.min.css" type="text/css">
                <link rel="stylesheet" href="assets/css/font-awesome.min.css" type="text/css">
                <link rel="stylesheet" href="assets/css/style.css" type="text/css">
                <link rel="stylesheet" href="assets/css/header.css">
                <link rel="stylesheet" href="assets/css/login.css">
                <link rel="stylesheet" href="assets/css/goods.css">
                <link rel="stylesheet" href="assets/css/goods_insert.css">
                <link rel="stylesheet" href="assets/css/templatemo-klassy-cafe.css">
</head>
<body>
               <!-- ***** Header Area Start ***** -->
 <jsp:include page="/header.jsp"></jsp:include>
            <!----------------------->
            <div class="breadcrumb-option">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="breadcrumb__text">
                                <h2>Goods insert</h2>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="breadcrumb__links">
                                <a href="./index.html">Home</a>
                                <a href="./shop.html">Goods</a>
                                <span>insert</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
<!-- ------------- -->
            <section class="product-details spad">
                <div class="inner-container">
                    <div class="insert-label">
                            <label>상품명 :</label><input type="text" name="" id="" placeholder="상품명을 입력하세요"><br>
                            <label>그룹 이름 :</label><input type="text" name="" id="" placeholder="그룹 이름을 입력하세요"><br>
                            <label>가격 :</label><input type="text" name="" id="" placeholder="가격을 입력하세요"><br>
                    </div>
                    <div class="insert-file">
                        <div class="file-camera" style="background-image: url(assets/images/camera.png);"></div>
                        <div class="input-file">
                            <div>
                                대표 이미지 파일을 첨부해주세요
                                <input type="file" name="" id="">
                            </div>
                        </div>
                        <div class="input-file">
                            <div>
                                상세 이미지 파일을 첨부해주세요
                                <input type="file" name="" id="">
                            </div>
                        </div>
                    </div>
                    <div class="insert-detail">
                        <label>내용 :</label><br>
                        <textarea name="" id="" cols="90" rows="15" placeholder="상세 정보를 입력하세요"></textarea>
                    </div>
                    <div class="insert-btn">
                        <button type="submit">등록</button>
                        <button type="reset">취소</button>
                    </div>
                </div>
            </section>
                    <!-- ***** Footer Start ***** -->
	<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>