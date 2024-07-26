<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>위시리스트</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<body class="container">
	
	<jsp:include page="/WEB-INF/view/layout/navbarSub.jsp"></jsp:include>
	
	<br>
	<h2>${sessionScope.userInfo.userId}님의 위시리스트</h2>
	<br>
	
	<div class="row row-cols-1 row-cols-md-4 g-4">
		<c:forEach var="room" items="${userWishList }">
			<div class="col">
				<div class="card h-100">
				<button type="button" name="wishListBtn_${room.roomId}" style="position: absolute; top: 0; right: 0; border: 0; background-color: transparent;">&#129505;</button>
					<a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${room.roomId}">
						<img src="${room.mainImage }" class="card-img-top" alt="..." height="200px">
					</a>
					<div class="card-body">	
						<h5 class="card-text">
							<a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${room.roomId}">${room.roomName}</a>
							<a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${room.roomId}">⭐ 0점</a>
						</h5>
						<p class="card-text">
							<a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${room.roomId}">${room.roomId}</a>
							<a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${room.roomId}">${room.defaultPrice} 원</a>
						</p>
						<p class="card-text">
							<a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${room.roomId}">${room.address}</a>
						</p>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	
	<!-- 위시리스트에 있는 숙소 제거 -->
	<script type="text/javascript">
		$('button[name^="wishListBtn_"]').click(function() {
			const wishListBtnRoomId = $(this).attr('name');
			const roomId = wishListBtnRoomId.split('_')[1];

			$.ajax({
				url : '/ajaxWishList',
				method : 'get',
				data : {
					'userId' : '${sessionScope.userInfo.userId}',
					'roomId' : roomId
				},
				success : function(response) {
					console.log(response);
					if (response.result) {
						alert(response.message);
						window.location.href = "/user/wishList";
					}
				}
			});
		});
	</script>
</body>
</html>