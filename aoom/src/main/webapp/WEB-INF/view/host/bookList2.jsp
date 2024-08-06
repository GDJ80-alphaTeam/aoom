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
    <script src="/style/js/navbarSub.js" defer></script>
    <link rel="stylesheet" href="/style/css/navSub.css">
    <link rel="stylesheet" href="/style/css/roomManage.css">
    <link rel="stylesheet" href="/style/css/common.css">
    <link rel="stylesheet" href="/style/css/hostBookList.css">
</head>
<body>
	
	<!-- 네비게이션바 -->
	<jsp:include page="/WEB-INF/view/layout/navbarSub.jsp"></jsp:include>
	
	<div class="inner">
	    <!-- 메뉴 -->
	    <div class="inner_nav">
	        <ul>
	            <li><a href="/host/main">메인</a></li>
	            <li><a href="/host/calendar">달력</a></li>
	            <li><a href="/host/roomManage">숙소 관리</a></li>
	            <li class="active"><a href="/host/bookList">예약 목록</a></li>
	            <li><a href="/host/revenue">수입</a></li>
	        </ul>
	    </div>
	   
	    <!-- 컨텐츠 시작 -->
	    <div class="r_manage">
	        
	        <div class="r_m_top">
	            <h4>예약받은목록</h4>
	        </div>
	   
	        <!-- 검색 -->
	        <form action="${pageContext.request.contextPath}/host/bookList" method="get">
	            <div class="search-container">
	                <!-- 호스팅한 숙소 목록 -->
	                <select id="selectRoom" name="selectRoom">
	                    <option value="all">===전체선택===</option>
	                    <!-- 숙소 상태가 활성화인것만 나오게 설정 -->
	                    <c:forEach var="room" items="${roomList}">
	                        <c:if test="${room.roomstatCode == 'rst03'}">
	                            <c:if test="${room.roomId == selectRoom}">
	                                <option value="${room.roomId}" selected="selected">${room.roomName}</option>
	                            </c:if>
	                            <c:if test="${room.roomId != selectRoom}">
	                                <option value="${room.roomId}">${room.roomName}</option>
	                            </c:if>
	                        </c:if>
	                    </c:forEach>
	                </select>
	                
	                <!-- 날짜 지정 선택 -->
	                <div class="calendar calendar1 chk_i">
	                    <div class="calendar_input">
	                        <div class="left_box" id="datePicker">
	                            <label for="startDate">체크인</label>
	                            <input type="text" class="selected-date" id="startDate" name="startDate" autocomplete="off" placeholder="체크인날짜" value="${startDate}">
	                        </div>
	                        <i class="fa-regular fa-calendar"></i>
	                    </div>
	                </div>
	
	                <div class="calendar calendar1 chk_i">
	                    <div class="calendar_input">
	                        <div class="left_box" id="datePicker">
	                            <label for="endDate">체크아웃</label>
	                            <input type="text" class="selected-date" id="endDate" name="endDate" autocomplete="off" placeholder="체크아웃날짜" value="${endDate}">
	                            <input type="hidden" id="roomId" name="roomId">
	                        </div>
	                        <i class="fa-regular fa-calendar"></i>
	                    </div>
	                </div>
	
	                <!-- 예약 상태 선택 -->
	                <div class="status-container">
	                    <input type="radio" id="all" name="bookStat" value="all" <c:if test="${bookStat == 'all'}">checked="checked"</c:if>>
	                    <label for="all">전체</label>
	                    
	                    <input type="radio" id="bst02" name="bookStat" value="bst02" <c:if test="${bookStat == 'bst02'}">checked="checked"</c:if>>
	                    <label for="bst02">이용전</label>
	                    
	                    <input type="radio" id="bst03" name="bookStat" value="bst03" <c:if test="${bookStat == 'bst03'}">checked="checked"</c:if>>
	                    <label for="bst03">이용후</label>
	                    
	                    <input type="radio" id="bst05" name="bookStat" value="bst05" <c:if test="${bookStat == 'bst05'}">checked="checked"</c:if>>
	                    <label for="bst05">예약취소</label>
	                </div>
	                
	                <button class="pinkBtn" type="submit"><span>선택</span></button>
	            </div>
	        </form>
	        
	        <!-- 예약받은 목록 출력 -->
	        <div class="view_style">
	            <div class="r_m_list view">
	                <ul class="list_style">
	                    <li class="list_top">
	                        <div class="one">숙소이름</div>
	                        <div class="two">게스트</div>
	                        <div class="three">체크인</div>
	                        <div class="four">체크아웃</div>
	                        <div class="five">예약상태</div>
	                        <div class="six">숙박비용</div>
	                        <div class="seven">비고</div>
	                    </li>
	                    <c:forEach var="bookingList" items="${bookingList }">
	                        <li class="list_con">
	                            <div class="one">${bookingList.roomName}</div>
	                            <div class="two">${bookingList.guestId}</div>
	                            <div class="three">${bookingList.checkIn}</div>
	                            <div class="four">${bookingList.checkOut}</div>
	                            <c:if test="${bookingList.bookstatCode == 'bst01'}">
	                                <div class="five">예약대기</div>
	                            </c:if>
	                            <c:if test="${bookingList.bookstatCode == 'bst02'}">
	                                <div class="five">이용전</div>
	                            </c:if>
	                            <c:if test="${bookingList.bookstatCode == 'bst03'}">
	                                <div class="five">이용후</div>
	                            </c:if>
	                            <c:if test="${bookingList.bookstatCode == 'bst04'}">
	                                <div class="five">후기작성완료</div>
	                            </c:if>
	                            <c:if test="${bookingList.bookstatCode == 'bst05'}">
	                                <div class="five">예약취소</div>
	                            </c:if>
	                            <div class="six">${bookingList.totalPrice}원</div>
	                            <div class="seven"><a href="${pageContext.request.contextPath}/host/bookList/bookInfo?bookingId=${bookingList.bookingId }">상세보기</a></div>
	                        </li>
	                    </c:forEach>
	                </ul>
	            </div>
	        </div>
	        
	        <!-- 페이징버튼 -->
	        <div class="pagination">
	            <c:choose>
	                <c:when test="${lastPage == 0 }"></c:when>
	                <c:otherwise>
	                    <nav>
	                        <ul>
	                            <li>
	                            <!-- paging 이전버튼 --> 
	                                <c:choose>
	                                    <c:when test="${currentPage == 1}">
	                                        <button class="prev_btn" type="button" disabled="disabled">
	                                            <i class="fa-solid fa-chevron-left"></i>
	                                        </button>
	                                    </c:when>
	                                    <c:otherwise>
	                                        <button class="prev_btn" type="button" onclick="window.location.href='/host/bookList?selectRoom=${selectRoom }&startDate=${startDate }&endDate=${endDate }&bookStat=${bookStat }&currentPage=${currentPage - 1}'">
	                                            <i class="fa-solid fa-chevron-left"></i>
	                                        </button>
	                                    </c:otherwise>
	                                </c:choose>
	                            </li>
	
	                            <!-- paging 숫자버튼 -->
	                            <c:forEach var="i" begin="1" end="${lastPage}">
	                                <li>
	                                    <c:choose>
	                                        <c:when test="${currentPage == i}">
	                                            <button class="page_btn active" type="button" onclick="window.location.href='/host/bookList?selectRoom=${selectRoom }&startDate=${startDate }&endDate=${endDate }&bookStat=${bookStat }&currentPage=${i}'">
	                                                ${i}
	                                            </button>
	                                        </c:when>
	                                        <c:otherwise>
	                                            <button class="page_btn" type="button" onclick="window.location.href='/host/bookList?selectRoom=${selectRoom }&startDate=${startDate }&endDate=${endDate }&bookStat=${bookStat }&currentPage=${i}'">
	                                                ${i}
	                                            </button>
	                                        </c:otherwise>
	                                    </c:choose></li>
	                            </c:forEach>
	
	                            <!-- paging 다음버튼 -->
	                            <li>
	                                <c:choose>
	                                    <c:when test="${currentPage == lastPage}">
	                                        <button class="next_btn" type="button" disabled="disabled">
	                                            <i class="fa-solid fa-chevron-right"></i>
	                                        </button>
	                                    </c:when>
	                                    <c:otherwise>
	                                        <button class="next_btn" type="button" onclick="window.location.href='/host/bookList?selectRoom=${selectRoom }&startDate=${startDate }&endDate=${endDate }&bookStat=${bookStat }&currentPage=${currentPage + 1}'">
	                                            <i class="fa-solid fa-chevron-right"></i>
	                                        </button>
	                                    </c:otherwise>
	                                </c:choose>
	                            </li>
	                        </ul>
	                    </nav>
	                </c:otherwise>
	            </c:choose>
	        </div>
	        
	        <br>
	        
	    </div>
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
