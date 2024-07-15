<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>AOOM 메인페이지</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
</head>
<body class="container">
	<!-- AOOM 네비게이션 바 -->
	<jsp:include page="/inc/navbar.jsp"></jsp:include>
	
	<!-- 검색 -->
	<form action="${pageContext.request.contextPath}/room/roomList" method="get">
		<input type="text" name="searchWord" id="searchWord" placeholder="여행지">
		<input type="text" name="daterange" style="width: 200px;"/>
		<input type="number" name="usePeople" id="usePeople" placeholder="여행자">
		<button type="submit">검색</button>
	</form>
	
	<!-- 카테고리 -->
	<c:forEach var="roomCategory" items="${roomCategory}">
		<span><a href="${pageContext.request.contextPath}/room/roomList?category=${roomCategory.codeKey}">${roomCategory.codeName}</a></span>
	</c:forEach>
	
	<!-- 필터 -->
	<!-- Button trigger modal -->
	<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
		필터
	</button>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">필터</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"	aria-label="Close"></button>
				</div>
				<form action="${pageContext.request.contextPath}/room/roomList" method="get">
					<div class="modal-body">
							<h3>가격</h3>
							<input type="number" min="0" name="lowPrice" placeholder="최저"> ~ <input type="number" min="0" name="highPrice" placeholder="최고"> 
							<h3>숙소 유형</h3>
					        <label>
					        	<label for="roomTypeAll">전체</label>
					            <input type="radio" id="roomTypeAll" name="roomtypeCode" value="all" checked>
					        </label>
							<c:forEach var="roomType" items="${roomType}">
								<label for="${roomType.codeKey}">${roomType.codeName}</label>
					            <input type="radio" id="${roomType.codeKey}" name="roomtypeCode" value="${roomType.codeKey}">
							</c:forEach>
							<h3>침실과 침대 화장실</h3>
							<h3>편의 시설</h3>
							<h3>즉시 예약만</h3>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						<button type="submit" class="btn btn-danger">필터링</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<h3>전체 숙소 목록</h3>
	<table border="1">
		<thead>
			<tr>
				<th>메인사진</th>
				<th>주소</th>
				<th>숙소이름</th>
				<th>기본가격</th>
			</tr>
		</thead>
		<c:forEach var="roomAllList" items="${roomAllList}">
			<tbody>
				<tr>
					<td><a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${roomAllList.roomId}">${roomAllList.mainImage}</a></td>
					<td>${roomAllList.address}</td>
					<td><a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${roomAllList.roomId}">${roomAllList.roomName}</a></td>
					<td>${roomAllList.defaultPrice}</td>
				</tr>
			</tbody>
		</c:forEach>
	</table>
	
	<h3>TOP 4 목록</h3>
	
	<h5>조회수</h5>
	<table border="1">
		<thead>
			<tr>
				<th>메인사진</th>
				<th>주소</th>
				<th>숙소이름</th>
				<th>기본가격</th>
			</tr>
		</thead>
		<c:forEach var="viewsDesc" items="${viewsDesc}">
			<tbody>
				<tr>
					<td><a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${viewsDesc.roomId}">${viewsDesc.mainImage}</a></td>
					<td>${viewsDesc.address}</td>
					<td><a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${viewsDesc.roomId}">${viewsDesc.roomName}</a></td>
					<td>${viewsDesc.defaultPrice}</td>
				</tr>
			</tbody>
		</c:forEach>
	</table>
		
	<h5>별점</h5>
	<table border="1">
		<thead>
			<tr>
				<th>메인사진</th>
				<th>주소</th>
				<th>숙소이름</th>
				<th>기본가격</th>
			</tr>
		</thead>
		<c:forEach var="starDesc" items="${starDesc}">
			<tbody>
				<tr>
					<td><a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${starDesc.roomId}">${starDesc.mainImage}</a></td>
					<td>${starDesc.address}</td>
					<td><a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${starDesc.roomId}">${starDesc.roomName}</a></td>
					<td>${starDesc.defaultPrice}</td>
				</tr>
			</tbody>
		</c:forEach>
	</table>
	
	<h5>예약</h5>
	<table border="1">
		<thead>
			<tr>
				<th>메인사진</th>
				<th>주소</th>
				<th>숙소이름</th>
				<th>기본가격</th>
			</tr>
		</thead>
		<c:forEach var="bookingDesc" items="${bookingDesc}">
			<tbody>
				<tr>
					<td><a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${bookingDesc.roomId}">${bookingDesc.mainImage}</a></td>
					<td>${bookingDesc.address}</td>
					<td><a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${bookingDesc.roomId}">${bookingDesc.roomName}</a></td>
					<td>${bookingDesc.defaultPrice}</td>
				</tr>
			</tbody>
		</c:forEach>
	</table>
	
	<h5>위시리스트</h5>
	<table border="1">
		<thead>
			<tr>
				<th>메인사진</th>
				<th>주소</th>
				<th>숙소이름</th>
				<th>기본가격</th>
			</tr>
		</thead>
		<c:forEach var="wishListDesc" items="${wishListDesc}">
			<tbody>
				<tr>
					<td><a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${wishListDesc.roomId}">${wishListDesc.mainImage}</a></td>
					<td>${wishListDesc.address}</td>
					<td><a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${wishListDesc.roomId}">${wishListDesc.roomName}</a></td>
					<td>${wishListDesc.defaultPrice}</td>
				</tr>
			</tbody>
		</c:forEach>
	</table>
	
	
	<script>
	
		// 달력 API 호출 
	    $(function() {
	        $('input[name="daterange"]').daterangepicker({
	            opens: 'left'
	        }, function(start, end, label) {
	            console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
	        });
	    });

		// 모달
		const myModal = document.getElementById('myModal')
		const myInput = document.getElementById('myInput')
		
		myModal.addEventListener('shown.bs.modal', () => {
			myInput.focus()
		})
	</script>
</body>
</html>