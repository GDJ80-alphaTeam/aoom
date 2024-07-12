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
		
		<div style="margin-bottom:100px; height:500px; background-color: green" >
			이미지 들어갈곳
		</div>
		
		<h3>숙소설명</h3>
		<div style="margin-bottom:100px; width: 100%; background-color: gray">
			${roomInfo.roomContent}
		</div>
		
		<!-- 지도 -->
		<div id="map" style="width:100%; height:400px;"></div>
		
		<h3>숙소 편의시설</h3>
		<div style="flex-wrap: wrap; margin-bottom:100px; display: flex;justify-content: space-between;">
			<c:forEach var="r" items="${roomAmenities}">
				<div style="width: 50%">
					${r.codeName}
				</div>
			</c:forEach>
		</div>
		
		<h3>별점 + 후기개수</h3>
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
		
		<h4>프로필 페이징</h4>
		<div style="margin-bottom:100px;display: flex;justify-content: space-between; ">
			<div>
				프로필 상세보기
			</div>
			<div>
				${roomInfo.address}
			</div>			
		</div>
		
		
	</div> <!-- 상세보기전체감싸는 div -->
</body>
	<!-- body 스크립트 -->
	<script>
	
	</script>

	<!-- 카카오지도 스크립트 -->
	<script>
	 
     
	let mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
let map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
let geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다		주소값 jstl로 받아왔음
geocoder.addressSearch("${roomInfo.address}", function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        let coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        let marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        let infowindow = new kakao.maps.InfoWindow({							//jstl로 바로 가격받아옴
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${roomInfo.defaultPrice}</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
	</script>
</html>