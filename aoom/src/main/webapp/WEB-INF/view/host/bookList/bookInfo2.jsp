<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예약상세보기</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/82b4a4fcad.js"></script>
    <script src="/style/js/roomManage.js" defer></script>
    <link rel="stylesheet" href="/style/css/roomManage.css">
    <link rel="stylesheet" href="/style/css/common.css">
    
    <script src="/style/js/navbarSub.js" defer></script>
    <link rel="stylesheet" href="/style/css/navSub.css">
</head>
<style>
	.pinkBtn {
		width: 140px;
		height: 48px;
		display: inline-block; /* 링크를 블록처럼 취급하여 width와 height가 적용되도록 함 */
		border: 1px solid #ed5977;
		background: #ed5977;
		border-radius: 8px;
		text-align: center; /* 텍스트를 가운데 정렬 */
		line-height: 48px; /* 세로 중앙 정렬을 위해 라인 높이를 버튼 높이와 동일하게 설정 */
		text-decoration: none; /* 링크의 기본 밑줄 제거 */
		color: #ed5977; /* 텍스트 색상 설정 */
	}
	
	.whiteBtn {
		width: 140px;
		height: 48px;
		display: inline-block; /* 링크를 블록처럼 취급하여 width와 height가 적용되도록 함 */
		border: 1px solid #ed5977;
		background: #fff;
		border-radius: 8px;
		text-align: center; /* 텍스트를 가운데 정렬 */
		line-height: 48px; /* 세로 중앙 정렬을 위해 라인 높이를 버튼 높이와 동일하게 설정 */
		text-decoration: none; /* 링크의 기본 밑줄 제거 */
		color: #ed5977; /* 텍스트 색상 설정 */
	}
	
	.pinkBtn span {
		color: #fff;
	}
	
	.whiteBtn span {
		color: #000;
	}
	
	table, th, td {
		text-align: center;
		vertical-align: middle;
	}
	
	.inner_nav ul li a {
		width: auto;
		display: block;
	}
</style>
<body>

	<!-- 네비게이션바 -->
	<jsp:include page="/WEB-INF/view/layout/navbarSub.jsp"></jsp:include>
	
    <div class="inner">
    	
		<!-- 호스트 모드 메뉴 -->
        <div class="inner_nav">
            <ul>
                <li><a href="/host/main">메인</a></li>
                <li><a href="/host/calendar">달력</a></li>
                <li><a href="/host/roomManage">숙소 관리</a></li>
                <li class="active"><a href="/host/bookList">예약 목록</a></li>
                <li><a href="/host/revenue">수입</a></li>
            </ul>
        </div>
	
		<br><br>
	
		<!-- 예약상세보기 폼 -->
		<h4>예약상세보기</h4>
		
		<br><br><br>
		
		<table>
			<tr>
				<td style="width: 50px;">
				</td>
				<td>
					<img alt="" src="${bookInfo.mainImage }" style="width: 250px; height: 200px; border-radius: 30px;">
				</td>
				<td style="width: 50px;"></td>
				<td>
					<table>
						<tr>
							<th style="width: 200px;">게스트</th>
							<th style="width: 150px;">연락처</th>
							<th style="width: 65px;">인원수</th>
							<th style="width: 55px;">가격</th>
							<th style="width: 75px;">체크인</th>
							<th style="width: 75px;">체크아웃</th>
							<th style="width: 100px;">상태</th>
						</tr>
						<tr>
							<td>${bookInfo.userId }</td>
							<td>${bookInfo.userPhone }</td>
							<td>${bookInfo.stayPeople }</td>
							<td>${bookInfo.totalPrice }</td>
							<td>${bookInfo.checkIn }</td>
							<td>${bookInfo.checkOut }</td>
							<c:if test="${bookInfo.bookstatCode == 'bst01'}">
	                       		<td>예약대기</td>
		                    </c:if>
		                    <c:if test="${bookInfo.bookstatCode == 'bst02'}">
		                        <td>이용전</td>
		                    </c:if>
		                    <c:if test="${bookInfo.bookstatCode == 'bst03'}">
		                        <td>이용후</td>
		                    </c:if>
		                    <c:if test="${bookInfo.bookstatCode == 'bst04'}">
		                        <td>후기작성완료</td>
		                    </c:if>
		                    <c:if test="${bookInfo.bookstatCode == 'bst05'}">
		                        <td>예약취소</td>
		                    </c:if>
						</tr>
						<tr style="height: 40px;">
						</tr>
						<tr>
							<td>숙소 아이디</td>
							<td>숙소 이름</td>
							<td colspan="5">숙소 위치</td>
						</tr>
						<tr>
							<td><a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${bookInfo.roomId }">${bookInfo.roomId }</a></td>
							<td><a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${bookInfo.roomId }">${bookInfo.roomName }</a></td>
							<td colspan="5">${bookInfo.address }</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		
	</div>
	
	<br><br><br>
	
	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/view/layout/footer.jsp"></jsp:include>
</body>
</html>