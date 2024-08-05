<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예약받은목록</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ko.js"></script>
    <link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_orange.css">
    
    <script src="https://kit.fontawesome.com/82b4a4fcad.js"></script>
    <script src="/style/js/roomManage.js" defer></script>
    <link rel="stylesheet" href="/style/css/roomManage.css">
    <link rel="stylesheet" href="/style/css/common.css">
    <link rel="stylesheet" href="/style/css/hostNavbar.css">
</head>
<style>
	select{
	    width: 134px;
	    height: 100%;
	    padding: 5px;
	    border-radius: 5px;
	}
	
	
</style>
<body>

	<!-- 네비게이션바 -->
	<jsp:include page="/WEB-INF/view/layout/navbarHost.jsp"></jsp:include>
	
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
       
	<!-- 검색 -->
	<form action="${pageContext.request.contextPath}/host/bookList" method="get">
	    <div>
	    
			<!-- 호스팅한 숙소 목록 -->
	        <select id="selectRoom" name="selectRoom">
	        	<option value="all">===전체선택===</option>
	            <!-- 숙소 상태가 활성화인것만 나오게 설정 -->
	            <c:forEach var="room" items="${roomList }">
	                <c:if test="${room.roomstatCode == 'rst03' and room.roomstatCode eq 'rst03'}">
	                    <c:if test="${room.roomId == selectRoom}">
	                        <option value="${room.roomId }" selected="selected">${room.roomName }</option>
	                    </c:if>
	                    <c:if test="${room.roomId != selectRoom}">
	                        <option value="${room.roomId }">${room.roomName }</option>
	                    </c:if>
	                </c:if>
	            </c:forEach>
	        </select>
	        
			<!-- 날짜 지정 선택 -->
			<input type="text" id="startDate" name="startDate" autocomplete="off" placeholder="체크인날짜" value="${startDate }">
			<input type="text" id="endDate" name="endDate" autocomplete="off" placeholder="체크아웃날짜" value="${endDate }">
			
			<!-- 예약 상태 선택 -->
			<input type="radio" id="all" name="bookStat" value="all" <c:if test="${bookStat == 'all'}">checked="checked"</c:if> >
			<label for="all">전체</label>
			
			<input type="radio" id="bst02" name="bookStat" value="bst02" <c:if test="${bookStat == 'bst02'}">checked="checked"</c:if> >
			<label for="bst02">이용전</label>
			
			<input type="radio" id="bst03" name="bookStat" value="bst03" <c:if test="${bookStat == 'bst03'}">checked="checked"</c:if> >
			<label for="bst03">이용후(+후기작성완료)</label>
			
			<input type="radio" id="bst05" name="bookStat" value="bst05" <c:if test="${bookStat == 'bst05'}">checked="checked"</c:if> >
			<label for="bst05">예약취소</label>
			
		    <button type="submit">선택</button>
	    </div>
	</form>

	<h1>예약받은목록</h1>
	<table class="table">
		<thead>
			<tr>
				<th>숙소이름</th>
				<th>게스트</th>
				<th>체크인</th>
				<th>체크아웃</th>
				<th>예약상태</th>
				<th>숙박가격</th>
				<th>비고</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="bookingList" items="${bookingList }">
				<tr>
					<td>${bookingList.roomName}</td>
					<td>${bookingList.guestId}</td>
					<td>${bookingList.checkIn}</td>
					<td>${bookingList.checkOut}</td>
                    <c:if test="${bookingList.bookstatCode == 'bst01'}">
                        <td>예약대기</td>
                    </c:if>
                    <c:if test="${bookingList.bookstatCode == 'bst02'}">
                        <td>이용전</td>
                    </c:if>
                    <c:if test="${bookingList.bookstatCode == 'bst03'}">
                        <td>이용후</td>
                    </c:if>
                    <c:if test="${bookingList.bookstatCode == 'bst04'}">
                        <td>후기작성완료</td>
                    </c:if>
                    <c:if test="${bookingList.bookstatCode == 'bst05'}">
                        <td>예약취소</td>
                    </c:if>
					<td>${bookingList.totalPrice}원</td>
					<td><a href="${pageContext.request.contextPath}/host/bookList/bookInfo?bookingId=${bookingList.bookingId }">상세보기</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<c:choose>
		<c:when test="${lastPage == 0 }"></c:when>
		<c:otherwise>
			<nav>
				<ul>
					<li>
					<!-- paging 이전버튼 --> 
						<c:choose>
							<c:when test="${currentPage == 1}">
								<button type="button">이전</button>
							</c:when>
							<c:otherwise>
								<buttontype="button" onclick="window.location.href='/host/bookList?selectRoom=${selectRoom }&startDate=${startDate }&endDate=${endDate }&bookStat=${bookStat }&currentPage=${currentPage - 1}'">이전</button>
							</c:otherwise>
						</c:choose>
					</li>

					<!-- paging 숫자버튼 -->
					<c:forEach var="i" begin="1" end="${lastPage}">
						<li>
							<c:choose>
								<c:when test="${currentPage == i}">
									<button type="button" onclick="window.location.href='/host/bookList?selectRoom=${selectRoom }&startDate=${startDate }&endDate=${endDate }&bookStat=${bookStat }&currentPage=${i}'">${i}</button>
								</c:when>
								<c:otherwise>
									<button type="button" onclick="window.location.href='/host/bookList?selectRoom=${selectRoom }&startDate=${startDate }&endDate=${endDate }&bookStat=${bookStat }&currentPage=${i}'">${i}</button>
								</c:otherwise>
							</c:choose></li>
					</c:forEach>

					<!-- paging 다음버튼 -->
					<li>
						<c:choose>
							<c:when test="${currentPage == lastPage}">
								<button type="button">다음</button>
							</c:when>
							<c:otherwise>
								<button type="button" onclick="window.location.href='/host/bookList?selectRoom=${selectRoom }&startDate=${startDate }&endDate=${endDate }&bookStat=${bookStat }&currentPage=${currentPage + 1}'">다음</button>
							</c:otherwise>
						</c:choose>
					</li>
				</ul>
			</nav>
		</c:otherwise>
	</c:choose>

	</div><!-- inner close -->
	
	<!-- 푸터 -->
	<jsp:include page="/WEB-INF/view/layout/footer.jsp"></jsp:include>

	<script type="text/javascript">
	
		// 달력 출력
		let startDate = flatpickr('#startDate');
		let endDate = flatpickr('#endDate');
        
	</script>
</body>
</html>