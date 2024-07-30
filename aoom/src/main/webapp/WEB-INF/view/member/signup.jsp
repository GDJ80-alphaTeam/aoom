<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="modal fade" id="signupModal" tabindex="-1" aria-labelledby="signupModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="signupModalLabel">회원가입</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- 회원가입 폼 내용 -->
				<form id="signup">
					<div>
						이메일: <input type="text" name="userId" maxlength="50" placeholder="이메일을 입력해주세요" id="userId"  required="required">
						<button type="button" id="authBtn">인증하기</button>
						<span id="userIdMsg"></span>
						<span id="spinner"></span>
					</div>
					<div>
						인증번호 : <input type="text" name="authNo" id="authNo" required="required">
						<button type="button" id="authCheck">인증번호 확인</button>
					</div>
					<div>
						비밀번호 : <input type="password" name="userPw" id="userPw" min="8" max="15" required="required">
					</div>
					<div>
						비밀번호 확인 : <input type="password" name="userPwCheck" id="userPwCheck" required="required">
						<div id="pwMsg"></div>
					</div>
					<div>
						생년월일 : <input type="date" name="userBirth" id="userBirth" required="required">
					</div>
					<div>
						이름 : <input type="text" name="userName" id="userName" minlength="2" required="required" onkeyup="chk_han('userName')">
					</div>
					<div>
						전화번호 : <input type="tel" name="userPhone" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" id="userPhone" required="required" placeholder="ex)010-1111-1111">
					</div>
				</form>
					
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" id="signupBtn" disabled="disabled" class="btn btn-primary">회원가입</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
	// 비밀번호 양식
	const PWCHECK = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
	
	// 전화번호 정규식
    const phoneRegex = /^\d{3}-\d{4}-\d{4}$/;

	// 회원가입 버튼 클릭시 유효성 로직
	$('#signupBtn').click(function(){
		
		// 비밀번호 유효성검사
		if(!PWCHECK.test($('#userPw').val())){
			alert('비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.');
			$('#userPw').focus();
			return;
		} 
		
		// 비밀번호 확인 유효성검사
		if($('#userPw').val() != $('#userPwCheck').val()){
			alert('비밀번호가 일치하지 않습니다.');
			$('#userPwCheck').focus();
			return;
		}
			
		// 생년월일 유효성검사
		if($('#userBirth').val() == '') {
			alert('생년월일을 입력해주세요.');
			$('#userBirth').focus();
			return;
		}
		
		// 이름 유효성검사
		if($('#userName').val() == '') {
			alert('이름을 입력해주세요.');
			$('#userName').focus();
			return;
		}
		
		// 전화번호 유효성검사
		if($('#userPhone').val() == '') {
			alert('전화번호를 입력해주세요.');
			$('#userPhone').focus();
			return;
		}
		
		if(!phoneRegex.test($('#userPhone').val())) {
			alert('전화번호 형식이 다릅니다');
			return;
		}
		
		// 회원가입 정보 전송
		$.ajax({
			url:'/member/ajaxSignup',
			method:'post',
			async:false,
			data: $('#signup').serialize(),
			success: function(response){
					console.log('test : ' + response);
				if (response.result === true) {
					alert(response.message);
					window.location.href = '/main';
				} else {
					alert(response.message);
				}
			}
		})
	})
	
	// 한글을 제외한 값을 입력시 ''로교체
	function chk_han(id) {
		var regexp = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
		var value = $("#" + id).val();
		if (regexp.test(value)) {
			$("#" + id).val(value.replace(regexp, ''));
		}
	}
	
	// 이메일 인증번호 전송
	$('#authBtn').click(function(){
		console.log("test")
		$("#authBtn").hide();
		$("#spinner").html('<div class="spinner-border" role="status"><span class="visually-hidden">Loading...</span></div>')
		$.ajax({
			url:'/userAuthNo/ajaxSend',
			method:'post',
			data:{'userId':$('#userId').val()},
			success:function(response){
				if(response.result){
					alert(response.message);
				}else{
					alert(response.message);
				}
				$("#authBtn").show();
				$("#spinner").html('');
			},
	        error: function(jqXHR, textStatus, errorThrown) {
	            console.error('AJAX Error: ' + textStatus + ': ' + errorThrown);
	            alert('로그인 중 오류가 발생했습니다.');
	        }
		})
	})
	
	// 인증번호 확인
	$('#authCheck').click(function() {
		$.ajax({
			url:'/userAuthNo/ajaxAuthCheck',
			method:'post',
			data : {
				'authNo' : $('#authNo').val(),
				'userId' : $('#userId').val()
			},
			success : function(response) {
				if (response.result) {
					alert(response.message);
					$('#authNo').attr('disabled', true);
					$('#authBtn').attr('disabled', true);
					$('#signupBtn').attr('disabled', false);
					$('#userId').attr('readonly', true);
				} else {
					alert(response.message);
				}
			}
		});
	})
</script>