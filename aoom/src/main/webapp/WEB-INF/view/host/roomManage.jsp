<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>숙소관리</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<body>
	<form action="/host/roomManage/setupRoom" method="post">
		<button type="submit">숙소등록</button>
	</form>
	
	<table>
		<thead>
			<tr>
				<th>숙소</th>
				<th>위치</th>
				<th>상태</th>
				<th>비고</th>
			</tr>
		</thead>	
		<tbody>
			<c:forEach var="room" items="${roomListByUser }">
				<tr>
					<td>${room.mainImage }</td>
					<td>${room.address }</td>
					<c:if test="${room.codeName == '반려'}">
						<td><a href="#">${room.codeName }</a></td>
					</c:if>
					<c:if test="${room.codeName != '반려'}">
						<td>${room.codeName }</td>
					</c:if>
					<td>
						<button>수정</button>
						<button>삭제</button>
						<button>비활성화</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
</body>
</html>