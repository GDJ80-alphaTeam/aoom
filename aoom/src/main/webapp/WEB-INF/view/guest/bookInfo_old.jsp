<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약상세</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
	
	<jsp:include page="/WEB-INF/view/layout/navbarSub.jsp"></jsp:include>
	
	
	<div style="width: 1200px;margin: 0 auto; text-align: center;">
		<a href="/guest/bookList">
			<button type="button" class="btn btn-primary">숙소리스트보기</button>
		</a>
		<c:choose>
			<c:when test="${bookingInfo.bookstatCode == 'bst05'}">
				<h1>취소된예약</h1>
			</c:when>
			<c:when test="${paymentInfo.paytypeCode == 'pmt02' }">
				<h1>예약상세보기</h1>
				<h3>환불계좌:${paymentInfo.refundAccount}</h3>
				
				<a href="/booking/bookingCancel?bookingId=${bookingInfo.bookingId}">
					<button type="button" class="btn btn-primary">
						예약취소하기
					</button>
				</a>
			</c:when>
			<c:otherwise>
				
				
			</c:otherwise>
		</c:choose>
	
		<div style="width: 100%">
			<h3>가격:${bookingInfo.totalPrice}</h3>
		</div>
		<div style="width: 100%">
			<h3>주소:${bookingInfo.address}</h3> 
		</div>
		<div style="width: 100%">
			<h3>숙소이름:${bookingInfo.roomName}</h3> 
		</div>
		<div style="width: 100%">
			<h3>체크인날짜:${bookingInfo.checkIn}</h3> 
		</div>
		<div style="width: 100%">
			<h3>체크아웃날짜:${bookingInfo.checkOut}</h3> 
		</div>
		<h3>숙소사진</h3>
		<img src="${bookingInfo.mainImage}">
		<div style="width: 100%">
			<h3>
			예약번호:${bookingInfo.bookingId}
			</h3>
		</div>
		<div style="width: 100%">
			<h3>
			숙박인원:${bookingInfo.stayPeople}
			</h3>
		</div>
		<div style="width: 100%">
			<h3>
				호스트아이디:${bookingInfo.hostId}
			</h3>
		</div>
		
		<form action="/review/insert" enctype="multipart/form-data" method="post" id="reviewForm">		
			<c:choose> 
				<c:when test="${bookingInfo.bookstatCode == 'bst03'}">
					
					<!-- Button trigger modal -->
					<button type="button" class="btn btn-primary" data-bs-toggle="modal"data-bs-target="#reviewModal">
							후기 작성하기
					</button>
	
				<!-- Modal -->
				<div class="modal fade" id="reviewModal" tabindex="-1"	aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">후기 작성하기</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
							</div>
							<!-- 내용 -->
							<div class="modal-body">
								<h3>후기 작성시 수정이 불가능합니다.</h3>
								 <input type="hidden" id="rating" name="rating" value="0">
								 <input type="hidden" name="bookingId" value="${bookingInfo.bookingId}">
					 			 <input type="hidden" name="roomId" value="${bookingInfo.roomId}">
					 			<c:forEach var="i" begin="1" end="5">
						        	<span id="star${i}" onClick="stars(${i})">
						     			⚝
						        	</span>
					           	</c:forEach>
					           		 
								<p>후기내용</p>
								<textarea rows="5" cols="35" id="reviewContent" name="reviewContent" required="required" maxlength="500"></textarea>
								<p>후기사진</p>
								<div style="display: inline-block;">
									<div style="display: inline-block; position: relative;">
									<button type="button" class="btn-close" id="reviewImageRemove" style="position: absolute; top: 0; right: 0;"></button>
									<label for="reviewImage">
										<img src="/image/etc/imageUploadIcon.png" style="width: 300px; height: 300px; display: block;" id="reviewImageFile"> 
										<input type="file" id="reviewImage" name="reviewImage" accept="image/*" style="display: none;">
									</label> 
									</div>
								</div>
							</div>
							<!-- 버튼이름 -->
							<div class="modal-footer">	
								<button type="button" id="closeBtn" class="btn btn-secondary"data-bs-dismiss="modal">닫기</button>
								<button type="button" id="submitBtn" class="btn btn-primary">작성하기</button>
							</div>
						</div>
					</div>
				</div>
				</c:when>
				
				<c:otherwise>
					후기를 이미 작성했거나 작성할수없는 상태입니다.
				</c:otherwise>
			</c:choose>
		</form>
		
	</div>
</body>

	<script>
		//미리 보기 기능 - 메인이미지
		$('#reviewImage').on('change', function() {
			const imageSrc = URL.createObjectURL(this.files[0]);
			$('#reviewImageFile').attr('src', imageSrc);
		});
		
		// 이미지 제거
		$('#reviewImageRemove').click(function() {
			$('#reviewImage').val("");
			$('#reviewImageFile').attr('src', "/image/etc/imageUploadIcon.png");
		});
		
		$('#reviewModal').on('hidden.bs.modal', function (e) {
            // 텍스트 영역 초기화
            $('#reviewContent').val('');

            // 별점 초기화 (임시로 값 변경 - 실제 별점 관리 방식에 따라 수정 필요)
            $('#rating').val('0');

            // 이미지 파일 제거
            $('#reviewImageFile').attr('src', '/image/etc/imageUploadIcon.png');
            $('#reviewImage').val('');
			
            for (let i = 1; i <= 5; i++) {
                const star = document.getElementById('star' + i);
                star.innerHTML = '⚝';
            }
            // 필요에 따라 추가적인 초기화 작업
            // 예: $('#star1').removeClass('selected'); 등
        });
		
		function stars(num) {
			$('#rating').val(num)
            for (let i = 1; i <= 5; i++) {
                const star = document.getElementById('star' + i);
                star.innerHTML = i <= num ? '⭐' : '⚝';
            }
		}    
		
		$('#submitBtn').click(function() {
			if($('#rating').val() == 0	|| $('#reviewContent').val() == '') {
				alert('별점 또는 내용을 입력해주세요');
			}
			
			if($('#rating').val() != 0 && $('#reviewContent').val() != ''){
				
				console.log($('#reviewContent').val());
				$("#reviewForm").submit();		
			}
			
			
		})
	 	
	  	
	  	
		
	</script>
</html>