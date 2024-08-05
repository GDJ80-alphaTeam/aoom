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
    <title>숙소 관리</title>
    <script src="https://kit.fontawesome.com/82b4a4fcad.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   	<link rel="stylesheet" href="https://uicdn.toast.com/chart/latest/toastui-chart.min.css" />
	<script src="https://uicdn.toast.com/chart/latest/toastui-chart.min.js"></script>
    
    
    <script src="/style/js/roomManage.js" defer></script>

    <link rel="stylesheet" href="/style/css/common.css">
    <link rel="stylesheet" href="/style/css/hostMain.css">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
</style>
<body>
	<!-- 네비게이션바 -->
    <div class="fixed">
        <header>
            <div class="inner">
                <ul class="nav_menu">
                    <li><p>계정</p></li>
                    <li><p>메세지</p></li>
                    <li><p>알림</p></li>
                    <li><p>숙소관리</p></li>
                    <li><p>관심목록</p></li>
                    <li><p>자주묻는질문</p></li>
                    <li><p>로그아웃</p></li>
                </ul>
                
                <a href="${pageContext.request.contextPath}/main" class="logo">
                    <img src="/style/img/n_1.png" alt="AOOM로고">
                </a>

                <div class="user">
                    <div class="profile">
                        <img src="${sessionScope.userInfo.userImage }" alt="유저 프로필">
                        <p>${sessionScope.userInfo.userName }</p>
                        <i class="fa-solid fa-bars"></i>
                    </div>
                </div>

            </div>
        </header>
    </div>

    <div class="inner">
    	
    	<!-- 메뉴 -->
        <div class="inner_nav">
            <ul>
                <li class="active"><a href="/host/main">메인</a></li>
                <li><a href="/host/calendar">달력</a></li>
                <li><a href="/host/roomManage">숙소 관리</a></li>
                <li><a href="/host/bookList">예약 목록</a></li>
                <li><a href="/host/revenue">수입</a></li>
            </ul>
        </div>
        
        <!-- 컨텐츠 시작 -->
        <div class="r_manage">

            <div class="r_m_top">
                <h4>&nbsp;&nbsp;&nbsp;&nbsp;${userInfo.userName }님의 오늘의 일정</h4>
            </div>
            
            <!-- 호스트의 간편 예약 관리 버튼-->
            &nbsp;&nbsp;&nbsp;&nbsp;
	        <c:if test="${actionType == 'checkOut'}"> 
			<a class="pinkBtn" href="${pageContext.request.contextPath}/host/main"><span>체크아웃 예정</span></a>
			</c:if>
			<c:if test="${actionType != 'checkOut'}"> 
			<a class="whiteBtn" href="${pageContext.request.contextPath}/host/main"><span>체크아웃 예정</span></a>
			</c:if>
			<c:if test="${actionType == 'hosting'}"> 
			<a class="pinkBtn" href="${pageContext.request.contextPath}/host/main?actionType=hosting"><span>현재 호스팅 중</span></a>
			</c:if>
			<c:if test="${actionType != 'hosting'}"> 
			<a class="whiteBtn" href="${pageContext.request.contextPath}/host/main?actionType=hosting"><span>현재 호스팅 중</span></a>
			</c:if>
			<c:if test="${actionType == 'checkIn'}"> 
			<a class="pinkBtn" href="${pageContext.request.contextPath}/host/main?actionType=checkIn"><span>체크인 예정</span></a>
			</c:if>
			<c:if test="${actionType != 'checkIn'}"> 
			<a class="whiteBtn" href="${pageContext.request.contextPath}/host/main?actionType=checkIn"><span>체크인 예정</span></a>
			</c:if>
			<c:if test="${actionType == 'upComing'}"> 
			<a class="pinkBtn" href="${pageContext.request.contextPath}/host/main?actionType=upComing"><span>다가오는 예약</span></a>
			</c:if>
			<c:if test="${actionType != 'upComing'}"> 
			<a class="whiteBtn" href="${pageContext.request.contextPath}/host/main?actionType=upComing"><span>다가오는 예약</span></a>
			</c:if>
			<c:if test="${actionType == 'pendingReview'}"> 
			<a class="pinkBtn" href="${pageContext.request.contextPath}/host/main?actionType=pendingReview"><span>후기작성 대기중</span></a>
			</c:if>
			<c:if test="${actionType != 'pendingReview'}"> 
			<a class="whiteBtn" href="${pageContext.request.contextPath}/host/main?actionType=pendingReview"><span>후기작성 대기중</span></a>
			</c:if>
			
			<br><br>
			
			<h5>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<c:if test="${actionType == 'checkOut'}"> 
				오늘 체크아웃 예정 : ${todayContentCnt } 건
				</c:if>
				<c:if test="${actionType == 'hosting'}"> 
				현재 호스팅 진행중 : ${todayContentCnt } 건
				</c:if>
				<c:if test="${actionType == 'checkIn'}"> 
				오늘 체크인 예정 : ${todayContentCnt } 건
				</c:if>
				<c:if test="${actionType == 'upComing'}"> 
				다가오는 예약 : ${todayContentCnt } 건
				</c:if>
				<c:if test="${actionType == 'pendingReview'}"> 
				후기작성 대기중 : ${todayContentCnt } 건
				</c:if>
			</h5>
			
			<!-- 호스트의 간편 예약 관리 출력-->
			<div class="view_style">
				<div class="r_m_list view">
					<ul class="list_style">
						<li class="list_top">
							<div class="one">예약번호</div>
	                        <div class="two">숙소번호</div>
	                        <div class="three">게스트ID</div>
	                        <div class="four">숙박인원</div>
	                        <div class="five">체크인</div>
	                        <div class="six">체크아웃</div>
	                        <div class="seven">숙박비용</div>
	                        <div class="eight">비고</div>
						</li>
						<c:forEach var="todayContent" items="${todayContent}">
							<li class="list_con">
								<div class="one"><a href="${pageContext.request.contextPath}/host/bookList/bookInfo?bookingId=${todayContent.bookingId }">${todayContent.bookingId }</a></div>
		                        <div class="two"><a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${todayContent.roomId }">${todayContent.roomId }</a></div>
		                        <div class="three"><a href="${pageContext.request.contextPath}/user/profile?userId=${todayContent.userId }">${todayContent.userId }</a></div>
		                        <div class="four">${todayContent.stayPeople } 명</div>
		                        <div class="five">${todayContent.checkIn }</div>
		                        <div class="six">${todayContent.checkOut }</div>
		                        <div class="seven">${todayContent.totalPrice } 원</div>
		                        <div class="eight">
									<c:if test="${actionType == 'checkOut'}">
										<button type="button" id="checkOutBtn" class="whiteBtn" data-booking-id="${todayContent.bookingId }" ><span>체크아웃</span></button>
									</c:if>		                        
		                        </div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			
			<br><br>
			<!-- 차트 -->
			<h5>&nbsp;&nbsp;&nbsp;&nbsp;${userInfo.userName }님의 차트</h5>
			
			<br><br>
			
			
			<table>
				<tr>
					<th>월별 총예약수</th>
					<th>숙소별 총예약수</th>
				</tr>
				<tr>
					<td><div id="chartOne"></div></td>
					<td><div id="chartTwo"></div></td>
				</tr>
				<tr>
					<th>숙소별 평점</th>
					<th>숙소별 위시리스트 갯수</th>
				</tr>
				<tr>
					<td><div id="chartThree"></div></td>
					<td><div id="chartFour"></div></td>
				</tr>
				
			</table>
            
        </div><!-- //r_ manage -->
        
    </div><!-- //inner -->

	<!-- 푸터 -->
	<footer class="inner clear">
	    <div class="f_top">
	        <div class="ft_left">
	            <p>© 2024 Airbnb, Inc. · 개인정보 처리방침 · 이용약관 · 사이트맵 · 환불 정책 · 회사 세부정보</p>
	        </div>
	        <div class="ft_right">
	            <p>자주 묻는 질문</p>
	        </div>
	    </div>
	    <div class="f_bottom">
	        <span>
	            웹사이트 제공자: GDJ80alphaTeam | 팀원: 이용훈, 오승엽, 손지원 | VAT번호: IE12345678L | 사업자등록번호: IE123456 | 연락처: newlife5991@naver.com, 010-7635-9302|서버제공업체: 아마존웹서비스<br>
	            AOOM은 통신판매중개자로 AOOM플랫폼을 통하여 게스트와 호스트사이에 이루어지는 통신판매의 당사자가 아닙니다. AOOM플랫폼을통하여 예약된 숙소, 호스트 서비스에 관한 의무와 책임은 해당 서비스를 제공하는 호스트에게 있습니다.
	        </span>
	    </div>
	</footer>
	<script type="text/javascript">
	
		/* 첫번째 차트 : 월별 예약수 */
			// 차트 사용
			const ChartOne = toastui.Chart;
			
			// 옵션
			const options = {
			    chart: { width: 500, height: 400 },
			};
			
			// '월별 에약수' 차트 들어갈 곳 선언
			const elOne = document.getElementById('chartOne');
			
			// '월별 예약수' 차트 데이터 불러오기
			const dataOne = {
					
			    categories: [
		            <c:forEach var="item" items="${monthCnt}">
	                	'<c:out value="${item.bookingMonth}" />',
	            	</c:forEach>
			    ],
			    series: [
			        {
			            name: '예약수',
			            data: [
			                <c:forEach var="item" items="${monthCnt}">
			                	<c:out value="${item.bookingCount}" />,
			           		</c:forEach>
			            ],
			        }
			    ],
			
			};
			
			// 차트에 데이터 넣기
			const chart = ChartOne.lineChart({ el:elOne, data:dataOne, options });
			
		/* 두번째 차트 : 숙소별 총 예약수 */
			// 차트 사용
			const ChartTwo = toastui.Chart;
			// '월별 에약수' 차트 들어갈 곳 선언
			const elTwo = document.getElementById('chartTwo');
			// '월별 예약수' 차트 데이터 불러오기
			const dataTwo = {
			    categories: [
		            <c:forEach var="item" items="${roomCnt}">
	                	'<c:out value="${item.roomName}" />',
	            	</c:forEach>
			    ],
			    series: [
			        {
			            name: '예약수',
			            data: [
			                <c:forEach var="item" items="${roomCnt}">
			                	<c:out value="${item.bookingCount}" />,
			           		</c:forEach>
			            ],
			            colorByCategories: true
			        }
			    ],
			
			};
			// 차트에 데이터 넣기
			const chartTwo = ChartTwo.barChart({ el:elTwo, data:dataTwo, options });
			
		/* 세번째 차트 : 숙소별 총 예약수 */
			// 차트 사용
			const ChartThree = toastui.Chart;
			// '월별 에약수' 차트 들어갈 곳 선언
			const elThree = document.getElementById('chartThree');
			// '월별 예약수' 차트 데이터 불러오기
			const dataThree = {
			    categories: [
		            <c:forEach var="item" items="${roomRating}">
	                	'<c:out value="${item.roomName}" />',
	            	</c:forEach>
			    ],
			    series: [
			        {
			            name: '평점',
			            data: [
			                <c:forEach var="item" items="${roomRating}">
			                	<c:out value="${item.averageRating}" />,
			           		</c:forEach>
			            ],
			            colorByCategories: true
			        }
			    ],
			
			};
			// 차트에 데이터 넣기
			const chartThree = ChartThree.barChart({ el:elThree, data:dataThree, options });
			
			/* 네번째 차트 : 숙소별 위시리스트 된 갯수 */
				// 차트 사용
				const ChartFour = toastui.Chart;
				// '월별 에약수' 차트 들어갈 곳 선언
				const elFour = document.getElementById('chartFour');
				// '월별 예약수' 차트 데이터 불러오기
				const dataFour = {
				    categories: [
			            <c:forEach var="item" items="${wishlistCnt}">
		                	'<c:out value="${item.roomName}" />',
		            	</c:forEach>
				    ],
				    series: [
				        {
				            name: '예약수',
				            data: [
				                <c:forEach var="item" items="${wishlistCnt}">
				                	<c:out value="${item.totalCount}" />,
				           		</c:forEach>
				            ],
				            colorByCategories: true
				        }
				    ],
				
				};
				// 차트에 데이터 넣기
				const chartFour = ChartFour.barChart({ el:elFour, data:dataFour, options });
		
	</script>
</body>
</html>