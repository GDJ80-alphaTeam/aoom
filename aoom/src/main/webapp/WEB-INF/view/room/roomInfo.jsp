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
	<div style="width:1000px; margin: 0 auto ; min-width:600px" >
			<!-- 숙소 이미지 -->
		<h1 style="display:flex;justify-content: space-between; margin-top: 100px;">
			<!-- 숙소이름 -->
			<div>
				${roomInfo.roomName}
			</div>			
			<!-- 위시리스트 버튼 -->
			<button type="button" style="background-color: white ; border: 0">
				&#128151;
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
						<img src="/image/room20240705/toben.jpg" class="d-block w-100" alt="#">
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
			<c:forEach var="r" items="${reviewList}">
				<div style="width: 45%; margin-right: 30px;margin-bottom: 30px;display: flex;">					
					<img alt="#" src="" style="width:20%;background-color: green">					
					<div style="width: 80%">
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
		          <li class="page-item <c:if test="${currentPage == 1}">disabled</c:if>">
		          	<button class="page-link" type="button" id="previous">이전</button>
		           <%-- <a class="page-link" href="?roomId=${roomInfo.roomId}&currentPage=${currentPage - 1}">이전</a> --%>
		          </li>
		
		          <c:forEach var="i" begin="1" end="${reviewCntAvg.lastPage}">
		            <li class="page-item <c:if test="${currentPage == i}">active</c:if>">
		            	<button id="pageNo" class="page-link" type="button" value="${i}">${i}</button>
		              <%-- <a class="page-link" href="?roomId=${roomInfo.roomId}&currentPage=${i}">${i}</a> --%>
		            </li>
		          </c:forEach>
		
		          <li class="page-item <c:if test="${currentPage == reviewCntAvg.lastPage}">disabled</c:if>">
		            <button class="page-link" type="button" id="next">다음</button>
		            <%-- <a class="page-link" href="?roomId=${roomInfo.roomId}&currentPage=${currentPage + 1}">다음</a> --%>
		          </li>
		        </ul>
		      </nav>
		    </c:otherwise>			
		</c:choose>
						
		<div style="margin-bottom:100px;display: flex;justify-content: space-between; ">
			<div>
				프로필 상세보기
			</div>
			<div>
				
			</div>			
		</div>		
	</div> <!-- 상세보기전체감싸는 div -->
</body>
		
		
	<script>
	<!-- 페이징 -->
		const currentPage = "${currentPage}"
		console.log(currentPage);
		$("#pageNo").click( function(){
			$.ajax({
				url:"/room/ajaxRoomInfoPaging",
				method:"post",
				data: {"currentPage":"${currentPage}" , "roomId":"${roomInfo.roomId}"},
				success: console.log("success")
			})
		})		
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