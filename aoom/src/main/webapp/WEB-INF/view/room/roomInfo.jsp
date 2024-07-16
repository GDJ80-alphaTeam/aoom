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
</head>
<body>
	<jsp:include page="/inc/navbar.jsp"></jsp:include>
	
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
					<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true"	aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
				</div>
				
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="" class="d-block w-100" alt="/image/reviewDefault.png">
					</div>
					<div class="carousel-item">
						<img src="" class="d-block w-100" alt="#">
					</div>
					<div class="carousel-item">
						<img src="" class="d-block w-100" alt="#">
					</div>
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
			<c:forEach var="r" items="${reviewList}" varStatus="status">
				<div style="width: 45%; margin-right: 30px;margin-bottom: 30px;display: flex;">
					<div style="height: 150px ;width: 20%;">										
						<img id="reviewImg${status.count}" alt="" src="${r.reviewImage}" style="width:100%;height:50%;background-color: green">
						<img id="userImg${status.count}" alt="" src="${r.userImage}" style="width:100%;height:50%;background-color: gray">
					</div>						
					<div style="width: 80%" id="reviewContent${status.count}">
						${r.reviewContent}
					</div>
				</div>
			</c:forEach>			
		</div>		
		<c:choose>
			<c:when test="${reviewCntAvg.lastPage == 0 }">
				
			</c:when>
			<c:otherwise>
			  <nav>
			    <ul class="pagination">
			      <li class="page-item">
			      <!-- paging 이전버튼 -->
			        <c:choose>			        
			          <c:when test="${currentPage == 1}">
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
			        
			          <c:when test="${currentPage == reviewCntAvg.lastPage}">
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
				내용
			</div>
			<div style="width: 50% ; background-color: gray" >
				내용2
			</div>			
		</div>		
	</div> <!-- 상세보기전체감싸는 div -->
</body>
		
		
	<script>
	<!-- 페이징 -->
		// currentPage는 변경가능해야함 , lastPage는 중간에 리뷰가 추가될수있음
	  let currentPage = parseInt("${currentPage}");
	  let lastPage = parseInt("${reviewCntAvg.lastPage}");
	  const roomId = "${roomInfo.roomId}";
								// id가 page로 시작하는 모든태그 
		$(document).on('click', '[id^="page"], #previous, #next', function() {
			let page = currentPage;
			
			// 페이지 번호 클릭
		    if (this.id.startsWith('page')) {
		    	// page에 클릭한 페이지 값 입력
		      	page = $(this).val();
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
					$('[id^="reviewContent"]').empty();
					$('[id^="reviewImg"]').empty();
					$('[id^="userImg"]').empty();
					// currentpage값 바꿔줌
					currentPage = page;
					// id의값은 1부터 시작 , list는 [0]부터 시작함 그래서 response -1
					for (let i = 1; i < response.length+1; i++) {
						$('#reviewContent'+i).append(response[i-1].reviewContent);
						$('#reviewImg'+i).attr('src',response[i-1].reviewImg); // reviewImgUrl이 response에 포함되어 있다고 가정함
		                $('#userImg'+i).attr('src',response[i-1].userImg); // userImgUrl이 response에 포함되어 있다고 가정함
						// 사진도 넣어야함
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