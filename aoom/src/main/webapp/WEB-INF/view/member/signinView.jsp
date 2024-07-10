<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
	<form id="signin">
		<div>
			이메일 : <input type="email" name="userId" id="userId" placeholder="이메일을 입력해주세요" required="required">
		</div>
		<div>
			비밀번호 : <input type="password" name="userPw" id="userPw" required="required">
		</div>
		
		<button type="button" id="signinBtn">로그인</button>
	</form>
	
	<script type="text/javascript">
		
		// 로그인 버튼 클릭시
		$('#signinBtn').click(function(){
			
			$.ajax({
				url:'/member/signin',
				method: 'post',
				data: $('#signin').serialize(),
				success: function(response){
					if (response === 'success'){
						window.location.href = '/main';
					} else {
						alert('로그인에 실패하였습니다.');
					}
				}
			})
			
		})
		
	</script>
</body>
</html>