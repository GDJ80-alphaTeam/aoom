<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예약상세보기</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body class="container">
	<jsp:include page="/WEB-INF/view/layout/navbarSub.jsp"></jsp:include>
	
	<!-- 호스트 모드 메뉴 -->
	<br>
	<div>
		<a class="btn btn-outline-danger" href="/host/main">메인</a>
		<a class="btn btn-outline-danger" href="/host/calendar">달력</a>
		<a class="btn btn-outline-danger" href="/host/roomManage">숙소 관리</a>
		<a class="btn btn-danger" href="/host/bookList">예약 목록</a>
		<a class="btn btn-outline-danger" href="/host/revenue">수입</a>
	</div>
	<br>
	
	<!-- 예약상세보기 폼 -->
	<h1>예약상세보기</h1>
	<br>
	
	<div class="container text-center">
		<div class="row">
			<div class="col-3 text-start">
				<br>
				<img alt="" src="${bookInfo.mainImage }" style="width: 250px; height: 200px;">
				<br><br>
				<p>숙소아이디 : <a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${bookInfo.roomId }">${bookInfo.roomId }</a></p>
				<p>숙소 이름 : <a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${bookInfo.roomId }">${bookInfo.roomName }</a></p>
				<p>숙소 위치 : ${bookInfo.address }</p>
			</div>
			<div class="col-9">
				<table class="table">
					<tr>
						<th>예약정보</th>
					</tr>
					<tr>
						<th rowspan="2"><img alt="" src="${bookInfo.userImage }" style="width: 125px; height: 100px;"></th>
						<th>게스트</th>
						<th>연락처</th>
						<th>인원수</th>
						<th>가격</th>
						<th>체크인</th>
						<th>체크아웃</th>
						<th>상태</th>
					</tr>
					<tr>
						<td>${bookInfo.userId }</td>
						<td>${bookInfo.userPhone }</td>
						<td>${bookInfo.totalPrice }</td>
						<td>${bookInfo.totalPrice }</td>
						<td>${bookInfo.checkIn }</td>
						<td>${bookInfo.checkOut }</td>
						<c:if test="${bookInfo.bookstatCode == 'bst01'}">
                        <td>예약대기</td>
	                    </c:if>
	                    <c:if test="${bookInfo.bookstatCode == 'bst02'}">
	                        <td>이용전</td>
	                    </c:if>
	                    <c:if test="${bookInfo.bookstatCode == 'bst03'}">
	                        <td>이용후</td>
	                    </c:if>
	                    <c:if test="${bookInfo.bookstatCode == 'bst04'}">
	                        <td>후기작성완료</td>
	                    </c:if>
	                    <c:if test="${bookInfo.bookstatCode == 'bst05'}">
	                        <td>예약취소</td>
	                    </c:if>
					</tr>
					<tr>
						<th>요구사항정보</th>
						<th>여행목적</th>
					</tr>
					<tr>
						<td><img alt="" src="/image/etc/userDefault.png" style="width: 125px; height: 100px;"></td>
						<td colspan="7">
							<textarea rows="5" cols="110">근처에 골프 약속이 있어요.</textarea>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	
	<!-- 승인 반려 폼 -->
	<div class="container text-center">
		<div class="row">
			<div class="col-7"></div>
			<div class="col-5">
				<table>
					<tr>
						<td>
							<textarea rows="3" cols="50">저희 숙소 근방 100km 이내에 골프장이 없는데... 수상하군요.... 반려하겠습니다!</textarea>
						</td>
						<td><button class="btn btn-danger">반려</button></td>
						<td><button class="btn btn-primary">승인</button></td>
					</tr>
				</table>
			</div>
		</div>
	</div>

</body>
</html>