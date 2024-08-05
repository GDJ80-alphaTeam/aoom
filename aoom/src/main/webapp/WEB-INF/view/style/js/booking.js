
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
	
	        if (params.usePeople) $('#usePeople').html(params.usePeople);
	        if (params.startDate) $('#startDate').val(params.startDate);
	        if (params.endDate) $('#endDate').val(params.endDate);
	        if (params.startDate && params.endDate) {
	            $('#datePicker').val(params.startDate + " ~ " + params.endDate);
	        }
	        if (params.roomId) $('#roomId').val(params.roomId);
	        if (params.startDate){
				$('#startDate').val(params.startDate);
			}
			if (params.endDate){
				$('#endDate').val(params.endDate);
			}
	    });
	    
// 인원수 조절 
$(document).ready(function() {
	let usePeople = parseInt($('#usePeople').text(), 10);
	$('#usePeopleValue').val(usePeople);
	
	console.log(maxPeople);
	console.log(usePeople+"test");
    $('.plus_btn').click(function() {
		if( maxPeople > usePeople){
            var $result = $('.result');
            var currentValue = parseInt($result.text(), 10);//숫자로 변환
            $result.text(currentValue + 1);
            usePeople = usePeople + 1;
            $('#usePeopleValue').val(usePeople); 
            console.log(usePeople);
            
        }
        
    });

$('.minus_btn').click(function() {
        var $result = $('.result');
        var currentValue = parseInt($result.text(), 10);
        if (currentValue > 1) {
            $result.text(currentValue - 1);
            usePeople = usePeople - 1 ;
            $('#usePeopleValue').val(usePeople);
        }
    });
});

let isInitializing = false;
		
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
	                    data: {"roomId":roomId},
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
	            let usePeople = parseInt($('#usePeople').text(), 10);
	            
	         	// endDate input 필드 업데이트
                $('#startDate').val(startDate);
                $('#endDate').val(endDate);
	         
	            $.ajax({
	                url: '/onedayPrice/ajaxBookingDay',
	                method: 'post',
	                data: {"roomId" : roomId , "selectedDate" : formattedDates, "startDate" : startDate, "endDate" : endDate, "usePeople" : usePeople},
	                dataType: 'json',
	                success: function(response) {
	                	console.log(response)
	                	
	                    // 서버에서 받은 비활성화할 날짜 배열
	                    let disableDates = response.data.map(item => item.oneday);      
	                    // Flatpickr 인스턴스 업데이트
	                    instance.set('enable', disableDates);
	                    
	                    // 요금 세부 정보 업데이트
	                    let priceDetail = "₩" + response.bookingPrice.avg +"원 x " + response.bookingPrice.cnt + "박";
	                    
	                    $('#detailPrice').html(priceDetail);
	                    
	                    // 요금 합계 업데이트
	                    $('#totalPrice').text(response.bookingPrice.sum + ' 원');
	                    $('#paymentPrice').val(response.bookingPrice.sum);
	                }
	            });
	        }
	    });	    
	    
$('#paymentMethod').change(function() {
	const selectedMethod = $(this).val();
	$('#cardInfo').removeAttr('required');
    $('#cardsa').removeAttr('required');
    $('#bankInfo').removeAttr('required');
    $('#bank').removeAttr('required');
    $('#cardInfo').val('');
    $('#cardsa').val('');
    $('#bankInfo').val('');
    $('#bank').val('');
    console.log(selectedMethod);
    if (selectedMethod === 'card') {
        $('#cardInfo').css('display', 'block').attr('required', 'required');
        $('#cardsa').css('display', 'block').attr('required', 'required');
    } else if (selectedMethod === 'bankTransfer') {
        $('#bankInfo').css('display', 'block').attr('required', 'required');
        $('#bank').css('display', 'block').attr('required', 'required');
    }

    if (selectedMethod === 'card') {
        $('#cardInfo').css('display', 'block').attr('required', 'required');
        $('#cardsa').css('display', 'block').attr('required', 'required');
        $('#bankInfo').css('display', 'none').removeAttr('required');
        $('#bank').css('display', 'none').removeAttr('required');
    } else if (selectedMethod === 'bankTransfer') {
        $('#bankInfo').css('display', 'block').attr('required', 'required');
        $('#bank').css('display', 'block').attr('required', 'required');
        $('#cardInfo').css('display', 'none').removeAttr('required');
        $('#cardsa').css('display', 'none').removeAttr('required');
    } else {
        $('#cardInfo').css('display', 'block').removeAttr('required');
        $('#cardsa').css('display', 'block').removeAttr('required');
        $('#bankInfo').css('display', 'block').removeAttr('required');
        $('#bank').css('display', 'block').removeAttr('required');
    }

});	   
 
// 숙박인원 변경 시 이벤트
$('#usePeople').on('input', function() {
	alert("인원변경됨.");
});

// 예약하기 버튼 클릭 시 이벤트
$('#bookingBtn').click(function(event){
	event.preventDefault(); // 폼의 기본 제출 동작을 막음
	
	let startDateValue = new Date($('#startDate').val());
    let endDateValue = new Date($('#endDate').val());
	console.log(startDateValue);
	console.log(endDateValue);
	// 폼이 유효하지 않으면 AJAX 요청을 보내지 않음
    if (!document.getElementById('booking').checkValidity()) {
        alert('폼을 올바르게 작성해주세요.');
        return; 
    }
    
    if (!startDateValue || !endDateValue || startDateValue == endDateValue || endDateValue < startDateValue) {
        alert('날짜를 선택해주세요.');
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