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
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
	
</head>
<body>
	<jsp:include page="/WEB-INF/view/layout/navbarSub.jsp"></jsp:include>
	
	<div style="width:1000px; margin: 0 auto ; min-width:600px" >
			<!-- 숙소 이미지 -->
		<h1 style="display:flex;justify-content: space-between; margin-top: 100px;">
			<!-- 숙소이름 -->
			<div>
				${roomInfo.roomName}
			</div>			
			<!-- 위시리스트 버튼 -->
			<button type="button" style="background-color: white ; border: 0">
				<a>
					&#128151;
				</a>
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
						<img id="userImg${status.count}"  src="${r.userImage}" style="width:100%;height:50%;"onerror="this.style.display='none'">
					</div>						
					<div style="width: 80%" id="reviewContent${status.count}">
						${r.reviewContent}
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
			          
			            <c:when test="${currentPage == i}">
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
													
							<img style="width: 100%;height: 80%" src="${roomInfo.userImage}">					
							<div style="width:100%;height:20%">
							호스트:${roomInfo.userName}
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
			
			<div style="width: 50% ; background-color: gray" >
				<input type="text" id="bookingDate" placeholder="날짜를 선택해주세요" style="width: 300px;" autocomplete="off">
				<input type="hidden" id="startDate" name="startDate">
				<input type="hidden" id="endDate" name="endDate">
			</div>			
		</div>		
	</div> <!-- 상세보기전체감싸는 div -->
</body>
		
		
	<script>
	<!-- 숙소 운영 시작일 날짜 제한 및 Date Range Picker 설정-->
		let today = moment().format("YYYY-MM-DD");
		// 이용불가능한 날짜데이터 
		let disableDate = "${disableDate}";
		
		// 마지막날+1 
		let endDate = moment("${roomInfo.endDate}", "YYYY-MM-DD").add(1, 'days').format("YYYY-MM-DD");
        
		
		// Date Range Picker 설정		
		$('#bookingDate').daterangepicker({
			minDate: today,
			maxDate: endDate,
		    showDropdowns: true,
		    autoApply: false,
			autoUpdateInput: false,
			// 날짜값 disabled 해주는곳 true값이 반환되면 해당날짜는 false가됨
		 	isInvalidDate: function(date) {
            	const formattedDate = date.format('YYYY-MM-DD');
            	// disabledate에 fromatteDate날짜와 비교해서 해당날짜가 있으면 true를 반환후 해당날짜 비활성화
            	return disableDate.includes(formattedDate);
           	},
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
		
		$('#bookingDate').on('apply.daterangepicker', function(ev, picker) {
			$(this).val(picker.startDate.format('YYYY-MM-DD') + ' ~ ' + picker.endDate.format('YYYY-MM-DD'));
		});

		$('#bookingDate').on('cancel.daterangepicker', function(ev, picker) { 
			$(this).val('');
		});	
		

	<!-- 페이징 -->
	 	// currentPage는 변경가능해야함 , lastPage는 중간에 리뷰가 추가될수있음
	  	let currentPage = parseInt("${reviewList.currentPage}");
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
		    	console.log(currentPage)
		    	console.log(page)
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
					$('[id^="reviewContent"]').empty();
					$('[id^="reviewImg"]').attr('src','');
					$('[id^="userImg"]').attr('src','');
					// onError일때 display가 none이된후 사라지지않음 그래서 다시 block처리후 src가없으면 다시 none으로 변경
					$('[id^="reviewImg"]').css('display','block');
					$('[id^="userImg"]').css('display','block');
					// currentpage값 바꿔줌
					currentPage = page;
										
					// id의값은 1부터 시작 , list는 [0]부터 시작함 그래서 response -1
					for (let i = 1; i < response.review.length+1; i++) {
						$('#reviewContent'+i).append(response.review[i-1].reviewContent);
						$('#reviewImg'+i).attr('src',response.review[i-1].reviewImage); // reviewImgUrl이 response에 포함되어 있다고 가정함
		                $('#userImg'+i).attr('src',response.review[i-1].userImage); // userImgUrl이 response에 포함되어 있다고 가정함
		                console.log(response.review[i-1]);	
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
</html>