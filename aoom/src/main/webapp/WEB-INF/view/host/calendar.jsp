<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>달력</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js'></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
	<style>
		.selected-date {
			background-color: yellow !important;
		}
		
		.event-date {
			background-color: #d3d3d3 !important; /* 어두운 배경색 */
			pointer-events: none; /* 클릭 비활성화 */
		}
	</style>
</head>
<body class="container">
	<jsp:include page="/WEB-INF/view/layout/navbarSub.jsp"></jsp:include>
	
	<!-- 호스트 모드 메뉴 -->
	<br>
	<div>
		<a href="/host/main">메인</a>
		<a href="/host/calendar">달력</a>
		<a href="/host/roomManage">숙소 관리</a>
		<a href="#">예약 목록</a>
	</div>
	
	<div>
		<select id="selectRoom" name="selectRoom">
			<c:forEach var="room" items="${roomList }">
				<option value="${room.roomId }">${room.roomName }</option>
			</c:forEach>
		</select>
	</div>
	
	<div style="display: flex;">
		<div id='calendar' style="width: 80%;"></div>
		
		<div style="width: auto;" >
		
			<div style="width: auto; display: inline-block;" id="notSelectDay">
				<h3>기본 요금</h3>
				<div>1박당</div>
				<input type="number" min="30000" id="defaultPrice" name="defaultPrice" value="" style="height: 35px;">
				<button type="button">설정</button>
				<br>
				<br>
				
				<h3>주말 요금</h3>
				<div>1박당</div>
				<input type="number" min="30000" id="defaultPrice" name="defaultPrice" value="" style="height: 35px;">
				<button type="button">설정</button>
			</div>
			<hr>
			
			
			<div style="width: auto;" id="selectDay">
				<h3>YYYY년 M월 D일 요금 설정</h3>
				<br>
				
				<div class="d-flex align-items-center">
					<span>예약 차단</span>
					<div class="form-check form-switch">
						<input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
					</div>
					<span>예약 가능</span>
				</div>
				<br>
				
				<div>1박당</div>
				<input type="number" min="30000" id="defaultPrice" name="defaultPrice" value="" style="height: 35px;">
				<button type="button">설정</button>
				<br>
			</div>
		</div>
	</div>
	
	<!-- onedayPrice 가져오기 -->
	<script type="text/javascript">
	    $(document).ready(function() {
	        // 페이지가 로드될 때 초기 이벤트를 가져옵니다.
	        loadEvents();
	
	        $('#selectRoom').change(function() {
	            loadEvents();
	        });
	
	        function loadEvents() {
	            $.ajax({
	                url: '/host/calendar/ajaxSelectOnedayPrice',
	                method: 'post',
	                data: {'roomId': $('#selectRoom').val()},
	                success: function(response) {
	                    // 데이터가 올바른지 확인
	                    if (response && response.data && Array.isArray(response.data)) {
	                        var onedayPrices = response.data; // 데이터 배열 가져오기
	                        var events = [];
	
	                        // 가져온 날짜를 기반으로 이벤트 배열 생성
	                        onedayPrices.forEach(function(item) {
	                            var date = item.oneday; // oneday 필드에서 날짜 추출
	
	                            // ISO 8601 날짜 문자열을 moment로 처리하여 'YYYY-MM-DD' 형식으로 포맷
	                            var formattedDate = moment(date).format('YYYY-MM-DD');
	                            if (moment(formattedDate, 'YYYY-MM-DD', true).isValid()) {
	                                events.push({
	                                    title: '예약 가능', // 이벤트 제목
	                                    start: formattedDate, // 이벤트 시작 날짜
	                                    end: moment(formattedDate).add(1, 'day').format('YYYY-MM-DD') // 이벤트 종료 날짜 (1일 후)
	                                });
	                            } else {
	                                console.error('Invalid date format:', date);
	                            }
	                        });
	
	                        // FullCalendar 객체가 이미 생성되었는지 확인
	                        if (calendar) {
	                            // 기존 이벤트를 모두 제거한 후 새로운 이벤트를 추가
	                            calendar.getEvents().forEach(function(event) {
	                                event.remove();
	                            });
	
	                            calendar.addEventSource(events);
	                        }
	                    } else {
	                        console.error('Invalid response data:', response);
	                    }
	                },
	                error: function(xhr, status, error) {
	                    console.error('AJAX Error:', status, error);
	                }
	            });
	        }
	    });
	</script>


	
	<script>
	    var calendar;
	
	    document.addEventListener('DOMContentLoaded', function() {
	        var calendarEl = document.getElementById('calendar');
	        calendar = new FullCalendar.Calendar(calendarEl, {
	            initialView: 'dayGridMonth',
	            navLinks: false,
	            showNonCurrentDates: false,
	            aspectRatio: 1.5,
	            selectable: true,
	            locale: 'kr',
	            defaultAllDayEventDuration: 1,
	            headerToolbar: {
	                start: 'prev',
	                center: 'title',
	                end: 'next',
	            },
	            validRange: {
	                start: '2024-05-01',
	                end: '2024-09-05'
	            },
	            events: [
	                // 초기 이벤트 데이터
	                {
	                    title: '예약 불가',
	                    start: '2024-05-10',
	                    end: '2024-05-12'
	                },
	                {
	                    title: '예약 불가',
	                    start: '2024-06-15',
	                    end: '2024-06-19'
	                }
	            ],
	            eventDidMount: function(info) {
	                var startDate = new Date(moment(info.event.start).format("YYYY-MM-DD"));
	                var endDate = new Date(moment(info.event.end).format("YYYY-MM-DD"));
	                endDate.setDate(endDate.getDate());
	                var currentDate = startDate;
	                
	                while (currentDate < endDate) {
	                    var dateStr = currentDate.toISOString().split('T')[0];
	                    var cell = document.querySelector('[data-date="' + dateStr + '"]');
	                    if (cell) {
	                        cell.classList.add('event-date');
	                    }
	                    currentDate.setDate(currentDate.getDate() + 1);
	                }
	            },
	            selectAllow: function(selectInfo) {
	                var events = calendar.getEvents();
	                
	                for (var i = 0; i < events.length; i++) {
	                    var event = events[i];
	                    
	                    if (selectInfo.start < event.end && selectInfo.end > event.start) {
	                        return false; // 선택된 기간이 이벤트와 겹치면 선택을 허용하지 않음
	                    }
	                }
	                return true; // 선택된 기간이 이벤트와 겹치지 않으면 선택을 허용
	            },
	            select: function(info) {
	                var selectedCells = document.querySelectorAll('.selected-date');
	                selectedCells.forEach(function(cell) {
	                    cell.classList.remove('selected-date');
	                });
	                
	                var startDate = new Date(moment(info.startStr).format("YYYY-MM-DD"));
	                var endDate = new Date(moment(info.endStr).format("YYYY-MM-DD"));
	                endDate.setDate(endDate.getDate() - 1);
	                var currentDate = startDate;
	
	                while (currentDate <= endDate) {
	                    var dateStr = currentDate.toISOString().split('T')[0];
	                    var cell = document.querySelector('[data-date="' + dateStr + '"]');
	                    if (cell) {
	                        cell.classList.add('selected-date');
	                    }
	                    currentDate.setDate(currentDate.getDate() + 1);
	                }
	
	                alert('selected ' + info.startStr + ' to ' + info.endStr);
	            }
	        });
	
	        calendar.render();
	    });
	</script>

</body>
</html>