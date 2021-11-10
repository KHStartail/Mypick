<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이돌 리스트</title>
</head>
<body>

<div><button onclick="location.href='idolJoinView.pick'">아이돌  등록</button></div>
<table align="center" width="600" border="1" cellspacing="0" style="clear:right;">
		<tr>
			<th>아이돌이름</th>
			<th>그룹명</th>
			<th>사진유무</th>
		</tr>
		<c:if test="${ empty iList }">
			<tr>
				<td colspan="5" align="center">조회된 정보가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty iList }">
		<c:forEach items="${iList }" var="idol">
			<tr>
				<td align="center">${idol.idolName }</td>
				<td align="center">${idol.groupName }</td>
				<td align="center">
					<c:if test="${not empty idol.filePath }">O</c:if>
					<c:if test="${ empty idol.filePath }">X</c:if>
				</td>
			</tr>
		</c:forEach>
		</c:if>
	</table>
</body>
</html>