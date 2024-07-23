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
<body>
	<jsp:include page="/WEB-INF/view/layout/navbarSub.jsp"></jsp:include>
	
	<!-- 호스트 모드 메뉴 -->
	<br>
	<div>
		<a href="/host/main">메인</a>
		<a href="/host/calendar">달력</a>
		<a href="/host/roomManage">숙소 관리</a>
		<a href="#">예약 목록</a>
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

<script>
    document.addEventListener('DOMContentLoaded', function() {
      var calendarEl = document.getElementById('calendar');
      var calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        navLinks: false,
        showNonCurrentDates: false,
        aspectRatio: 1.5,
        selectable: true,
        locale: 'kr',
        
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
          {
            title: '예약 불가',
            start: '2024-05-10',
            end: '2024-05-12'
          },
          {
            title: '예약 불가',
            start: '2024-06-15',
            end: '2024-06-18'
          }
        ],

        eventDidMount: function(info) {
        	  var startDate = new Date(info.event.start);
        	  var endDate = new Date(info.event.end);
        	  endDate.setDate(endDate.getDate() - 1); // Adjust the end date
        	  var currentDate = startDate;
				console.log(startDate);
				console.log(endDate);
				console.log(currentDate);
        	  while (currentDate <= endDate) { // Adjust the condition to include the end date
        	    var dateStr = currentDate.toISOString().split('T')[0];
				console.log(dateStr);
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
        	  // Clear previous selection
        	  var selectedCells = document.querySelectorAll('.selected-date');
        	  selectedCells.forEach(function(cell) {
        	    cell.classList.remove('selected-date');
        	  });

        	  // Highlight selected dates
        	  var startDate = new Date(info.startStr);
        	  var endDate = new Date(info.endStr);
        	  endDate.setDate(endDate.getDate() - 1); // Adjust the end date
        	  var currentDate = startDate;

        	  while (currentDate <= endDate) { // Adjust the condition to include the end date
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