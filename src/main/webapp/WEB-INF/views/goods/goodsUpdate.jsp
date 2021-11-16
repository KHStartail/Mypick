<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                <link rel="stylesheet" href="assets/css/goodsStyle.css" type="text/css">
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
                <form action="goodsModify.pick" method="post" enctype="multipart/form-data">
                	<input type="hidden" name="goodsNo" value="${goods.goodsNo }">
                	<input type="hidden" name="imgPath" value="${goods.imgPath }">
                	 <c:forEach items="${fList }" var="file">
	                	<input type="hidden" name="imgNo" vlaue="${file.imgNo }">
                     </c:forEach>
                <div class="inner-container">
                    <div class="insert-label">
                            <label>상품명 :</label><input type="text" name="goodsName" value="${goods.goodsName }" placeholder="상품명을 입력하세요"><br>
                            <label>상품소개 :</label><input type="text" name="goodsIntro" value="${goods.goodsIntro }" placeholder="상품소개를 입력하세요"><br>
                            <label>그룹 이름 :</label><input type="text" name="groupName" value="${goods.groupName }" placeholder="그룹 이름을 입력하세요"><br>
                            <label>가격 :</label><input type="text" name="goodsPrice" value="${goods.goodsPrice }" placeholder="가격을 입력하세요"><br>
                    </div>
                    <div class="insert-file">
                        <div class="file-camera" style="background-image: url(assets/images/camera.png);"></div>
                        <div class="input-file">
                            <div>
                                 ${goods.imgPath}
                                <input type="file" name="reloadMainFile">
                            </div>
                        </div>
                        <div class="input-file">
                            <div>
                        <c:forEach items="${fList }" var="file">
                                ${file.imgName }&nbsp;
                        </c:forEach>
                                <input name="reloadSubFile" type="file" multiple="multiple">
                            </div>
                        </div> 
                    </div>
                    <div class="insert-detail">
                        <label>내용 :</label><br>
                        <textarea cols="90" rows="15" name="goodsContents" placeholder="상세 정보를 입력하세요">${goods.goodsContents }</textarea>
                    </div>
                    <div class="insert-btn">
                        <button type="submit">수정</button>
                        <button type="reset">취소</button>
                    </div>
                </div>
                </form>
            </section>
                    <!-- ***** Footer Start ***** -->
	<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>