<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/layout/navbarSub.jsp"></jsp:include>
	
	<div style="width: 1200px; margin: 0 auto">
		<h1>예약취소페이지</h1>
		<div style="width: 100%;display: flex;height: 200px;">
			<div style="width: 50% " >
				<p>결제한금액:${bookingInfo.totalPrice}</p>
				<p>환불금액:${bookingInfo.totalPrice}(수수료에 따라 차등)</p>
				<div>
					<h3>환불 세부내역</h3>
					<p>결제금액:${bookingInfo.totalPrice}</p>
					<p>수수료:0</p>
				</div>
			</div>
			
			<div style="width: 50;">
				<!-- 우 -->
				<div class="col">
					<div class="card" style="width: 18rem;">
						<img src="${bookingInfo.mainImage}" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title"> ${bookingInfo.roomName }</h5>
							<h6 class="card-title">예약번호: ${bookingInfo.bookingId }</h6>
								
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">
								<h5 class="card-title">요금세부정보</h5>
								<p class="card-text"  id="detailPrice">
									이용날짜: ${bookingInfo.checkIn} ~ ${bookingInfo.checkOut}<br>
									결제한금액: ${bookingInfo.totalPrice}<br>
									환불금액: ${bookingInfo.totalPrice}
								</p>
							</li>
							<li class="list-group-item">
								<h5 class="card-title">총환불금액</h5>
								<p class="card-text"  id="totalPrice">
									${bookingInfo.totalPrice} 원
									<input type="hidden" name="paymentPrice" value="${bookingPrice.sum }">
								</p>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		<form id="bookingCancelForm" action="/booking/bookingCancelEvent" method="post">
			<div>
				 <select name="cancelreaCode" id="cancelreaCode">
				 	<option value="">사유선택</option>
					<c:forEach var="c" items="${cancelInfo}">
						<option value="${c.codeKey}">${c.codeName}</option>
					</c:forEach>
				</select>
				<input type="text" name="cancelreaContent" id="cancelContent" placeholder="기타 내용을 입력하세요." style="display: none;">
			</div>
			<c:choose>
				<c:when test="${paymentInfo.paytypeCode == 'pmt02'}">
					<div>
						대금수령계좌 :
						<input type="text" value="${paymentInfo.refundAccount}" id="bankInfo" name="refundAccount" placeholder="환불 계좌 입력('-'를 포함하여 입력해주세요.)" style="display: block;" pattern="^(\d{1,})(-(\d{1,})){1,}" disabled="disabled">
					</div>
				</c:when>
			</c:choose>
			<!-- 예약번호 -->
			<input type="hidden" value="${bookingInfo.bookingId}" name="bookingId">
			<input type="hidden" value="${bookingInfo.onedayPrice}" name="refundPrice">
			<!-- 결제번호 -->
			<input type="hidden" value="${paymentInfo.paymentId}" name="paymentId">
			<button type="submit">예약취소하기</button>
		</form>
		<p id="result"></p>
	</div>
	
</body>

	<script>
        $(document).ready(function() {
            const originalAccountNumber = $('#bankInfo').val(); // 원래 계좌번호를 저장

            $('#bookingCancelForm').submit(function(event) {
                const cancelCodeSelected = $('#cancelreaCode').val();
                const cancelContent = $('#cancelContent').val();
                const currentAccountNumber = $('#bankInfo').val();
                const result = $('#result');

                // 검증 플래그
                let isValid = true;
                result.text(''); // 결과 메시지 초기화
				console.log(cancelCodeSelected);
                // 취소 사유 선택 확인
                if (!cancelCodeSelected) {
                    result.text('취소 사유를 선택해주세요.');
                    isValid = false;
                }

                // 기타 내용 입력 확인
                if ($('#cancelContent').is(':visible') && cancelContent.trim() === '') {
                    result.text('기타 내용을 입력해주세요.');
                    isValid = false;
                }

            	 // 계좌번호가 입력된 경우에만 유효성 검사
                if ($('#bankInfo').is(':enabled') && currentAccountNumber.trim() !== '') {
                    const accountPattern = /^(\d{1,})(-(\d{1,})){1,}$/; // 계좌번호 형식: XX-XXX-XXXX
                    if (!accountPattern.test(currentAccountNumber)) {
                        result.text('올바른 계좌번호 형식을 입력해주세요.');
                        isValid = false;
                    }
                }
                
                // 폼 제출 방지
                if (!isValid) {
                    event.preventDefault(); // 검증 실패 시 폼 제출 방지
                }
            });

            // 취소 사유 선택에 따른 기타 입력란 표시
            $('#cancelreaCode').change(function() {
                const selectedOption = $(this).find("option:selected").text();
                console.log(selectedOption)
                $('#bankInfo').prop('disabled', false); // 계좌번호 입력 활성화
                if (selectedOption == '기타') { // '기타'가 선택되었을 경우
                    $('#cancelContent').show();
                } else {
                    $('#cancelContent').hide();
                }
            });
        });
    </script>
</html>	