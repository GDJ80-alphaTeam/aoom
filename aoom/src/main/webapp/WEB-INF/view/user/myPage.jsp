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
	<link rel="stylesheet" href="/style/css/userCommon.css">
	<script src="/style/js/navbarSub.js" defer></script>
</head>
<body>
    <!-- AOOM 네비게이션 바 -->
    <jsp:include page="/WEB-INF/view/layout/navbarSub.jsp"></jsp:include>
    
    <div class="my_p inner">
        <div class="my_p_top">
            <h2>마이페이지</h2>
            <h3><b>${sessionScope.userInfo.userName} 님</b> 환영합니다. <br>자유롭게 계정을 설정해보세요.</h3>
        </div><!-- //my_p_top -->
        <div class="my_p_bottom">
            <div class="mpb_left">
                <h4>내 프로필</h4>
                <div class="pro_box">
                    <div class="my_pro">
                        <img src="${sessionScope.userInfo.userImage}" alt="임시 이미지">
                    </div><!-- //my_pro -->
                    <h5>${sessionScope.userInfo.userName}</h5>
                    <p>${sessionScope.userInfo.userId}</p>
                </div><!-- //pro_box -->

                <div class="my_p_btn">
                    <button class="left" onclick="window.location.href='/user/profileUpdate?userId=${userInfo.userId}'">프로필 수정</button>
                        <button class="right" onclick="window.location.href='/user/profile?userId=${sessionScope.userInfo.userId}'">프로필 보기</button>
                </div><!-- //my_p_btn  -->
            </div><!-- //mpb_left -->
            <div class="mpb_right">
                <ul class="mpb_r_top">
                    <li onclick="$('.check_userinfo_bg').show();">
                        <div class="menu">
                            <img src="/style/img/pu_3.png" alt="개인정보 ">
                            <span>개인정보 </span>
                            <p>개인정보 및 연락처 변경 </p>
                        </div><!-- //menu -->
                        <i class="fas fa-chevron-right"></i>
                    </li>
                    <li>
                        <div class="menu">
                            <img src="/style/img/my_p1.png" alt="결제 및 대금 수령 ">
                            <span>결제 및 대금 수령 </span>
                            <p>결제수단 등록, 환불 관리 </p>
                        </div><!-- //menu -->
                        <i class="fas fa-chevron-right"></i>
                    </li>
                </ul><!-- //mpb_r_top -->
                <div class="mpb_r_bottom">
                    <img src="/style/img/cute_il3.png" alt="바다 배경과 캐릭터" class="pos fly">
                    <img src="/style/img/cute_il2.png" alt="바다 배경과 캐릭터" class="pos shake">
                    <img src="/style/img/cute_il1.png" alt="바다 배경과 캐릭터" class="pos body">
                    <img src="/style/img/cute_il.png" alt="바다 배경과 캐릭터">
                </div><!-- //mpb_r_bottom -->
            </div><!-- //mpb_right -->
        </div><!-- //my_p_bottom -->
    </div><!-- //inner -->
    
    <!-- footer -->
	<jsp:include page="/WEB-INF/view/layout/footer.jsp"></jsp:include>
	
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