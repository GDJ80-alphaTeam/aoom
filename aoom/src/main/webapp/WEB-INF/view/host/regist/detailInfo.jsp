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
				<input type="text" name="roomName" maxlength="25" value="${roomInfo.roomName }" required="required">
			</c:if>
			<c:if test="${roomInfo.roomName == null || roomInfo.roomName eq ''}">
				<input type="text" name="roomName" maxlength="25" required="required">
			</c:if>
		</div>

		<!-- 숙소 설명 설정 -->
		<div>
			숙소 설명 :
			<c:if test="${roomInfo.roomContent != null && roomInfo.roomContent ne ''}">
				<textarea rows="10" cols="50" name="roomContent" maxlength="1000" required="required">${roomInfo.roomContent }</textarea>
			</c:if>
			<c:if test="${roomInfo.roomContent == null || roomInfo.roomContent eq ''}">
				<textarea rows="10" cols="50" name="roomContent" maxlength="1000" required="required"></textarea>
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
					<c:if test="${roomInfo.mainImage != null && roomInfo.mainImage ne ''}">
						<img src="${roomInfo.mainImage }" style="width: 300px; height: 300px; display: block;" id="mainImageFile"> 
					</c:if>
					<c:if test="${roomInfo.mainImage == null || roomInfo.mainImage eq ''}">
						<img src="/image/etc/imageUploadIcon.png" style="width: 300px; height: 300px; display: block;" id="mainImageFile"> 
					</c:if>
					<input type="file" id="mainImage" name="mainImage" accept="image/*" style="display: none;">
		            <input type="hidden" id="existingMainImage" value="${roomInfo.mainImage}">
				</label> 
			</div>

			<!-- 나머지 이미지들 -->
			<div style="display: inline-block;">
				<div>
					<c:forEach var="i" begin="1" end="4">
					    <c:if test="${i % 2 == 1 }">
					        <div>
					    </c:if>
					    <div style="position: relative; display: inline-block;">
					        <button type="button" id="image_${i}_remove" style="position: absolute; top: 0; right: 0;">X</button>
					        <label for="images_${i}">
					            <c:if test="${roomInfo.roomImages[i-1].image != null && roomInfo.roomImages[i-1].image ne ''}">
					                <img src="${roomInfo.roomImages[i-1].image}" style="width: 150px; height: 150px; display: block;" id="image_${i}_file">
					            </c:if>
					            <c:if test="${roomInfo.roomImages[i-1].image == null || roomInfo.roomImages[i-1].image eq ''}">
					                <img src="/image/etc/imageUploadIcon.png" style="width: 150px; height: 150px; display: block;" id="image_${i}_file">
					            </c:if>
					            <input type="file" id="images_${i}" name="images_${i}" accept="image/*" style="display: none;">
					            <input type="hidden" id="existingImages_${i }" value="${roomInfo.roomImages[i-1].image }">
					        </label>
					    </div>
					    <c:if test="${i % 2 == 0 }">
					        </div>
					    </c:if>
					</c:forEach>

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
		    let amenityList = [];
		    
		    // 페이지 로딩 시 체크박스 상태 확인
		    $('input[name="checkAmenities"]').each(function() {
		        if ($(this).is(':checked')) {
		            let amenityCode = $(this).val();
		            $('label[for="' + amenityCode + '"]').removeClass('btn-light')
		            $('label[for="' + amenityCode + '"]').addClass('btn-primary');
		            amenityList.push(amenityCode);
		        }
		        
		        $('#amenities').val(amenityList);
		    });
		    
		    $('input[name="checkAmenities"]').change(function() {
		        amenityList = []; // 변경 시점에 배열을 초기화
	
		        $('input[name="checkAmenities"]').each(function() {
		            let amenityCode = $(this).val();
		            if ($(this).is(":checked")) {
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
		});
	</script>

	<!-- 이미지 등록 전 미리보기 기능 -->
	<script type="text/javascript">
		// 미리 보기 기능 - 메인이미지
		$('#mainImage').on('change', function() {
			const imageSrc = URL.createObjectURL(this.files[0]);
			$('#mainImageFile').attr('src', imageSrc);
		});
	
		// 미리 보기 기능 - 나머지 이미지들
		for (let i = 1; i <= 4; i++) {
			$('#images_' + i).on('change', function() {
				let imageSrc = URL.createObjectURL(this.files[0]);
				$('#image_' + i + '_file').attr('src', imageSrc);
			});
		}
	</script>

	<!-- x버튼 클릭시 이미지 제거 -->
	<script type="text/javascript">
		// x버튼 클릭시 이미지 제거
		// 메인 이미지 제거
		$('#mainImageRemove').click(function() {
			$('#mainImage').val('');
			$('#mainImageFile').attr('src', "/image/etc/imageUploadIcon.png");
			$('#existingMainImage').val('');
		});
		
		// 나머지 이미지 제거
		for (let i = 1; i <= 4; i++) {
			$('#image_' + i + '_remove').click(function() {
				$('input[name="images_' + i + ']').val('');
				$('#image_' + i + '_file').attr('src', "/image/etc/imageUploadIcon.png");
				$('#existingImages_' + i).val('');
			});
		}
	</script>

	<!-- 폼 제출 전 이미지 파일 업로드 했는지 검사 -->
	<script type="text/javascript">
	    $('#BtnNext').click(function(event) {
	        // 메인 이미지 검사
	        if ($('#mainImage').val() == '' && $('#existingMainImage').val() == '') {
	            alert('숙소 이미지를 추가해주세요!');
	            return false;
	        }
	        
	        // 나머지 이미지들 검사
	        for (let i = 1; i <= 4; i++) {
	            if ($('#images_' + i).val() == '' && $('#existingImages_' + i).val() == '') {
	                alert('숙소 이미지를 추가해주세요!');
	                return false;
	            }
	        }
	    });
	</script>

	
	<!-- 나가기 버튼 클릭시 이벤트 -->
	<script type="text/javascript">
		$('#BtnQuit').click(function() {
			if (confirm("나가실 경우 해당 페이지의 내용은 저장 되지않습니다")) {
                window.location.href = "/host/roomManage";
            }
		});	
	</script>
</body>
</html>