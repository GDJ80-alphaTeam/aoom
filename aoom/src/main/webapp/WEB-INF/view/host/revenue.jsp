<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>호스트 수입</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script src="https://uicdn.toast.com/chart/latest/toastui-chart.min.js"></script>
	<link rel="stylesheet" href="https://uicdn.toast.com/chart/latest/toastui-chart.min.css" />
<body class="container">
	
	<jsp:include page="/WEB-INF/view/layout/navbarSub.jsp"></jsp:include>
	
	<!-- 호스트 모드 메뉴 -->
	<br>
	<div>
		<a class="btn btn-outline-danger" href="/host/main">메인</a>
		<a class="btn btn-outline-danger" href="/host/calendar">달력</a>
		<a class="btn btn-outline-danger" href="/host/roomManage">숙소 관리</a>
		<a class="btn btn-outline-danger" href="/host/bookList">예약 목록</a>
		<a class="btn btn-danger" href="/host/revenue">수입</a>
	</div>
	<br>
	
	<h2 id="revenueTitle"></h2>
	
	<div>
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
    </div>
    
    <!-- 수입 차트 -->
    <div class="row">
	    <div id="chart" style="width: 80%;"></div>
	    <div style="width: 20%;">
	    	<h2 id="sideTitle"></h2>
	    	<br>
	    	<div id="totalPrice"></div>
	    </div>
    </div>

	<!-- 해당 월의 수입 상세 정보 Modal -->
	<div class="modal fade modal-xl" id="paymentInfoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title" id="exampleModalLabel">${selectedMonth }월 수입 상세보기</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				
				<!-- 내용 -->
				<div class="modal-body">
					<div>
						<table class="table">
							<thead>
								<tr>
									<td>예약 번호</td>
									<td>숙소 이름</td>
									<td>유저 아이디</td>
									<td>숙박 인원</td>
									<td>예약 상태</td>
									<td>예약 일자</td>
									<td>숙박 요금</td>
									<td>결제 유형</td>
								</tr>
							</thead>
							<tbody id="modalTableBody">
								<tr>
									<td colspan="8" style="text-align: center;">
										<div class="spinner-border" role="status">
										  <span class="visually-hidden">Loading...</span>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
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
	            $('#revenueTitle').html($('#selectRoom').find('option:selected').text().replaceAll('=', '') + ' 수입')
	            $('#sideTitle').html('올해 ' + $('#selectRoom').find('option:selected').text().replaceAll('=', '') + ' 수입')
	            
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
	    	
	    	// bootstrap 모달 초기화
	        let paymentInfoModal = new bootstrap.Modal($('#paymentInfoModal'));
	    	
	    	// ajax로 불러온 월별 수입 상세정보를 담을 변수
	        let tableRows = '';
	        
	    	// 월별 수입 상세정보를 가져올 ajax
	        $.ajax({
	        	url: '/host/revenue/ajaxSelectRevenueByMonth',
	        	method: 'get',
	        	data: {
	        		'roomId' : urlRoomId,
	        		'selectedMonth' : selectedMonth
	        	},
	        	success: function(response) {
	        		
	        		$('#exampleModalLabel').html(selectedMonth + '월 수입 상세보기');
	        		// 월별 수입의 각각의 행을 추가 
		            response.revenueOne.forEach(function(revenue) {
		                tableRows += '<tr>'
										+ '<td>' + revenue.bookingId + '</td>'
		                                + '<td>' + revenue.roomName + '</td>'
		                                + '<td>' + revenue.userId + '</td>'
		                                + '<td>' + revenue.stayPeople + '</td>'
		                                + '<td>' + revenue.bookstatName + '</td>'
		                                + '<td>' + revenue.bookingDay + '</td>'
		                                + '<td>' + revenue.paymentPrice.toLocaleString('ko-KR') + ' 원' + '</td>'
		                                + '<td>' + revenue.paytypeName + '</td>'
	                                + '</tr>';
		            });
		            $('#modalTableBody').html(tableRows);
				}
	        });
	        
	        paymentInfoModal.show();
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
</body>
</html>