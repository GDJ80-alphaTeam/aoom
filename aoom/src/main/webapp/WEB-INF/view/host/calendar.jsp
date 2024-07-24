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
            background-color: black !important;
        }
        
        .event-date {
            background-color: #d3d3d3 !important; /* 어두운 배경색 */
            pointer-events: none; /* 클릭 비활성화 */
        }
        
        #calendar {
            width: 80%;
            min-height: 600px; /* 고정된 최소 높이 설정 */
            box-sizing: border-box; /* 패딩과 테두리를 포함한 크기 조정 */
        }

        #selectDay, #notSelectDay {
            box-sizing: border-box; /* 패딩과 테두리를 포함한 크기 조정 */
        }

        #selectDay {
            display: none; /* 기본적으로 숨김 */
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
            <!-- 숙소 상태가 활성화인것만 나오게 설정 -->
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
    
    <div style="display: flex;">
        <div id='calendar'></div>
        
        <div id="DivSelectDay" style="width: 20%; box-sizing: border-box;">
        
            <div style="width: 100%; display: inline-block;" id="notSelectDay">
	            <form action="/host/calendar/updateDefaultPrice" method="post">
	            	<h3>기본 요금</h3>
	                <div>1박당</div>
	                <input type="hidden" name="roomId" value="${selectedRoomId }">
	                <input type="number" min="30000" id="defaultPrice" name="defaultPrice" required="required" style="height: 35px;">원
	                <button type="submit">설정</button>
	                <br>
	                <br>
	                
<!-- 	                <h3>주말 요금</h3> -->
<!-- 	                <div>1박당</div> -->
<!-- 	                <input type="number" min="30000" id="defaultPrice" name="defaultPrice" value="" style="height: 35px;"> -->
<!-- 	                <button type="button">설정</button> -->
	            </form>
            </div>
            
            <div style="width: 100%;" id="selectDay">
                <h3 id="dateTitle"></h3>
                <br>
                
                <div class="d-flex align-items-center">
                    <span>예약 차단</span>
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                    </div>
                    <span>예약 가능</span>
                </div>
                <br>
                <form action="/host/calendar/updateDefaultPrice" method="post">
	                <div>1박당</div>
	                <input type="hidden" name="roomId" value="${selectedRoomId }">
	                <input type="hidden" name="startDate" id="startOneDay">
	                <input type="hidden" name="endDate" id="endOneDay">
	                <input type="number" min="30000" id="defaultPriceSelected" name="defaultPrice" style="height: 35px;">원
	                <button type="submit">설정</button>
	                <br>
                </form>
            </div>
        </div>
    </div>
    <script type="text/javascript">
	    let calendar; 
	
	    $(document).ready(function() {
	        let urlRoomId = $('#selectRoom').val();
	        $('input[name="roomId"]').val(urlRoomId);
	        selectOnedayPrice();
	
	        $('#selectRoom').change(function() {
	            urlRoomId = $('#selectRoom').val();
	            window.location.href = '/host/calendar?roomId=' + urlRoomId;
		        $('input[name="roomId"]').val(urlRoomId);
	            selectOnedayPrice();
	        });
	
	        function selectOnedayPrice() {
	            $.ajax({
	                url: '/host/calendar/ajaxSelectOnedayPrice',
	                method: 'get',
	                data: {'roomId': urlRoomId},
	                success: function(response) {
	
	                    let startDate = response.roomData.startDate;
	                    let endDate = response.roomData.endDate;
						$('#defaultPrice').val(response.roomData.originalDefaultPrice);
	
	                    // 데이터가 올바른지 확인
	                    if (response && response.onedayData && Array.isArray(response.onedayData)) {
	                        let onedayList = response.onedayData; // 데이터 배열 가져오기
	                        let events = [];
	
	                        // 가져온 onedayPrice들로 event 배열 생성
	                        onedayList.forEach(function(item) {
	                            let date = item.oneday;
	
	                            let oneday = moment(date).format('YYYY-MM-DD');
	                            if (moment(oneday, 'YYYY-MM-DD', true).isValid()) {
	                                events.push({
	                                    title: item.codeName, // 예약 가능 여부
	                                    description: item.onedayPrice + '원', // 추가 텍스트
	                                    start: oneday, // oneday
	                                    end: moment(oneday).add(1, 'day').format('YYYY-MM-DD'), // ondey + 1 (퇴실날)
	                                    color: item.onestatCode === 'one01' ? 'green' : 'red',
	                                });
	                            }
	                        });
	
	                        // FullCalendar 초기화
	                        initCalendar(events, startDate, endDate);
	                    }
	                }
	            });
	        }
	    });
	
	    function initCalendar(events, startDate, endDate) {
	        let calendarEl = document.getElementById('calendar');
	        if (calendar) {
	            calendar.destroy(); // 기존 캘린더가 있으면 제거
	        }
	        calendar = new FullCalendar.Calendar(calendarEl, {
	            initialView: 'dayGridMonth',
	            navLinks: false,
	            showNonCurrentDates: false,
	            aspectRatio: 1.5,
	            selectable: true,
	            selectOverlap: true, // 이벤트가 있는 부분도 선택 가능하게 설정
	            locale: 'kr',
	            defaultAllDayEventDuration: 1,
	            headerToolbar: {
	                start: 'prev',
	                center: 'title',
	                end: 'next',
	            },
	            validRange: {
	                start: startDate,
	                end: endDate
	            },
	            events: events,
	            eventDidMount: function(info) {
	                let startDate = new Date(moment(info.event.start).format("YYYY-MM-DD"));
	                let endDate = new Date(moment(info.event.end).format("YYYY-MM-DD"));
	                endDate.setDate(endDate.getDate());
	                let currentDate = startDate;
	                let today = new Date(moment().format("YYYY-MM-DD"));
	
	                while (currentDate < endDate) {
	                    let dateStr = currentDate.toISOString().split('T')[0];
	                    let cell = document.querySelector('[data-date="' + dateStr + '"]');
	                    if (cell) {
	                        if (currentDate < today) {
	                            cell.classList.add('event-date');
	                        }
	                    }
	                    currentDate.setDate(currentDate.getDate() + 1);
	                }
	            },
	            selectAllow: function(selectInfo) {
	                let today = new Date();
	                let selectStart = selectInfo.start;
	                let selectEnd = selectInfo.end;
	
	                // 선택 시작일이 오늘 날짜 이전일 경우 선택을 허용하지 않음
	                if (selectEnd <= today) {
	                    return false;
	                }
	
	                // 오늘 날짜 이후의 날짜에 대해서만 선택을 허용
	                return true;
	            },
	            select: function(info) {
	            	console.log(info);
	                let selectedCells = document.querySelectorAll('.selected-date');
	                selectedCells.forEach(function(cell) {
	                    cell.classList.remove('selected-date');
	                });
	                let startDate = new Date(moment(info.startStr).format("YYYY-MM-DD"));
	                let endDate = new Date(moment(info.endStr).format("YYYY-MM-DD"));
	                endDate.setDate(endDate.getDate() - 1);
	                let currentDate = startDate;
	
	                while (currentDate <= endDate) {
	                    let dateStr = currentDate.toISOString().split('T')[0];
	                    let cell = document.querySelector('[data-date="' + dateStr + '"]');
	                    if (cell) {
	                        cell.classList.add('selected-date');
	                    }
	                    currentDate.setDate(currentDate.getDate() + 1);
	                }
	
	                // 날짜 선택에 따라 div 토글
	                $('#selectDay').show();
	                $('#notSelectDay').hide();
	
	                console.log(moment(info.startStr).format("YYYY-MM-DD"));
	                console.log(moment(info.endStr).subtract(1,'day').format("YYYY-MM-DD"));
	                
	                let startOneDay = moment(info.startStr).format("YYYY-MM-DD");
	                let endOneDay = moment(info.endStr).subtract(1,'day').format("YYYY-MM-DD");
	                
	                if(startOneDay == endOneDay) {
	                	$('#dateTitle').text(startOneDay + ' 요금 설정');
	                	
	                	$('#startOneDay').val(startOneDay);
	                	$('#endOneDay').val(endOneDay);
	                	console.log($('input[name="roomId"]').val());	                	
	                } else {
	                	$('#dateTitle').text(startOneDay + '~' + endOneDay  + ' 요금 설정');
	                	
	                	$('#startOneDay').val(startOneDay);
	                	$('#endOneDay').val(endOneDay);
	                	console.log($('input[name="roomId"]').val());	                	
	                }
	                alert('selected ' + info.startStr + ' to ' + info.endStr);
	            },
	            eventContent: function(arg) {
	                let italicEl = document.createElement('span');
	                italicEl.innerHTML = arg.event.title;
	
	                let descriptionEl = document.createElement('div');
	                descriptionEl.innerHTML = arg.event.extendedProps.description;
	
	                let arrayOfDomNodes = [ italicEl, descriptionEl ];
	
	                return { domNodes: arrayOfDomNodes };
	            }
	        });
	
	        calendar.render();
	    }
	</script>

</body>
</html>