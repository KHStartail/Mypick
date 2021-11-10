<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진행중 서포팅 상세</title>
 <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-klassy-cafe.css">
    <link rel="stylesheet" href="assets/css/owl-carousel.css">
    <link rel="stylesheet" href="assets/css/lightbox.css">
    <link rel="stylesheet" href="assets/css/header.css">
    <link rel="stylesheet" href="assets/css/login.css">
</head>
<body>
		<jsp:include page="/header.jsp"></jsp:include>
		<div id="imgBox"></div>
		<ul id="contextBox">
			<li>날짜 : {supporting.scheduleDate}</li>
			<li>장소 : {supporting.supPlace}</li>
			<li>내용 : {supporting.supContents}</li>
			<li>서포팅기간 : {supporting.supStartDate} ~ {supporting.supEndDate }</li>
		</ul>
		<div id="moneyBox">
			<div id="sumMoney">모인 금액<br>{supporting.sumMoney}</div>
			<div id="goalMoney">목표 금액<br>{supporting.goalMoney}</div>
		</div>
		<div id="percent">달성률</div>
		<div class="contentsBox">
			첨부파일
		</div>
		<button onclick="location.href='SupportingList.pick'">목록</button>
		<div class="side">
			<input type="radio" name="money-check" id="one"><label for="10,000won">10,000원</label>
			<input type="radio" name="money-check" id="two"><label for="20,000won">20,000원</label>
			<input type="radio" name="money-check" id="three"><label for="30,000won">30,000원</label>
			<input type="radio" name="money-check" id="four"><label for="40,000won">40,000원</label>
			기타입력<br><input type="text" name="money-check" id="five" value="추가금액을 입력해주세요.">
		</div>
		<div class="point"><p>최소단위는 1,000원 입니다.<br>최소단위 이하는 서포팅이 취소될 시 환불되지 않습니다.</p></div>
		<div class="payment"><button id="paybtn">서포팅 결제하기</button></div>
		<table align="center" border="1" id="reply">
			<tr>
				<td>
					<textarea rows="3" cols="5" id="rContents"></textarea>
				</td>
				<td>
					<button id="rSubmit">등록</button>
				</td>
			</tr>
		</table>
		<!-- 댓글 목록 -->
		<table align="center" width="500px" border="1" id="rtb">
			<tbody>
				<a href="#">수정</a>
				<a href="#">삭제</a>
				<a href="#">신고</a>
			</tbody>
		</table>
		<br><br>
		<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>