let cancelCodeSelected = $('#cancelreaCode').val();
 
$(document).ready(function() {
        $('button[id^="cancelReason"]').on('click', function() {
            // 모든 버튼에서 'on' 클래스를 제거
            $('button[id^="cancelReason"]').removeClass('on');
            // 클릭된 버튼에 'on' 클래스 추가
            $(this).addClass('on');
            $('#cancelreaCode').val($(this).attr('value'));
            cancelCodeSelected = $('#cancelreaCode').val();
            console.log($('#cancelreaCode').val());
        });
    });
    
$('#bookingCancelForm').submit(function(event) {
	
            const cancelContent = $('#cancelContent').val();
            const currentAccountNumber = $('#bankInfo').val();
            
            // 검증 플래그
            let isValid = true;
            
			console.log(cancelCodeSelected);
            // 취소 사유 선택 확인
            if (!cancelCodeSelected) {
                alert('취소 사유를 선택해주세요.');
                isValid = false;
            }

            // 기타 내용 입력 확인
            if ($('#cancelContent').is(':visible') && cancelContent.trim() === '') {
                alert('구체적인 사유를 입력해주세요.');
                isValid = false;
            }

        	 // 계좌번호가 입력된 경우에만 유효성 검사
            if ($('#bankInfo').is(':enabled') && currentAccountNumber.trim() !== '') {
                const accountPattern = /^(\d{1,})(-(\d{1,})){1,}$/; // 계좌번호 형식: XX-XXX-XXXX
                if (!accountPattern.test(currentAccountNumber)) {
                    alert('올바른 계좌번호 형식을 입력해주세요.');
                    isValid = false;
                }
            }
            
            // 폼 제출 방지
            if (!isValid) {
                event.preventDefault(); // 검증 실패 시 폼 제출 방지
            }
        });    