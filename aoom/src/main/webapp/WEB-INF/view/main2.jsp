<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="AOOM 웹 사이트 입니다">
    <meta name="keywords" content="AOOM, 웹디자인, 포트폴리오, 디자이너, 웹 포트폴리오">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AOOM 메인 페이지</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
    <jsp:include page="/WEB-INF/view/layout/navbarMain.jsp"></jsp:include>

    <div class="room_container inner">
        <div class="room fade_in">
        
          	<!-- 숙소 출력 반복 -->
       		<!-- 조회수 TOP 4 -->
            <ul>
           		<c:forEach var="viewsDesc" items="${viewsDesc}">
	                <li>
	                    <a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${viewsDesc.roomId}">
	                        <div class="img_box">
	                            <img src="${viewsDesc.mainImage}" alt="숙소사진">
	                            <div class="heart_btn">
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
	                            </div>
	                        </div>
	                        <div class="txt_box">
	                            <div class="t_box_top">
	                                <div class="r_name">
	                                    ${viewsDesc.roomName}
	                                </div>
	                                <div class="r_star">
	                                    <img src="${pageContext.request.contextPath}/img/roomlist_16.png" alt="별점">
	                                    <span>${viewsDesc.avgRating}</span>
	                                </div>
	                            </div>
	                            <div class="r_option">
	                                ${viewsDesc.address}
	                            </div>
	                            <div class="r_price">
	                                ${viewsDesc.defaultPrice} 원
	                            </div>
	                        </div>
	                    </a>
	                </li>
                </c:forEach>
            </ul>
            
          	<!-- 예약 TOP 4 -->
            <ul>    
           		<c:forEach var="bookingDesc" items="${bookingDesc}">
	                <li>
	                    <a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${bookingDesc.roomId}">
	                        <div class="img_box">
	                            <img src="${bookingDesc.mainImage}" alt="숙소사진">
	                            <div class="heart_btn">
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
	                            </div>
	                        </div>
	                        <div class="txt_box">
	                            <div class="t_box_top">
	                                <div class="r_name">
	                                    ${bookingDesc.roomName}
	                                </div>
	                                <div class="r_star">
	                                    <img src="${pageContext.request.contextPath}/img/roomlist_16.png" alt="별점">
	                                    <span>${bookingDesc.avgRating}</span>
	                                </div>
	                            </div>
	                            <div class="r_option">
	                                ${bookingDesc.address}
	                            </div>
	                            <div class="r_price">
	                                ${bookingDesc.defaultPrice} 원
	                            </div>
	                        </div>
	                    </a>
	                </li>
                </c:forEach>
            </ul>
          	
          	<!-- 위시리스트 TOP 4 -->
            <ul>    
           		<c:forEach var="wishListDesc" items="${wishListDesc}">
	                <li>
	                    <a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${wishListDesc.roomId}">
	                        <div class="img_box">
	                            <img src="${wishListDesc.mainImage}" alt="숙소사진">
	                            <div class="heart_btn">
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
	                            </div>
	                        </div>
	                        <div class="txt_box">
	                            <div class="t_box_top">
	                                <div class="r_name">
	                                    ${wishListDesc.roomName}
	                                </div>
	                                <div class="r_star">
	                                    <img src="${pageContext.request.contextPath}/img/roomlist_16.png" alt="별점">
	                                    <span>${wishListDesc.avgRating}</span>
	                                </div>
	                            </div>
	                            <div class="r_option">
	                                ${wishListDesc.address}
	                            </div>
	                            <div class="r_price">
	                                ${wishListDesc.defaultPrice} 원
	                            </div>
	                        </div>
	                    </a>
	                </li>
                </c:forEach>
            </ul>
            
			<!-- 별점 TOP 4 -->
            <ul>    
           		<c:forEach var="ratingDesc" items="${ratingDesc}">
	                <li>
	                    <a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${ratingDesc.roomId}">
	                        <div class="img_box">
	                            <img src="${ratingDesc.mainImage}" alt="숙소사진">
	                            <div class="heart_btn">
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
	                            </div>
	                        </div>
	                        <div class="txt_box">
	                            <div class="t_box_top">
	                                <div class="r_name">
	                                    ${ratingDesc.roomName}
	                                </div>
	                                <div class="r_star">
	                                    <img src="${pageContext.request.contextPath}/img/roomlist_16.png" alt="별점">
	                                    <span>${ratingDesc.avgRating}</span>
	                                </div>
	                            </div>
	                            <div class="r_option">
	                                ${ratingDesc.address}
	                            </div>
	                            <div class="r_price">
	                                ${ratingDesc.defaultPrice} 원
	                            </div>
	                        </div>
	                    </a>
	                </li>
                </c:forEach>
            </ul>
        </div>
    </div>

	<!-- 푸터  -->
    <jsp:include page="/WEB-INF/view/layout/footer.jsp"></jsp:include>
	
	<!-- 위로가기 -->
    <aside>
        <i class="fa-solid fa-chevron-up"></i>
        <span>TOP</span>
    </aside>

    <script type="text/javascript">
    
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
	    
	    // 침실 버튼 클릭 시
	    $('#totalSpace0').click(function(){
	    	$('#totalSpace').val('0');
	    })
	    $('#totalSpace1').click(function(){
	    	$('#totalSpace').val('1');
	    })
	    $('#totalSpace2').click(function(){
	    	$('#totalSpace').val('2');
	    })
	    $('#totalSpace3').click(function(){
	    	$('#totalSpace').val('3');
	    })
	    $('#totalSpace4').click(function(){
	    	$('#totalSpace').val('4');
	    })
	    $('#totalSpace5').click(function(){
	    	$('#totalSpace').val('5');
	    })
	    
	    // 침대 버튼 클릭 시
   	    $('#totalBed0').click(function(){
	    	$('#totalBed').val('0');
	    })
   	    $('#totalBed1').click(function(){
	    	$('#totalBed').val('1');
	    })
   	    $('#totalBed2').click(function(){
	    	$('#totalBed').val('2');
	    })
   	    $('#totalBed3').click(function(){
	    	$('#totalBed').val('3');
	    })
   	    $('#totalBed4').click(function(){
	    	$('#totalBed').val('4');
	    })
   	    $('#totalBed5').click(function(){
	    	$('#totalBed').val('5');
	    })
	    
	    // 화장실 버튼 클릭 시
   	    $('#totalBath0').click(function(){
	    	$('#totalBath').val('0');
	    })
   	    $('#totalBath1').click(function(){
	    	$('#totalBath').val('1');
	    })
   	    $('#totalBath2').click(function(){
	    	$('#totalBath').val('2');
	    })
   	    $('#totalBath3').click(function(){
	    	$('#totalBath').val('3');
	    })
   	    $('#totalBath4').click(function(){
	    	$('#totalBath').val('4');
	    })
   	    $('#totalBath5').click(function(){
	    	$('#totalBath').val('5');
	    })
	    		
	    // 필터 초기화 버튼 이벤트
        $('#clearFilter').click(function() {
        	// input태그들 value비우기
            $('#filterForm')[0].reset();
        	
        	// 전체선택에 active클래스 부여
            $('#guestHouse').removeClass('active');
            $('#normalHouse').removeClass('active');
            $('#allHouse').addClass('active')
        	
        	// 침실, 침대, 욕실 값 0으로 만들고 상관없음태그에 active클래스 부여
            $('#totalSpace').val('0');
            $('#totalSpace1').removeClass('active');
            $('#totalSpace2').removeClass('active');
            $('#totalSpace3').removeClass('active');
            $('#totalSpace4').removeClass('active');
            $('#totalSpace5').removeClass('active');
            $('#totalSpace0').addClass('active')
            $('#totalBed').val('0');
            $('#totalBed1').removeClass('active');
            $('#totalBed2').removeClass('active');
            $('#totalBed3').removeClass('active');
            $('#totalBed4').removeClass('active');
            $('#totalBed5').removeClass('active');
            $('#totalBed0').addClass('active')
            $('#totalBath').val('0');
            $('#totalBath1').removeClass('active');
            $('#totalBath2').removeClass('active');
            $('#totalBath3').removeClass('active');
            $('#totalBath4').removeClass('active');
            $('#totalBath5').removeClass('active');
            $('#totalBath0').addClass('active')
        });
	    
	    // 위시리스트에 숙소 추가, 삭제
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