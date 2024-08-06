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
    <title>수입</title>
    <script src="https://kit.fontawesome.com/82b4a4fcad.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <link rel="stylesheet" href="/style/css/common.css">
    <link rel="stylesheet" href="/style/css/revenue.css">
    <link rel="stylesheet" href="/style/css/navSub.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://uicdn.toast.com/chart/latest/toastui-chart.min.js"></script>
	<link rel="stylesheet" href="https://uicdn.toast.com/chart/latest/toastui-chart.min.css" />
</head>
<body>
	<jsp:include page="/WEB-INF/view/layout/navbarSub.jsp"></jsp:include>
    
	<div class="inner">
        <div class="inner_nav">
            <ul>
                <li><a href="/host/main">메인</a></li>
                <li><a href="/host/calendar">달력</a></li>
                <li><a href="/host/roomManage">숙소 관리</a></li>
                <li><a href="/host/bookList">예약 목록</a></li>
                <li class="active"><a href="/host/revenue">수입</a></li>
            </ul>
        </div><!-- //inner_nav 숙소관리 네비 -->
        <div class="revenue">
           	<div class="revenue_top">
                <h4 id="revenueTitle"></h4>
                <div class="t_right">
                    <select id="selectRoom" name="selectRoom">
			            <!-- 숙소 상태가 활성화인것만 나오게 설정 -->
			            <option value="">=== 전체 ===</option>
			            <c:forEach var="room" items="${roomList }">
			                <c:if test="${room.roomstatCode == 'rst03' and room.roomstatCode eq 'rst03'}">
			                    <c:if test="${room.roomId == selectedRoomId}">
			                        <option value="${room.roomId }" selected="selected">${room.roomName }</option>
			                    </c:if>
			                    <c:if test="${room.roomId != selectedRoomId}">
			                        <option value="${room.roomId }">${room.roomName }</option>
			                    </c:if>
			                </c:if>
			            </c:forEach>
			        </select>
                </div><!-- //t_right -->
            </div><!-- //r_m_top 썸네일, 리스트 형식 공통  사용-->
            
		    <!-- 수입 차트 -->
		    <div style="display: flex;">
			    <div id="chart" style="width: 80%;"></div>
			    <div style="width: 20%;">
			    	<h2 id="sideTitle"></h2>
			    	<br>
			    	<div id="totalPrice"></div>
			    </div>
		    </div>
        </div><!-- //revenue -->
	
		<!-- 월 수입 상세보기 모달 -->
		<div class="revnenue_detail_bg" id="paymentInfoModal" style="display: none;">
			<div class="revnenue_detail">
				<div class="revnenue_detail_t">
					<i class="fa-solid fa-xmark" id="closeModal"></i>
					<p id="modalTitle">${selectedMonth }월수입 상세보기</p>
				</div>
				<ul class="revnenue_detail_b" id="revenueDetailList">
				    <li class="list_top">
				        <div class="one">예약번호</div>
				        <div class="two">숙소 이름</div>
				        <div class="three">유저 아이디</div>
				        <div class="fourth">숙박 인원</div>
				        <div class="five">예약 상태</div>
				        <div class="six">예약 일자</div>
				        <div class="seven">숙박 요금</div>
				        <div class="last">결제 유형</div>
				    </li>
				</ul>
			</div>
		</div>
		
		
    </div><!-- //inner -->
    
    <!-- ---------------컨텐츠 끝------------------------>
    <footer class="inner clear">
        <div class="f_top">
            <div class="ft_left">
                <p>© 2024 Airbnb, Inc. · 개인정보 처리방침 · 이용약관 · 사이트맵 · 환불 정책 · 회사 세부정보</p>
            </div>
            <div class="ft_right">
                <p>자주 묻는 질문</p>
            </div>
        </div><!-- //f_top -->
        <div class="f_bottom">
            <span>
                웹사이트제공자:GDJ80alphaTeam,privateunlimitedcompany,8HanoverQuayDublin2,D02DP23Ireland|팀장:이용훈|VAT번호:IE12345678L사업자등록번호:IE123456|연락처:newlife5991@naver.com,
                웹사이트,010-7635-9302|호스팅서비스제공업체: <br>아마존웹서비스|알파비앤비는
                통신판매중개자로알파비앤비플랫폼을통하여게스트와호스트사이에이루어지는통신판매의당사자가아닙니다.알파비앤비플랫폼을통하여 예약된 숙소, 호스트 서비스에 관한 의무와 책임은 해당 서비스를
                제공하는
                호스트에게 있습니다.
            </span>
        </div><!-- //f_bottom -->
    </footer>
    
	<script type="text/javascript">
		// 전체 금액 변수 선언
		let totalPrice = 0;
		
		//  toastUi의 chart API 사용
    	const Chart = toastui.Chart;
		// 요소 가져오기
    	const el = document.getElementById('chart');
		// 차트 출력할 데이터 설정
	    const data = {
    		categories: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    		series: []
	    };
		// 차트의 옵션 설정
	    const options = {
			// 차트의 크기 설정
   			chart: { 
   				width: $('#chart').width(), 
   				height: document.documentElement.clientHeight / 2
			},
			// 출력 데이터 선택기능 설정
   			legend: {
   				visible: false,
			},
			// 자료 추출 기능 설정
			exportMenu: {
				visible: false
			},
			// 데이터가 없을 시 표시할 값
			lang: {
				noData: '😭아직 수입이 없어요😭',
			},
			// 그래프에 hover시 보여줄 값
			tooltip: {
                formatter: function(value, tooltipDataInfo) {
                    return value.toLocaleString('ko-KR') + ' 원';
                }
            },
            // 그래프 클릭 기능 활성화
            series: {
            	selectable: true
           	}
	    };
	    
		// 차트 생성
	    const chart = Chart.columnChart({ el, data, options });
		// 수입 배열 선언
	    let revenue = [];
		
		// 호스트의 월별 수입을 가져오는 ajax
	    $.ajax({
	    	url: '/host/revenue/ajaxSelectRevenue',
	    	method: 'get',
	    	data: {
	    		'userId' : '${sessionScope.userInfo.userId}',
	    		'roomId' : '${selectedRoomId}'
	    	},
	    	success: function(response) {
	            console.log(response.revenue);
	            
	            // 선택된 room 이름으로 title 설정
	            $('#revenueTitle').html($('#selectRoom').find('option:selected').text().replaceAll('=', '') + ' 확정 수입')
	            $('#sideTitle').html('올해<br>' + $('#selectRoom').find('option:selected').text().replaceAll('=', '') + '<br>확정 수입')
	            
	            // response의 revenue 반복
	            // 월별 수입을 카테고리의 값에 맞춰 보여주기 위해(7월 수입만 있을 경우 7월이 아닌 1월에 값이 들어가는 것을 방지)
	            response.revenue.forEach(function(item) {
	                let monthIndex = parseInt(item.paymentMonth.split('-')[1]) - 1; // 월을 인덱스로 변환
	                revenue[monthIndex] = item.totalAmount;
	            });

	            // 수입이 있을 경우
	            if(response.revenue.length !== 0) {
	            	// 차트에 data추가
		            chart.addSeries({
		            	// 숙소 선택시 해당 숙소의 이름으로, 아니면 전체로 표시
		                name: response.revenue[0].roomName || '전체',
		                data: revenue
		            });
	            }
	            
	            // 월별 수입 합산(1년 수입)
	            revenue.forEach(function(item) {
	            	console.log(item);
	            	totalPrice += item;
	            });
	            $('#totalPrice').html('<h4>' + totalPrice.toLocaleString('ko-KR') + ' 원</h4>')
	        }
	    });
	    
		// 그래프 선택시 실행
	    chart.on('selectSeries', (ev) => {
	    	// 선택한 그래프의 월 값 가져오기(ex.7월을 07로 변환)
	    	let selectedMonth = ev.column[0].data.category.match(/\d+/)[0].padStart(2, '0');
	    	
	        let paymentInfoModal = $('#paymentInfoModal');
	    	
	    	// ajax로 불러온 월별 수입 상세정보를 담을 변수
	        let tableRows = '';
	        
	    	// 월별 수입 상세정보를 가져올 ajax
	        $.ajax({
	        	url: '/host/revenue/ajaxSelectRevenueByMonth',
	        	method: 'get',
	        	data: {
	        		'roomId' : urlRoomId,
	        		'userId' : '${sessionScope.userInfo.userId}',
	        		'selectedMonth' : selectedMonth
	        	},
	        	success: function(response) {
	        		
	        		$('#modalTitle').html(selectedMonth + '월 확정 수입 상세보기');
	        		// 월별 수입의 각각의 행을 추가 
	                response.revenueOne.forEach(function(revenue) {
	                    tableRows += '<li class="list_con">'
	                                    + '<div class="one">' + revenue.bookingId + '</div>'
	                                    + '<div class="two">' + revenue.roomName + '</div>'
	                                    + '<div class="three">' + revenue.userId + '</div>'
	                                    + '<div class="fourth">' + revenue.stayPeople + '</div>'
	                                    + '<div class="five">' + revenue.bookstatName + '</div>'
	                                    + '<div class="six">' + revenue.bookingDay + '</div>'
	                                    + '<div class="seven">' + revenue.paymentPrice.toLocaleString('ko-KR') + ' 원' + '</div>'
	                                    + '<div class="last">' + revenue.paytypeName + '</div>'
	                                + '</li>';
	                });
	                
	                // list_top을 제외한 나머지 부분을 초기화하고 결과를 추가
		            $('#revenueDetailList').find('li:not(.list_top)').remove();
		            $('#revenueDetailList').append(tableRows);
	                
	                // 모달 창 표시
	                paymentInfoModal.show();
				}
	        });
	        
	        paymentInfoModal.show();
	    });
		
	    $('#closeModal').click(function() {
	        $('.revnenue_detail_bg').hide();
	    });
    </script>

	<script type="text/javascript">
	    // 선택한 roomId 전역 변수 선언
	    let urlRoomId;
	    
	    $(document).ready(function() {
	    	
	    	// 선택된 숙소 roomId 가져오고, input에 value 넣어주기
	        urlRoomId = $('#selectRoom').val();
	
	        $('#selectRoom').change(function() {
	            urlRoomId = $('#selectRoom').val();
	            window.location.href = '/host/revenue?roomId=' + urlRoomId;
	        });
	
	    });
	    
	</script>
	
	<script type="text/javascript">
	    $(document).ready(function() {
	        $('.fa-bars').click(function() {
	            $('.nav_menu').toggle();
	        });
	    });
	</script>
</body>
</html>