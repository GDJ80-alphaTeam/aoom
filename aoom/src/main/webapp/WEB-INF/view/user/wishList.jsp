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
    <title>위시리스트</title>
    <script src="https://kit.fontawesome.com/82b4a4fcad.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="/style/js/navbarSub.js" defer></script>

    <link rel="stylesheet" href="/style/css/common.css">
    <link rel="stylesheet" href="/style/css/wishList.css">
    <link rel="stylesheet" href="/style/css/navSub.css">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	
	<jsp:include page="/WEB-INF/view/layout/navbarSub.jsp"></jsp:include>
	
	<div class="room_container inner" style="width: 1300px;">
	
		<br>
		<h2 style="margin-top: 140px;">${sessionScope.userInfo.userId}님의 위시리스트</h2>
		<br>
        <div class="room fade_in">
        
        <c:choose>
            <c:when test="${empty userWishList}">
                <p style="text-align: center; font-size: 18px; margin-top: 20px;">😭 위시리스트가 비었습니다 😭</p>
            </c:when>
            <c:otherwise>
                <!-- 숙소 출력 반복 -->
                <c:forEach var="room" items="${userWishList}" varStatus="status">
                    <c:if test="${status.count % 4 == 1}">
                        <ul>
                    </c:if>
                        <li>
                            <a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${room.roomId}">
                                <div class="img_box">
                                    <img src="${room.mainImage}" alt="숙소사진">
                                    <div class="heart_btn">
                                        <button type="button" name="wishListBtn_${room.roomId}" style="position: absolute; top: 0; right: 0; border: 0; background-color: transparent;">&#129505;</button>
                                            <c:set var="isWishRoom" value="false"></c:set>
                                            <c:forEach var="uwr" items="${userWishRoom }">
                                                <c:if test="${uwr.roomId == room.roomId }">
                                                    <c:set var="isWishRoom" value="true"></c:set>
                                                </c:if>
                                            </c:forEach>
                                            <c:if test="${isWishRoom}">
                                                &#129505;
                                            </c:if>
                                            <c:if test="${!isWishRoom}">
                                                &#129293;
                                            </c:if>
                                        </button>                                   
                                    </div>
                                </div>
                                <div class="txt_box">
                                    <div class="t_box_top">
                                        <div class="r_name">
                                            ${room.roomName}
                                        </div>
                                        <div class="r_star">
                                            <img src="${pageContext.request.contextPath}/img/roomlist_16.png" alt="별점">
                                            <span>${room.avg}</span>
                                        </div>
                                    </div>
                                    <div class="r_option">
                                        ${room.address}
                                    </div>
                                    <div class="r_price">
                                        ${room.defaultPrice} 원
                                    </div>
                                </div>
                            </a>
                        </li>
                    <c:if test="${status.count % 4 == 0 || status.last}">
                        <!-- 마지막 줄이 4개가 아닌 경우 빈 li 태그 추가 -->
                        <c:if test="${status.last}">
                            <c:choose>
                                <c:when test="${status.count % 4 == 1}">
                                    <li class="placeholder"></li>
                                    <li class="placeholder"></li>
                                    <li class="placeholder"></li>
                                </c:when>
                                <c:when test="${status.count % 4 == 2}">
                                    <li class="placeholder"></li>
                                    <li class="placeholder"></li>
                                </c:when>
                                <c:when test="${status.count % 4 == 3}">
                                    <li class="placeholder"></li>
                                </c:when>
                            </c:choose>
                        </c:if>
                        </ul>
                    </c:if>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        </div>
    </div>
	<!-- 위시리스트에 있는 숙소 제거 -->
	<script type="text/javascript">
		$('button[name^="wishListBtn_"]').click(function() {
			const wishListBtnRoomId = $(this).attr('name');
			const roomId = wishListBtnRoomId.split('_')[1];

			$.ajax({
				url : '/ajaxWishList',
				method : 'get',
				data : {
					'userId' : '${sessionScope.userInfo.userId}',
					'roomId' : roomId
				},
				success : function(response) {
					console.log(response);
					if (response.result) {
						alert(response.message);
						window.location.href = "/user/wishList";
					}
				}
			});
		});
	</script>
</body>
</html>