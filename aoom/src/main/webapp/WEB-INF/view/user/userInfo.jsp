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
		<form id="editUserInfoForm">
			<h1>개인정보</h1>
			<br>
			
			<div>
				<h5><b>이름</b></h5>
				<input type="text" id="editUserName" name="userName" value="${sessionScope.userInfo.userName }" required="required"> 
				<br>
			</div>
			<hr>
			
			<div>
				<h5><b>아이디</b></h5>
				<input type="text" id="userId" name="userId" value="${sessionScope.userInfo.userId}" readonly="readonly" style="border-width: 0; outline: none;">
				<br>
			</div>
			<hr>
			
			<div>
				<h5><b>생년월일</b></h5>
				${sessionScope.userInfo.userBirth }
				<br>
			</div>
			<hr>
			
			<div>
				<h5><b>전화번호</b></h5>
				<input type="tel" name="userPhone" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" id="editUserPhone" value="${sessionScope.userInfo.userPhone }" required="required" placeholder="ex)010-1111-1111">
				<br>
			</div>
			<hr>
			
			<div>
				<h5><b>비밀번호</b></h5>
			
				<h6>새 비밀번호</h6>
				<input type="password" id="editUserPw" name="editUserPw">
			
				<h6>비밀번호 확인</h6>
				<input type="password" id="editUserPwcheck" name="editUserPwCheck">
			</div>
			<br>
			
			<button type="button" onclick="window.location.href='/user/myPage'">나가기</button>
			<button type="submit" id="submitBtn">수정하기</button>
		</form>
	</div>
	
	<script type="text/javascript">
	
		$('#submitBtn').on('click', function() {
			let editUserPw = $('#editUserPw').val();
			let editUserPwcheck = $('#editUserPwcheck').val();
			
			if(editUserPw !== '' || editUserPwcheck !== '') {
				// 비밀번호 유효성검사
				if(!PWCHECK.test(editUserPw)){
					alert('비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.');
					$('#editUserPw').focus();
					return false;
				} 
				if (editUserPw !== editUserPwcheck) {
					alert("비밀번호가 일치하지 않습니다.");
					$('#editUserPwcheck').focus();
					return false;
				}
			}
			
			$.ajax({
				url: '/user/userInfo/ajaxEditUserInfo',
				method: 'post',
				data: $('#editUserInfoForm').serialize(),
				success: function(response) {
					console.log(response);
					if(response.result) {
						 window.location.href = '/user/userInfo';
						 alert(response.message);
					} else {
						window.location.href = '/user/userInfo';
						alert(response.message);
					}
				}
			});
		});
	</script>
</body>
</html>