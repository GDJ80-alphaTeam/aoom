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
    <title>달력</title>
    <script src="https://kit.fontawesome.com/82b4a4fcad.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/style/js/roomManage.js" defer></script>

    <link rel="stylesheet" href="/style/css/common.css">
    <link rel="stylesheet" href="/style/css/calendar.css">
    <link rel="stylesheet" href="/style/css/hostNavbar.css">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js'></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/view/layout/navbarHost.jsp"></jsp:include>
    <!-- ---------------컨텐츠 시작------------------------>

    <div class="inner">
        <div class="inner_nav">
            <ul>
                <li><a href="/host/main">메인</a></li>
                <li class="active"><a href="/host/calendar">달력</a></li>
                <li><a href="/host/roomManage">숙소 관리</a></li>
                <li><a href="/host/bookList">예약 목록</a></li>
                <li><a href="/host/revenue">수입</a></li>
            </ul>
        </div><!-- //inner_nav 숙소관리 네비 -->
        <div class="cal">
           	<div class="cal_top">
                <h4>달력</h4>
                <div class="t_right">
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
                </div><!-- //t_right -->
            </div><!-- //r_m_top 썸네일, 리스트 형식 공통  사용-->
		    
		    <div style="display: flex;">
		        <div id='calendar'></div>
		        
		        <div style="width: 280px; box-sizing: border-box;">
		        
		        	<!-- 닐찌 선택 안했을 때 -->
		            <div style="width: 840; display: inline-block;" id="notSelectDay">
			            <form id="priceForm">
			            	<h3 id="notSelectedDateTitle"></h3>
			            	<h3>전체 요금</h3>
			                <div>1박당</div>
			                <input type="hidden" name="roomId" value="${selectedRoomId }">
			                <input type="number" min="30000" id="defaultPrice" name="defaultPrice" required="required" style="height: 35px;">원
			                <button class="pink" type="button" id="updateDefaultPriceBtn"><span>설정</span></button>
			                <br>
			                <br>
			                
			                <h3>주말 요금</h3>
			                <div>1박당</div>
		                	<input type="number" min="30000" id="weekendPrice" name="weekendPrice" style="height: 35px;">원
			                <button class="pink" type="button" id="updateWeekendPriceBtn"><span>설정</span></button>
			            </form>
		            </div>
		            
		            <!-- 닐찌 선택 했을 때 -->
		            <div style="width: 100%;" id="selectDay">
		            	<!-- 선택한 날짜 표시 -->
		                <h3 id="selectedDateTitle"></h3>
		                <br>
		                
		                <!-- 예약 상태 변경 -->
		                <form id="selectedPriceForm">
			                <div class="d-flex align-items-center">
								<c:forEach var="onestatCode" items="${onestatCodeList }">
									<c:if test="${onestatCode.codeKey == 'one01'}">
									    <button class="pink" type="button" name="onestatCode" value="${onestatCode.codeKey }"><span>${onestatCode.codeName }</span></button>
									</c:if>
									<c:if test="${onestatCode.codeKey == 'one02'}">
									    <button class=dark_navy type="button" name="onestatCode" value="${onestatCode.codeKey }"><span>${onestatCode.codeName }</span></button>
									</c:if>					
								</c:forEach>
			                </div>
			                <br>
		                
			                <div>1박당</div>
			                <input type="hidden" name="roomId" value="${selectedRoomId }">
			                <input type="hidden" name="startDate" id="startOneDay">
			                <input type="hidden" name="endDate" id="endOneDay">
			                <input type="number" min="30000" id="defaultPriceSelected" name="defaultPrice" style="height: 35px;">원
			                <button class="pink" type="button" id="selectedPriceBtn"><span>설정</span></button>
			                <br>
		                </form>
		            </div>
		        </div>
		    </div>
        </div><!-- //cal -->
		
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
    	// calendar, 선택한 roomId 전역 변수 선언
	    let calendar; 
	    let urlRoomId;
	    let friSatList = [];
	    
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
	                	console.log(response.roomData)
	                	// 운영일 만큼만 달력을 보여주기 위해 startDate, endDate 가져오기
	                    let startDate = response.roomData.startDate;
	                    let endDate = response.roomData.endDate;
	                    // 날짜 선택하지 않았을 때 title 설정
	                    $('#notSelectedDateTitle').html(startDate + ' ~ ' + endDate);
	                    
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
	                                    color: item.onestatCode === 'one01' ? '#ed5977' : '#291B3C'
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
	                        $('#selectedDateTitle').html(startOneDay + ' 요금 설정');
	                    } else {
	                        $('#selectedDateTitle').html(startOneDay + ' ~ ' + endOneDay + '<br>요금 설정');
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
	
	        friSatList = getFriSatDays(startDate, moment(endDate).subtract(1, 'day'));
	        console.log(friSatList);
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
	
	<script type="text/javascript">
	
		// 금요일과 토요일 날짜를 가져오는 함수
		function getFriSatDays(startDate, endDate) {
		    let fridaySaturdayDates = [];
		    let currentDate = moment(startDate);
	
		    while (currentDate.isBefore(endDate) || currentDate.isSame(endDate, 'day')) {
		        let dayOfWeek = currentDate.day();
		        if (dayOfWeek === 5 || dayOfWeek === 6) { // 금요일 또는 토요일
		            fridaySaturdayDates.push(currentDate.format('YYYY-MM-DD'));
		        }
		        currentDate.add(1, 'day');
		    }
	
		    return fridaySaturdayDates;
		}
		
		$('#updateDefaultPriceBtn').click(function() {
			$.ajax({
				url: '/host/calendar/ajaxUpdateDefaultPrice',
				method: 'get',
				data: {
					'roomId' : urlRoomId,
					'defaultPrice' : $('#defaultPrice').val()
				},
				success: function(response) {
					alert(response.message);
					window.location.href = '/host/calendar?roomId=' + urlRoomId;
				}
			})
		});
		
		$('#updateWeekendPriceBtn').click(function() {
			$.ajax({
				url: '/host/calendar/ajaxUpdateDefaultPrice',
				method: 'get',
				data: {
					'roomId' : urlRoomId,
					'weekendDates'	: friSatList.join(','),
					'defaultPrice' : $('#weekendPrice').val()
				},
				success: function(response) {
					alert(response.message);
					window.location.href = '/host/calendar?roomId=' + urlRoomId;
				}
			})
		});
		
		$('#selectedPriceBtn').click(function() {
			$.ajax({
				url: '/host/calendar/ajaxUpdateDefaultPrice',
				method: 'get',
				data: {
					'roomId' : urlRoomId,
					'startDate' : $('#startOneDay').val(),
					'endDate' : $('#endOneDay').val(),
					'defaultPrice' : $('#defaultPriceSelected').val()
				},
				success: function(response) {
					alert(response.message);
					window.location.href = '/host/calendar?roomId=' + urlRoomId;
				}
			})
		});
	</script>

</body>
</html>