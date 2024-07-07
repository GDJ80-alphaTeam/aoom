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
</head>
<body>
	<form action="/signupAction" method="post">
		<div>
			이메일: <input type="text" name="userId" maxlength="50" placeholder="이메일을 입력해주세요" id="userId" required="required">
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
	</script>
	
</body>
</html>