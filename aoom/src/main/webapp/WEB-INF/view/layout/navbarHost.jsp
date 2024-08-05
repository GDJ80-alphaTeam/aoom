<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="fixed">
	<header>
		<div class="inner">
			<ul class="nav_menu">
				<a href="${pageContext.request.contextPath}/user/myPage">
					<li>
						<p>마이페이지</p>
					</li>
				</a>
				<a class="dropdown-item" href="${pageContext.request.contextPath}/message/messageList">
					<li>
						<p>메세지</p>
					</li>
				</a>
				<a href="${pageContext.request.contextPath}/guest/bookList">
					<li>
						<p>숙소예약목록</p>
					</li>
				</a>
				<a href="${pageContext.request.contextPath}/user/wishList">
					<li>
						<p>위시리스트</p>
					</li>
				</a>
				<a id="signoutBtn">
					<li>
						<p>로그아웃</p>
					</li>
				</a>
			</ul>
			<!-- //nav_menu -->
			<a href="${pageContext.request.contextPath}/main" class="logo"> <img
				src="/style/img/n_1.png" alt="AOOM로고">
			</a>
			<!-- //logo -->
			<div class="user">
				<div class="profile">
					<img src="${sessionScope.userInfo.userImage }" alt="유저 프로필"
						style="width: 35px; height: 35px;">
					<p>${sessionScope.userInfo.userName }</p>
					<i class="fa-solid fa-bars"></i>
				</div>
				<!-- //profile -->
			</div>
			<!--//user -->
		</div>
		<!-- //inner -->
	</header>
	<!--//header-->
</div>
<!-- //fixed -->

<script type="text/javascript">
    // 로그아웃 기능
    $('#signoutBtn').click(function() {
        $.ajax({
            url: '/member/ajaxSignout',
            method: 'post',
            success: function(response){
                if(response === "success") {
                    alert('로그아웃 되었습니다.');
                    window.location.href = '/main';
                }else{
                    alert('로그아웃에 실패하였습니다.');
                }
            }
        })
    })
</script>