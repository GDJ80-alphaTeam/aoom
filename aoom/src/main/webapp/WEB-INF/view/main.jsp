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
	<c:forEach var="r" items="${roomAllList}">
		${r.roomId}
	</c:forEach>
	
	
	<button type="button" id="signoutBtn">로그아웃</button>
	
	<script type="text/javascript">
		
		// 로그아웃 기능
		$('#signoutBtn').click(function() {
			
			$.ajax({
				url: '/member/signout',
				method: 'post',
				success: function(response){
					if(response === "success") {
						window.location.href = '/main';
					}else{
						alert('로그아웃에 실패하였습니다.');
					}
				}
			})
		})
	</script>
</body>
</html>