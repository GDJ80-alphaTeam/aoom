<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="log_in_bg"><!-- 로그인 모달 -->
    <div class="log_in">
        <div class="log_in_t">
            <i class="fa-solid fa-xmark"></i>
            <p>로그인</p>
        </div><!--// log_in_t -->

        <ul class="log_in_b">
            <li>
            	<form id="signin">
	                <input type="email" id="signinUserId" name="userId" placeholder="이메일을 입력해주세요" required="required">
	                <input type="password" id="signinUserPw" name="userPw" placeholder="비밀번호를 입력해주세요" required="required" value="qwer1234!">
            	</form>
                <div class="option_btn">
                    <p>이메일 찾기</p>
                    <p>비밀번호 변경</p>
                </div><!-- option_btn -->
            </li>
            <li class="login_btn">
                <button type="button" id="signinBtn">로그인</button>
                <button>회원가입</button>
            </li><!-- //login_btn -->
        </ul> <!-- //log_in_b -->
    </div><!-- //log_in -->
</div><!-- //log_in_bg -->
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
			$('#signinUserPw').focus();
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