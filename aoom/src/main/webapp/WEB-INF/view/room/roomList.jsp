<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>숙소검색결과</title>
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
	<!-- AOOM 네비게이션 바 -->
	<jsp:include page="/WEB-INF/view/layout/navbarSub.jsp"></jsp:include>
	
	<!-- 그리드 -->
	<div class="container text-center">
		<div class="row">
			<div class="col"></div>
			<div class="col-10">
				<!-- 검색 -->
				<form id="search">
					<input type="text" name="address" id="address" placeholder="여행지">
					<input type="date" id="startDate" name="startDate" placeholder="체크인" autocomplete="off">
					<input type="date" id="endDate" name="endDate" placeholder="체크아웃" autocomplete="off">
					<input type="number" name="usePeople" id="usePeople" min="0" placeholder="여행자">
					<button type="button" id="searchBtn">검색</button>
				</form>
				
				<!-- 카테고리 -->
				<c:forEach var="roomCategory" items="${roomCategory}" varStatus="status">
					<span><a id="rct${status.index + 1 < 10 ? '0' : ''}${status.index + 1}" href="${pageContext.request.contextPath}/room/roomList?category=${roomCategory.codeKey}">${roomCategory.codeName}</a></span>
				</c:forEach>
				
				<!-- 필터 -->
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
					필터
				</button>
			
				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-scrollable">
						<div class="modal-content">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">필터</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal"	aria-label="Close"></button>
							</div>
							<form action="${pageContext.request.contextPath}/room/roomList" method="get">
								<div class="modal-body">
								
										<h3>가격</h3>
										<input type="number" min="30000" value="30000" name="lowPrice" placeholder="최저"> ~ <input type="number" min="40000" value="200000" name="highPrice" placeholder="최고"> 
										
										<h3>숙소 유형</h3>
							        	<label for="roomTypeAll">전체</label>
							            <input type="radio" id="roomTypeAll" name="roomtypeCode" value="all" checked>
										<c:forEach var="roomType" items="${roomType}">
											<label for="${roomType.codeKey}">${roomType.codeName}</label>
								            <input type="radio" id="${roomType.codeKey}" name="roomtypeCode" value="${roomType.codeKey}">
										</c:forEach>
										
										<h3>침실과 침대 화장실</h3>
										<label for="totalSpace">침실</label>
										<input type="radio" id="totalSpace" name="totalSpace" value="1" checked>1
										<input type="radio" id="totalSpace" name="totalSpace" value="2">2
										<input type="radio" id="totalSpace" name="totalSpace" value="3">3
										<input type="radio" id="totalSpace" name="totalSpace" value="4">4
										<input type="radio" id="totalSpace" name="totalSpace" value="5">5+
										<br>
										<label for="totalBed">침대</label>
										<input type="radio" id="totalBed" name="totalBed" value="1" checked>1
										<input type="radio" id="totalBed" name="totalBed" value="2">2
										<input type="radio" id="totalBed" name="totalBed" value="3">3
										<input type="radio" id="totalBed" name="totalBed" value="4">4
										<input type="radio" id="totalBed" name="totalBed" value="5">5+
										<br>
										<label for="totalBath">화장실</label>
										<input type="radio" id="totalBath" name="totalBath" value="1" checked>1
										<input type="radio" id="totalBath" name="totalBath" value="2">2
										<input type="radio" id="totalBath" name="totalBath" value="3">3
										<input type="radio" id="totalBath" name="totalBath" value="4">4
										<input type="radio" id="totalBath" name="totalBath" value="5">5+
										
										<h3>편의 시설</h3>
										<!-- 기본값 0(hidden), 선택시 1값이 submit되게. -->
										<c:forEach var="amenitie" items="${amenities }">
											<input type="checkbox" id="${amenitie.codeKey }" name="${amenitie.codeKey }" value="1">${amenitie.codeName }
											<br>
										</c:forEach>
										
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
									<button type="submit" class="btn btn-danger">필터링</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="col"></div>
		</div>
	</div>

	<h3 class="text-center">결과 출력</h3>
	
	<table class="table table-danger">
		<thead>
			<tr>
				<th>메인사진</th>
				<th>주소</th>
				<th>숙소이름</th>
				<th>기본가격</th>
			</tr>
		</thead>
		<tbody id="result">
			
		</tbody>
	</table>
	
	<script>
		// 검색버튼 클릭시 이벤트
		$('#searchBtn').click(function() {
			$.ajax({
				url:'/room/ajaxResultRoom',
				method:'post',
				data: $('#search').serialize(),
				success:function(response){
					
					// 검색결과가 출력되어 있는 부분을 empty시킴
					$('#result').empty();
					
					if(response.result == true){
						alert(response.message);
						console.log(response);
						
						// 반환된 검색결과 변수에 넣기
						let roomResult = response.data;
						let divResult = $('#result');
						
						// 검색결과 데이터를 반복해서 출력
						$.each(roomResult, function(index, item){
							let content = '<tr><td>'+item.mainImage+'</td><td>'+item.address+'</td><td>'+item.roomName+'</td><td>'+item.defaultPrice+'</td></tr>';
							divResult.append(content);
						});
					}else{
						alert(response.message);
					}
				}	
			})
		})
		
		// Moment.js를 사용하여 오늘 날짜 문자열 생성
		let today = moment().format("YYYY/MM/DD");
	
		// 모달
		const myModal = document.getElementById('myModal')
		const myInput = document.getElementById('myInput')
		
		myModal.addEventListener('shown.bs.modal', () => {
			myInput.focus()
		})
	</script>
</body>
</html>

















