<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>


<link rel=" stylesheet" href="assets/css/fullcalendar.min.css">
<link rel=" stylesheet" href="assets/css/calbootstrap.min.css">
<link rel=" stylesheet" href="assets/css/select2.min.css">
<link rel=" stylesheet" href="assets/css/bootstrap-datetimepicker.min.css">

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<link rel=" stylesheet" href="assets/css/calmain.css">

</head>
<body>
	<input type="hidden" value="${idol.groupName } " id="groupName">
	<table align="center" width="450" border="1" style="float: left; margin-left: 250px">
		<tr>
			<td>사진</td>
			<td>
			<img src = "../../../resources/idolloadFiles/${idol.filePath }">
			</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${idol.idolName }</td>
		</tr>
		<tr>
			<td>그룹이름</td>
			<td>${idol.groupName }</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<c:url var="iModify" value="idolModify.pick">
					<c:param name="idolNo" value="${idol.idolNo }"></c:param>
				</c:url>
				<c:url var="iDelete" value="idolDelete.pick">
					<c:param name="idolNo" value="${idol.idolNo }"></c:param>
				</c:url>
				<a href="${iModify }">수정페이지로 이동</a>
				<a href="${iDelete }">삭제하기</a>
			</td>
		</tr>
	</table>
	
   
	 <div class="container" style="width: 600px; height: 800px; float: left;">
	 
        <!-- 일자 클릭시 메뉴오픈 -->
        <div id="contextMenu" class="dropdown clearfix">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                <li><a tabindex="-1" href="#">작성</a></li>
                <li class="divider"></li>
                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
            </ul>
        </div>

        <div id="wrapper">
            <div id="loading"></div>
            <div id="calendar"></div>
        </div>


        <!-- 일정 추가 MODAL -->
        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">
                    
                    <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-allDay">하루종일</label>
                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox"/>
                            </div>
                        </div>
                    
                      <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-idol">아이돌넘버</label>
                                <input class="inputModal" type="text" name="edit-idol" id="edit-idol"
                                    required="required" value="${idol.idolNo }"/>
                            </div>
                        </div>
                    
                      <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-group">그룹명</label>
                                <input class="inputModal" type="text" name="edit-group" id="edit-group"
                                    required="required" value="${idol.groupName }" />
                            </div>
                        </div>
                    

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">일정명</label>
                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
                                required="required" />
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-start">시작일</label>
                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end">종료일</label>
                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
                            </div>
                        </div>
 					
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-color">색상</label>
                                <select class="inputModal" name="edit-color" id="edit-color">
                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
                                    <option value="#495057" style="color:#495057;">검정색</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-desc">상세내용</label>
                                <textarea rows="4" cols="50" class="inputModal" name="edit-desc"
                                    id="edit-desc"></textarea>
                            </div>
                        </div>
                    </div>
                    
                    
                    
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
                    </div>
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
        
        <br> <br> <br> <br> <br> <br>
      

		<br> <br> <br> <br> <br> <br>
		
		<c:forEach items="${gList }" var="group">	
		<c:if test="${group.idolName ne idol.idolName}">
		<img src="../../../resources/idolloadFiles/${group.filePath }" width="300px" height="300px">
		<p>${group.idolName } </p>
		</c:if>	
		</c:forEach>
					
					
	
	
	<script src="assets/js/caljquery.min.js"></script>
    <script src="assets/js/calbootstrap.min.js"></script>
    <script src="assets/js/moment.min.js"></script>
    <script src="assets/js/fullcalendar.min.js"></script>
    <script src="assets/js/ko.js"></script>
    <script src="assets/js/select2.min.js"></script>
    <script src="assets/js/bootstrap-datetimepicker.min.js"></script>
    <script src="assets/js/calmain.js"></script>
    <script src="assets/js/addEvent.js"></script>
    <script src="assets/js/etcSetting.js"></script>
    <script src="assets/js/editEvent.js"></script>
	
	
	
	
	
	
	
</body>
</html>