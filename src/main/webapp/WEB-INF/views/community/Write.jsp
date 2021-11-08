<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=UTF-8,width=device-width, initial-scale=1">

<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<link rel="stylesheet" href="assets/css/header.css">
<link rel="stylesheet" href="assets/css/lightbox.css">
<link rel="stylesheet" href="assets/css/login.css">
<link rel="stylesheet" href="assets/css/input.css">
<link rel="stylesheet" href="assets/css/templatemo-klassy-cafe.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
<jsp:include page="/header.jsp"></jsp:include>
<title>글쓰기</title>

<script>
	$(document).ready(function() {
		 $('#summernote').summernote({
		        placeholder: '여기에 내용 입력하세요~',
		        tabsize: 2,
		        height: 300, // 에디터 높이
		        width: 1200,
		        defaultFontName: '바탕체',
		        lang : 'ko-KR',
		        toolbar: [
		  ['style', ['style']],
		  ['fontname', ['fontname']],
		  ['fontsize', ['fontsize']],
		  ['font style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		  ['color', ['forecolor','color']],
		  ['para', ['ul', 'ol', 'paragraph']],
		  ['table', ['table']],
		  ['view', ['fullscreen', 'codeview', 'help']],
		],
		    defaultFontName:'바탕',
		    fontNames: ['Arial', 'Comic Sans MS','맑은 고딕','궁서','굴림','돋음체','바탕'],
		    fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
		    maximumImageFileSize:2097152,

		  popover: {
		                  image: [
		                    ['image', ['resizeFull', 'resizeHalf', 'resizeQuarter', 'resizeNone']],
		                    ['float', ['floatLeft', 'floatRight', 'floatNone']],
		                    ['remove', ['removeMedia']]
		                  ],
		                  link: [
		                    ['link', ['linkDialogShow', 'unlink']]
		                  ],
		                  table: [
		                    ['add', ['addRowDown', 'addRowUp', 'addColLeft', 'addColRight']],
		                    ['delete', ['deleteRow', 'deleteCol', 'deleteTable']],
		                  ],
		                  air: [
		                    ['color', ['color']],
		                    ['font', ['bold', 'underline', 'clear']],
		                    ['para', ['ul', 'paragraph']],
		                    ['table', ['table']],
		                    ['insert', ['link', 'picture']]
		                  ]
		                }
		      });
		$('.dropdown-toggle').dropdown()
let input_element = document.querySelector("input");

input_element.addEventListener("keyup", () => {
    input_element.setAttribute("value", input_element.value);
})
	});
</script>
</head>
<body>
	<form name="dataForm" id="dataForm" onsubmit="return registerAction()">
		<h2 style="text-align: center;">&nbsp;</h2>
		<br> <br> <br>

		<div style="width: 60%; margin: auto;">

			<br> <br>
			<button id="btn-upload" type="button"
				style="border: 1px solid #ddd; outline: none; float: left;">파일
				추가</button>
			<input id="input_file" multiple="multiple" type="file"
				style="display: none;"> <span
				style="font-size: 10px; color: gray;">※첨부파일은 최대 10개까지 등록이
				가능합니다.</span>
			<div class="data_file_txt" id="data_file_txt" style="margin: 40px;">

				<br />
				<div id="articlefileChange"></div>
			</div>
			<table>
				<tr>
					<td class="img_wrap">
					</td>

				</tr>
			</table>
			<br>
		</div>
		<div class="input-contain" style="left: 20%">
			<input type="text" id="postTitle" name="postTitle"placeholder="제목" value="">
			<label class="placeholder-text" for="fname" id="placeholder-fname">

			</label>
		</div>

		<br> <br>
		<div>
			<textarea id="summernote" name="content" id="content"></textarea>
			<input id="subBtn" type="button" value="글 작성"
				onclick="goWrite();" style="position: relative; left: 30%" />
		</div>
	</form>
	<!-- 파일 업로드 스크립트 -->
	<script>
	
$(document).ready(function()
		// input file 파일 첨부시 fileCheck 함수 실행
		{
			$("#input_file").on("change", fileCheck);
		});

/**
 * 첨부파일로직
 */
$(function () {
    $('#btn-upload').click(function (e) {
        e.preventDefault();
        $('#input_file').click();
    });
});

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
    $("#input_file").val("");
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
	function registerAction(){
		
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
   	      url: "upload.pick",
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
	}
	//이미지 미리보기
    var sel_file;
      
	
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
            	newImg.setAttribute("width", 50);
            	newImg.setAttribute("height", 50);
            	newImg.setAttribute("margin-left", 10);
            }
            reader.readAsDataURL(f);
        });
    }
    function goWrite() {
    	var title = $("#postTitle").val();
    	var contents = $("#summernote").val();
    	location.href='Register.pick?title='+title+'&contents='+contents;
    	registerAction()
    }
   
    
</script>
</body>
</html>