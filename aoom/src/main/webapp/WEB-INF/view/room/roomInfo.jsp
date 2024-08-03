<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>숙소상세보기</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f0842831d9c350ed32adefb11b6cd5f6&libraries=services"></script>
	<!-- flat 피커 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ko.js"></script>
	<!-- 모멘트js -->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_orange.css">
	
</head>
<body>
	
	<div class="container" > 
		<jsp:include page="/WEB-INF/view/layout/navbarSub.jsp"></jsp:include>
		<!-- 숙소 이미지 -->
		<h1 style="display:flex;justify-content: space-between; margin-top: 100px;">
		<!-- 숙소이름 -->
			<div>
				${roomInfo.roomName}
			</div>			
			<!-- 위시리스트 버튼 -->
			<button type="button" id="wishListBtn" style="background-color: white ; border: 0">
				<c:if test="${userWishRoom[0] != null }">
					&#129505;
				</c:if>
				<c:if test="${userWishRoom[0] == null }">
					&#129293;
				</c:if>
			</button>
		</h1>
		
		<div>
			<div id="carouselExampleIndicators" class="carousel slide"data-bs-ride="carousel">				
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true"aria-label="Slide 1"></button>
					<c:forEach var="image" items="${roomImages}" varStatus="status">
						<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${status.count}" aria-label="Slide 2"></button>
					</c:forEach>
				</div>
								
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="${roomInfo.mainImage}" class="d-block w-100" alt="/image/reviewDefault.png">
					</div>
					
					<c:forEach var="image" items="${roomImages}">
						<div class="carousel-item">
							<img src="${image.image}" class="d-block w-100" alt="/image/reviewDefault.png">
						</div>
					</c:forEach>					
				</div>
				<button class="carousel-control-prev" type="button"	data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
		
		<h3>숙소설명</h3>
		<div style="margin-bottom:100px; width: 100%; background-color: gray">
			${roomInfo.roomContent}
		</div>
		
		<!-- 지도 -->
		<h3>숙소위치</h3>
		<h5>${roomInfo.address}</h5>
		<div id="map" style="width:100%; height:400px;"></div>
		
		<h3>숙소 편의시설</h3>
		<div style="flex-wrap: wrap; margin-bottom:100px; display: flex;justify-content: space-between;">
			<c:forEach var="r" items="${roomAmenities}">
				<div style="width: 50%">
					${r.codeName}
				</div>
			</c:forEach>
		</div>
	
		<c:choose>
			<c:when test="${reviewCntAvg.cnt == 0 }">
				<h3>숙소후기가 없습니다.</h3>
			</c:when>
			<c:otherwise>
				<h3>별점${reviewCntAvg.avg} 후기${reviewCntAvg.cnt}개</h3>
			</c:otherwise>			
		</c:choose>
		
		<div style="flex-wrap: wrap; margin-bottom:100px; display: flex;">
			<c:forEach var="r" items="${reviewList.review}" varStatus="status">
				<div style="width: 45%; margin-right: 30px;margin-bottom: 30px;display: flex;">
					<div style="height: 150px ;width: 20%;">										
						<img id="reviewImg${status.count}"  src="${r.reviewImage}" style="width:100%;height:50%;"onerror="this.style.display='none'">
							<a href="/user/profile?userId=${r.userId}" id="userId${status.count}">
								<img id="userImg${status.count}"  src="${r.userImage}" style="width:100%;height:50%;"onerror="this.style.display='none'">
							</a>
					</div>						
					<div style="width: 70%" id="reviewContent${status.count}">
						${r.reviewContent}
					</div>
					<div>
						<div id="userRating${status.count}">${r.rating}</div>
						<div id="userName${status.count}">${r.userName}</div>
					</div>
				</div>
			</c:forEach>			
		</div>		
		<!-- 페이징 총숫자에맞춰서 1~10 ,11~20이런식으로 만들어야됨  -->
		<c:choose>
			<c:when test="${reviewCntAvg.lastPage == 0 }">
				
			</c:when>
			<c:otherwise>
			  <nav>
			    <ul class="pagination">
			      <li class="page-item">
			      <!-- paging 이전버튼 -->
			        <c:choose>			        
			          <c:when test="${reviewList.currentPage == 1}">
			            <button class="page-link disabled" type="button" id="previous">이전</button>
			          </c:when>
			          
			          <c:otherwise>
			            <button class="page-link" type="button" id="previous">이전</button>
			          </c:otherwise>
			          
			        </c:choose>
			      </li>
				
					<!-- paging 숫자버튼 -->
			      <c:forEach var="i" begin="1" end="${reviewCntAvg.lastPage}">
			        <li class="page-item">
			          <c:choose>
			          
			            <c:when test="${reviewList.currentPage == i}">
			              <button class="page-link active" type="button" id="page${i}" value="${i}">${i}</button>
			            </c:when>
			            
			            <c:otherwise>
			              <button class="page-link " type="button" id="page${i}" value="${i}">${i}</button>
			            </c:otherwise>
			            
			          </c:choose>
			        </li>
			      </c:forEach>
			
					<!-- paging 다음버튼 -->
			      <li class="page-item">
			        <c:choose>
			        
			          <c:when test="${reviewList.currentPage == reviewCntAvg.lastPage}">
			            <button class="page-link" type="button" id="next" disabled ="disabled">다음</button>
			          </c:when>
			          
			          <c:otherwise>
			            <button class="page-link" type="button" id="next">다음</button>
			          </c:otherwise>
			          
			        </c:choose>
			      </li>
			    </ul>
			  </nav>
			</c:otherwise>
		</c:choose>
						
		<div style="margin-bottom:100px;display: flex;justify-content: space-between; ">
			<div style="width: 50%; background-color: green" >
				
					<div style="width:100%;height:150px; display:flex">
						<div style="width: 70%;flex-wrap: wrap; display:flex">						
													
							<a href="${pageContext.request.contextPath}/user/profile?userId=${roomInfo.userId}">
								<img style="width: 100%;height: 80%" src="${roomInfo.userImage}">
							</a>					
							<div style="width:100%;height:20%">
							호스트:<a href="${pageContext.request.contextPath}/user/profile?userId=${roomInfo.userId}">
								${roomInfo.userName}
								</a>
							</div>
						</div>
						
						<div style="width: 30%">
							<div>
								후기수:${hostReview.cnt}
							</div>
								
							<div>
								평점:${hostReview.avg} 
							</div>
						</div>
					</div>
					<div style="width:30%">
					
					</div>
				</div>
			<form action="${pageContext.request.contextPath}/booking/book" method="get" id="bookingForm">
				<div style="width: 50% ; background-color: gray" >
					<input type="text" id="datepicker" style="width: 300px;">
					<input type="number" id="usePeople" name="usePeople" min="1" max="${roomInfo.maxPeople}">
					<input type="hidden" id="startDate" name="startDate" required="required">
					<input type="hidden" id="endDate" name="endDate" required="required">
					<input type="hidden"  value="${roomInfo.roomId}" name="roomId">
					<button type="submit" id="bookingBtn">예약하기</button>
				</div>
			</form>			
		</div>		
	</div> <!-- 상세보기전체감싸는 div -->
</body>
		
		
	<script>
	
	    $('#bookingBtn').click(function(event) {
	        event.preventDefault(); // 폼의 기본 제출 동작을 막음
	
	        var datepickerValue = $('#datepicker').val();
	        let usePeople = $('#usePeople').val();
	        let maxPeople = ${roomInfo.maxPeople};
	        console.log(maxPeople);
	        // datepicker가 빈칸이나 null인지 확인
	        if (!datepickerValue) {
	            alert('날짜를 선택해주세요.');
	            return;
	        }
	
	        if (usePeople > ${roomInfo.maxPeople}){
	        	alert("인원수를 조정해주세요")
	        	return;
	        }
	        
	        // 폼 시리얼라이즈
	        var formData = $('#bookingForm').serialize();
	
	        // GET 요청으로 폼 데이터 전송
	        var actionUrl = $('#bookingForm').attr('action');
	        window.location.href = actionUrl + '?' + formData;
	    });
	
		let isInitializing = false;
		
		const fp = flatpickr("#datepicker", {			
			mode: "range",
			dateFormat: "Y-m-d",		       		         
			minDate: 'today',        // 오늘 이전 날짜 선택 비활성화
			//maxDate: '2024-12-31',   // 특정 날짜까지 선택 가능
			//defaultDate: 'today',    // 초기 날짜 설정 (현재 날짜와 시간)		
			showMonths: 2,
			locale: "ko",			   
			disable: [],
			onOpen: function(selectedDates, dateStr, instance) {
				
				if (!isInitializing) {
                    isInitializing = true; // 설정 중임을 표시
				
                    
                 // 모든 날짜를 활성화하려면 enable을 빈 배열로 설정                                        
				$.ajax({
		            url: '/onedayPrice/ajaxValidDate',
		            method: 'post',
		            data: {"roomId":"${roomInfo.roomId}"},
		            dataType: 'json',
		            success: function(response) {
		            	console.log(response);
		            	instance.set('disable', []);
		            	
		                // 서버에서 받은 비활성화할 날짜 배열
		                let disableDate = response.data.map(item => item.oneday);
						
		                // Flatpickr 인스턴스 업데이트
		            	instance.set('enable', disableDate);
		            },
		            complete: function() {
	                    isInitializing = false; // 초기화 완료 표시
	                }   
		        });		
				
			}}
			,
			onChange: function(selectedDates, dateStr, instance) {
				console.log("Selected range: ", selectedDates);
				
				// 날짜형식 변경 yyyy/mm/dd
            	let formattedDates = moment(selectedDates[0]).format('YYYY/MM/DD');
            	let startDate = moment(selectedDates[0]).format('YYYY/MM/DD');
 	            let endDate = moment(selectedDates[1]).format('YYYY/MM/DD');
                console.log("Selected range (formatted): ", formattedDates);
				console.log( $("#usePeople").val());
				$.ajax({
		            url: '/onedayPrice/ajaxBookingDay',
		            method: 'post',
		            data: {"roomId" : "${roomInfo.roomId}", "selectedDate" : formattedDates, "startDate" : startDate, "endDate" : endDate, "usePeople" : $("#usePeople").val()},
		            dataType: 'json',
		            success: function(response) {
	                    // 서버에서 받은 비활성화할 날짜 배열
		                let disableDates = response.data.map(item => item.oneday);		
		                // Flatpickr 인스턴스 업데이트
		            	instance.set('enable', disableDates);
		                
		            	
		            }
		           
		        });		
			  },
			onClose: function(selectedDates, dateStr, instance) {
				
				let startDate = moment(selectedDates[0]).format('YYYY/MM/DD');
				let endDate = moment(selectedDates[1]).format('YYYY/MM/DD');
				console.log("startDate" , startDate);
				console.log("endDate" , endDate);
				
				$("#startDate").val(startDate);
				$("#endDate").val(endDate);
			}
			});
 	
	<!-- 페이징 -->
	 	// currentPage는 변경가능해야함 , lastPage는 중간에 리뷰가 추가될수있음
	  	let currentPage = parseInt("${reviewList.currentPage}");
	 	console.log(currentPage);
	  	let lastPage = parseInt("${reviewCntAvg.lastPage}");
	  	const roomId = "${roomInfo.roomId}";
	  	
								// id가 page로 시작하는 모든태그 
		$(document).on('click', '[id^="page"], #previous, #next', function() {
			let page = currentPage;
		  		
			
			// 페이지 번호 클릭 this = 위에 on.click된 것들중 클릭이벤트가 일나면
		    if (this.id.startsWith('page')) {
		    	// page에 클릭한 페이지 값 입력 , String으로 오기때문에 변환해줘야함
		      	page = parseInt($(this).val());
		    	
		    	// 모든 번호페이지의 active상태 제거
		      	$(".page-link.active").removeClass("active");
		    	// 선택한 번호페이지의 active 추가
		      	$(this).addClass("active")
		      	
		      	// 숫자가 선택되었을때 다음버튼과 이전버튼의 disabled 비활성화
		      	$('#previous').removeClass("disabled");
		      	$('#next').removeClass("disabled");
		      
		      	// 이전 and 다음 버튼 비활성화 page값에따라 처리
		      	if(page == 1){
		    		$('#previous').addClass("disabled");
		      	}
		      	if(page == lastPage){
		    		$('#next').addClass("disabled");
		      	}
		      
		    }
	
		    // 이전 버튼 클릭
		    if (this.id == 'previous' && currentPage > 1) {
		      
		    	// 이전 active상태 삭제
		      	$('#page'+page).removeClass("active");		      		    	
		    	page = currentPage - 1;
		    	// 다음 버튼 active 상태 활성  
		      	$('#page'+page).addClass("active");
		      
		      	
		      	$('#previous').removeClass("disabled");
		      	$('#next').removeClass("disabled");
		      
		      	// 이전버튼 비활성화
		      	if(page == 1){
		    		  $('#previous').addClass("disabled");
		      	}
		    }
	
		    // 다음 버튼 클릭
		    if (this.id == 'next' && currentPage < lastPage) {
		    	
		   		$('#page'+page).removeClass("active");			    	
		      	page = currentPage + 1;
		      	$('#page'+page).addClass("active");
		      
		      	
		      	$('#previous').removeClass("disabled");
		      	$('#next').removeClass("disabled");
		     	
		      	// 다음버튼 비활성화		        
		      	if(page == lastPage){
		    		  $('#next').addClass("disabled");
		      	}
		   }
				// page의 값에 변동이 생기면 ajax호출 
		    if (page !== currentPage) {
		    	reloadReivew(page);
		    }	
			
		})
		
		// ajax 호출 : 
		function reloadReivew(page){
			
			$.ajax({
				url:"/review/ajaxReviewPaging",
				method:"post",
				data: {"currentPage": page , "roomId":"${roomInfo.roomId}"},
				success: function(response){
					if(response.code == 00){
						$('[id^="reviewContent"]').empty();
						$('[id^="reviewImg"]').attr('src','');
						$('[id^="userImg"]').attr('src','');
						$('[id^="userId"]').attr('href','');
						$('[id^="userRating"]').empty();
						$('[id^="userName"]').empty();
						// onError일때 display가 none이된후 사라지지않음 그래서 다시 block처리후 src가없으면 다시 none으로 변경
						$('[id^="reviewImg"]').css('display','block');
						$('[id^="userImg"]').css('display','block');
						// currentpage값 바꿔줌
						currentPage = page;
						// id의값은 1부터 시작 , list는 [0]부터 시작함 그래서 response -1
						for (let i = 1; i < response.data.review.length+1; i++) {
							$('#reviewContent'+i).append(response.data.review[i-1].reviewContent);
							$('#reviewImg'+i).attr('src',response.data.review[i-1].reviewImage); 
			                $('#userImg'+i).attr('src',response.data.review[i-1].userImage);
			                $('#userRating'+i).append(response.data.review[i-1].rating);
              				$('#userName'+i).append(response.data.review[i-1].userName);
              				$('#userId'+i).attr('href','/user/profile?userId='+response.data.review[i-1].userId);
              				
						}					
					} else if(response.code == 01){
						alert('후기를불러오는데 실패하였습니다.')
					}
				}
			})
		}									
		
		
		
		<!-- 카카오 지도api -->
	 
		let mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
		// 지도를 생성    
		let map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성
		let geocoder = new kakao.maps.services.Geocoder();
		
		// 주소로 좌표를 검색		주소값 jstl로 받아왔음
		geocoder.addressSearch("${roomInfo.address}", function(result, status) {
	    // 정상적으로 검색이 완료되면 
		    if (status === kakao.maps.services.Status.OK) {
		
		       let coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		       // 결과값으로 받은 위치를 마커로 표시
		       let marker = new kakao.maps.Marker({
		           map: map,
		           position: coords
		       });
		
		       // 인포윈도우로 장소에 대한 설명을 표시
		       let infowindow = new kakao.maps.InfoWindow({							
		           content: '<div style="width:150px;text-align:center;padding:6px 0;">숙소</div>'
		       });
		       infowindow.open(map, marker);
		
		       // 지도의 중심을 결과값으로 받은 위치로 이동
		       map.setCenter(coords);
			} 
		});    
	</script>
	
	<!-- 위시리스트에 있는 숙소 추가, 제거 -->
	<script type="text/javascript">
		let userId = '${sessionScope.userInfo.userId}';
		$('#wishListBtn').click(function() {
			if(userId === ''){
				alert('로그인이 필요한 기능입니다');
			}
			$.ajax({
				url: '/ajaxWishList',
				method: 'get',
				data: {
					'userId' : '${sessionScope.userInfo.userId}',
					'roomId' : '${roomInfo.roomId}'
				},
				success: function(response) {
					if(response.result) {
						alert(response.message)
						window.location.href="/room/roomInfo?roomId=${roomInfo.roomId}"
					}
				}
			});
		});
	</script>
</html>