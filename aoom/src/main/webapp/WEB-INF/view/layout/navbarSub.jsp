<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
	<div class="container-fluid">
		<a class="navbar-brand" href="${pageContext.request.contextPath}/main">
			<img src="/image/etc/aoomLogo.jpg" style="width: 90; height: 30px;">
		</a>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0"></ul>
			<a class="me-3" href="${pageContext.request.contextPath}/host/main">호스트모드</a>
			<form class="d-flex">
				<div class="dropdown-center">
					<button class="btn btn-danger dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
					 	<c:if test="${sessionScope.userInfo.userId == null}">
					 		<span>로그인 하세요</span>
					 	</c:if>
					 	<c:if test="${sessionScope.userInfo.userId != null}">
						 	<span><img alt="" src="/image/etc/userDefault.png" style="width:35px; height:35px;"></span>
						 	<span>${sessionScope.userInfo.userName} 님</span>
					 	</c:if>
					</button>
					<ul class="dropdown-menu">
						<c:if test="${sessionScope.userInfo.userId == null}">
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/member/signin">로그인</a></li>
							<li><a class="dropdown-item" href="#">자주묻는질문</a></li>
						</c:if>
						<c:if test="${sessionScope.userInfo.userId != null}">
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/myPage">계정</a></li>
							<li><a class="dropdown-item" href="#">메시지</a></li>
							<li><a class="dropdown-item" href="#">알림</a></li>
							<li><a class="dropdown-item" href="${pageContext.request.contextPath}/guest/bookList">숙소예약목록</a></li>
							<li><a class="dropdown-item" href="#">관심목록</a></li>
							<li><a class="dropdown-item" href="#">자주묻는질문</a></li>
							<li><button class="dropdown-item" type="button" id="signoutBtn">로그아웃</button></li>
						</c:if>
					</ul>
				</div>
			</form>
		</div>
	</div>
</nav>

<script type="text/javascript">
	
	// 로그아웃 기능
	$('#signoutBtn').click(function() {
		
		$.ajax({
			url: '/member/ajaxSignout',
			method: 'post',
			success: function(response){
				if(response === "success") {
					alert('로그아웃 되었습니다.');
					window.location.href = '/member/signin';
				}else{
					alert('로그아웃에 실패하였습니다.');
				}
			}
		})
	})
	
</script>