<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="fixed">
	<header>
	    <div class="inner">
			
			<!-- 메뉴 -->
			
			<!-- 로그인 안 했을 때 -->
			<c:if test="${sessionScope.userInfo.userId == null}">
		        <ul class="nav_menu">
		            <li><p>로그인</p></li>
		            <li><p>회원가입</p></li>
		            <li><p>자주묻는질문</p></li>
		        </ul>
			</c:if>
			
			<!-- 로그인 했을 때 -->
			<c:if test="${sessionScope.userInfo.userId != null}">
		        <ul class="nav_menu">
	                <li><a href="${pageContext.request.contextPath}/user/myPage">마이페이지</a></li>
	                <li><a href="#">메시지</a></li>
	                <li><a href="${pageContext.request.contextPath}/guest/bookList">숙소예약목록</a></li>
	                <li><a href="${pageContext.request.contextPath}/user/wishList">위시리스트</a></li>
	                <li><button class="dropdown-item" type="button" id="signoutBtn">로그아웃</button></li>
		        </ul>			
			</c:if>
			
			<!-- 로고 -->	
	        <a href="${pageContext.request.contextPath}/main" class="logo">
	            <img src="${pageContext.request.contextPath}/img/nav_1.png" alt="AOOM로고">
	        </a>
	
	        <div class="user">
	        
	        	<!-- 호스트모드 -->
	            <div class="host_mode">
	                <a href="${pageContext.request.contextPath}/host/main">
	                    호스트 모드
	                </a>
	            </div>
	            
	            <!-- 로그인 안 했을 때 -->
                <c:if test="${sessionScope.userInfo.userId == null}">
		            <div class="profile">
		                <img src="${pageContext.request.contextPath}/img/nav_3.png">
		                <p>로그인</p>
		                <i class="fa-solid fa-bars"></i>
		            </div>
                </c:if>
                
                <!-- 로그인 했을 때 -->
                <c:if test="${sessionScope.userInfo.userId != null}">
		            <div class="profile">
		                <img src="${sessionScope.userInfo.userImage}" style="width: 35px; height: 35px; border-radius: 50%; object-fit: cover; border: 1px solid black;">
		                <p>${sessionScope.userInfo.userName} 님</p>
		                <i class="fa-solid fa-bars"></i>
		            </div>                
                </c:if>
	            
	        </div>
	    </div>
	</header>
</div>

<!-- Login Modal -->
<jsp:include page="/WEB-INF/view/member/signin2.jsp"></jsp:include>

<!-- Signup Modal -->
<jsp:include page="/WEB-INF/view/member/signup2.jsp"></jsp:include>

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