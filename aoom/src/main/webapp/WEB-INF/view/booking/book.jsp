<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예약하기</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ko.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
</head>
<body class="container">
	<!-- AOOM 네비게이션 바 -->
	<jsp:include page="/WEB-INF/view/layout/navbarSub.jsp"></jsp:include>
	
	<h3><button onclick="history.back()" class="btn btn-outline-danger"><</button> 예약하기</h3>
    
    <h4>숙소 아이디</h4>
    <input type="text" name="roomId" id="roomId">
    
    <h4>날짜</h4>
    <input type="text" name="startDate" id="startDate" placeholder="날짜 및 시간 선택">
    <input type="text" name="endDate" id="endDate" placeholder="날짜 및 시간 선택">
    
    <h4>숙박인원</h4>
    <input type="number" name="usePeople" id="usePeople" min="1" required>
    <input type="text" id="datePicker" style="width: 300px;">
</body>

	<script>
		
		// url데이터를 input태그 value에 삽입
	    $(document).ready(function(){
	        const roomId = "${roomId}";
	        const startDate = "${startDate}";
	        const endDate = "${endDate}";
	        const usePeople = "${usePeople}";
	
	        if (roomId) $('#roomId').val(roomId);
	        if (startDate) $('#startDate').val(startDate);
	        if (endDate) $('#endDate').val(endDate);
	        if (usePeople) $('#usePeople').val(usePeople);
	    });
		
		let isInitializing = false;
		
		
		const fp = flatpickr("#datePicker", {			
			mode: "range",
			dateFormat: "Y-m-d",		       		         
			minDate: 'today',        // 오늘 이전 날짜 선택 비활성화
			maxDate: '2024-12-31',   // 특정 날짜까지 선택 가능
			//defaultDate: 'today',    // 초기 날짜 설정 (현재 날짜와 시간)		
			showMonths: 2,
			locale: "ko",			   
			disable: [],
			onOpen: function(selectedDates, dateStr, instance) {
				
				if (!isInitializing) {
                    isInitializing = true; // 설정 중임을 표시
				
                    
                 // 모든 날짜를 활성화하려면 enable을 빈 배열로 설정                                        
				$.ajax({
		            url: '/onedayPrice/ajaxValidDate',
		            method: 'post',
		            data: {"roomId":"${roomId}"},
		            dataType: 'json',
		            success: function(response) {
		            	
		            	instance.set('disable', []);
		            	console.log(response)
		                // 서버에서 받은 비활성화할 날짜 배열
		                let disableDate = response.data.map(item => item.oneday);
						console.log(disableDate)
		                // Flatpickr 인스턴스 업데이트
		            	instance.set('enable', disableDate);
		            },
		            complete: function() {
	                    isInitializing = false; // 초기화 완료 표시
	                }   
		        });		
				
			}}
			,
			onChange: function(selectedDates, dateStr, instance) {
				console.log("Selected range: ", selectedDates);
				
				// 날짜형식 변경 yyyy/mm/dd
            	let formattedDates = moment(selectedDates[0]).format('YYYY-MM-DD');
                console.log("Selected range (formatted): ", formattedDates);
				
				$.ajax({
		            url: '/onedayPrice/ajaxSelectDay',
		            method: 'post',
		            data: {"roomId":"${roomId}" , "selectedDate" : formattedDates },
		            dataType: 'json',
		            success: function(response) {
		            			            			                
	                    // 서버에서 받은 비활성화할 날짜 배열
		                let disableDates = response.data.map(item => item.oneday);		
		                // Flatpickr 인스턴스 업데이트
		            	instance.set('enable', disableDates);
		                
		            	console.log(disableDates);
		            }
		           
		        });		
			  }
			});
	
	</script>
</html>