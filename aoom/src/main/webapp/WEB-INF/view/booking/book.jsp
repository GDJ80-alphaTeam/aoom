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
    <style>
        .hidden {
            display: none;
        }
    </style>
</head>
<body class="container">
    <!-- AOOM 네비게이션 바 -->
    <jsp:include page="/WEB-INF/view/layout/navbarSub.jsp"></jsp:include>

	<h3><button onclick="history.back()" class="btn btn-outline-danger"><</button> 예약하기</h3>
    <!-- 그리드 -->
	<form id="booking">
		<div class="container">
			<div class="row">
			
				<!-- 좌 -->
				<div class="col">
					<h3>날짜</h3>    
				    <input type="text" id="datePicker" style="width: 300px;" required autocomplete="off">
				    
				    <h3>숙박인원</h3>
				    <input type="number" name="usePeople" id="usePeople" min="1" required autocomplete="off">
				    
				    <h3>결제 수단 선택</h3>
				    <select id="paymentMethod">
				        <option value="">===결제수단===</option>
				        <option value="card">카드</option>
				        <option value="bankTransfer">무통장입금</option>
				    </select>
				    <input id="cardInfo" class="hidden" type="text" placeholder="카드 번호 입력" required autocomplete="off" pattern="\d{4}-\d{4}-\d{4}-\d{4}">
				    <input id="bankInfo" class="hidden" type="text" placeholder="계좌 번호 입력" required autocomplete="off">
				</div>
				
				<!-- 우 -->
				<div class="col">
					<div class="card" style="width: 18rem;">
						<img src="/image/etc/reviewDefault.png" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">${roomInfo.roomName }</h5>
								<p class="card-text">
									${roomInfo.category }
									<br>
									⭐${ratingReview.avg }점
									(후기 ${ratingReview.cnt }개)
								</p>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">
								<h5 class="card-title">요금세부정보</h5>
								<p class="card-text">
									000000 X 00일
								</p>
							</li>
							<li class="list-group-item">
								<h5 class="card-title">총합계</h5>
								<p class="card-text">
									000000 원
								</p>
							</li>
						</ul>
						<div class="card-body">
						    <button id="bookingBtn" class="btn btn-danger">예약하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>

	

	<script>
	    // url데이터를 input태그 value에 삽입
	    $(document).ready(function(){
	        const usePeople = "${usePeople}";
	        const bookingDate = "${bookingDate}";
	        
	        if (usePeople) $('#usePeople').val(usePeople);
	        if (bookingDate) $('#datePicker').val(bookingDate);
	    });
	
	    let isInitializing = false;
	
	    const bookingDate = "${bookingDate}";
	    let defaultDates = [];
	    if (bookingDate) {
	        const dates = bookingDate.split(' ~ ');
	        if (dates.length === 2) {
	            defaultDates = [dates[0], dates[1]];
	        }
	    }
	
	    const fp = flatpickr("#datePicker", {            
	        mode: "range",
	        dateFormat: "Y-m-d",                           
	        minDate: 'today',        // 오늘 이전 날짜 선택 비활성화
	        maxDate: '2024-12-31',   // 특정 날짜까지 선택 가능
	        defaultDate: defaultDates,    // 초기 날짜 설정 (현재 날짜와 시간)        
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
	                        console.log(response);
	                        // 서버에서 받은 비활성화할 날짜 배열
	                        let disableDate = response.data.map(item => item.oneday);
	                        console.log(disableDate);
	                        // Flatpickr 인스턴스 업데이트
	                        instance.set('enable', disableDate);
	                    },
	                    complete: function() {
	                        isInitializing = false; // 초기화 완료 표시
	                    }   
	                });
	            }
	        },
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
	    
	    // 결제수단 선택시 인풋창 보이게
		$('#paymentMethod').change(function() {
		    const selectedMethod = $(this).val();
		    if (selectedMethod === 'card') {
		        $('#cardInfo').removeClass('hidden');
		        $('#bankInfo').addClass('hidden');
		    } else if (selectedMethod === 'bankTransfer') {
		        $('#cardInfo').addClass('hidden');
		        $('#bankInfo').removeClass('hidden');
		    } else {
		        $('#cardInfo').addClass('hidden');
		        $('#bankInfo').addClass('hidden');
		    }
		});
	</script>
</body>
</html>