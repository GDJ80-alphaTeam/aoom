<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>기본정보 등록</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<form id="basicInfoForm">
		<!-- 숙소 카테고리 설정 -->
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
				<input type="radio" id="${type.codeKey }" name="roomcateCode" value="${type.codeKey }" required="required">
			</c:forEach>
		</div>
		
		<!-- 숙소 위치 입력 -->
		<div>
			주소 : <input type="text" id="address" placeholder="주소" style="width: 300px;" readonly="readonly" required="required">
			<button type="button" onclick="searchAddress()">주소 찾기</button><br>
			상세 주소 : <input type="text" id="detailAddress" placeholder="상세주소">
		</div>
		
		<!-- 최대 인원 입력 -->
		<div>
			최대 인원 : <input type="number" min="1" required="required">
		</div>
		
		<!-- 숙소 운영일 설정 -->
		<div>
			시작일 : <input type="date" id="startDate" required="required">
			종료일 : <input type="date" id="endDate" disabled="disabled">
		</div>
		<!-- 방, 침대, 욕실 수 설정 -->
		<div>
			방 수 : <input type="number" min="1" required="required">
			침대 수 : <input type="number" min="0" required="required">
			욕실 수 : <input type="number" min="0" required="required">
		</div>
		
		<button id="nextBtn">다음</button>
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
					
	                // 선택한 주소를 address에 값으로 주기
	                $('#address').val(addr);
	                // 커서 상세주소 필드로 이동
	                $('#detailAddress').focus();
	            }
	        }).open();
	    }
	</script>
	
	<!-- 숙소 운영 시작일 날짜 제한 -->
	<script type="text/javascript">
		// 영국시간과의 차이(ms단위);
		let offset = 1000 * 60 * 60 * 9;
		
		// Date.now() - 오늘 날짜(ms단위) + 영국시간과 차이(ms단위) = 한국 날짜(ms단위)
		// toISOString() : Date 를 ISOString(yyyy-mm-ddThh:mm:ss) 형식의 문자열로 변환
		let today = new Date(Date.now() + offset).toISOString().substring(0, 10);
		console.log(today);
		
		// 숙소 운영 시작일 min값을 오늘로 설정
		$('#startDate').attr('min', today);
		
		// 숙소 운영 종료일을 시작일 이후로 설정
		$('#startDate').blur(function() {
			// 숙소 운영 시작일의 value값 가져오기
			let startDate = $('#startDate').val(); 

			// 숙소 운영 종료일에 min값을 숙소 운영 시작일로 설정
			$('#endDate').attr('min', startDate);
			
			// 숙소 운영 시작일을 선택했을 경우 숙소 운영 종료일을 선택할 수 있도록 설정
			$('#endDate').attr('disabled', false);
		});
	</script>
	
	<script type="text/javascript">
		$('#nextBtn').click(function() {
			
		});
	</script>
</body>
</html>