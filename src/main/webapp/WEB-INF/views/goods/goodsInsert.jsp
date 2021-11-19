<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Goods | insert</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
	<form action="goodsRegister.pick" method="post" enctype="multipart/form-data">
                <div class="inner-container">
                    <div class="insert-label">
                            <label>상품명 :</label><input type="text" name="goodsName" id="goodsName" placeholder="상품명을 입력하세요"><br>
                            <label>상품소개 :</label><input type="text" name="goodsIntro" id="goodsIntro" placeholder="상품소개를 입력하세요"><br>
                            <label>그룹 이름 :</label><input type="text" name="groupName" id="groupName" placeholder="그룹 이름을 입력하세요"><br>
                            <label>멤버 이름 :</label><input type="text" name="idolName" id="idolName" placeholder="멤버 이름을 입력하세요"><br>
                            <label>가격 :</label><input type="text" name="goodsPrice" id="goodsPrice" placeholder="가격을 입력하세요"><br>
                    </div>
                    <div class="insert-file">
                        <div class="file-camera" style="background-image: url(assets/images/camera.png);"></div>
                        <div class="input-file">
                            <div>
                                대표 이미지 파일을 첨부해주세요
                                 <input type="file" name="mainFile"> 
                            </div>
                        </div>
                          <div class="input-file">
                            <div>
                                상세 이미지 파일을 첨부해주세요
                                <input name="sec-File" type="file" multiple="multiple"> 
		                       <!-- <div id="articlefileChange"></div> -->
		                        <!--<table>
									<tr>
										<td class="img_wrap"></td>
									</tr>
								</table> -->
                            </div>
                        </div>
                        <div class="file-btn">
                ※첨부파일은 최대 10개까지 등록이 가능합니다.&nbsp;
                        </div>
                    </div>
                    
                    <div class="insert-detail">
                        <label>내용 :</label><br>
                        <textarea id="" cols="90" rows="15" name="goodsContents" placeholder="상세 정보를 입력하세요"></textarea>
                    </div>
                    <div class="insert-btn">
                        <button type="submit">등록</button>
                        <button type="reset"><a href="goodsList.pick">취소</a></button>
                    </div>
                </div>
                </form>
            </section>
                    <!-- ***** Footer Start ***** -->
	<jsp:include page="/footer.jsp"></jsp:include>
	
	
	<script>
	
$(document).ready(function()
		// input file 파일 첨부시 fileCheck 함수 실행
		{
			$("#subfile").on("change", fileCheck);
		});

/**
 * 첨부파일로직
 */
/* $(function () {
    $('#btn-upload').click(function (e) {
        e.preventDefault();
        $('#input_file').click();
    });
});
 */
// 파일 현재 필드 숫자 totalCount랑 비교값
var fileCount = 0;
// 해당 숫자를 수정하여 전체 업로드 갯수를 정한다.
var totalCount = 10;
// 파일 고유넘버
var fileNum = 0;
// 첨부파일 배열
var content_files = new Array();

var imgTag;
function fileCheck(e) {
    var files = e.target.files;
    
    // 파일 배열 담기
    var filesArr = Array.prototype.slice.call(files);
    
    // 파일 개수 확인 및 제한
    if (fileCount + filesArr.length > totalCount) {
      $.alert('파일은 최대 '+totalCount+'개까지 업로드 할 수 있습니다.');
      return;
    } else {
    	 fileCount = fileCount + filesArr.length;
    }
    
    // 각각의 파일 배열담기 및 기타
    filesArr.forEach(function (f) {
      var reader = new FileReader();
      reader.onload = function (e) {
        content_files.push(f);
        $('#articlefileChange').append(
       		'<div id="file' + fileNum + '" onclick="fileDelete(\'file' + fileNum + '\')">'
       		+ '<font style="font-size:12px">' + f.name + '</font>'  
       		+ '<img src="/img/icon_minus.png" style="width:20px; height:auto; vertical-align: middle; cursor: pointer;"/>' 
       		+ '<div/>'
		);
        fileNum ++;
      };
      reader.readAsDataURL(f);
    });
    console.log(content_files);
    $("#subfile").val("");
  }

// 파일 삭제 함수
function fileDelete(fileNum){
    var no = fileNum.replace(/[^0-9]/g, "");
    content_files[no].is_delete = true;
	$('#' + fileNum).remove();
	fileCount --;
    console.log(content_files);
}

/*
 * 폼 submit 로직
 */
/* 	function registerAction(){
		
	var form = $("form")[0];        
 	var formData = new FormData(form);
		for (var x = 0; x < content_files.length; x++) {
			// 삭제 안된것만 업로드 해준다. 
			if(!content_files[x].is_delete){
				 formData.append("article_file", content_files[x]);
			}
		}
	$.ajax({
   	      type: "POST",
   	   	  enctype: "multipart/form-data",
   	      url: "goodsInsertView.pick",
       	  data : formData,
       	  processData: false,
   	      contentType: false,
   	      success: function (data) {
   	    	if(JSON.parse(data)['result'] == "OK"){
   	    		alert("파일업로드 성공");
   	    		handleImgFileSelect(e);
			} else
				alert("파일업로드실패. 잠시 후 다시 시도해주세요");
   	      },
   	      error: function (request,xhr, status, error) {
   	    	alert("서버오류로 지연되고있습니다. 잠시 후 다시 시도해주시기 바랍니다.");
   	     alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
   	     return false;
   	      }
   	    });
   	    return false;
	} */
	//이미지 미리보기
/*     var sel_file;
      
	
 	$("#input_file").on("change", handleImgFileSelect);
    function handleImgFileSelect(e) {
    	 var img_wrap = event.target.parentNode;
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);
 
         var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
 
        filesArr.forEach(function(f) {
            if (!f.type.match(reg)) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }
            sel_file = f;
            var reader = new FileReader();
                $("td img").attr("src", e.target.result);
            reader.onload = function(e) {
            	var newImg = document.createElement("img");
            	img_wrap.appendChild(newImg);
            	newImg.setAttribute("src", event.target.result);
            	newImg.setAttribute("width", 100);
            	newImg.setAttribute("height", 100);
            	newImg.setAttribute("margin-left", 10);
            	newImg.setAttribute("onclick",'doDel(this)');
            	
            }
            reader.readAsDataURL(f);
            
        });
    }
   function doDel(obj){
	   
	   $(obj).remove();
   }*/
   
	</script>
</body>
</html>