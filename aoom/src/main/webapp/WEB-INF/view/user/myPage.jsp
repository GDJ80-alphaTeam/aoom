<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body class="container">
    <!-- AOOM 네비게이션 바 -->
    <jsp:include page="/WEB-INF/view/layout/navbarSub.jsp"></jsp:include>
    
	<div style="width: 1200px;margin: 0 auto ; text-align: center">
		<h1>마이페이지</h1>
		<div style="width: 100%;height: 300px; background-color: green;" onclick="window.location.href='/user/profile?userId=${sessionScope.userInfo.userId}'">
				프로필
		</div>
		<div style="width: 100%;height: 300px; background-color: gray;" id="userInfoPage" data-bs-toggle="modal" data-bs-target="#checkUserInfoModal">
			<a> 
				개인정보
			</a>
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="checkUserInfoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title" id="exampleModalLabel">회원정보 확인</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				
				<form id="checkUserInfoForm">
					<!-- 내용 -->
					<div class="modal-body">
						<div>
							<h6><b>아이디</b></h6>
							<input type="text" id="userId" name="userId" value="${sessionScope.userInfo.userId}" readonly="readonly" style="border-width: 0; outline: none;">
							
							<h6><b>비밀번호</b></h6>
							<input type="password" id="userPw" name="userPw" style="width: 70%;">

						</div>
					</div>
					
					<!-- 버튼이름 -->
					<div class="modal-footer">	
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
						<button type="button" id="checkBtn" class="btn btn-primary">확인</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<!-- 개인정보 수정 들어가기 전 고객 정보 확인 -->
	<script type="text/javascript">
		$('#checkBtn').on('click', function() {
			$.ajax({
				url: '/user/userInfo/ajaxCheckUserInfo',
				method: 'post',
				data: $('#checkUserInfoForm').serialize(),
				success: function(response) {
					console.log(response);
					if(response.result) {
						 window.location.href = '/user/userInfo';
					} else {
						alert(response.message);
						$('#userPw').focus();
					}
				}
			});
		});
	</script>
</body>
</html>