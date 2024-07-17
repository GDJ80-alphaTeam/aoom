<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>숙소등록 3단계</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>

	<form action="/host/roomManage/registRoom/registPaymentInfo" id="paymentForm" method="post">
		<!-- roomId -->
		<input type="hidden" name="roomId" value="${roomId }">
		
		<!-- 예약 확정 방식 설정 - 현재 기능 구현 X -->
		<h4>예약 확정 방식</h4>
		<div>
			<button type="button" id="instantBooking" disabled="disabled">즉시 예약</button>
			<button type="button" id="wan01" disabled="disabled">사진</button>
			<button type="button" id="wan02" disabled="disabled">여행 목적</button>
			<button type="button" id="wan03" disabled="disabled">체크인 시간</button>
			<button type="button" id="wan04" disabled="disabled">숙소 선택 이유</button>
		</div>
		<br>
		
		<!-- 기본 요금 설정 -->
		<h4>기본 요금</h4>
		<span>숙소 요금은 10원단위로 절사(내림)됩니다.</span>
		<div>
			<input type="number" id="defaultPrice" name="defaultPrice" min="0" placeholder="금액을 입력해주세요">원
		</div>
		<br>
		
		<!-- 환불 정책 설정 - 현재 기능 구현 X -->
		<h4>환불 정책 설정</h4>
		<div>
			<select>
				<c:forEach var="rf" items="${refundme }">
					<option>${rf.codeDesc }</option>
				</c:forEach>
			</select>			
		</div>
		<br>
		
		<!-- 대금 수령 계좌 설정 -->
		<h4>환불 정책 설정</h4>
		<div>
			<!-- 은행 선택 -->
			<select name="bankCode">
				<c:forEach var="b" items="${bank }">
					<option value="${b.codeKey }">${b.codeName }</option>
				</c:forEach>
			</select>
			
			<!-- 계좌번호 정규식 적용 -->
			<input type="text" id="accountNo" name="accountNo" placeholder="'-'를 포함하여 입력해주세요" pattern="^(\d{1,})(-(\d{1,})){1,}" style="width: 250px;">
		</div>
		<br>
		
		<button type="submit">다음</button>
	</form>
	
	<!-- 숙소 기본 요금 설정 시 10원단위로 절사 및 1000원단위로 콤마 표시 기능 -->
	<script type="text/javascript">
		$('#defaultPrice').blur(function() {
			// 입력한 금액 가져오기
			let originalPrice = $('#defaultPrice').val();
			console.log(originalPrice);
			
			// 1원단위 절사(내림)
			let truncationPrice = Math.floor(originalPrice/10) * 10;
			console.log(truncationPrice);
			
			$('#defaultPrice').val(truncationPrice);
		});
	</script>
</body>
</html>