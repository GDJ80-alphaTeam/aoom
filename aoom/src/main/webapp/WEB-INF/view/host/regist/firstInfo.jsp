<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>숙소 등록 1단계</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<body>
	<form action="/host/roomManage/registRoom/registFirstInfo" method="post">
	
		<!-- roomId -->
		<input type="hidden" name="roomId" value="${roomId }">
		
		<!-- 숙소 카테고리 선택 -->
		<div>
			
			카테고리 : 
			<c:forEach var="cate" items="${roomcate }">
				<label for="${cate.codeKey }">${cate.codeName }</label>
				<input type="radio" id="${cate.codeKey }" name="roomcateCode" value="${cate.codeKey }" required="required">
			</c:forEach>
		</div>
		
		<!-- 숙소 유형 선택 -->
		<div>
			유형 :
			<c:forEach var="type" items="${roomtype }">
				<label for="${type.codeKey }">${type.codeName }</label>
				<input type="radio" id="${type.codeKey }" name="roomtypeCode" value="${type.codeKey }" required="required">
			</c:forEach>
		</div>
		
		<!-- 숙소 위치 설정 -->
		<div>
			주소 : <input type="text" id="frontAddress" placeholder="주소" style="width: 300px;" readonly="readonly" required="required">
			<button type="button" onclick="searchAddress()">주소 찾기</button><br>
			상세 주소 : <input type="text" id="detailAddress" placeholder="상세주소">
			<input type="hidden" name="address" id="address">
		</div>
		
		<!-- 최대 인원 설정 -->
		<div>
			최대 인원 : <input type="number" name="maxPeople" min="1" required="required">
		</div>
		
		<!-- 숙소 운영일 설정 -->
		<div>
			숙소 운영 기간 : 
			<input type="text" id="roomOperationDate" placeholder="날짜를 선택해주세요" style="width: 300px;" autocomplete="off">
			<input type="hidden" id="startDate" name="startDate">
			<input type="hidden" id="endDate" name="endDate">
		</div>
		
		<!-- 방, 침대, 욕실 수 설정 -->
		<div>
			방 수 : <input type="number" name="totalSpace" min="1" required="required">
			침대 수 : <input type="number" name="totalBed" min="0" required="required">
			욕실 수 : <input type="number" name="totalBath" min="0" required="required">
		</div>
		
		<button type="submit">다음</button>
	</form>
	
	<!-- 카카오 주소 찾기 API -->
	<script>
	    function searchAddress() {
	        new daum.Postcode({
	            onComplete: function(data) {
	                // 팝업에서 검색결과를 클릭했을때 실행할 코드
					
	                // 주소 변수
	                var addr = '';
					
	                // 사용자가 선택한 주소 타입에 따라 해당 주소 값 가져오기
	                if (data.userSelectedType === 'R') { // 도로명 주소를 선택(R)
	                    addr = data.roadAddress;
	                } else { // 지번 주소를 선택(J)
	                    addr = data.jibunAddress;
	                }
					
	                // 선택한 주소를 frontAddress에 값으로 주기
	                $('#frontAddress').val(addr);
	                $('#address').val($('#frontAddress').val() + ' ' + $('#detailAddress').val())
	                // 커서 상세주소 필드로 이동
	                $('#detailAddress').focus();
	            }
	        }).open();
	    }
	</script>
	
	<!-- 주소 찾기한 주소와 상세 주소 더하기 -->
	<script type="text/javascript">
		$('#detailAddress').blur(function() {
			$('#address').val($('#frontAddress').val() + ' ' + $('#detailAddress').val());
			console.log($('#address').val());
		});
	</script>
	
	<!-- 숙소 운영 시작일 날짜 제한 및 Date Range Picker 설정-->
	<script type="text/javascript">
		let today = moment().format("YYYY-MM-DD");

		// Date Range Picker 설정
		$('#roomOperationDate').daterangepicker({
			minDate:today,
		    showDropdowns: true,
		    autoApply: false,
			autoUpdateInput: false,
			locale : {
				"format" : "YYYY-MM-DD",
				"separator" : " ~ ",
				"applyLabel" : "적용",
				"cancelLabel" : "취소",
				"fromLabel" : "From",
				"toLabel" : "To",
				"customRangeLabel" : "Custom",
				"daysOfWeek" : [ "일", "월", "화", "수", "목", "금", "토" ],
				"monthNames" : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ]
			},
		},
		
		// 날짜 선택 시 input에 값 전달
		function(start, end, label) {
			console.log("시작일 : " + start.format('YYYY-MM-DD'));
			console.log("종료일 : " + end.format('YYYY-MM-DD'));
			$('#startDate').val(start.format('YYYY-MM-DD'));
			$('#endDate').val(end.format('YYYY-MM-DD'));
		});
		
		$('#roomOperationDate').on('apply.daterangepicker', function(ev, picker) {
			$(this).val(picker.startDate.format('YYYY-MM-DD') + ' ~ ' + picker.endDate.format('YYYY-MM-DD'));
		});

		$('#roomOperationDate').on('cancel.daterangepicker', function(ev, picker) { 
			$(this).val('');
		});
	</script>
</body>
</html>