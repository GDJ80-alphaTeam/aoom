<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<form id="filterForm">
	<div class="filter_bg">
	     <div class="filter">
	         <div class="filter_t">
	             <i class="fa-solid fa-xmark"></i>
	             <p>필터</p>
	         </div>
	         <ul class="filter_contents">
	             <li>
	                 <h2>가격</h2>
	                 <p>1박 요금( 수수료 및 세금 포함)</p>
	                 <div class="price_box">
	                     <input type="number" min="30000" id="lowPrice" name="lowPrice" placeholder="최소 가격" value="30000">
	                     <input type="number" min="30000" id="highPrice" name="highPrice" placeholder="최대 가격" value="30000">
	                 </div>
	             </li>
	             <li>
	                 <h2>숙소 유형</h2>
	                 <p>방, 집 전체 등 원하는 숙소 유형을 검색해보세요.</p>
	                 <div class="click_box">
	                 	 <input type="hidden" id="roomtypeCode" name="roomtypeCode" value="all">
	                     <button type="button" id="allHouse" class="active">전체 보기</button>
	                     <button type="button" id="guestHouse">게스트 하우스</button>
	                     <button type="button" id="normalHouse">일반 숙소</button>
	                 </div>
	             </li>
	             <li>
	                 <h2>침실 · 침대 · 화장실 </h2>
	                 <div class="bedroom">
	                     <p>침실</p>
	                     <input type="hidden" id="totalSpace" name="totalSpace" value="0">
	                     <button type="button" id="totalSpace0" class="not active">상관없음</button>
	                     <button type="button" id="totalSpace1">1</button>
	                     <button type="button" id="totalSpace2">2</button>
	                     <button type="button" id="totalSpace3">3</button>
	                     <button type="button" id="totalSpace4">4</button>
	                     <button type="button" id="totalSpace5">5+</button>
	                 </div>
	                 <div class="bed">
	                     <p>침대</p>
	                     <input type="hidden" id="totalBed" name="totalBed" value="0">
	                     <button type="button" id="totalBed0" class="not active">상관없음</button>
	                     <button type="button" id="totalBed1">1</button>
	                     <button type="button" id="totalBed2">2</button>
	                     <button type="button" id="totalBed3">3</button>
	                     <button type="button" id="totalBed4">4</button>
	                     <button type="button" id="totalBed5">5+</button>
	                 </div>
	                 <div class="restroom">
	                     <p>화장실</p>
	                     <input type="hidden" id="totalBath" name="totalBath" value="0">
	                     <button type="button" id="totalBath0" class="not active">상관없음</button>
	                     <button type="button" id="totalBath1">1</button>
	                     <button type="button" id="totalBath2">2</button>
	                     <button type="button" id="totalBath3">3</button>
	                     <button type="button" id="totalBath4">4</button>
	                     <button type="button" id="totalBath5">5+</button>
	                 </div>
	             </li>
	             <li>
	                 <h2>편의시설</h2>
	                 <ul>
	                 	 <c:forEach var="amenitie" items="${amenities}">
		                     <li class="chk"> <input type="checkbox" id="${amenitie.codeKey}" name="amenities" value="${amenitie.codeKey}"> <label for="check_btn"><span>${amenitie.codeName}</span></label></li>
	                 	 </c:forEach>
	                 </ul>
	             </li>
	         </ul>
	         <div class="filter_b">
	             <button type="button" id="clearFilter">초기화</button>
	             <button type="button" id="btnFilter">필터적용</button>
	         </div>
	         <div class="custom-scrollbar">
	             <div class="custom-scrollbar-thumb"></div>
	         </div>
	     </div>
	</div>
</form>

<div class="fixed">
	<header>
	    <div class="inner">
			
			<!-- 메뉴 -->
			
			<!-- 로그인 안 했을 때 -->
			<c:if test="${sessionScope.userInfo.userId == null}">
		        <ul class="nav_menu">
		            <li><p>로그인</p></li>
		            <li><p>회원가입</p></li>
		            <li><p>숙소리스트</p></li>
		            <li><p>도움말센터</p></li>
		            <li><p>자주묻는질문</p></li>
		        </ul>
			</c:if>
			
			<!-- 로그인 했을 때 -->
			<c:if test="${sessionScope.userInfo.userId != null}">
		        <ul class="nav_menu">
	                <li><a href="${pageContext.request.contextPath}/user/myPage">마이페이지</a></li>
	                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/message/messageList">메시지</a></li>
	                <li><a href="${pageContext.request.contextPath}/guest/bookList">숙소예약목록</a></li>
	                <li><a href="${pageContext.request.contextPath}/user/wishList">위시리스트</a></li>
	                <li><a id="signoutBtn">로그아웃</a></li>
		        </ul>			
			</c:if>
			
			<!-- 로고 -->	
	        <a href="${pageContext.request.contextPath}/main" class="logo">
	            <img src="${pageContext.request.contextPath}/img/nav_1.png" alt="AOOM로고">
	        </a>
	
			<!-- 검색 -->
           	<form id="searchForm">
            	<ul class="search">
	                <li class="destination">
	                    <span>여행지</span>
	                    <input type="text" id="address" name="address" placeholder="여행지">
	                </li>
	                <li class="check_in">
	                    <span>체크인 / 체크아웃</span>
                        <input type="text" id="daterange" placeholder="체크인 / 체크아웃" autocomplete="off">
	                    <input type="hidden" id="startDate" name="startDate">
	                    <input type="hidden" id="endDate" name="endDate">
	                </li>
	                <li class="traveler">
	                    <span>여행자</span>
	                    <input type="number" id="usePeople" name="usePeople" min="1" placeholder="여행자">
	                </li>
	                <li class="s_btn">
	                    <button type="button" id="btnSearch"><img src="${pageContext.request.contextPath}/img/nav_2.png" alt="검색 아이콘"></button>
	                </li>
            	</ul>
            </form>
	
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
		                <%-- <img src="${pageContext.request.contextPath}/img/nav_3.png"> --%>
		                <p>&nbsp;로그인 해주세요</p>
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
	
	<!-- 카테고리 -->
    <div class="category">
        <ul class="inner">
            <li>
            	<a href="${pageContext.request.contextPath}/room/roomList?category=rct01" id="rct01">
            		<c:if test="${param.category != 'rct01'}">
		                <img src="${pageContext.request.contextPath}/img/roomlist_1.png" alt="골프장">
            		</c:if>
            		<c:if test="${param.category == 'rct01'}">
		                <img src="${pageContext.request.contextPath}/img/step1_1on.png" alt="골프장">
            		</c:if>
            	</a>
            	<a href="${pageContext.request.contextPath}/room/roomList?category=rct01" id="rct01">
	                <span>골프장</span>
            	</a>
            </li>
            <li>
            	<a href="${pageContext.request.contextPath}/room/roomList?category=rct02" id="rct02">
	                <c:if test="${param.category != 'rct02'}">
		                <img src="${pageContext.request.contextPath}/img/roomlist_2.png" alt="국립공원">
            		</c:if>
            		<c:if test="${param.category == 'rct02'}">
		                <img src="${pageContext.request.contextPath}/img/step1_2on.png" alt="골프장">
            		</c:if>
            	</a>
            	<a href="${pageContext.request.contextPath}/room/roomList?category=rct02" id="rct02">
	                <span>국립공원</span>
            	</a>
            </li>
            <li>
            	<a href="${pageContext.request.contextPath}/room/roomList?category=rct03" id="rct03">
	                <c:if test="${param.category != 'rct03'}">
		                <img src="${pageContext.request.contextPath}/img/roomlist_3.png" alt="농장">
            		</c:if>
            		<c:if test="${param.category == 'rct03'}">
		                <img src="${pageContext.request.contextPath}/img/step1_3on.png" alt="골프장">
            		</c:if>
            	</a>
            	<a href="${pageContext.request.contextPath}/room/roomList?category=rct03" id="rct03">
	                <span>농장</span>
            	</a>
            </li>
            <li>
            	<a href="${pageContext.request.contextPath}/room/roomList?category=rct04" id="rct04">
	                <c:if test="${param.category != 'rct04'}">
		                <img src="${pageContext.request.contextPath}/img/roomlist_4.png" alt="최고의 전망">
            		</c:if>
            		<c:if test="${param.category == 'rct04'}">
		                <img src="${pageContext.request.contextPath}/img/step1_4on.png" alt="골프장">
            		</c:if>
            	</a>
            	<a href="${pageContext.request.contextPath}/room/roomList?category=rct04" id="rct04">
	                <span>최고의 전망</span>
            	</a>
            </li>
            <li>
            	<a href="${pageContext.request.contextPath}/room/roomList?category=rct05" id="rct05">
	                <c:if test="${param.category != 'rct05'}">
		                <img src="${pageContext.request.contextPath}/img/roomlist_5.png" alt="캠핑장">
            		</c:if>
            		<c:if test="${param.category == 'rct05'}">
		                <img src="${pageContext.request.contextPath}/img/step1_5on.png" alt="골프장">
            		</c:if>
            	</a>
            	<a href="${pageContext.request.contextPath}/room/roomList?category=rct05" id="rct05">
	                <span>캠핑장</span>
            	</a>
            </li>
            <li>
            	<a href="${pageContext.request.contextPath}/room/roomList?category=rct06" id="rct06">
	                <c:if test="${param.category != 'rct06'}">
		                <img src="${pageContext.request.contextPath}/img/roomlist_6.png" alt="컨테이너 하우스">
            		</c:if>
            		<c:if test="${param.category == 'rct06'}">
		                <img src="${pageContext.request.contextPath}/img/step1_6on.png" alt="골프장">
            		</c:if>
            	</a>
            	<a href="${pageContext.request.contextPath}/room/roomList?category=rct06" id="rct06">
	                <span>컨테이너 하우스</span>
            	</a>
            </li>
            <li>
            	<a href="${pageContext.request.contextPath}/room/roomList?category=rct07" id="rct07">
	                <c:if test="${param.category != 'rct07'}">
		                <img src="${pageContext.request.contextPath}/img/roomlist_7.png" alt="호수 근처">
            		</c:if>
            		<c:if test="${param.category == 'rct07'}">
		                <img src="${pageContext.request.contextPath}/img/step1_7on.png" alt="골프장">
            		</c:if>
            	</a>
            	<a href="${pageContext.request.contextPath}/room/roomList?category=rct07" id="rct07">
	                <span>호수 근처</span>
            	</a>
            </li>
            <li>
            	<a href="${pageContext.request.contextPath}/room/roomList?category=rct08" id="rct08">
	                <c:if test="${param.category != 'rct08'}">
		                <img src="${pageContext.request.contextPath}/img/roomlist_8.png" alt="풀빌라">
            		</c:if>
            		<c:if test="${param.category == 'rct08'}">
		                <img src="${pageContext.request.contextPath}/img/step1_8on.png" alt="골프장">
            		</c:if>
            	</a>
            	<a href="${pageContext.request.contextPath}/room/roomList?category=rct08" id="rct08">
	                <span>풀빌라</span>
            	</a>
            </li>
            <li>
            	<a href="${pageContext.request.contextPath}/room/roomList?category=rct09" id="rct09">
	                <c:if test="${param.category != 'rct09'}">
		                <img src="${pageContext.request.contextPath}/img/roomlist_9.png" alt="향토적인">
            		</c:if>
            		<c:if test="${param.category == 'rct09'}">
		                <img src="${pageContext.request.contextPath}/img/step1_9on.png" alt="골프장">
            		</c:if>
            	</a>
            	<a href="${pageContext.request.contextPath}/room/roomList?category=rct09" id="rct09">
	                <span>향토적인</span>
            	</a>
            </li>
            <li>
            	<a href="${pageContext.request.contextPath}/room/roomList?category=rct10" id="rct10">
	                <c:if test="${param.category != 'rct10'}">
		                <img src="${pageContext.request.contextPath}/img/roomlist_10.png" alt="오션뷰">
            		</c:if>
            		<c:if test="${param.category == 'rct10'}">
		                <img src="${pageContext.request.contextPath}/img/step1_10on.png" alt="골프장">
            		</c:if>
            	</a>
            	<a href="${pageContext.request.contextPath}/room/roomList?category=rct10" id="rct10">
	                <span>오션뷰</span>
            	</a>
            </li>
            <li>
            	<a href="${pageContext.request.contextPath}/room/roomList?category=rct11" id="rct11">
	                <c:if test="${param.category != 'rct11'}">
		                <img src="${pageContext.request.contextPath}/img/roomlist_11.png" alt="한옥">
            		</c:if>
            		<c:if test="${param.category == 'rct11'}">
		                <img src="${pageContext.request.contextPath}/img/step1_11on.png" alt="골프장">
            		</c:if>
            	</a>
            	<a href="${pageContext.request.contextPath}/room/roomList?category=rct11" id="rct11">
	                <span>한옥</span>
            	</a>
            </li>
            <li>
            	<a href="${pageContext.request.contextPath}/room/roomList?category=rct12" id="rct12">
	                <c:if test="${param.category != 'rct12'}">
		                <img src="${pageContext.request.contextPath}/img/roomlist_12.png" alt="전문가급 주방">
            		</c:if>
            		<c:if test="${param.category == 'rct12'}">
		                <img src="${pageContext.request.contextPath}/img/step1_12on.png" alt="골프장">
            		</c:if>
            	</a>
            	<a href="${pageContext.request.contextPath}/room/roomList?category=rct12" id="rct12">
	                <span>전문가급 주방</span>
            	</a>
            </li>
            <li class="filter">
                <button type="button">
                    <img src="${pageContext.request.contextPath}/img/roomlist_13.png" alt="필터">
                    <span>필터</span>
                </button>
            </li>
        </ul>
    </div>
	
</div>

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