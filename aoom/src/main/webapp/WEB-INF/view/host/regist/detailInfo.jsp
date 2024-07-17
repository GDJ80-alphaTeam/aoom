<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>숙소 등록 2단계</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
	<form action="/host/roomManage/registRoom/registDetailInfo" enctype="multipart/form-data" method="post">
		<!-- roomId -->
		<input type="hidden" name="roomId" value="${roomId }">
		
		<!-- 숙소 이름 설정 -->
		<div>
			숙소 이름 : 
			<input type="text" name="roomName" required="required">
		</div>
		
		<!-- 숙소 설명 설정 -->
		<div>
			숙소 설명 :
			<textarea rows="10" cols="50" name="roomContent"></textarea>
		</div>
		
		<!-- 숙소 편의시설 설정 -->
		<div>
			편의시설 : 
			<c:forEach var="amenity" items="${amenities }">
				<label for="${amenity.codeKey }">${amenity.codeName }</label>
				<input type="checkbox" id="${amenity.codeKey }" name="amenities" value="${amenity.codeKey }">
			</c:forEach>
		</div>
		
		<!-- 사진 등록 -->
		<div>
			<div style="display: inline-block;">
				<!-- 메인이미지 -->
				<div style="display: inline-block;">
					<img src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" style="width: 300px; height: 300px; display: block;" id="mainImageFile">
					<input type="file" id="mainImage" name="mainImage" accept="image/*" required="required">
				</div>
				
				<!-- 나머지 이미지들 -->
			    <div style="display: inline-block;">
			    	<div style="display: inline-block;">
			    		<img src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" style="width: 150px; height: 150px; display: block;" id="firstImageFile">
						<input type="file" id="firstImage" name="images" accept="image/*" required="required">
						
						<img src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" style="width: 150px; height: 150px; display: block;" id="secondImageFile">
						<input type="file" id="secondImage" name="images" accept="image/*" required="required">
			    	</div>
					
					<div style="display: inline-block;">
			    		<img src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" style="width: 150px; height: 150px; display: block;" id="thirdImageFile">
						<input type="file" id="thirdImage" name="images" accept="image/*" required="required">
						<img src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" style="width: 150px; height: 150px; display: block;" id="fourthImageFile">
						<input type="file" id="fourthImage" name="images" accept="image/*" required="required">
			    	</div>
				</div>
			</div>
		</div>
		
		<button type="submit">다음</button>
	</form>
	
	<!-- 이미지 등록 전 미리보기 기능 -->
	<script type="text/javascript">
		
		// 미리 보기 기능 - 메인이미지
		$('#mainImage').on('change', function() {
			const imageSrc = URL.createObjectURL(this.files[0]);
			$('#mainImageFile').attr('src', imageSrc);
		});

		// 미리 보기 기능 - 메인이미지
		$('#firstImage').on('change', function() {
			const imageSrc = URL.createObjectURL(this.files[0]);
			$('#firstImageFile').attr('src', imageSrc);
		});

		// 미리 보기 기능 - 메인이미지
		$('#secondImage').on('change', function() {
			const imageSrc = URL.createObjectURL(this.files[0]);
			$('#secondImageFile').attr('src', imageSrc);
		});
		
		// 미리 보기 기능 - 메인이미지
		$('#thirdImage').on('change', function() {
			const imageSrc = URL.createObjectURL(this.files[0]);
			$('#thirdImageFile').attr('src', imageSrc);
		});
		
		// 미리 보기 기능 - 메인이미지
		$('#fourthImage').on('change', function() {
			const imageSrc = URL.createObjectURL(this.files[0]);
			$('#fourthImageFile').attr('src', imageSrc);
		});
		
	</script>
</body>
</html>