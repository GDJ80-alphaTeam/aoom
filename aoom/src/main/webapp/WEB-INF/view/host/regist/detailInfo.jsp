 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="description" content="AOOM 웹 사이트 입니다">
    <meta name="keywords" content="AOOM, 웹디자인, 포트폴리오, 디자이너, 웹 포트폴리오">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>숙소 등록</title>
    <script src="https://kit.fontawesome.com/82b4a4fcad.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/style/js/roomRegist.js" defer></script>

    <link rel="stylesheet" href="/style/css/common.css">
    <link rel="stylesheet" href="/style/css/roomRegist.css">
    <link rel="stylesheet" href="/style/css/navSub.css">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/layout/navbarSub.jsp"></jsp:include>

	<!----------------------------------- 컨텐츠 시작! --------------------------------------------------->
    <div class="registration inner">
	    <form action="/host/roomManage/registRoom/registDetailInfo" enctype="multipart/form-data" method="post">
	        <div class="title">
	            <h2>숙소등록</h2>
	        </div>
	        <div class="pro">
	            <img src="/style/img/pro2.png" alt="프로그래스바" class="active">
	        </div><!-- //pro -->
	        
	        <div class="page_ac">
	            <div class="page_move">
	                <div class="page_rolling page_r2">
	                    <div class="p_top">
	                        <div class="pt_left">
	                        	<!-- roomId -->
								<input type="hidden" name="roomId" value="${roomId }">
	                            <div class="l_name">
	                                <h4>숙소 이름</h4>
	                                <c:if test="${roomInfo.roomName != null && roomInfo.roomName ne ''}">
										<input type="text" name="roomName" maxlength="25" value="${roomInfo.roomName }" required="required">
									</c:if>
									<c:if test="${roomInfo.roomName == null || roomInfo.roomName eq ''}">
										<input type="text" name="roomName" maxlength="25" required="required">
									</c:if>
	                            </div><!-- //d_name 숙소이름-->
	                            <div class="l_explanation">
	                                <h4>숙소 설명</h4>
	                                <c:if test="${roomInfo.roomContent != null && roomInfo.roomContent ne ''}">
										<textarea rows="10" cols="50" name="roomContent" maxlength="1000" required="required">${roomInfo.roomContent }</textarea>
									</c:if>
									<c:if test="${roomInfo.roomContent == null || roomInfo.roomContent eq ''}">
										<textarea rows="10" cols="50" name="roomContent" maxlength="1000" required="required"></textarea>
									</c:if>
	                            </div><!-- //l_explanation 숙소설명-->
	                        </div><!-- //pt_left -->
	                        <div class="pt_right">
	                            <h4>사진 추가하기</h4>
	                            <div class="l_pic">
	                                <div class="main_pic pic">
	                                	<button type="button" id="mainImageRemove" style="position: absolute; top: 0; right: 0;">X</button>
										<label for="mainImage">
											<c:if test="${roomInfo.mainImage != null && roomInfo.mainImage ne ''}">
												<img src="${roomInfo.mainImage }" id="mainImageFile"> 
											</c:if>
											<c:if test="${roomInfo.mainImage == null || roomInfo.mainImage eq ''}">
												<img src="/image/etc/imageUploadIcon.png" id="mainImageFile"> 
											</c:if>
											<input type="file" id="mainImage" name="mainImage" accept="image/*" style="display: none;">
								            <input type="hidden" id="existingMainImage" value="${roomInfo.mainImage}">
										</label> 
	                                    <div class="bg_box">대표 사진</div>
	                                </div><!-- //main_pic 대표사진-->
	                                <div class="sub">
	                                    <c:forEach var="i" begin="1" end="4">
										    <c:if test="${i % 2 == 1 }">
										        <div class="sub_pic">
										    </c:if>
										    <div class="s_p pic">
										        <button type="button" id="image_${i}_remove" style="position: absolute; top: 0; right: 0;">X</button>
										        <label for="images_${i}">
										            <c:if test="${roomInfo.roomImages[i-1].image != null && roomInfo.roomImages[i-1].image ne ''}">
										                <img src="${roomInfo.roomImages[i-1].image}" id="image_${i}_file">
										            </c:if>
										            <c:if test="${roomInfo.roomImages[i-1].image == null || roomInfo.roomImages[i-1].image eq ''}">
										                <img src="/image/etc/imageUploadIcon.png" id="image_${i}_file">
										            </c:if>
										            <input type="file" id="images_${i}" name="images_${i}" accept="image/*" style="display: none;">
										            <input type="hidden" id="existingImages_${i }" value="${roomInfo.roomImages[i-1].image }">
										        </label>
										        <div class="bg_box">사진 ${i }</div>
									        </div>
										    <c:if test="${i % 2 == 0 }">
										        </div>
										    </c:if>
										</c:forEach>
	                                </div>
	
	
	                            </div><!-- //l_pic -->
	                        </div><!-- //pt_right -->
	                    </div><!-- //p2_top -->
	                    <div class="p_bottom">
	                        <h4>편의시설</h4>
	                        <ul class="icon_box">
	                            <c:forEach var="amenity" items="${amenities }">
									<c:set var="isCheckd" value="false"></c:set>
									<c:forEach var="ra" items="${roomInfo.roomAmenities}">
										<c:if test="${ra.codeKey eq amenity.codeKey }">
											<li class="on">
												<i class="fa-solid fa-check"></i>
				                                <div class="img_b">
				                                    <img src="/style/img/${amenity.codeKey }on.png" alt="${ra.codeName }">
				                                </div>
				                                <h5>${amenity.codeName }</h5>
												<input type="checkbox" id="${amenity.codeKey }" name="checkAmenities" checked="checked" value="${amenity.codeKey }" style="display: none">
											</li>
											<c:set var="isCheckd" value="true"></c:set>
										</c:if>
									</c:forEach>
									<c:if test="${!isCheckd}">
										<li>
											<i class="fa-solid fa-check"></i>
			                                <div class="img_b">
			                                    <img src="/style/img/${amenity.codeKey }.png" alt="${ra.codeName }">
			                                </div>
			                                <h5>${amenity.codeName }</h5>
											<input type="checkbox" id="${amenity.codeKey }" name="checkAmenities" value="${amenity.codeKey }" style="display: none">
										</li>
									</c:if>
								</c:forEach>
								<input type="hidden" name="amenities" id="amenities">
	                        </ul>
	                    </div><!-- //p_bottom -->
	                </div><!-- page_rolling//page_r2 -->
	            </div><!-- //page_move -->
	        </div>
	        <div class="pagenation_box">
		        <button type="button" class="prev" onclick="window.location.href = '/host/roomManage/registRoom/basicInfo?roomId=${roomInfo.roomId}';">
	        		<span>이전 단계</span>
	        	</button>
				<button type="submit" class="next" id="btnNext">
					<span>다음 단계</span>
				</button>
	        </div><!-- //pagenation_box -->
        </form>
    </div><!-- //inner -->

	<!-- amenities 선택 후 배열로 넘기기 및 버튼 방식 기능 -->
	<script>
		$(document).ready(function() {
		    let amenityList = [];
		    
		    // 페이지 로딩 시 체크박스 상태 확인
		    $('input[name="checkAmenities"]').each(function() {
		        if ($(this).is(':checked')) {
		            let amenityCode = $(this).val();
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
		            }
		        });
	
		        $('#amenities').val(amenityList);
		        console.log($('#amenities').val());
		    });
		});
	</script>

	<!-- 이미지 등록 전 미리보기 기능 -->
	<script type="text/javascript">
		$('#mainImage').on('change', function() {
		    if (this.files.length > 0) {
		        const imageSrc = URL.createObjectURL(this.files[0]);
		        $('#mainImageFile').attr('src', imageSrc);
		    } else {
		        $('#mainImageFile').attr('src', '/image/etc/imageUploadIcon.png');
		    }
		});
	
		// 미리 보기 기능 - 나머지 이미지들
		for (let i = 1; i <= 4; i++) {
		    $('#images_' + i).on('change', function() {
		        if (this.files.length > 0) {
		            let imageSrc = URL.createObjectURL(this.files[0]);
		            $('#image_' + i + '_file').attr('src', imageSrc);
		        } else {
		            $('#image_' + i + '_file').attr('src', '/image/etc/imageUploadIcon.png');
		        }
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

	<script type="text/javascript">
		$('#mainImage').click(function() {
			$('#mainImage').val('');
			$('#mainImageFile').attr('src', "/image/etc/imageUploadIcon.png");
			$('#existingMainImage').val('');
		});
		
		// 나머지 이미지 제거
		for (let i = 1; i <= 4; i++) {
			$('#image_' + i).click(function() {
				$('input[name="images_' + i + ']').val('');
				$('#image_' + i + '_file').attr('src', "/image/etc/imageUploadIcon.png");
				$('#existingImages_' + i).val('');
			});
		}
	</script>
	
	<!-- 폼 제출 전 이미지 파일 업로드 했는지 검사 -->
	<script type="text/javascript">
	    $('#btnNext').click(function(event) {
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

</body>
</html>