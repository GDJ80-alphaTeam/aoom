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
</head>
<body class="container">

	<h1>숙소 등록 1단계</h1>
	
	<!-- 나가기 버튼 -->
	<div class="d-flex">
		<button id="BtnQuit" class="btn btn-danger ms-auto">나가기</button>
	</div>
	
	<form action="/host/roomManage/registRoom/registBasicInfo" method="post">
	
		<!-- roomId -->
		<input type="hidden" name="roomId" value="${roomId }">
		
		<!-- 숙소 카테고리 선택 -->
		<div>
			
			카테고리 : 
			<c:forEach var="cate" items="${roomcate }">
				<label for="${cate.codeKey }">${cate.codeName }</label>
				<c:if test="${cate.codeKey eq roomInfo.roomcateCode}">
					<input type="radio" id="${cate.codeKey }" name="roomcateCode" value="${cate.codeKey }" checked="checked" required="required">
				</c:if>
				<c:if test="${cate.codeKey ne roomInfo.roomcateCode}">
					<input type="radio" id="${cate.codeKey }" name="roomcateCode" value="${cate.codeKey }" required="required">
				</c:if>
			</c:forEach>
		</div>
		
		<!-- 숙소 유형 선택 -->
		<div>
			유형 :
			<c:forEach var="type" items="${roomtype }">
				<label for="${type.codeKey }">${type.codeName }</label>
				<c:if test="${type.codeKey eq roomInfo.roomtypeCode}">
					<input type="radio" id="${type.codeKey }" name="roomtypeCode" value="${type.codeKey }" checked="checked" required="required">
				</c:if>
				<c:if test="${type.codeKey ne roomInfo.roomtypeCode}">
					<input type="radio" id="${type.codeKey }" name="roomtypeCode" value="${type.codeKey }" required="required">
				</c:if>
			</c:forEach>
		</div>
		
		<!-- 숙소 위치 설정 -->
		<div>
			주소 : 
			<input type="text" id="frontAddress" placeholder="주소" style="width: 300px;" readonly="readonly" required="required">
			<button type="button" onclick="searchAddress()">주소 찾기</button><br>
			상세 주소 : 
			<input type="text" id="detailAddress" placeholder="상세주소">
			<input type="hidden" name="address" id="address" required="required">
		</div>
		<!-- 최대 인원 설정 -->
		<div>
			최대 인원 : 
			<c:if test="${roomInfo.maxPeople != null && roomInfo.maxPeople ne ''}">
				<input type="number" name="maxPeople" min="1" value="${roomInfo.maxPeople }" required="required">
			</c:if>
			<c:if test="${roomInfo.maxPeople == null || roomInfo.maxPeople eq ''}">
				<input type="number" name="maxPeople" min="1" required="required">
			</c:if>
		</div>
		
		<!-- 숙소 운영일 설정 -->
		<div>
			숙소 운영 기간 : 
			<fmt:formatDate value="${roomInfo.startDate }" pattern="yyyy-MM-dd" var="startDateDB"/>
			<fmt:formatDate value="${roomInfo.endDate }" pattern="yyyy-MM-dd" var="endDateDB"/>
			<c:if test="${roomInfo.startDate != null && roomInfo.startDate ne ''}">
				<input type="text" id="roomOperationDate" placeholder="날짜를 선택해주세요" value="${startDateDB }-${endDateDB }" style="width: 300px;" required="required" autocomplete="off">			
			</c:if>
			<c:if test="${roomInfo.startDate == null || roomInfo.startDate eq ''}">
				<input type="text" id="roomOperationDate" placeholder="날짜를 선택해주세요" style="width: 300px;" required="required" autocomplete="off">
			</c:if>

			<input type="hidden" id="startDate" value="${startDateDB }" name="startDate">
			<input type="hidden" id="endDate" value="${endDateDB }" name="endDate">
		</div>
		
		<!-- 방, 침대, 욕실 수 설정 -->
		<div>
			방 수 : 
			<c:if test="${roomInfo.totalSpace != null && roomInfo.totalSpace ne ''}">
				<input type="number" name="totalSpace" min="1" value="${roomInfo.totalSpace }" required="required">			
			</c:if>
			<c:if test="${roomInfo.totalSpace == null || roomInfo.totalSpace eq ''}">
				<input type="number" name="totalSpace" min="1" required="required">
			</c:if>
			
			침대 수 : 
			<c:if test="${roomInfo.totalBed != null && roomInfo.totalBed ne ''}">
				<input type="number" name="totalBed" min="0" value="${roomInfo.totalBed }" required="required">			
			</c:if>
			<c:if test="${roomInfo.totalBed == null || roomInfo.totalBed eq ''}">
				<input type="number" name="totalBed" min="0" required="required">
			</c:if>

			욕실 수 : 
			<c:if test="${roomInfo.totalBath != null && roomInfo.totalBath ne ''}">
				<input type="number" name="totalBath" min="0" value="${roomInfo.totalBath }" required="required">			
			</c:if>
			<c:if test="${roomInfo.totalBath == null || roomInfo.totalBath eq ''}">
				<input type="number" name="totalBath" min="0" required="required">
			</c:if>
		</div>
		
		<!-- 다음 버튼-->
		<div class="d-flex">
			<button type="submit" id="BtnNext" class="btn btn-primary ms=">다음</button>
		</div>
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
	                $('#address').val($('#frontAddress').val() + '^' + $('#detailAddress').val())
	                // 커서 상세주소 필드로 이동
	                $('#detailAddress').focus();
	            }
	        }).open();
	    }
	</script>
	
	<!-- 주소 찾기한 주소와 상세 주소 더하기 -->
	<script type="text/javascript">
		$('#detailAddress').blur(function() {
			$('#address').val($('#frontAddress').val() + '^' + $('#detailAddress').val());
			console.log($('#address').val());
		});
	</script>
	
	<!-- DB에서 가져온 주소 나누기 -->
	<script type="text/javascript">
		$( document ).ready(function() {
		    console.log("${roomInfo.address}");
		    let roomInfo = "${roomInfo.address}";
		    let array = roomInfo.split("^");
		    let address1 = array[0];
		    let address2 = array[1];
		    
		    console.log(address1);
		    console.log(address2);
		    
			// input 요소에 값 설정
			$('#frontAddress').val(address1);
			$('#detailAddress').val(address2);
			$('#address').val(address1 + '^' + address2);
			
		    console.log($('#frontAddress').val());
		    console.log($('#detailAddress').val());
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
	
	<!-- form 제출 전 주소값 유효성 검사 -->
	<script type="text/javascript">
		$('#BtnNext').click(function() {
			if ($('#frontAddress').val() == null || $('#frontAddress').val() == '') {
				$('#frontAddress').focus();
				return false;
			}
			if ($('#detailAddress').val() == null || $('#detailAddress').val() == '') {
				$('#detailAddress').focus();
				return false;
			}
		});
	</script>
	
	<!-- 나가기 버튼 클릭시 이벤트 -->
	<script type="text/javascript">
		$('#BtnQuit').click(function() {
			if (confirm("나가실 경우 해당 페이지의 내용은 저장 되지않습니다")) {
                window.location.href = "/host/roomManage";
            }
		});	
	</script>
</body>
</html>