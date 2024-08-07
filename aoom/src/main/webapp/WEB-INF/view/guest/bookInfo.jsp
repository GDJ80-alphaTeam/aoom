<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="description" content="AOOM 웹 사이트 입니다">
    <meta name="keywords" content="AOOM, 웹디자인, 포트폴리오, 디자이너, 웹 포트폴리오">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약상세</title>
    <script src="https://kit.fontawesome.com/82b4a4fcad.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/style/js/bookinfo.js" defer></script>
	<link rel="stylesheet" href="/style/css/messageModal.css">
    <link rel="stylesheet" href="/style/css/common.css">
    <link rel="stylesheet" href="/style/css/bookinfo.css">
    <link rel="stylesheet" href="/style/css/navSub.css">
    <script src="/style/js/navbarSub.js" defer></script>
    <jsp:include page="/WEB-INF/view/layout/message.jsp"></jsp:include>
</head>
<body>
	
	<jsp:include page="/WEB-INF/view/layout/navbarSub.jsp"></jsp:include>
	
	<!-- ----------------------------------------------컨텐츠 시작----------------------------------- -->
    <div class="inner bookinfo">
        <div class="r_infomation">
            <h2>예약 정보</h2>
            <div class="r_info_b">
            	<c:if test="${bookingInfo.bookstatCode == 'bst05'}">
					<h5>
						<b>${bookingInfo.roomName}</b> 예약이 정상적으로<br>취소되었습니다.
					</h5>
				</c:if>
				<c:if test="${bookingInfo.bookstatCode != 'bst05'}">
					<h5>
	                    <b>${bookingInfo.roomName}</b> 예약이 정상적으로<br>
	                    완료되었습니다.
	                </h5>
				</c:if>
                
                <div class="info_b_con">
                    <div class="pic_box">
                        <img src="${bookingInfo.mainImage}">
                    </div><!-- //pic_box -->
                    <div class="info_box">
                        <div class="loca">
                            <h4>숙소 위치</h4>
                            <p>${bookingInfo.address}</p>
                        </div><!-- //loca -->
                        <div class="r_date">
                            <h4>예약 날짜</h4>
                            <div class="date_box">
                                <div class="chk">
                                    <i>체크인</i>
                                    <p>${bookingInfo.checkIn}</p>
                                    <p>오후 2시</p>
                                </div><!-- //chk -->
                                <div class="chk">
                                    <i>체크아웃</i>
                                    <p>${bookingInfo.checkOut}</p>
                                    <p>오전 11시</p>
                                </div><!-- //chk -->
                            </div><!-- //date_box -->
                        </div><!-- //r_date -->
                        <div class="price">
                            <h4>결제 금액</h4>
                            <span>총 합계 KRW &#41;</span> <span class="un_l">₩${bookingInfo.totalPrice}</span>
                        </div><!-- //price -->
                    </div><!-- //info_box -->

                    <div class="cute">
                        <img src="/style/img/cute1_1.png" alt="캐릭터">
                        <img src="/style/img/cute2_1.png" alt="let's go" class="gogo">
                    </div><!-- //cute -->
                </div><!-- //info_b_con -->

            </div><!-- //r_info_b -->
        </div><!-- //r_infomation -->
        <div class="more_info">
				<div class="m_info_con">
					<div class="guest">
	                    <span>게스트</span>
	                    <p>게스트 ${bookingInfo.stayPeople}명</p>
	                </div><!-- //guest -->
	                <div class="num_box">
	                    <span>예약번호</span>
	                    <p>${bookingInfo.bookingId}</p>
	                </div><!-- //num_box -->
					<c:if test="${paymentInfo.paytypeCode == 'pmt02' }">
		                <div class="refund_box">
		                    <span>환불 계좌</span>
		                    <p>${paymentInfo.refundAccount}</p>
		                </div><!-- //num_box -->
					</c:if>
	                <div class="refund_info">
	                    <span>환불 정책</span>
	                    <p>AOOM 환불 정책에 따라 게스트는 예약을 취소 할 수 있으며, 예약 7일 전 까지는 무료취소, 예약 3일 ~ 5일 전 70% 환불, 하루 ~ 2일 전 50% 만 환불이
	                        가능하며, 당일에는 <br>
	                        취소가 불가능하며, 수수료가 발생됩니다. 환불정책을 숙지 하지 않아 생기는 모든 불이익은 게스트에게 책임이 있으며, 호스트의 사정으로 예약 취소시 100% 환불 되며, 해당
	                        <br>
	                        숙소는 일시적으로 차단됩니다.
	                    </p>
	                </div><!-- //refund_info -->
	                <c:if test="${bookingInfo.bookstatCode == 'bst01' or bookingInfo.bookstatCode == 'bst02'}">
						<button type="button" onclick="window.location.href='/booking/bookingCancel?bookingId=${bookingInfo.bookingId}'">예약 취소</button>
					</c:if>
	            </div>
        </div><!-- //more_info -->

        <div class="host_info">
            <h2>호스트</h2>
        <!-- ★호스트소개★--------------------------------------------------------------------------------------------->
        <div class="host_i p_b">
            <div class="h_flex">
                <div class="h_left">
                    <div class="profile">
                        <div class="img_box">
                            <a href="${pageContext.request.contextPath}/user/profile?userId=${roomInfo.userId}">
                            	<img src="${roomInfo.userImage}" alt="임시사진" class="u_pic">
                            </a>
                            <img src="/style/img/icon_9.png" alt="인증마크" class="position_a">
                            <!-- 호스트 프로필사진 자리 -->
                        </div><!--  //img_box-->
                        <b class="host_name">${roomInfo.userName}</b>
                        <p><i class="fa-solid fa-user"></i>호스트</p>
                    </div><!-- //profile -->

                    <div class="h_information">
                        <div class="h_review flex_info">
                            <i>후기</i>
                            <b>${hostReview.cnt}<p>개</p></b>
                        </div><!-- //h_review -->
                        <div class="h_grade flex_info">
                            <i>평점</i>
                            <b>${hostReview.avg}<p><i class="fa-solid fa-star"></i></p></b>
                        </div><!-- //h_grade 평점 -->
                        <div class="h_career flex_info">
                            <i>호스팅 경력</i>
                            
                            <b>
                            <c:choose>
							    <c:when test="${roomInfo.year == 0}">
							        <c:choose>
							            <c:when test="${roomInfo.month != 0}">
							                ${roomInfo.month}<p>월</p>
							            </c:when>
							            <c:otherwise>
							                신규 
							            </c:otherwise>
							        </c:choose>
							    </c:when>
							    <c:when test="${roomInfo.year != 0}">
							        ${roomInfo.year}<p>년</p>
							        <c:choose>
							            <c:when test="${roomInfo.leftMonth != 0}">
							                ${roomInfo.leftMonth}<p>월</p>
							            </c:when>
							        </c:choose>
							    </c:when>
							</c:choose>
                            </b>
                        </div><!-- //h_career호스팅 경력 -->
                    </div><!-- //h_information -->
                </div><!-- //h_left -->
                <div class="h_right">
                    <c:forEach var="hp" items="${hostProfile}">
                   		<c:if test="${hp.proitemCode == 'pfi09'}">
                    	<span>${hp.content}</span>
                    	</c:if>
                    </c:forEach>
                    <div class="talk_btn">
                        <button class="h_talk" id="messageStart">
                            <span>대화 하기</span>
                        </button><!-- //h_talk -->
                    </div><!-- //talk_btn -->
                </div><!-- //h_right -->
            </div><!--/ /h_flex -->

        </div><!-- //host_i -->
        <!--  호스트소개 끝------------------------------------------------------------------------------------>


        </div><!-- //host_info -->

        <div class="bottom_btn">
            <button type="button" onclick="window.location.href='/guest/bookList'">예약목록</button>
            		
			<c:choose> 
				<c:when test="${bookingInfo.bookstatCode == 'bst03'}">
					
					<!-- Button trigger modal -->
					<button type="button" class="event_btn" id="reviewModalBtn">
							후기 작성하기
					</button>
	
					<!-- Modal -->
					<div class="review_modal" id="reviewModal">
						<div class="modal_bg"></div>
							<div class="review">
							<form action="/review/insert" enctype="multipart/form-data" method="post" id="reviewForm">
							
								<div class="r_top">
					                <i class="fa-solid fa-xmark" id="closeModal"></i>
					                <h6>후기작성</h6>
					            </div>
								<!-- 내용 -->
								<div class="r_con">
									<span>숙소 이용에 만족하셨나요?<br>
	                    				고객님의 소중한 후기를 남겨주세요
	                    			</span>
									<input type="hidden" id="rating" name="rating" value="0">
									<input type="hidden" name="bookingId" value="${bookingInfo.bookingId}">
									<input type="hidden" name="roomId" value="${bookingInfo.roomId}">
									<div class="star_box">
							 			<c:forEach var="i" begin="1" end="5">
								        	<span id="star${i}" onClick="stars(${i})">
								     			<i class="fa-solid fa-star "></i>
								        	</span>
							           	</c:forEach>
									</div>
						           		 
									<textarea rows="5" cols="35" id="reviewContent" name="reviewContent" required="required" maxlength="500" placeholder="후기를 작성해주세요"></textarea>
									
									<ul class="pic_box">
					                    <li>
					                    	<label for="reviewImage">
						                    	<i class="fa-solid fa-camera">
													<input type="file" id="reviewImage" name="reviewImage" accept="image/*" style="display: none;">
						                    	</i>
					                    	</label> 
					                    	<b id="picNum">사진 0/1</b>
				                    	</li>
					                    <li class="x">
				                    		<img id="reviewImageFile">
				                    		<button type="button" id="reviewImageRemove">
				                    			<i class="fa-solid fa-xmark"></i>
				                    		</button>
				                    	</li>
					                </ul><!-- //pic_box -->
					                
<!-- 									<div style="display: inline-block;"> -->
<!-- 										<div style="display: inline-block; position: relative;"> -->
<!-- 											<button type="button" id="reviewImageRemove" style="position: absolute; top: 0; right: 0; width: 25px; height: 25px;"></button> -->
<!-- 											<label for="reviewImage"> -->
<!-- 												<img src="/image/etc/imageUploadIcon.png" style="width: 200px; height: 200px; display: block;" id="reviewImageFile">  -->
<!-- 												<input type="file" id="reviewImage" name="reviewImage" accept="image/*" style="display: none;"> -->
<!-- 											</label>  -->
<!-- 										</div> -->
<!-- 									</div> -->
									<p>* 후기 작성시 수정이 불가능 합니다.</p>
								</div>
								<!-- 버튼이름 -->
								<div class="r_bottom">	
									<button type="button" id="submitBtn">작성완료</button>
								</div>
								</form>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<button type="button" class="event_btn" disabled="disabled" style="cursor: not-allowed; opacity: 60%;">
								후기 작성
						</button>
					</c:otherwise>
				</c:choose>
			
        </div><!-- //bottom_btn -->
    </div><!-- //bookinfo -->
    <!-- ----------------------------------------------컨텐츠 끝----------------------------------- -->

</body>

	<script>
		$(document).ready(function() {
			//미리 보기 기능 - 메인이미지
			$('#reviewImage').on('change', function() {
				const imageSrc = URL.createObjectURL(this.files[0]);
				$('#reviewImageFile').attr('src', imageSrc);
				$('#picNum').html('사진 1/1');
			});
			
			// 이미지 제거
			$('#reviewImageRemove').click(function() {
				$('#reviewImage').val("");
				$('#reviewImageFile').attr('src', "");
				$('#picNum').html('사진 0/1');
			});
			
			$('#reviewModalBtn').on('click', function (e) {
				$('.review_modal').addClass('view')
		        $(document).off('click')
	            // 텍스트 영역 초기화
	            $('#reviewContent').val('');
	
	            // 별점 초기화 (임시로 값 변경 - 실제 별점 관리 방식에 따라 수정 필요)
	            $('#rating').val('0');
	
	            // 이미지 파일 제거
	            $('#reviewImageFile').attr('src', '');
	            $('#reviewImage').val('');
	            $('#picNum').html('사진 0/1')
				
	            for (let i = 1; i <= 5; i++) {
	                const star = document.getElementById('star' + i);
	                star.innerHTML = '<i class="fa-solid fa-star "></i>';
	            }
	            // 필요에 따라 추가적인 초기화 작업
	            // 예: $('#star1').removeClass('selected'); 등
	        });
			
			// 별 클릭 이벤트 처리
		    function stars(num) {
		        $('#rating').val(num);
		        for (let i = 1; i <= 5; i++) {
		            const star = document.getElementById('star' + i);
		            // 선택된 별은 활성화된 별로 표시
		            star.innerHTML = i <= num ? '<i class="fa-solid fa-star active"></i>' : '<i class="fa-solid fa-star"></i>';
		        }
		    }

		    // 각 별(span 요소)에 클릭 이벤트 추가
		    for (let i = 1; i <= 5; i++) {
		        $('#star' + i).on('click', function() {
		            stars(i); // 클릭한 별의 순서(i)를 stars 함수에 전달
		        });
		    }

			
			$('#submitBtn').click(function() {
				if($('#rating').val() == 0	|| $('#reviewContent').val() == '') {
					alert('별점 또는 내용을 입력해주세요');
				}
				
				if($('#rating').val() != 0 && $('#reviewContent').val() != ''){
					
					console.log($('#reviewContent').val());
					$("#reviewForm").submit();		
				}
			});
			
			$('#closeModal').on('click', function() {
		        $('#reviewModal').removeClass('view');
		    });
		});		
	</script>
</html>