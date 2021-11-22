<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
</head>
<body>
	<table align="center" width="450" border="1">
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
				<c:url var="community" value="mainView.pick">
					<c:param name="groupName" value="${idol.groupName }"></c:param>
				</c:url>
				<a href="${community }">커뮤니티</a>	
			</td>
		</tr>
	</table>
	
</body>
</html>