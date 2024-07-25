<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>호스트모드 메인</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body class="container">

	<jsp:include page="/WEB-INF/view/layout/navbarSub.jsp"></jsp:include>
	
	<!-- 호스트 모드 메뉴 -->
	<br>
	<div>
		<a href="/host/main">메인</a>
		<a href="/host/calendar">달력</a>
		<a href="/host/roomManage">숙소 관리</a>
		<a href="/host/bookList">예약 목록</a>
	</div>
	<br>
	
	<div>
		<h2>${userInfo.userName }님 반갑습니다</h2>
	</div>
	<br>
	
	<!-- 호스트의 간편 예약 관리 버튼-->
	<div>
		<h3>예약</h3>
		<button type="button">체크아웃 예정</button>
		<button type="button">현재 호스팅 중</button>
		<button type="button">체크인 예정</button>
		<button type="button">예정</button>
		<button type="button">작성할 후기</button>
	</div>
	<br>
	
	<!-- 호스트의 간편 예약 관리 출력-->
	<div>
		<table class="table">
			<thead>
				<tr>
					<th>예약번호</th>
					<th>숙소 ID</th>
					<th>게스트 ID</th>
					<th>인원</th>
					<th>예약일</th>
				</tr>
			</thead>	
			<tbody>
				<tr>
					<td>예</td>
					<td>약</td>
					<td>정</td>
					<td>보</td>
					<td>!</td>
				</tr>
				<tr>
					<td>예</td>
					<td>약</td>
					<td>정</td>
					<td>보</td>
					<td>!</td>
				</tr>
				<tr>
					<td>예</td>
					<td>약</td>
					<td>정</td>
					<td>보</td>
					<td>!</td>
				</tr>
			</tbody>
		</table>
	</div>
	
</body>
</html>