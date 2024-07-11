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
</head>
<body>
	<h1>AOOM 메인페이지</h1>
	
	<button onclick="location.href='${pageContext.request.contextPath}/host/main'">호스트모드</button>
	<button type="button" id="signoutBtn">로그아웃</button>
	
	<h3>전체 숙소 목록</h3>
	<table>
		<thead>
			<tr>
				<th>메인사진</th>
				<th>주소</th>
				<th>숙소이름</th>
				<th>기본가격</th>
			</tr>
		</thead>
		<c:forEach var="r" items="${roomAllList}">
			<tbody>
				<tr>
					<td><a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${r.roomId}">${r.mainImage}</a></td>
					<td>${r.address}</td>
					<td><a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${r.roomId}">${r.roomName}</a></td>
					<td>${r.defaultPrice}</td>
				</tr>
			</tbody>
		</c:forEach>
	</table>
	
	<h3>TOP 4 목록</h3>
	
	<h5>조회수</h5>
	<table>
		<thead>
			<tr>
				<th>메인사진</th>
				<th>주소</th>
				<th>숙소이름</th>
				<th>기본가격</th>
			</tr>
		</thead>
		<c:forEach var="v" items="${viewsDesc}">
			<tbody>
				<tr>
					<td><a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${v.roomId}">${v.mainImage}</a></td>
					<td>${v.address}</td>
					<td><a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${v.roomId}">${v.roomName}</a></td>
					<td>${v.defaultPrice}</td>
				</tr>
			</tbody>
		</c:forEach>
	</table>
		
	<h5>별점</h5>
	
	<h5>예약</h5>
	
	<h5>위시리스트</h5>
	
	<script type="text/javascript">
		
		// 로그아웃 기능
		$('#signoutBtn').click(function() {
			
			$.ajax({
				url: '/member/signout',
				method: 'post',
				success: function(response){
					if(response === "success") {
						alert('로그아웃 되었습니다.');
						window.location.href = '/member/signinView';
					}else{
						alert('로그아웃에 실패하였습니다.');
					}
				}
			})
		})
		
	</script>
</body>
</html>