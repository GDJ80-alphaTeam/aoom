<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예약목록</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>

<jsp:include page="/WEB-INF/view/layout/navbarSub.jsp"></jsp:include>
	
	<div style="margin: 0 auto; width: 1500px">
		<h1>예약목록 페이지</h1>
	
		<table class="table">
			<thead>
				<tr>
					<th>숙소이름</th>
					<th>예약 일자</th>
					<th>호스트</th>
					<th>대표사진</th>
					<th>예약상태</th>
					<th>결제상태</th>
					<th>비고(환불상태)</th>
				</tr>
			</thead>	
			<tbody>
			<c:forEach var="r" items="${bookingList}">
			
					<tr>
						<td>
							<a href="${pageContext.request.contextPath}/guest/booking">
								${r.roomName}
							</a>	
						</td>
						<td>${r.createDate}</td>
						<td>${r.userId}</td>
						
						<td>
							<img src="${r.mainImage}" style="height: 50px;">
						</td>
						<td> ${r.bookstatName}</td>
						<td>${r.paystatName}</td>
					</tr>
				
			</c:forEach>	
			</tbody>
		</table>
	</div>
</body>
</html>