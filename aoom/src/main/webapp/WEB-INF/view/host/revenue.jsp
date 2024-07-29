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
	
	<h2>수입</h2>
	
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
    <div id="chart"></div>

	<script type="text/javascript">
    	const Chart = toastui.Chart;
    	const el = document.getElementById('chart');
	    const data = {
    		categories: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    		series: [
    			
   			]
	    };
	    const options = {
   			chart: { 
   				width: document.body.offsetWidth, 
   				height: document.documentElement.clientHeight / 2
			},
   			legend: {
   				visible: false,
			},
			exportMenu: {
				visible: false
			},
			lang: {
				noData: '😭아직 수입이 없어요😭',
			},
			tooltip: {
                formatter: function(value, tooltipDataInfo) {
                    return value + ' 원';
                }
            }
	    };
	    
	    const chart = Chart.columnChart({ el, data, options });
	    let revenue = [];
	    $.ajax({
	    	url: '/host/revenue/ajaxSelectRevenue',
	    	method: 'get',
	    	data: {
	    		'userId' : '${sessionScope.userInfo.userId}',
	    		'roomId' : '${selectedRoomId}'
	    	},
	    	success: function(response) {
	            console.log(response);
	            response.forEach(function(item) {
	                let monthIndex = parseInt(item.paymentMonth.split('-')[1]) - 1; // 월을 인덱스로 변환
	                revenue[monthIndex] = item.totalAmount;
	            });

	            chart.addSeries({
	                name: '${selectedRoomId}' || '전체',
	                data: revenue
	            });
	        }
	    });
	    
    </script>

	<script type="text/javascript">
	    // 선택한 roomId 전역 변수 선언
	    let urlRoomId;
	    
	    $(document).ready(function() {
	    	
	    	// 선택된 숙소 roomId 가져오고, input에 value 넣어주기
	        urlRoomId = $('#selectRoom').val();
	    	console.log('urlRoomId : ', urlRoomId);
	
	        $('#selectRoom').change(function() {
	            urlRoomId = $('#selectRoom').val();
	            window.location.href = '/host/revenue?roomId=' + urlRoomId;
	        });
	
	    });
	
	</script>
</body>
</html>