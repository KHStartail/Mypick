<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;500;600;700&display=swap"
	rel="stylesheet">

<title>MyPick 메인</title>


<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/assets/js/summernote-ko-KR.js"></script>

<!-- Additional CSS Files -->

<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/css/font-awesome.css">
<link rel="stylesheet" href="assets/css/templatemo-klassy-cafe.css">
<link rel="stylesheet" href="assets/css/owl-carousel.css">
<link rel="stylesheet" href="assets/css/lightbox.css">
<link rel="stylesheet" href="assets/css/header.css">
<link rel="stylesheet" href="assets/css/login.css">
<link rel="stylesheet" href="assets/css/detail.css">
<script src="assets/js/search.js"></script>

<script>
	$(document).ready(function() {
		var oScript = document.createElement('script');

		oScript.type ='text/javascript';

		oScript.charset ='utf-8';		  

		oScript.src = 'assets/js/detail.js';

		document.getElementsByTagName('head')[0].appendChild(oScript);
		oScript.remove();
	}
		
</script>
<style>
.card {
	min-height: 100px;
}
.button{
 
}
</style>
</head>

<body>

	<!-- ***** Header Area Start ***** -->
	<jsp:include page="/header.jsp"></jsp:include>
	<!----------------------->
	<div class="All">
		<div class="poto">
			<c:if test="${empty file }">
				<ul class="slider" style="float: left;">
						<li><input type="radio" id="slide1"
							name="slide" checked> <label for="slide1"></label>
							<img src="/resources/idolImg/no_img.png"
							alt="Panel1" style="width: 200%; box-shadow: 4px 4px 3px #666;"></li>
				</ul>
			</c:if>
			<c:if test="${not empty file }">
				<ul class="slider" style="float: left;">
					<c:forEach items="${file }" var="file" varStatus="index">
						<li><input type="radio" id="slide${index.count }"
							name="slide" checked> <label for="slide${index.count }"></label>
							<img src="/resources/upload/${file.fileRename }"
							alt="Panel ${index.count }" style="width: 200%; box-shadow: 4px 4px 3px #666;"></li>
					</c:forEach>
				</ul>
			</c:if>
		</div>
		<div class="board">
		
			<div class="contents" style="overflow: auto">
				<h1>${post.postTitle }</h1>
				<div id="contents">${post.postContents }</div>
				   <div style="text-align: right; margin-top:35%">
       <a class="btn heart">
           <img id="heart" src="">
       </a>
   </div>
			</div>
		</div>
	</div>
		<form action="CommunityDelete.pick" onsubmit="return confirm('삭제하시겠습니까?')" method="get"style="margin-left: 84%;margin-top: 2%">
		<c:forEach items="${file }" var="file">
			<input type="hidden" value="${file.fileRename }" id="fileName"
				name="fileName">
		</c:forEach>
		<input type="hidden" value="${post.postNo }" id="postNo" name="postNo">
		<table id="table" style="margin-left: 5%;">
			<tr>
				<td>
				작성자 : ${post.userNickName } 작성일 : ${post.updateDate }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<c:if test ="${loginUser.userId eq post.userId}">
				<c:url var="cModify" value="modifyView.pick">
						<c:param name="postNo" value="${post.postNo }"></c:param>
					</c:url> <a class="btn btn-primary" href="${cModify }">수정하기</a> <input
					type="submit" class="btn btn-primary" value="삭제하기">
					</c:if>
						<c:if test ="${loginUser.userId ne post.userId}">
					<a class="btn btn-primary" onclick="report(${post.postNo });">신고하기</a> 
					</c:if>
					
				</td>
			</tr>
		</table>
	</form>
	<!-- 댓글 -->
	<table class="card mb-2" id="reply">
		<thead id="thead" display=''>
			<tr>
				<td>
					<div class="card-header bg-light">
						<i class="fa fa-comment fa"></i> REPLY
					</div>
				<td>
			<tr>
			<tr class="list-group list-group-flush">
				<td class="list-group-item" ><textarea id="summernote" 
						name="content" id="content" onclick="onScript();" rows="5" cols="140" ></textarea>
					<button type="button" id="rSubmit" class="btn btn-dark mt-3">댓글작성</button>
					<input type="hidden" value="${loginUser.userId }" id="loginUser">
				<hr>
				</td>
				</tr>
		</thead>
		<tbody class="reply-body" id="reply-body">
		<tr>
			<td>		
			
			</td>
		</tr>
		</tbody>
	</table>
	<!-- - -->


	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>





	<!-- ***** Footer Start ***** -->

	<!-- jQuery -->

	<!-- Bootstrap -->
	<script src="assets/js/popper.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>

	<!-- Plugins -->
	<script src="assets/js/owl-carousel.js"></script>
	<script src="assets/js/accordions.js"></script>
	<script src="assets/js/datepicker.js"></script>
	<script src="assets/js/scrollreveal.min.js"></script>
	<script src="assets/js/waypoints.min.js"></script>
	<script src="assets/js/jquery.counterup.min.js"></script>
	<script src="assets/js/imgfix.min.js"></script>
	<script src="assets/js/slick.js"></script>
	<script src="assets/js/lightbox.js"></script>
	<script src="assets/js/isotope.js"></script>
	<!-- Global Init -->

</body>
<footer>
	<jsp:include page="/footer.jsp"></jsp:include>
	
		<script>
	$(window).on('load',function(){
	console.log('안들어가짐?')
	getReplyList();		

	$("#rSubmit").on("click",function(){
		//var boardNo = $("#boardNo").val();
		var postNo = '${post.postNo }';
		var rContents = $("#summernote").val();
		$.ajax({
			url : "addReply.pick",
			type : "post",
			data : {"replyContents" : rContents,
					"postNo" : postNo	
			},  //rContents는 위에 var값
			success : function(data){
				if(data == "success"){
					location.reload();
					// 댓글 불러오기
						getReplyList();
					// 작성 후 내용 초기화
					rContents.val("");
					alert("댓글 등록 성공");
				}else{
					alert("댓글 등록 실패");
				}
			},
			 error: function (request,xhr, status, error) {
		   	     alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			},
			complete : function() {
				location.reload();
			}
		});
})

		function getReplyList(){
			var postNo = '${post.postNo}';
			$.ajax({
				url : "replyList.pick",
				type: "get",
				data : {"postNo" : postNo},
				dataType : "json",									//json방식으로 보내면 data형식처럼 배열로 넘어온다 
																	// [{},{},{}] 이런 형식으로 들어온다.
				success : function(data){
					var $tableBody = $("#reply tbody");
					$tableBody.html("");
					var $tr;
					var $rWriter;
					var $rContent;
					var $rCreateDate;
					var $btnArea;	
					var $loginUser = $("#loginUser").val();
					$("#rCount").text("댓글("+data.length+")"); // 댓글 갯수
					if(data.length > 0){
						for(var i in data){
							$tr = $("<tr id='modifyTr' class='list-group list-group-flush'>");
							$rWriter = $("<td style='font-weight : bold' colspan='4'>").text('작성자 : '+data[i].userNickName);
							<c:if test ="${loginUser.userId ne data[i].userId}"> 
							$btnArea = $("<td colspan='4' align='right'>").append("<a href='#' onclick='modifyReply(this,"+postNo+","+data[i].replyAllNo+",\""+data[i].replyContents+"\");'>수정</a>").append("<a href='#' onclick='removeReply("+postNo+","+data[i].replyAllNo+")'>삭제</a>");
							</c:if>
							if($loginUser != data[i].userId){
							$btnArea = $("<td colspan='4' align='right'>").append("<a href='#' onclick='reportReply(this,"+postNo+","+data[i].replyAllNo+",\""+data[i].replyContents+"\");'>신고</a>");
							}
							$rCreateDate = $("<td style='font-size : 20px' align='right'>").text(data[i].replyDate);												
							$rContent = $("<td class='list-group-item'>").html(data[i].replyContents+'<hr>');
							
							$tr.append($rWriter);
							$tr.append($rCreateDate);
							$tr.append($btnArea);
							$tr.append($rContent);
							$tableBody.append($tr);
							
						}
						
					}
				},
				error : function(){
				}
			})
		}
	});
	function reportReply(obj,postNo,replyAllNo,replyContents){
		$.ajax({
			url : "reportReply.pick",
			type : "get",
			data : {
				"postNo" : postNo,
				"replyAllNo" : replyAllNo,
				"replyContents" : replyContents
			},
			success : function(data){
				if(data == "success"){
					alert("신고되었습니다.")
				}else{
					
					alert("이미 신고하셨습니다.")
					location.reload();
				}
			},error : function(request, status, error){
				alert("로그인이후 이용해주세요.")
				location.reload();
			}
		})
	}
	function modifyReply(obj,postNo,replyAllNo,replyContents){
			  if($('#thead').css('display') == 'none'){
		            $('#thead').show();
		        }else{
		            $('#thead').hide();
		        }
		$trModify = $("<tr>");
		$trModify
		.append("<td><textarea rows='5' cols='140' name='content' id='content' class='content' onclick='onScript();'>"+replyContents+"</textarea>></td>");
		$trModify
		.append("<td><button class='btn btn-dark mt-3' onclick='modifyReplyCommit("+postNo+","+replyAllNo+")'>수정</button></td>");
		$(obj).parent().parent().after($trModify);
	}

	
	function modifyReplyCommit(postNo,replyAllNo){
		var content = $("#content").val();
		$.ajax({
			url : "modifyReply.pick",
			type : "post",
			data : {
				"postNo" : postNo,
				"replyAllNo" : replyAllNo,
				"replyContents" : content
			},
		success : function(data){
			if(data == "success"){
				location.reload();
				getReplyList();
			}else{
				alert("댓글 수정 실패");
				location.reload();
			}
		},
		error : function(){
			location.reload();
		}
		});
	}
	
	function onScript(){
		
		var oScript = document.createElement('script');

		oScript.type ='text/javascript';

		oScript.charset ='utf-8';		  

		oScript.src = 'assets/js/detail.js';

		document.getElementsByTagName('head')[0].appendChild(oScript);
	}
	function removeReply(postNo,replyAllNo){
		$.ajax({
			url : "deleteReply.pick",
			type : "get",
			data : {"postNo" : postNo,"ReplyAllNo" : replyAllNo},
			success : function(data){
				if(data =="success"){
					getReplyList();
					location.reload();
				}else{
					alert("댓글 삭제 실패!");
					location.reload();
				}
			}
		});
	} 
	// 하트
	
	var heartval = ${heart};

        if(heartval>0) {
            console.log(heartval);
            $("#heart").prop("src", "/resources/img/Red.png");
            $(".heart").prop('name',heartval)
        }
        else {
            console.log(heartval);
            $("#heart").prop("src", "/resources/img/Black.png");
            $(".heart").prop('name',heartval)
        }

        $(".heart").on("click", function () {

            var that = $(".heart");

            var sendData = {'postNo' : '${post.postNo }','heart' : that.prop('name')};
            $.ajax({
                url :'heart.pick',
                type :'POST',
                data : sendData,
                success : function(data){
                    that.prop('name',data);
                    if(data==1) {
                        $('#heart').prop("src","/resources/img/Red.png");
                    }
                    else{
                        $('#heart').prop("src","/resources/img/Black.png");
                    }
                }
            });
        });
 
        
        
	</script>
</footer>
</html>