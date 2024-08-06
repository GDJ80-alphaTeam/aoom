<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="description" content="AOOM 웹 사이트 입니다">
    <meta name="keywords" content="AOOM, 웹디자인, 포트폴리오, 디자이너, 웹 포트폴리오">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>마이페이지</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="https://kit.fontawesome.com/82b4a4fcad.js"></script>
	<link rel="stylesheet" href="/style/css/navSub.css">
	<link rel="stylesheet" href="/style/css/common.css">
	<link rel="stylesheet" href="/style/css/myPage.css">
	<script src="/style/js/navbarSub.js" defer></script>
</head>
<body>
    <!-- AOOM 네비게이션 바 -->
    <jsp:include page="/WEB-INF/view/layout/navbarSub.jsp"></jsp:include>
    
    <div class="inner">
    	<div style="margin-top: 140px;">
			<h4>마이페이지</h4>
			<div style="width: 100%;height: 300px; background-color: green;" onclick="window.location.href='/user/profile?userId=${sessionScope.userInfo.userId}'">
					프로필
			</div>
			<div style="width: 100%;height: 300px; background-color: gray;" onclick="$('.check_userinfo_bg').show();">
				<a> 
					개인정보
				</a>
			</div>
		</div>
    </div>
	
	<!-- 개인 정보 수정 모달 -->
	<div class="check_userinfo_bg" style="display: none;">
	    <div class="check_userinfo">
	        <div class="check_userinfo_t">
	            <i class="fa-solid fa-xmark" id="closeModal"></i>
	            <p>회원정보 확인</p>
	        </div>
	        <ul class="check_userinfo_b">
	            <li>
	                <form id="checkUserInfoForm">
                        <div>
                            <h6><b>아이디</b></h6>
                            <input type="text" id="userId" name="userId" value="${sessionScope.userInfo.userId}" readonly="readonly">
                            <h6><b>비밀번호</b></h6>
                            <input type="password" id="userPw" name="userPw">
                        </div>
	                    <div class="c_b_btn">
	                        <button class="c_btn" type="button" id="cancelCheckUserinfoBtn">취소</button>
	                        <button class="d_btn"  type="button" id="checkUserinfoBtn">확인</button>
	                    </div>
	                </form>
	            </li>
	        </ul>
	    </div>
	</div>
	
	<!-- 개인정보 수정 들어가기 전 고객 정보 확인 -->
	<script type="text/javascript">
		$('#checkUserinfoBtn').on('click', function() {
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
		
		$('#cancelCheckUserinfoBtn, #closeModal').click(function() {
	        $('.check_userinfo_bg').hide();
	    });
	</script>
</body>
</html>