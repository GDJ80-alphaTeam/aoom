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
    <title>개인정보</title>
    <script src="https://kit.fontawesome.com/82b4a4fcad.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="/style/js/navbarSub.js" defer></script>
	
    <link rel="stylesheet" href="/style/css/common.css">
    <link rel="stylesheet" href="/style/css/userInfo.css">
    <link rel="stylesheet" href="/style/css/navSub.css">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/layout/navbarSub.jsp"></jsp:include>
	<div class="inner" style="width: 660px;">
		<div class="user_info">
			<form id="editUserInfoForm">
				<h1>개인정보 수정</h1>
				<br>
				
				<div>
					<h5><b>이름</b></h5>
					<input type="text" id="editUserName" name="userName" value="${sessionScope.userInfo.userName }" onkeyup="chk_han('editUserName')" required="required"> 
					<br>
				</div>
				<hr>
				
				<div>
					<h5><b>아이디</b></h5>
					<input type="text" name="userId" value="${sessionScope.userInfo.userId}" readonly="readonly" style="border-width: 0; outline: none;">
					<br>
				</div>
				<hr>
				
				<div>
					<h5><b>생년월일</b></h5>
					<input type="text" value="${sessionScope.userInfo.userBirth }" readonly="readonly" style="border-width: 0; outline: none;">
					<br>
				</div>
				<hr>
				
				<div>
					<h5><b>전화번호</b></h5>
					<input type="text" name="userPhone" id="editUserPhone" value="${sessionScope.userInfo.userPhone }" required="required" placeholder="ex)010-1111-1111">
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
				<hr>
				
				<div>
					<h5><b>계정 탈퇴</b></h5>
					<a onclick="$('.secession_bg').show();" style="color: blue;">계정 탈퇴</a>
					<br>
				</div>
				<hr>
				
				<div class="c_e_btn">
					<button class="cancel_btn" type="button" onclick="window.location.href='/user/myPage'">나가기</button>
					<button class="edit_btn" type="button" id="editBtn"><span style="color: white;">수정하기</span></button>
				</div>
			</form>
		</div>
	</div>
	
	<!-- 계정 탈퇴 모달 -->
	<div class="secession_bg" style="display: none;">
	    <div class="secession">
	        <div class="secession_t">
	            <i class="fa-solid fa-xmark" id="closeModal"></i>
	            <p>계정 탈퇴</p>
	        </div>
	        <ul class="secession_b">
	            <li>
	                <form id="checkSecessionForm">
                        <div>
                            <h6><b>아이디</b></h6>
                            <input type="text" id="secessionUserId" name="userId" value="${sessionScope.userInfo.userId}" readonly="readonly">
                            <h6><b>비밀번호</b></h6>
                            <input type="password" id="secessionUserPw" name="userPw">
                        </div>
	                    <div class="c_b_btn">
	                        <button class="c_btn" type="button" id="cancelSecessionBtn">취소</button>
	                        <button class="d_btn"  type="button" id="secessionBtn">탈퇴하기</button>
	                    </div>
	                </form>
	            </li>
	        </ul>
	    </div>
	</div>
	
	<!-- 개인정보 수정 -->
	<script type="text/javascript">
		// 전화번호 정규식
        // const phoneRegex = /^\d{3}-\d{4}-\d{4}$/;
		
		// 수정 버튼 클릭시
		$('#editBtn').on('click', function() {
			let editUserPw = $('#editUserPw').val();
			let editUserPwcheck = $('#editUserPwcheck').val();
			
			if ($('#editUserName').val() == '') {
				alert('이름을 입력해주세요.');
				$('#editUserName').focus();
				return false;
			}

			if ($('#editUserPhone').val() == '') {
				alert('전화번호를 입력해주세요.');
				$('#editUserPhone').focus();
				return false;
			}
	        
			if(!phoneRegex.test($('#editUserPhone').val())) {
				alert('전화번호 형식이 다릅니다');
				return false;
			}
			
			if (editUserPw !== '' || editUserPwcheck !== '') {
				// 비밀번호 유효성검사
				if (!PWCHECK.test(editUserPw)) {
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
				url : '/user/userInfo/ajaxEditUserInfo',
				method : 'post',
				data : $('#editUserInfoForm').serialize(),
				success : function(response) {
					// 					console.log(response);
					window.location.href = '/user/userInfo';
					alert(response.message);
				}
			});
		});
	</script>
	
	<script type="text/javascript">
		// 한글을 제외한 값을 입력시 ''로교체
		function chk_han(id) {
			var regexp = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
			var value = $("#" + id).val();
			if (regexp.test(value)) {
				$("#" + id).val(value.replace(regexp, ''));
			}
		}
	</script>
	
	<!-- 계정 탈퇴 -->
	<script type="text/javascript">
		$('#secessionBtn').on('click', function() {
			$.ajax({
				url: '/user/userInfo/ajaxSecessionUser',
				method: 'post',
				data: $('#checkSecessionForm').serialize(),
				success: function(response) {
					console.log(response);
					if(response.result) {
						alert(response.message);
						window.location.href = '/main';
					} else {
						alert(response.message);
						$('#userPw').focus();
					}
				}
			});
		});
		
		$('#cancelSecessionBtn, #closeModal').click(function() {
	        $('.secession_bg').hide();
	    });
	</script>
</body>
</html>