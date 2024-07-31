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
                            <span><img alt="" src="${sessionScope.userInfo.userImage}" style="width:35px; height:35px;"></span>
                            <span>${sessionScope.userInfo.userName} 님</span>
                        </c:if>
                    </button>
                    <ul class="dropdown-menu">
                        <c:if test="${sessionScope.userInfo.userId == null}">
                            <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#loginModal">로그인</a></li>
                            <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#signupModal">회원가입</a></li>
                            <li><a class="dropdown-item" href="#">자주묻는질문</a></li>
                        </c:if>
                        <c:if test="${sessionScope.userInfo.userId != null}">
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/myPage">마이페이지</a></li>
                            <li><a class="dropdown-item" href="#">메시지</a></li>
                            <li><a class="dropdown-item" href="#">알림</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/guest/bookList">숙소예약목록</a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/user/wishList">위시리스트</a></li>
                            <li><a class="dropdown-item" href="#">자주묻는질문</a></li>
                            <li><button class="dropdown-item" type="button" id="signoutBtn">로그아웃</button></li>
                        </c:if>
                    </ul>
                </div>
            </form>
        </div>
    </div>
</nav>

<!-- Login Modal -->
<jsp:include page="/WEB-INF/view/member/signin.jsp"></jsp:include>


<!-- Signup Modal -->
<jsp:include page="/WEB-INF/view/member/signup.jsp"></jsp:include>

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

<style>
    .modal-backdrop {
        z-index: 1040; /* Bootstrap의 기본 모달 배경 z-index 설정 */
    }
    .modal {
        z-index: 1050; /* Bootstrap의 기본 모달 z-index 설정 */
    }
    .navbar {
        z-index: 1030; /* 네비게이션 바의 z-index를 모달보다 낮게 설정 */
    }
</style>