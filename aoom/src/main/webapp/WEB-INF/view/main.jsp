<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>AOOM 메인페이지</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <link rel="stylesheet" href="/style/css/common.css">
    <link rel="stylesheet" href="/style/css/main.css">
    <script src="https://kit.fontawesome.com/82b4a4fcad.js"></script>
    <script src="/style/js/main.js" defer></script>
</head>
<body>
    <!-- AOOM 네비게이션 바 -->
    <jsp:include page="/WEB-INF/view/layout/navbarSub2.jsp"></jsp:include>
    
    <!-- 그리드 -->
    <div class="container text-center">
        <div class="row">
            <div class="col"></div>
            <div class="col-10">
                <!-- 검색 -->
                <form action="${pageContext.request.contextPath}/room/roomList" method="get">
                    <input type="text" name="address" placeholder="여행지">
                    <input type="text" id="daterange" placeholder="체크인 / 체크아웃" autocomplete="off">
                    <input type="hidden" id="startDate" name="startDate">
                    <input type="hidden" id="endDate" name="endDate">
                    <input type="number" name="usePeople" min="1" placeholder="여행자">
                    <button type="submit">검색</button>
                </form>
                
                <!-- 카테고리 -->
                <br>
                <button type="button" class="btn btn-danger btn-sm" onclick="window.location.href='${pageContext.request.contextPath}/room/roomList'">전체</button>
                <c:forEach var="roomCategory" items="${roomCategory}" varStatus="status">
                    <button type="button" class="btn btn-danger btn-sm" onclick="window.location.href='${pageContext.request.contextPath}/room/roomList?category=${roomCategory.codeKey}'">
                        ${roomCategory.codeName}</button>
                </c:forEach>

                <!-- 필터 -->
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    필터
                </button>
            
                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-scrollable">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">필터 </h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <form id="filterForm">
                                <div class="modal-body">

                                    <h3>가격</h3>
                                    <input type="number" min="30000" value="30000" name="lowPrice" placeholder="최저"> ~ <input type="number" min="30000" value="200000" name="highPrice" placeholder="최고">

                                    <h3>숙소 유형</h3>
                                    <label for="roomTypeAll">전체</label>
                                    <input type="radio" id="roomTypeAll" name="roomtypeCode" value="all" checked>
                                    <c:forEach var="roomType" items="${roomType}">
                                        <label for="${roomType.codeKey}">${roomType.codeName}</label>
                                        <input type="radio" id="${roomType.codeKey}" name="roomtypeCode" value="${roomType.codeKey}">
                                    </c:forEach>

                                    <h3>침실과 침대 화장실</h3>
                                    <label for="totalSpace">침실</label>
                                    <input type="radio" id="totalSpace1" name="totalSpace" value="1" checked>1
                                    <input type="radio" id="totalSpace2" name="totalSpace" value="2">2
                                    <input type="radio" id="totalSpace3" name="totalSpace" value="3">3
                                    <input type="radio" id="totalSpace4" name="totalSpace" value="4">4
                                    <input type="radio" id="totalSpace5" name="totalSpace" value="5">5+
                                    <br>
                                    <label for="totalBed">침대</label>
                                    <input type="radio" id="totalBed1" name="totalBed" value="1" checked>1
                                    <input type="radio" id="totalBed2" name="totalBed" value="2">2
                                    <input type="radio" id="totalBed3" name="totalBed" value="3">3
                                    <input type="radio" id="totalBed4" name="totalBed" value="4">4
                                    <input type="radio" id="totalBed5" name="totalBed" value="5">5+
                                    <br>
                                    <label for="totalBath">화장실</label>
                                    <input type="radio" id="totalBath1" name="totalBath" value="1" checked>1
                                    <input type="radio" id="totalBath2" name="totalBath" value="2">2
                                    <input type="radio" id="totalBath3" name="totalBath" value="3">3
                                    <input type="radio" id="totalBath4" name="totalBath" value="4">
                                    <input type="radio" id="totalBath5" name="totalBath" value="5">5+

                                    <h3>편의 시설</h3>
                                    <c:forEach var="amenitie" items="${amenities}">
                                        <input type="checkbox" id="${amenitie.codeKey}" name="amenities" value="${amenitie.codeKey}">${amenitie.codeName}
                                        <br>
                                    </c:forEach>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" id="clearFilter" class="btn btn-secondary">초기화</button>
                                    <button type="button" id="filterBtn" class="btn btn-danger">필터링</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col"></div>
        </div>
    </div>
    <br>
	
	<!-- 조회수 TOP 4 -->
	<h3>조회수 TOP 4</h3>
   	<div class="row row-cols-1 row-cols-md-4 g-4">
		<c:forEach var="viewsDesc" items="${viewsDesc}">
			<div class="col">
				<div class="card h-100">
					<button type="button" name="wishListBtn_${viewsDesc.roomId}" style="position: absolute; top: 0; right: 0; border: 0; background-color: transparent;">
						<c:set var="isWishRoom" value="false"></c:set>
						<c:forEach var="uwr" items="${userWishRoom }">
							<c:if test="${uwr.roomId == viewsDesc.roomId }">
								<c:set var="isWishRoom" value="true"></c:set>
							</c:if>
						</c:forEach>
						<c:if test="${isWishRoom}">
							&#129505;
						</c:if>
						<c:if test="${!isWishRoom}">
							&#129293;
						</c:if>
					</button>
					<a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${viewsDesc.roomId}">
						<img src="${viewsDesc.mainImage}" class="card-img-top" alt="..." height="200px">
					</a>
					<div class="card-body">	
						<h5 class="card-text">
							<a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${viewsDesc.roomId}">${viewsDesc.roomName}</a>
							<a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${viewsDesc.roomId}">⭐${viewsDesc.avgRating} 점</a>
						</h5>
						<p class="card-text">
							<a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${viewsDesc.roomId}">${viewsDesc.roomId}</a>
							<a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${viewsDesc.roomId}">${viewsDesc.defaultPrice} 원</a>
						</p>
						<p class="card-text">
							<a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${viewsDesc.roomId}">${viewsDesc.address}</a>
						</p>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
    <br>
    
	<!-- 예약 TOP 4 -->
	<h3>예약 TOP 4</h3>
    <div class="row row-cols-1 row-cols-md-4 g-4">
		<c:forEach var="bookingDesc" items="${bookingDesc}">
			<div class="col">
				<div class="card h-100">
					<button type="button" name="wishListBtn_${bookingDesc.roomId}" style="position: absolute; top: 0; right: 0; border: 0; background-color: transparent;">
						<c:set var="isWishRoom" value="false"></c:set>
						<c:forEach var="uwr" items="${userWishRoom }">
							<c:if test="${uwr.roomId == bookingDesc.roomId }">
								<c:set var="isWishRoom" value="true"></c:set>
							</c:if>
						</c:forEach>
						<c:if test="${isWishRoom}">
							&#129505;
						</c:if>
						<c:if test="${!isWishRoom}">
							&#129293;
						</c:if>
					</button>
					<a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${bookingDesc.roomId}">
						<img src="${bookingDesc.mainImage}" class="card-img-top" alt="..." height="200px">
					</a>
					<div class="card-body">	
						<h5 class="card-text">
							<a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${bookingDesc.roomId}">${bookingDesc.roomName}</a>
							<a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${bookingDesc.roomId}">⭐${bookingDesc.avgRating} 점</a>
						</h5>
						<p class="card-text">
							<a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${bookingDesc.roomId}">${bookingDesc.roomId}</a>
							<a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${bookingDesc.roomId}">${bookingDesc.defaultPrice} 원</a>
						</p>
						<p class="card-text">
							<a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${bookingDesc.roomId}">${bookingDesc.address}</a>
						</p>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
    <br>
    
	<!-- 위시리스트 TOP 4 -->
	<h3>위시리스트 TOP 4</h3>
    <div class="row row-cols-1 row-cols-md-4 g-4">
        <c:forEach var="wishListDesc" items="${wishListDesc}">
			<div class="col">
				<div class="card h-100">
					<button type="button" name="wishListBtn_${wishListDesc.roomId}" style="position: absolute; top: 0; right: 0; border: 0; background-color: transparent;">
						<c:set var="isWishRoom" value="false"></c:set>
						<c:forEach var="uwr" items="${userWishRoom }">
							<c:if test="${uwr.roomId == wishListDesc.roomId }">
								<c:set var="isWishRoom" value="true"></c:set>
							</c:if>
						</c:forEach>
						<c:if test="${isWishRoom}">
							&#129505;
						</c:if>
						<c:if test="${!isWishRoom}">
							&#129293;
						</c:if>
					</button>
					<a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${wishListDesc.roomId}">
						<img src="${wishListDesc.mainImage}" class="card-img-top" alt="..." height="200px">
					</a>
					<div class="card-body">	
						<h5 class="card-text">
							<a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${wishListDesc.roomId}">${wishListDesc.roomName}</a>
							<a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${wishListDesc.roomId}">⭐${wishListDesc.avgRating} 점</a>
						</h5>
						<p class="card-text">
							<a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${wishListDesc.roomId}">${wishListDesc.roomId}</a>
							<a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${wishListDesc.roomId}">${wishListDesc.defaultPrice} 원</a>
						</p>
						<p class="card-text">
							<a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${wishListDesc.roomId}">${wishListDesc.address}</a>
						</p>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<br>
	
	<!-- 별점 TOP 4 -->
	<h3>별점 TOP 4</h3>
    <div class="row row-cols-1 row-cols-md-4 g-4">
		<c:forEach var="ratingDesc" items="${ratingDesc}">
			<div class="col">
				<div class="card h-100">
					<button type="button" name="wishListBtn_${ratingDesc.roomId}" style="position: absolute; top: 0; right: 0; border: 0; background-color: transparent;">
						<c:set var="isWishRoom" value="false"></c:set>
						<c:forEach var="uwr" items="${userWishRoom }">
							<c:if test="${uwr.roomId == ratingDesc.roomId }">
								<c:set var="isWishRoom" value="true"></c:set>
							</c:if>
						</c:forEach>
						<c:if test="${isWishRoom}">
							&#129505;
						</c:if>
						<c:if test="${!isWishRoom}">
							&#129293;
						</c:if>
					</button>
					<a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${ratingDesc.roomId}">
						<img src="${ratingDesc.mainImage}" class="card-img-top" alt="..." height="200px">
					</a>
					<div class="card-body">	
						<h5 class="card-text">
							<a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${ratingDesc.roomId}">${ratingDesc.roomName}</a>
							<a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${ratingDesc.roomId}">⭐${ratingDesc.avgRating} 점</a>
						</h5>
						<p class="card-text">
							<a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${ratingDesc.roomId}">${ratingDesc.roomId}</a>
							<a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${ratingDesc.roomId}">${ratingDesc.defaultPrice} 원</a>
						</p>
						<p class="card-text">
							<a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${ratingDesc.roomId}">${ratingDesc.address}</a>
						</p>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	
    <!-- AOOM 네비게이션 바 -->
    <jsp:include page="/WEB-INF/view/layout/footer.jsp"></jsp:include>	
    
    <script>
        // Moment.js를 사용하여 오늘 날짜 문자열 생성
        let today = moment().format("YYYY/MM/DD");
        
            // 달력 API
        $(function() {
            $('#daterange').daterangepicker({
                minDate: today, // 오늘날짜 이전 선택불가
                showDropdowns: true, // 연도와 월을 선택할 수 있는 드롭다운 생성
                 autoApply: false, // 적용버튼 누르기 전 까지 적용 안되게
                autoUpdateInput: false, // 날짜 범위도 적용 누르기 전까지 적용 안 되게
                locale: {
                    "format" : "YYYY/MM/DD", // 연월일 포맷설정
                    "separator" : " ~ ", // 캘린더 우측아래 범위 표현
                    "applyLabel" : "적용", // 적용버튼 스트링값
                    "cancelLabel" : "비우기", // 취소버튼 스트링값
                    "customRangeLabel" : "Custom", // 커스텀방식
                    "daysOfWeek" : [ "일", "월", "화", "수", "목", "금", "토" ], // 요일표시방식
                    "monthNames" : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ] // 월 표시방식
                }
            });
            // 캘린더 '적용' 눌렀을 때 이벤트처리
            $('#daterange').on('apply.daterangepicker', function(ev, picker) {
                let startDate = picker.startDate; // 첫번째 선택날짜 선언
                let endDate = picker.endDate; // 두번째 선택날짜 선언
                // 선택날 두 날이 같을 시 조건문
                if (startDate.isSame(endDate, 'day')) { // 같을 때
                    alert("체크인과 체크아웃 날짜가 같을 수 없습니다.");
                    $('#daterange').val(''); // 비우기
                    $('#startDate').val('');
                    $('#endDate').val('');
                } else { // 그렇지 않은 모든경우에 : 선택한 첫날과 마지막날을 hidden안에 담는다 
                    $(this).val(startDate.format('MM/DD/YYYY') + ' - ' + endDate.format('MM/DD/YYYY'));
                    $('#startDate').val(startDate.format('YYYY/MM/DD'));
                    $('#endDate').val(endDate.format('YYYY/MM/DD'));
                }
            })
        });
    
		// 필터링 버튼을 눌렀을 때
		$('#filterBtn').click(function() {
		    let baseUrl = "${pageContext.request.contextPath}/room/roomList?";
		    let params = $('#filterForm').serializeArray();
		    let queryString = '';
		    
		    let lowPrice = parseInt($('input[name="lowPrice"]').val());
            let highPrice = parseInt($('input[name="highPrice"]').val());

            // 유효성 검사
            if (highPrice < lowPrice) {
                alert("최고 가격은 최저 가격보다 작을 수 없습니다.");
                return; // 유효성 검사를 통과하지 못하면 URL 생성 중단
            }

		    $.each(params, function(index, param) {
		        if (param.name === 'amenities') {
		            if (queryString.indexOf('amenities=') > -1) {
		                queryString += ',' + encodeURIComponent(param.value);
		            } else {
		                if (queryString.length > 0) {
		                    queryString += '&';
		                }
		                queryString += param.name + '=' + encodeURIComponent(param.value);
		            }
		        } else {
		            if (queryString.length > 0) {
		                queryString += '&';
		            }
		            queryString += param.name + '=' + encodeURIComponent(param.value);
		        }
		    });
		    
		    window.location.href = baseUrl + queryString;
		});
		
		// 초기화 버튼 이벤트
        $('#clearFilter').click(function() {
            $('#filterForm')[0].reset();
        });
    </script>
    
    <!-- 위시리스트에 숙소 추가, 삭제 -->
    <script type="text/javascript">
		let userId = '${sessionScope.userInfo.userId}';
		$('button[name^="wishListBtn_"]').click(function() {
			if(userId === ''){
				alert('로그인이 필요한 기능입니다');
			}
			const wishListBtnRoomId = $(this).attr('name');
			const roomId = wishListBtnRoomId.split('_')[1];

			$.ajax({
				url : '/ajaxWishList',
				method : 'get',
				data : {
					'userId' : userId,
					'roomId' : roomId
				},
				success : function(response) {
					if (response.result) {
						alert(response.message);
						window.location.href = "/main";
					}
				}
			});
		});
	</script>
</body>
</html>
