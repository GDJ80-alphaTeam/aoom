<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>숙소 등록 2단계</title>
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body class="container">

	<h1>숙소 등록 2단계</h1>
	
	<!-- 나가기 버튼 -->
	<div class="d-flex">
		<button id="BtnQuit" class="btn btn-danger ms-auto">나가기</button>
	</div>
	
	<form action="/host/roomManage/registRoom/registDetailInfo" enctype="multipart/form-data" method="post">
		<!-- roomId -->
		<input type="hidden" name="roomId" value="${roomId }">

		<!-- 숙소 이름 설정 -->
		<div>
			숙소 이름 : 
			<c:if test="${roomInfo.roomName != null && roomInfo.roomName ne ''}">
				<input type="text" name="roomName" value="${roomInfo.roomName }" required="required">
			</c:if>
			<c:if test="${roomInfo.roomName == null || roomInfo.roomName eq ''}">
				<input type="text" name="roomName" required="required">
			</c:if>
		</div>

		<!-- 숙소 설명 설정 -->
		<div>
			숙소 설명 :
			<c:if test="${roomInfo.roomContent != null && roomInfo.roomContent ne ''}">
				<textarea rows="10" cols="50" name="roomContent" required="required">${roomInfo.roomContent }</textarea>
			</c:if>
			<c:if test="${roomInfo.roomContent == null || roomInfo.roomContent eq ''}">
				<textarea rows="10" cols="50" name="roomContent" required="required"></textarea>
			</c:if>
		</div>

		<!-- 숙소 편의시설 설정 -->
		<div>
			편의시설 :
			<c:forEach var="amenity" items="${amenities }">
				<label for="${amenity.codeKey }" class="btn btn-light">${amenity.codeName }</label>
				<c:set var="isCheckd" value="false"></c:set>
				<c:forEach var="ra" items="${roomInfo.roomAmenities}">
					<c:if test="${ra.codeKey eq amenity.codeKey }">
						<input type="checkbox" id="${amenity.codeKey }" name="checkAmenities" checked="checked" value="${amenity.codeKey }" style="display: none">
						<c:set var="isCheckd" value="true"></c:set>
					</c:if>
				</c:forEach>
				<c:if test="${!isCheckd}">
					<input type="checkbox" id="${amenity.codeKey }" name="checkAmenities" value="${amenity.codeKey }" style="display: none">
				</c:if>
			</c:forEach>
				
			<input type="hidden" name="amenities" id="amenities">
		</div>

		<!-- 사진 등록 -->
		<div style="display: inline-block;">
			<!-- 메인이미지 -->
			<div style="display: inline-block; position: relative;">
				<button type="button" id="mainImageRemove" style="position: absolute; top: 0; right: 0;">X</button>
				<label for="mainImage"> 
					<img src="/image/etc/imageUploadIcon.png" style="width: 300px; height: 300px; display: block;" id="mainImageFile">
					<input type="file" id="mainImage" name="mainImage" accept="image/*" style="display: none;">
				</label> 
			</div>

			<!-- 나머지 이미지들 -->
			<div style="display: inline-block;">
				<div>
					<!-- 1번째 이미지 -->
					<div style="position: relative; display: inline-block;">
						<button type="button" id="firstImageRemove" style="position: absolute; top: 0; right: 0;">X</button>
						<label for="firstImage">
							<img src="/image/etc/imageUploadIcon.png" style="width: 150px; height: 150px; display: block;" id="firstImageFile"> 
							<input type="file" id="firstImage" name="images" accept="image/*" style="display: none;">
						</label>
					</div>
					<!-- 2번째 이미지 -->
					<div style="position: relative; display: inline-block;">
						<button type="button" id="secondImageRemove" style="position: absolute; top: 0; right: 0;">X</button>
						<label for="secondImage"> 
							<img src="/image/etc/imageUploadIcon.png" style="width: 150px; height: 150px; display: block;" id="secondImageFile"> 
							<input type="file" id="secondImage" name="images" accept="image/*" style="display: none;">
						</label>
					</div>
				</div>

				<div>
					<!-- 3번째 이미지 -->
					<div style="position: relative; display: inline-block;">
						<button type="button" id="thirdImageRemove" style="position: absolute; top: 0; right: 0;">X</button>
						<label for="thirdImage"> 
							<img src="/image/etc/imageUploadIcon.png" style="width: 150px; height: 150px; display: block;" id="thirdImageFile"> 
							<input type="file" id="thirdImage" name="images" accept="image/*" style="display: none;">
						</label>
					</div>

					<!-- 4번째 이미지 -->
					<div style="position: relative; display: inline-block;">
						<button type="button" id="fourthImageRemove" style="position: absolute; top: 0; right: 0;">X</button>
						<label for="fourthImage"> 
							<img src="/image/etc/imageUploadIcon.png" style="width: 150px; height: 150px; display: block;" id="fourthImageFile"> 
							<input type="file" id="fourthImage" name="images" accept="image/*" style="display: none;">
						</label>
					</div>
				</div>
			</div>
		</div>

		<br>
		<!-- 이전페이지 버튼, 다음 버튼-->
		<div class="d-flex">
			<button type="button" id="BtnBefore" onclick="window.location.href = '/host/roomManage/registRoom/basicInfo?roomId=${roomInfo.roomId}';" class="btn btn-secondary ms-auto">이전</button>
			<button type="submit" id="BtnNext" class="btn btn-primary">다음</button>
		</div>
	</form>

	<!-- amenities 선택 후 배열로 넘기기 및 버튼 방식 기능 -->
	<script>
		$(document).ready(function() {
			// 페이지 로딩 시 체크박스 상태 확인
		    $('input[name="checkAmenities"]').each(function() {
		        if ($(this).is(':checked')) {
		            let amenityCode = $(this).val();
		            $('label[for="' + amenityCode + '"]').removeClass('btn-light')
		            $('label[for="' + amenityCode + '"]').addClass('btn-primary');
		        }
		    });
		});
		
		$('input[name="checkAmenities"]').change(function() {
			let amenityList = []

			$('input[name="checkAmenities"]').each(function(i) {
				let amenityCode = $(this).val();
				if($(this).is(":checked")) {
					amenityList.push(amenityCode);
					$('label[for="' + amenityCode + '"]').removeClass('btn-light');
					$('label[for="' + amenityCode + '"]').addClass('btn-primary');
				} else {
					$('label[for="' + amenityCode + '"]').removeClass('btn-primary');
					$('label[for="' + amenityCode + '"]').addClass('btn-light');
				}
			});

			$('#amenities').val(amenityList);
			console.log($('#amenities').val());
		});
	</script>

	<!-- 이미지 등록 전 미리보기 기능 -->
	<script type="text/javascript">
		// 미리 보기 기능 - 메인이미지
		$('#mainImage').on('change', function() {
			const imageSrc = URL.createObjectURL(this.files[0]);
			$('#mainImageFile').attr('src', imageSrc);
		});

		// 미리 보기 기능 - 1번째 이미지
		$('#firstImage').on('change', function() {
			const imageSrc = URL.createObjectURL(this.files[0]);
			$('#firstImageFile').attr('src', imageSrc);
		});

		// 미리 보기 기능 - 2번째 이미지
		$('#secondImage').on('change', function() {
			const imageSrc = URL.createObjectURL(this.files[0]);
			$('#secondImageFile').attr('src', imageSrc);
		});

		// 미리 보기 기능 - 3번째 이미지
		$('#thirdImage').on('change', function() {
			const imageSrc = URL.createObjectURL(this.files[0]);
			$('#thirdImageFile').attr('src', imageSrc);
		});

		// 미리 보기 기능 - 4번째 이미지
		$('#fourthImage').on('change', function() {
			const imageSrc = URL.createObjectURL(this.files[0]);
			$('#fourthImageFile').attr('src', imageSrc);
		});
	</script>

	<!-- x버튼 클릭시 이미지 제거 -->
	<script type="text/javascript">
		// x버튼 클릭시 이미지 제거
		// 메인 이미지 제거
		$('#mainImageRemove').click(function() {
			$('#mainImage').val("");
			$('#mainImageFile').attr('src', "/image/etc/imageUploadIcon.png");
		});

		// 1번째 이미지 제거
		$('#firstImageRemove').click(function() {
			$('#firstImage').val("");
			$('#firstImageFile').attr('src', "/image/etc/imageUploadIcon.png");
		});

		// 2번째 이미지 제거
		$('#secondImageRemove').click(function() {
			$('#secondImage').val("");
			$('#secondImageFile').attr('src', "/image/etc/imageUploadIcon.png");
		});

		// 3번째 이미지 제거
		$('#thirdImageRemove').click(function() {
			$('#thirdImage').val("");
			$('#thirdImageFile').attr('src', "/image/etc/imageUploadIcon.png");
		});

		// 4번째 이미지 제거
		$('#fourthImageRemove').click( function() {
			$('#fourthImage').val("");
			$('#fourthImageFile').attr('src', "/image/etc/imageUploadIcon.png");
		});
	</script>

	<!-- 폼 제출 전 이미지 파일 업로드 했는지 검사 -->
	<script type="text/javascript">
		$('#BtnNext').click(
			function() {
				if (($('#mainImage').val() == '') 
						|| ($('#firstImage').val() == '')
						|| ($('#secondImage').val() == '') 
						|| ($('#thirdImage').val() == '')
						|| ($('#fourthImage').val() == '')) {
					
					alert('숙소 이미지를 추가해주세요!');
					return false;
				}
			});
	</script>
	
	<!-- 나가기 버튼 클릭시 이벤트 -->
	<script type="text/javascript">
		$('#BtnQuit').click(function() {
			if (confirm("나가실 경우 해당 페이지의 내용은 저장 되지않습니다")) {
                window.location.href = "/host/roomManage"; // 원하는 URL로 변경
            }
		});	
	</script>
</body>
</html>