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
			주소 : <input type="text" id="address" placeholder="주소" style="width: 300px;" readonly="readonly">
			<button type="button" onclick="searchAddress()">주소 찾기</button><br>
			상세 주소 : <input type="text" id="detailAddress" placeholder="상세주소">
		</div>
		
		<!-- 최대 인원 입력 -->
		<div>
			최대 인원 : <input type="number">
		</div>
		
		<!-- 숙소 운영일 설정 -->
		<div>
			시작일 : <input type="date">
			종료일 : <input type="date">
		</div>
		<!-- 방, 침대, 욕실 수 설정 -->
		<div>
			방 수 : <input type="number">
			침대 수 : <input type="number">
			욕실 수 : <input type="number">
		</div>
	</form>
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
</body>
</html>