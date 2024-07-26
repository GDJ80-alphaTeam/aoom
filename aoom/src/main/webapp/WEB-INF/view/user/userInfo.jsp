<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<body class="container">
	<jsp:include page="/WEB-INF/view/layout/navbarSub.jsp"></jsp:include>
	
	<div style="width: 80%; margin: auto;">
		<h1>개인정보</h1>
		
		<button type="button" class="btn btn-primary" data-bs-toggle="modal"data-bs-target="#editUserInfoModal">개인정보 수정하기</button>
		<br>
		<br>
		
		<div>
			<h5><b>이름</b></h5>
			${userInfo.userName }
			<br>
		</div>
		<hr>
		
		<div>
			<h5><b>아이디</b></h5>
			${userInfo.userId }
			<br>
		</div>
		<hr>
		
		<div>
			<h5><b>생년월일</b></h5>
			${userInfo.userBirth }
			<br>
		</div>
		<hr>
		
		<div>
			<h5><b>전화번호</b></h5>
			${userInfo.userPhone }
			<br>
		</div>
		<hr>
		
		<div>
			<h5><b>최근 정보 수정</b></h5>
			최종 수정일 : ${userInfo.recentEdit }일전
			<br>
		</div>
		<hr>
		
	</div>
	
	
	<!-- Modal -->
	<div class="modal fade" id="editUserInfoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title" id="exampleModalLabel">개인정보 수정하기</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				
				<form action="/user/userInfo/edit" method="post" id="editUserInfoForm">
					<!-- 내용 -->
					<div class="modal-body">
						<div>
							<h5><b>이름</b></h5>
							<input type="text" id="editUserName" name="userName" value="${userInfo.userName }" required="required" style="width: 70%;">
							<br>
						</div>
						<hr>
						
						<div>
							<h5><b>아이디</b></h5>
							${userInfo.userId }
							<br>
						</div>
						<hr>
						
						<div>
							<h5><b>생년월일</b></h5>
							${userInfo.userBirth }
							<br>
						</div>
						<hr>
						
						<div>
							<h5><b>전화번호</b></h5>
							<input type="tel" name="userPhone" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" id="editUserPhone" value="${userInfo.userPhone }" required="required" placeholder="ex)010-1111-1111">
							<br>
						</div>
						<hr>

						<div>
							<h5><b>비밀번호</b></h5>
							
							<h6>현재 비밀번호</h6>
							<input type="password" id="nowUserPw" name="nowUserPw" style="width: 70%;">
							
							<h6>새 비밀번호</h6>
							<input type="password" id="newUserPw" name="newUserPw" style="width: 70%;">
							
							<h6>비밀번호 확인</h6>
							<input type="password" id="newUserPwcheck" name="newUserPwCheck" style="width: 70%;">
						</div>
					</div>
					
					<!-- 버튼이름 -->
					<div class="modal-footer">	
						<button type="button" class="btn btn-secondary"data-bs-dismiss="modal">닫기</button>
						<button type="button" id="submitBtn" class="btn btn-primary">수정하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	
	<script type="text/javascript">
		$('#submitBtn').on('click', function() {
			let nowUserPw = $('#nowUserPw').val();
			let newUserPw = $('#newUserPw').val();
			let newUserPwcheck = $('#newUserPwcheck').val();

			if(newUserPw !== '' || newUserPwcheck !== ''){
				if (newUserPw !== newUserPwcheck) {
					alert("비밀번호가 일치하지 않습니다.");
					$('#newUserPwcheck').focus();
					return false;
				}
				if(nowUserPw === '') {
					alert("현재 비밀번호를 입력해주세요");
					$('#nowUserPw').focus();
					return false;
				}
				
				if(nowUserPw !== '') {
					$.ajax({
						url: '/user/userInfo/ajaxEditPwCheck',
						method: 'post',
						data: {
							'userId' : '${userInfo.userId }',
							'userPw' : nowUserPw
						 },
						success: function(response) {
							console.log(response);
							if(response.result) {
								 $('#editUserInfoForm').submit();
							} else {
								alert(response.message);
								$('#nowUserPw').focus();
							}
							
						}
					});
				}
				
			}
		});
	</script>
</body>
</html>