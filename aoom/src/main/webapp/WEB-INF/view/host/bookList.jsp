<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예약받은목록</title>
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
	
	<form action="${pageContext.request.contextPath}/host/bookList" method="get">
		<!-- 호스팅 목록 -->
	    <div>
	        <select id="selectRoom" name="selectRoom">
	        	<option value="all">===숙소선택===</option>
	            <!-- 숙소 상태가 활성화인것만 나오게 설정 -->
	            <c:forEach var="room" items="${roomList }">
	                <c:if test="${room.roomstatCode == 'rst03' and room.roomstatCode eq 'rst03'}">
	                    <c:if test="${room.roomId == selectRoom}">
	                        <option value="${room.roomId }" selected="selected">${room.roomName }</option>
	                    </c:if>
	                    <c:if test="${room.roomId != selectedRoomId}">
	                        <option value="${room.roomId }">${room.roomName }</option>
	                    </c:if>
	                </c:if>
	            </c:forEach>
	        </select>
		    <button type="submit">선택</button>
	    </div>
	</form>
	
	<h1>예약받은목록</h1>
	
	<table class="table">
		<thead>
			<tr>
				<th>숙소이름</th>
				<th>게스트 email</th>
				<th>체크인</th>
				<th>체크아웃</th>
				<th>예약상태</th>
				<th>상세보기</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="bookingList" items="${bookingList }">
				<tr>
					<td>${bookingList.roomName}</td>
					<td>${bookingList.guestId}</td>
					<td>${bookingList.checkIn}</td>
					<td>${bookingList.checkOut}</td>
                    <c:if test="${bookingList.bookstatCode == 'bst01'}">
                        <td>예약대기</td>
                    </c:if>
                    <c:if test="${bookingList.bookstatCode == 'bst02'}">
                        <td>이용전</td>
                    </c:if>
                    <c:if test="${bookingList.bookstatCode == 'bst03'}">
                        <td>이용후</td>
                    </c:if>
                    <c:if test="${bookingList.bookstatCode == 'bst04'}">
                        <td>후기작성완료</td>
                    </c:if>
                    <c:if test="${bookingList.bookstatCode == 'bst05'}">
                        <td>예약취소</td>
                    </c:if>
					<td><button class="btn btn-danger">바로가기</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<script type="text/javascript">
	
		
	
	</script>
</body>
</html>