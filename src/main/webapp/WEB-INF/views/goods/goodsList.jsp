<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
       <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700;800;900&display=swap"
        rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800;900&display=swap"
        rel="stylesheet">
    
        <!-- Css Styles -->
        
        <link rel="stylesheet" href="assets/css/goodsPage.css" type="text/css">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="assets/css/goodsStyle.css" type="text/css">
        <link rel="stylesheet" href="assets/css/header.css"type="text/css">
        <link rel="stylesheet" href="assets/css/login.css"type="text/css">
        <link rel="stylesheet" href="assets/css/goods.css"type="text/css">
        <link rel="stylesheet" href="assets/css/templatemo-klassy-cafe.css"type="text/css">

 
<style>
.zoom {
            display:inline-block;
            position: relative;
        }
 
        /* magnifying glass icon */
        .zoom:after {
            content:'';
            display:block;
            width:33px;
            height:33px;
            position:absolute;
            top:0;
            right:0;
            background:url(icon.png);
        }
 
        .zoom img {
            display: block;
        }
        .zoom img::selection { background-color: transparent; }

</style>
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
                        <h2>Goods</h2>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="breadcrumb__links">
                        <a href="/">Home</a>
                        <span>Goods</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Shop Section Begin -->
    <section class="shop spad">
        <div class="container">
            <div class="shop__option">
                <div class="row">
                    <div class="col-lg-7 col-md-7">
                        <div class="shop__option__search">
                            <form action="goodsSearch.pick" method="get">
                                <select name="searchCondition">
                                    <option value="all" <c:if test="${search.searchCondition == 'all' }">selected</c:if>> Categories</option>
                                    <option value="goods" <c:if test="${search.searchCondition == 'goods' }">selected</c:if>>?????? ??????</option>
                                    <option value="member" <c:if test="${search.searchCondition == 'member' }">selected</c:if>>?????? ??????</option>
                                    <option value="group" <c:if test="${search.searchCondition == 'group' }">selected</c:if>>?????? ??????</option>
                                </select>
                                <input type="text" name="searchValue" placeholder="Search" value="${search.searchValue }">
                                <button type="submit"><img src="assets/images/search.png" style="width: 30px;"></button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
            <c:forEach items="${gList }" var="goods">
            <c:url var="gDetail" value="goodsDetail.pick">
            	<c:param name="goodsNo" value="${goods.goodsNo }"></c:param>
            	<c:param name="groupName" value="${goods.groupName }"></c:param>
            </c:url>
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg">
                            <img  class="ex5"src="resources/goodsFiles/${goods.imgPath }" alt="" style="height: 300px; width: 250px">
                        <c:if test="${goods.idolName == null }">
                            <div class="product__label">
                                <span>${goods.groupName }</span>
                            </div>
                        </c:if>
                        <c:if test="${goods.idolName != null }">
                            <div class="product__label">
                                <span>${goods.groupName }???${goods.idolName }</span>
                            </div>
                        </c:if>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">${goods.goodsName }</a></h6>
                            <div class="product__item__price">${goods.goodsPrice }???</div>
                            <div class="cart_add">
                                <a href="${gDetail }">Detail View</a>
                            </div>
                        </div>
                    </div>
                </div>
             </c:forEach>
            </div>
        </div>
        <br><br><br>
       <div align="center" class="shop__last__option">         
         <div>
            <c:url var="before" value="goodsList.pick">
               <c:param name="page" value="${pi.currentPage -1 }"></c:param>
            </c:url>
            <!-- ???????????? -->
            <c:if test="${pi.currentPage <= 1 }">
               <
            </c:if>
            <!-- ??????????????? -->
            <c:if test="${pi.currentPage > 1 }">
               <a href="${before }">&nbsp;<</a>
            </c:if>

            <c:forEach var="p" begin="${pi.startNavi }" end="${pi.endNavi }">
                <c:url var="pagination" value="goodsList.pick">
                  <c:param name="page" value="${p }"></c:param>
               </c:url>
               <c:if test="${p eq pi.currentPage }">
                  <font color="red" size="4">&nbsp;${p }</font>
               </c:if>
               <c:if test="${p ne pi.currentPage }">
                  <a href="${pagination }">&nbsp;${p }</a>               
               </c:if>
            </c:forEach>
            <c:url var="after" value="goodsList.pick">
               <c:param name="page" value="${pi.currentPage +1 }"></c:param>
            </c:url>
            <c:if test="${pi.currentPage >= pi.maxPage }">
              >
            </c:if>
            <c:if test="${pi.currentPage < pi.maxPage }">
               <a href="${after }"> &nbsp;> </a>
            </c:if>
			</div>
		</div>
		<c:if test="${loginUser.userGrade == 'manager' }">
		<div class="manager-btn">
        	<button><a href="goodsInsertView.pick">?????? ??????</a></button>
        </div>
        </c:if>
    </section>
        <!-- ***** Footer Start ***** -->
	<jsp:include page="/footer.jsp"></jsp:include>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src='assets/js/jquery.zoom.js'></script>
	<script src='assets/js/jquery.Wheelzoom.js'></script>
		<script>
		$(document).ready(function(){
			$('#ex1').zoom();
			$('#ex2').zoom({ on:'grab' });
			$('#ex3').zoom({ on:'click' });
			$('#ex4').zoom({ on:'toggle' });
			$('.ex5').wheelzoom();
//			$('#ex5').wheelzoom({zoom:0.05});
//			$('#ex5').trigger('wheelzoom.reset')
		});
	</script>
</body>
</html>