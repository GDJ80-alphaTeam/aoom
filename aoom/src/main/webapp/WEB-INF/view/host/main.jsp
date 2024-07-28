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
		<a class="btn btn-danger" href="/host/main">메인</a>
		<a class="btn btn-outline-danger" href="/host/calendar">달력</a>
		<a class="btn btn-outline-danger" href="/host/roomManage">숙소 관리</a>
		<a class="btn btn-outline-danger" href="/host/bookList">예약 목록</a>
		<a class="btn btn-outline-danger" href="/host/revenue">수입</a>
	</div>
	<br>
	
	<div>
		<h2>${userInfo.userName }님 반갑습니다</h2>
	</div>
	<br>
	
	<!-- 호스트의 간편 예약 관리 버튼-->
	<div>
		<h3>Today</h3>
		<a class="btn btn-danger" href="${pageContext.request.contextPath}/host/main">체크아웃 예정</a>
		<a class="btn btn-danger" href="${pageContext.request.contextPath}/host/main?actionType=hosting">현재 호스팅 중</a>
		<a class="btn btn-danger" href="${pageContext.request.contextPath}/host/main?actionType=checkIn">체크인 예정</a>
		<a class="btn btn-danger" href="${pageContext.request.contextPath}/host/main?actionType=upComing">다가올 예약</a>
		<a class="btn btn-danger" href="${pageContext.request.contextPath}/host/main?actionType=pendingReview">후기작성 대기중</a>
	</div>
	<br>
	
	<h5>
		<c:if test="${actionType == 'checkOut'}"> 
		오늘 체크아웃 예정 : ${todayContentCnt } 건
		</c:if>
		<c:if test="${actionType == 'hosting'}"> 
		현재 호스팅 진행중 : ${todayContentCnt } 건
		</c:if>
		<c:if test="${actionType == 'checkIn'}"> 
		오늘 체크인 예정 : ${todayContentCnt } 건
		</c:if>
		<c:if test="${actionType == 'upComing'}"> 
		다가오는 예약 : ${todayContentCnt } 건
		</c:if>
		<c:if test="${actionType == 'pendingReview'}"> 
		후기작성 대기중 : ${todayContentCnt } 건
		</c:if>
	</h5>
	
	<!-- 호스트의 간편 예약 관리 출력-->
	<div>
		<table class="table">
			<tr>
				<th>예약 ID</th>
				<th>숙소 ID</th>
				<th>게스트 ID</th>
				<th>숙박인원</th>
				<th>체크인</th>
				<th>체크아웃</th>
				<th>숙박비용</th>
				<th>비고</th>
			</tr>
			<c:forEach var="todayContent" items="${todayContent}">
				<tr>
					<td>${todayContent.bookingId }</td>
					<td>${todayContent.roomId }</td>
					<td>${todayContent.userId }</td>
					<td>${todayContent.stayPeople } 명</td>
					<td>${todayContent.checkIn }</td>
					<td>${todayContent.checkOut }</td>
					<td>${todayContent.totalPrice } 원</td>
					<td>
						<c:if test="${actionType == 'checkOut'}">
							<button type="button" id="checkOutBtn" class="btn btn-danger" data-booking-id="${todayContent.bookingId }" >체크아웃</button>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<script type="text/javascript">
	
		// 체크아웃 ajax
		$('#checkOutBtn').click(function(event){
			// 예약id 가져오기
			var bookingId = $(this).data('booking-id');
			$.ajax({
				url: '/host/ajaxCheckOut',
				type: 'POST',
				data: {
					'bookingId': bookingId
				},
				success: function(response){
					if (response.result) {
						alert(response.message);
						window.location.href = "/host/main";
					} else{
						alert(response.message);
						window.location.href = "/host/main";
					}
				}
			})
		})
	
	</script>
</body>
</html>