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
    <link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_orange.css">
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
				    <input type="text" id="datePicker" style="width: 300px;" required autocomplete="off"><br>
				    <input type="hidden" id="startDate" name="startDate">
				    <input type="hidden" id="endDate" name="endDate">
				    <input type="hidden" id="roomId" name="roomId">
				    
				    <h3>숙박인원</h3>
				    <input type="number" id="usePeople" name="usePeople" min="1" max="${maxPeople}" required autocomplete="off">
				    
				    <h3>결제 수단 선택</h3>
				    <select id="paymentMethod">
				        <option value="card" selected>카드</option>
				        <option value="bankTransfer">무통장입금</option>
				    </select>
				    
				    <!-- 카드 선택시 나올 부분 -->
				    <select id="cardsa" name="card">
				    	<c:forEach var="card" items="${card }">
				    		<option value="${card.codeKey }">${card.codeName }</option>
				    	</c:forEach>
				    </select>
				    <input type="text" id="cardInfo" name="cardNo" placeholder="카드번호 입력('-'를 포함하여 입력해주세요.)" pattern="\d{4}-\d{4}-\d{4}-\d{4}" required>
				    
				    <!-- 무통장 입금 선택시 나올 부분 -->
				    <select id="bank" class="hidden" name="bank">
				    	<c:forEach var="bank" items="${bank }">
				    		<option value="${bank.codeKey }">${bank.codeName }</option>
				    	</c:forEach>
				    </select>
				    <input type="text" id="bankInfo" name="refundAccount" class="hidden" placeholder="환불 계좌 입력('-'를 포함하여 입력해주세요.)" pattern="^(\d{1,})(-(\d{1,})){1,}">
				    
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
								<p class="card-text"  id="detailPrice">
									<c:forEach var="bookingPriceDetail" items="${bookingPriceDetail}">
										${bookingPriceDetail.oneday} : ${bookingPriceDetail.onedayPrice}원 <br>
									</c:forEach>
								</p>
							</li>
							<li class="list-group-item">
								<h5 class="card-title">총합계</h5>
								<p class="card-text"  id="totalPrice">
									${bookingPrice.sum } 원
								</p>
								<input type="hidden" id="paymentPrice" name="paymentPrice" value="${bookingPrice.sum }">
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
	    // URL 쿼리 매개변수를 파싱하여 객체로 변환하는 함수
	    function getQueryParams() {
	        const params = {};
	        const queryString = window.location.search.substring(1);
	        const regex = /([^&=]+)=([^&]*)/g;
	        let m;
	        while (m = regex.exec(queryString)) {
	            params[decodeURIComponent(m[1])] = decodeURIComponent(m[2]);
	        }
	        return params;
	    }
	
	    // url데이터를 input태그 value에 삽입
	    $(document).ready(function(){
	        const params = getQueryParams();
	
	        if (params.usePeople) $('#usePeople').val(params.usePeople);
	        if (params.startDate) $('#startDate').val(params.startDate);
	        if (params.endDate) $('#endDate').val(params.endDate);
	        if (params.startDate && params.endDate) {
	            $('#datePicker').val(params.startDate + " ~ " + params.endDate);
	        }
	        if (params.roomId) $('#roomId').val(params.roomId);
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
	                        
	                        // 서버에서 받은 비활성화할 날짜 배열
	                        let disableDate = response.data.map(item => item.oneday);
	                        
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
	            // 날짜형식 변경 yyyy/mm/dd
	            let formattedDates = moment(selectedDates[0]).format('YYYY/MM/DD');
	            let startDate = moment(selectedDates[0]).format('YYYY/MM/DD');
	            let endDate = moment(selectedDates[1]).format('YYYY/MM/DD');
	            
	            // usePeople 값을 가져옴
	            let usePeople = $('#usePeople').val();
	            
	         	// endDate input 필드 업데이트
                $('#startDate').val(startDate);
                $('#endDate').val(endDate);
	         
	            $.ajax({
	                url: '/onedayPrice/ajaxBookingDay',
	                method: 'post',
	                data: {"roomId" : "${roomId}", "selectedDate" : formattedDates, "startDate" : startDate, "endDate" : endDate, "usePeople" : usePeople},
	                dataType: 'json',
	                success: function(response) {
	                	console.log(response)
	                	
	                    // 서버에서 받은 비활성화할 날짜 배열
	                    let disableDates = response.data.map(item => item.oneday);      
	                    // Flatpickr 인스턴스 업데이트
	                    instance.set('enable', disableDates);
	                    
	                    // 요금 세부 정보 업데이트
	                    let priceDetail = "";
	                    response.bookingPriceDetail.forEach(function(detail){
	                    	priceDetail += detail.oneday + " : " + detail.onedayPrice + "원<br>";
	                    });
	                    $('#detailPrice').html(priceDetail);
	                    
	                    // 요금 합계 업데이트
	                    $('#totalPrice').text(response.bookingPrice.sum + ' 원');
	                    $('#paymentPrice').val(response.bookingPrice.sum);
	                }
	            });
	        }
	    });
	    
	    // 결제수단 선택시 인풋창 보이게 + 유효성 검사
        $('#paymentMethod').change(function() {
            const selectedMethod = $(this).val();
            $('#cardInfo').removeClass('hidden').removeAttr('required');
            $('#cardsa').removeClass('hidden').removeAttr('required');
            $('#bankInfo').removeClass('hidden').removeAttr('required');
            $('#bank').removeClass('hidden').removeAttr('required');
            
            if (selectedMethod === 'card') {
                $('#cardInfo').addClass('hidden').attr('required', 'required');
                $('#cardsa').addClass('hidden').attr('required', 'required');
            } else if (selectedMethod === 'bankTransfer') {
                $('#bankInfo').addClass('hidden').attr('required', 'required');
                $('#bank').addClass('hidden').attr('required', 'required');
            }

            if (selectedMethod === 'card') {
                $('#cardInfo').removeClass('hidden').attr('required', 'required');
                $('#cardsa').removeClass('hidden').attr('required', 'required');
                $('#bankInfo').addClass('hidden').removeAttr('required');
                $('#bank').addClass('hidden').removeAttr('required');
            } else if (selectedMethod === 'bankTransfer') {
                $('#bankInfo').removeClass('hidden').attr('required', 'required');
                $('#bank').removeClass('hidden').attr('required', 'required');
                $('#cardInfo').addClass('hidden').removeAttr('required');
                $('#cardsa').addClass('hidden').removeAttr('required');
            } else {
                $('#cardInfo').addClass('hidden').removeAttr('required');
                $('#cardsa').addClass('hidden').removeAttr('required');
                $('#bankInfo').addClass('hidden').removeAttr('required');
                $('#bank').addClass('hidden').removeAttr('required');
            }
        });
	    
	    // 숙박인원 변경 시 이벤트
		$('#usePeople').on('input', function() {
			alert("인원변경됨.");
		});
	    
	    // 예약하기 버튼 클릭 시 이벤트
	    $('#bookingBtn').click(function(event){
	    	event.preventDefault(); // 폼의 기본 제출 동작을 막음
	    	
	    	// 폼이 유효하지 않으면 AJAX 요청을 보내지 않음
		    if (!document.getElementById('booking').checkValidity()) {
		        alert('폼을 올바르게 작성해주세요.');
		        return; 
		    }
		    
	    	// form 데이터를 seraialize()로 가져오기
	    	let formData = $('#booking').serialize();
	    	
			$.ajax({
				url: '/booking/ajaxBook',
				method: 'post',
				data: formData,
				success: function(response){
					console.log(response); // 응답 로그
					if(response.result){
				        alert(response.message);
				        window.location.href = '/guest/bookInfo?bookingId='+response.data;
					}else{
				        alert(response.message);
					}
				},
		        error: function(jqXHR, textStatus, errorThrown) {
		            console.error('AJAX Error: ' + textStatus + ': ' + errorThrown);
		            alert('예약 요청 중 오류가 발생했습니다.');
		        }
			})
	    })
	</script>
</body>
</html>