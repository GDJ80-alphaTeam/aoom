<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
	<form action="/signupAction" method="post">
		<div>
			이메일: <input type="text" name="userId" maxlength="50" placeholder="이메일을 입력해주세요" id="userId" required="required">
			<button type="button" id="authBtn">인증하기</button>
			<span id="spinner"></span>
		</div>
		<div>
			인증번호 : <input type="text" name="authNo" id="authNo" required="required">
			<button type="button" id="authCheck">인증번호 확인</button>
			<span id="authMsg"></span>
		</div>
		<div>
			비밀번호 : <input type="text" name="userPw" id="userPw" id="userPw" required="required">
		</div>
		<div>
			비밀번호 확인 : <input type="text" name="userPwCheck" id="userPwCheck" required="required">
			<div id="pwMsg"></div>
		</div>
		<div>
			생년월일 : <input type="date" name="userBirth" id="userBirth" required="required">
		</div>
		<div>
			이름 : <input type="text" name="userName" id="userName" required="required" onkeyup="chk_han('userName')">
		</div>
		<div>
			전화번호 : <input type="tel" name="userPhone" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" id="userPhone" required="required" placeholder="ex)010-1111-1111">
		</div>
		<button type="submit">회원가입</button>
	</form>

	<script type="text/javascript">

		$('#userPwCheck').blur(function test() {
			var p1 = $('#userPw').val();
			var p2 = $('#userPwCheck').val();
			
			if (p1 != p2) {
				$('#pwMsg').text('비밀번호가 일치하지 않습니다.');
				$('#userPwCheck').focus();
				return ;
			} else {
				$('#pwMsg').text('비밀번호가 일치합니다.');
				$('#userBirth').focus();
				return ;
			}
		});
		
		// 한글을 제외한 값을 입력시 ''로교체
		function chk_han(id) {
			var regexp = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
			var value = $("#" + id).val();
			if (regexp.test(value)) {
				$("#" + id).val(value.replace(regexp, ''));
			}
		}
		
		$('#authBtn').click(function(){
			$("#authBtn").hide();
			$("#spinner").html('<div class="spinner-border" role="status"><span class="visually-hidden">Loading...</span></div>')
			$.ajax({
				url:'/send',
				method:'post',
				data:{'userId':$('#userId').val()},
				success:function(authNo){
					$("#authBtn").show();
					$("#spinner").html('');
				}	
			})
		})
		
		$('#authCheck').click(function() {
			$.ajax({
				url:'/authCheck',
				method:'post',
				data : {
					'authNo' : $('#authNo').val(),
					'userId' : $('#userId').val()
				},
				success : function(response) {
					console.log(response);
					console.log('응답');
					if (response.success == 1) {
						$('#authNo').attr('disabled', true);
						alert('인증 완료');
					} else {
						alert('인증번호가 일치하지 않습니다.');
					}
				}
			});
		})
	</script>
	
</body>
</html>