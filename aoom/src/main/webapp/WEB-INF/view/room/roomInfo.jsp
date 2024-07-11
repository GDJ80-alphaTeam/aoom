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
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=LIBRARY"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
</head>
<body>
	<div style="width:1000px; margin: 0 auto ;">
		<h1>${roomInfo[0].roomName}</h1>
		
		<div style="margin-bottom:100px;height:500px; background-color: green" >
			이미지 들어갈곳
		</div>
			<h3>숙소설명</h3>
		<div style="margin-bottom:100px;">
			<textarea rows="10" cols="130">숙소설명content</textarea>
		</div>
		
		<!-- 지도 -->
		<div id="map" style="width:500px;height:400px;"></div>
		
		<h3>숙소 편의시설</h3>
		<div style="flex-wrap: wrap; margin-bottom:100px; display: flex;justify-content: space-between; ">
			<div style="width: 50%">
				content1			
			</div>
			<div style="width: 50%">
				content2
			</div>
			<div style="width: 50%">
				content3
			</div>
			<div style="width: 50%">
				content4
			</div>				
		</div>
		
		<h3>별점 + 후기개수</h3>
		<div style="flex-wrap: wrap;margin-bottom:100px; display: flex;">
			<div style="width: 50%;">
				프로필1
			</div>
			<div style="width: 50%;">
				프로필2
			</div>
			<div style="width: 50%;">
				프로필3
			</div>
			<div style="width: 50%;">
				프로필4
			</div>
		</div>
		<h4>프로필 페이징</h4>
		<div style="margin-bottom:100px;display: flex;justify-content: space-between; ">
			<div>
				프로필 상세보기
			</div>
			<div>
				간이예약메뉴
			</div>			
		</div>
		
		
	</div> <!-- 상세보기전체감싸는 div -->
</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d0bb47f44ed3984ece34abf9d6054796"></script>
	<script>
		let container = document.getElementById('map');
		let options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};
		let map = new kakao.maps.Map(container, options);
	</script>
</html>