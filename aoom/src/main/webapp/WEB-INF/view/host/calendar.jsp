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
        <a href="/host/bookList">예약 목록</a>
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
        
        	<!-- 닐찌 선택 안했을 때 -->
            <div style="width: 100%; display: inline-block;" id="notSelectDay">
	            <form action="/host/calendar/updateDefaultPrice" method="post">
	            	<h3 id="notSelectedDateTitle"></h3>
	            	<h3>전체 요금</h3>
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
            
            <!-- 닐찌 선택 했을 때 -->
            <div style="width: 100%;" id="selectDay">
            	<!-- 선택한 날짜 표시 -->
                <h3 id="selectedDateTitle"></h3>
                <br>
                
                <!-- 예약 상태 변경 -->
                <form action="/host/calendar/updateDefaultPrice" method="post">
	                <div class="d-flex align-items-center">
						<c:forEach var="onestatCode" items="${onestatCodeList }">						
						    <button type="button" name="onestatCode" value="${onestatCode.codeKey }">${onestatCode.codeName }</button>
						</c:forEach>
	                </div>
	                <br>
                
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
    	// calendar, 선택한 roomId 전역 변수 선언
	    let calendar; 
	    let urlRoomId;
	    
	    $(document).ready(function() {
	    	
	    	// 선택된 숙소 roomId 가져오고, input에 value 넣어주기
	        urlRoomId = $('#selectRoom').val();
	        $('input[name="roomId"]').val(urlRoomId);
	        
	        // 해당 숙소의 onedayPrice목록 가져오기
	        selectOnedayPrice();
	
	        $('#selectRoom').change(function() {
	            urlRoomId = $('#selectRoom').val();
	            window.location.href = '/host/calendar?roomId=' + urlRoomId;
		        $('input[name="roomId"]').val(urlRoomId);
	            selectOnedayPrice();
	        });
	
	        // 해당 숙소의 onedayPrice가져오는 함수
	        function selectOnedayPrice() {
	        	
	        	// 해당 숙소의 onedayPrice가져오는 ajax
	            $.ajax({
	                url: '/host/calendar/ajaxSelectOnedayPrice',
	                method: 'get',
	                data: {'roomId': urlRoomId},
	                success: function(response) { // onedayPrice가져오기 성공하면
	                	
	                	// 운영일 만큼만 달력을 보여주기 위해 startDate, endDate 가져오기
	                    let startDate = response.roomData.startDate;
	                    let endDate = response.roomData.endDate;
	                    // 날짜 선택하지 않았을 때 title 설정
	                    $('#notSelectedDateTitle').html(startDate + '<br>~' + endDate);
	                    
	                    // 실제 운영기간보다 1일 더 작게나와 1일 추가
	                    endDate = moment(endDate).add(1, 'day').format('YYYY-MM-DD');
	                    // room테이블에 설정된 숙소의 기본 요금 가져와서 value 넣어주기 
						$('#defaultPrice').val(response.roomData.originalDefaultPrice);
	                    
	                    // 데이터 잘 가져왔는지 분기
	                    if (response && response.onedayData && Array.isArray(response.onedayData)) { // 데이터가 비어있지 않다면
	                    	
	                    	// 해당 숙소의 onedayPrice 전체 가져와서 배열에 담기 
	                        let onedayList = response.onedayData;
	                    
	                    	// fullcalendar event를 담을 배열
	                        let events = [];
	
	                        // 가져온 onedayPrice들로 event 배열 생성
	                        onedayList.forEach(function(item) {
	                        	
	                        	// oneday_price테이블의 oneday
	                            let oneday = item.oneday;
								
	                            if (moment(oneday, 'YYYY-MM-DD', true).isValid()) {
	                                events.push({
	                                    title: item.codeName, // 예약 가능 여부
	                                    description: item.onedayPrice + '원', // onedayPrice 표시
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
	
	</script>
	
	<!-- fullCalendar 초기화 및 생성 -->
	<script type="text/javascript">
		// fullCalendar 초기화 함수
	    function initCalendar(events, startDate, endDate) {
	        let calendarEl = document.getElementById('calendar');
	        
	     	// 기존 캘린더가 있으면 제거
	        if (calendar) {
	            calendar.destroy();
	        }
	     	
	     	// calendar 생성
	        calendar = new FullCalendar.Calendar(calendarEl, {
	            initialView: 'dayGridMonth', // 달력 형태 설정
	            navLinks: false, // 날짜 클릭 기능 설정
	            showNonCurrentDates: false, // 해당 월의 달력에 이전달, 다음달 날짜 표시할건지 설정
	            aspectRatio: 1.5, // 달력 크기 설정(종횡비)
	            selectable: true, // 날짜(cell)를 선택할 수 있게 설정
// 		        selectOverlap: true, // 이벤트가 있는 부분도 선택 가능하게 설정
	            locale: 'kr', // 언어 설정
	            headerToolbar: { // 달력 상단 설정
	                start: 'prev',
	                center: 'title',
	                end: 'next',
	            },
	            validRange: { // 달력 범위 설정(해당 room의 운영기간 만큼)
	                start: startDate,
	                end: endDate
	            },
	            events: events,	// 달력의 event - 해당 onedayPrice의 상태, 가격 표시
	            select: function(info) {
	                // 선택한 날짜(cell) 요소들을 배열로 가져오기
	                let selectedCells = $('.selected-date').toArray();
	                
	                // 선택한 날짜의 시작일과 종료일을 가져오기
	                let startDate = moment(info.startStr);
	                let endDate = moment(info.endStr);
	                
	                // 선택되어 있는 날짜칸들(cell)에 해당하는 요소들을 담을 배열 선언 
	                let cellArray = [];

	                // 선택한 날짜들의 cell 요소들을 가져와 배열에 담기
	                while (startDate < endDate) {
	                    let cell = $('[data-date="' + startDate.format('YYYY-MM-DD') + '"]');
	                    if (cell) {
	                        cellArray.push(cell);
	                    }
	                    startDate = moment(startDate).add(1, 'day');
	                }

	                // 이미 선택된 날짜들인지 확인
	                let selectedDate = true;
	                
					// cellArray 배열에 담긴 요소들 확인
					cellArray.forEach(function(cell) {
					    if (!cell.hasClass('selected-date')) {
					        selectedDate = false;
					    }
					});
					
	                if (selectedDate) {
	                    // 이미 선택된 날짜면 'selected-date' 클래스를 제거
	                    cellArray.forEach(function(cell) {
	                        cell.removeClass('selected-date');
	                    });
	                    // 날짜 선택에 따라 div 토글
	                    $('#selectDay').hide();
	                    $('#notSelectDay').show();
	                } else {
	                    // 새로운 날짜를 선택했을 때
	                    selectedCells.forEach(function(cell) {
	                        $(cell).removeClass('selected-date');
	                    });

	                    cellArray.forEach(function(cell) {
	                        cell.addClass('selected-date');
	                    });

	                    // 날짜 선택에 따라 div 토글
	                    $('#selectDay').show();
	                    $('#notSelectDay').hide();

	                    let startOneDay = info.startStr;
	                    let endOneDay = moment(info.endStr).subtract(1, 'day').format('YYYY-MM-DD');

	                    if (startOneDay === endOneDay) {
	                        $('#selectedDateTitle').html(startOneDay + '<br>요금 설정');
	                    } else {
	                        $('#selectedDateTitle').html(startOneDay + '<br>~' + endOneDay + '<br>요금 설정');
	                    }

	                    $('#startOneDay').val(startOneDay);
	                    $('#endOneDay').val(endOneDay);
	                }
	            },
	            eventContent: function(arg) { // event에 내용 넣기(해당 날짜의 onedayPrice)
					let $italicEl = $('<span></span>').html(arg.event.title);
					let $descriptionEl = $('<div></div>').html(arg.event.extendedProps.description);
					let arrayOfDomNodes = [$italicEl[0], $descriptionEl[0]];
	                return { domNodes: arrayOfDomNodes };
	            }
	        });
	
	        calendar.render();
	    }
	</script>
	
	<script type="text/javascript">
		$("button[name='onestatCode']").click(function() {
			let onestatCode = $(this).val();
			
			$.ajax({
				url: '/host/calendar/ajaxUpdateOnestatCode',
				method: 'get',
				data: {
						'roomId' : urlRoomId,
						'onestatCode' : onestatCode,
						'startDate': $('#startOneDay').val(),
						'endDate': $('#endOneDay').val()
					  },
				success: function(response) {
					console.log(response);
					window.location.href = '/host/calendar?roomId=' + urlRoomId;
					alert(response.message);
				}
			});
		});
	</script>
</body>
</html>