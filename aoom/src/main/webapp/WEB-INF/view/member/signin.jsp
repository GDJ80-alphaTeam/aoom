<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="loginModalLabel">로그인</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- 로그인 폼 내용 -->
                <form id="signin">
					<div>
						이메일 : <input type="email" id="signinUserId" name="userId" placeholder="이메일을 입력해주세요" required="required">
					</div>
					<div>
						비밀번호 : <input type="password" id="signinUserPw" name="userPw" required="required">
					</div>
				</form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" id="signinBtn" class="btn btn-primary">로그인</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
	// 로그인 버튼 클릭시
	$('#signinBtn').click(function(){
		
		// 아이디 빈칸 유효성 검사
        if ($('#signinUserId').val().trim() === '') {
            alert('이메일을 입력해주세요.');
            $('#signinUserId').focus();
            return;
        }
		
		// 비밀번호 양식
		const PWCHECK = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
		
		// 비밀번호 유효성검사
		if(!PWCHECK.test($('#signinUserPw').val())){
			alert('비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.');
			$('#userPw').focus();
			return;
		} 
		
		$.ajax({
			url:'/member/ajaxSignin',
			method: 'post',
			data: $('#signin').serialize(),
			success: function(response){
				if (response.result){
					alert(response.message);
					window.location.href = '/main';
				} else {
					alert(response.message);
				}
			},
			error: function(jqXHR, textStatus, errorThrown) {
	            console.error('AJAX Error: ' + textStatus + ': ' + errorThrown);
	            alert('로그인 중 오류가 발생했습니다.');
	        }
		})
	})
</script>