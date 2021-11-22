<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
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
           <link rel="stylesheet" href="assets/css/mypageSideMenu.css">
           <link rel="stylesheet" href="assets/css/mypageCart.css">
          
<style>
     @import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
</style>
</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>
    <!-- ---------------------------- -->

    <section id="main-section">
<jsp:include page="/mypageSideMenu.jsp"></jsp:include>
     <!-- 결제창------굿즈정보------------ -->
     <div class="col-lg-6 col-md-6 col-sm-6" style="max-width: 95%;">
         <div class="breadcrumb__links">
             <a href="/">Home</a>
             <a href="myPageMain.pick">My Page</a>
             <span>Cart</span>
         </div>
     </div>
     <div id="contents-div">
         <div id="goods-section">
            <div class="pay-label">
                <span>장바구니</span>
            </div>
            <div class="goods-info">
            <form name="frm">
                <table class="goods-table">
                    <tr>
                    	<th>
                    		<input type="checkbox" name="chkbox"id="choiceAll" data-price="0">
                    		선택
                    	</th>
                        <th>상품정보</th>
                        <th>수량</th>
                        <th>배송비</th>
                        <th>주문금액</th>
                    </tr>
                    <c:forEach items="${cList }" var="cart">
                    <c:url var="gDetail" value="goodsDetail.pick">
		            	<c:param name="goodsNo" value="${cart.goodsNo }"></c:param>
		            	<c:param name="groupName" value="${cart.groupName }"></c:param>
		            </c:url>
                    <tr  style="border-bottom: 1px solid rgba(128, 128, 128, 0.548);">
                        <td><input type="checkbox" name="chkbox" onClick="itemSum(this.form);" class="choiceOne" value="${cart.cartNo }" data-price="${cart.goodsPrice*cart.goodsAmount }"></td>
                        <td style="text-align: left;">
                            <img src="resources/goodsFiles/${cart.imgPath }" alt="" style="width: 200px; height: 200px;">
                            &nbsp;&nbsp;<a href="${gDetail }">${cart.goodsName }</a>
                        </td>
                        <td>${cart.goodsAmount }</td>
                        <td>3000</td>
                        <td>${cart.goodsPrice * cart.goodsAmount }</td>
                    </tr>
                   </c:forEach>
                    <tr>
                        <td colspan="3">
                            상품합계&nbsp; ₩<input type="text" id="total" name="total" class="total-input" readonly> &nbsp;&nbsp;➕&nbsp;&nbsp;배송비 ₩3000
                        </td>
                        <td></td>
                        <td>
                            |&nbsp;&nbsp;총 합계 <span>₩<input type="text" name="total2" id="total2" class="total-input" style="color: red;" readonly></span>
                        </td>
                    </tr>
                </table>
                </form>
            </div>
        </div>
        <div id="btn-div">
            <button type="button" id="delete-btn">삭제</button>
            <button type="button" id="pay-btn">결제하기</button>
        </div>
     </div>
    </section>
    <!-- ------------------------------------ -->
<jsp:include page="/footer.jsp"></jsp:include>
<script>
	$(function(){
		$("#choiceAll").click(function(){
			var chk = $(this).is(":checked");
			var count = $(".choiceOne").length;
			var sum = 0;
			console.log(count);
			if(chk){
				$(".choiceOne").prop('checked', true);
				for(var i = 0; i<count; i++){
					sum += parseInt($(".choiceOne")[i].dataset.price);
				}
				console.log(sum);
				$("#total").val(sum);
				$("#total2").val(sum+3000);
			}else{
				$(".choiceOne").prop('checked', false);
				$("#total").val("");
				$("#total2").val("");
			}
		})

	});
	
	function itemSum(frm){
		var sum=0;
		var count = frm.chkbox.length;
		for(var i = 0; i<count; i++){
			if(frm.chkbox[i].checked == true){
				sum += parseInt(frm.chkbox[i].dataset.price);
			}
		}
		if(!sum==0){
			console.log(sum);
			frm.total.value=sum;
			frm.total2.value=sum+3000;			
		}else{
			$("#total").val("");
			$("#total2").val("");	
		}
	};
	
	$(".choiceOne").click(function(){
		$("#choiceAll").prop("checked",false);
	});
	
	$("#pay-btn").click(function(){
		var confirm_val = confirm("결제하시겠습니까?");
		
		if(confirm_val){
			var checkArr = new Array();
			$("input[class='choiceOne']:checked").each(function(){
				checkArr.push(this.value);
			});
			console.log(checkArr.toString());
			$.ajax({
				url : "paymentCart.pick",
				type : "post",
				traditional : true,
				data : { choiceOne : checkArr },
				success : function(data){
					location.href = "CartPaymentView.pick";
				},
				error : function(){
					alert("실패");
				}
			});
		}
	});
	
	$("#delete-btn").click(function(){
		var confirm_val = confirm("삭제하시겠습니까?");
		
		if(confirm_val){
			var checkArr = new Array();
			$("input[class='choiceOne']:checked").each(function(){
				checkArr.push(this.value);
			});
			console.log(checkArr.toString());
			$.ajax({
				url : "deleteCart.pick",
				type : "post",
				traditional : true,
				data : { choiceOne : checkArr },
				success : function(data){

 					location.href = "mypageCart.pick";
				},
				error: function(){
					alert("실패");
				}
			});
		}
	});
	
	
	
	
</script>

</body>
</html>