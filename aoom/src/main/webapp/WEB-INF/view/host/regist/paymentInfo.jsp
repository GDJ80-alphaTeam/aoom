<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	    <form action="/host/roomManage/registRoom/registPaymentInfo" id="paymentForm" method="post">
	        <div class="title">
	            <h2>숙소등록</h2>
	        </div>
	        <div class="pro">
	            <img src="/style/img/pro3.png" alt="프로그래스바" class="active">
	        </div><!-- //pro -->
	        
	        <div class="page_ac">
	            <div class="page_move">
	                <div class="page_rolling page_r3">
	                    <div class="page_r3">
	                        <div class="p3_left">
	                        	<!-- roomId -->
								<input type="hidden" name="roomId" value="${roomId }">
								
	                            <div class="l_top">
	                                <h4>기본 요금 <p>* 플랫폼 수수료 10%</p>
	                                </h4>
	                                <input type="number" id="defaultPrice" name="defaultPrice" min="30000" value="${roomInfo.originalDefaultPrice }" placeholder="금액을 입력해주세요" required="required"> 원
	                            </div><!-- //l_top -->
	                            <div class="l_middle">
	                                <h4>환불정책 설정</h4>
	                                <div class="select_btn">
	                                    <select>
											<c:forEach var="rf" items="${refundme }">
												<option>${rf.codeDesc }</option>
											</c:forEach>
										</select>	
	                                </div><!-- //slect_btn -->
	                            </div><!-- //l_middle -->
	                            <div class="l_bottom">
	                                <h4>대금 수령 계좌 입력</h4>
	                                <div class="i_box">
	                                    <!-- 은행 선택 -->
										<select name="bankCode" required="required">
											<c:forEach var="b" items="${bank }">
												<c:if test="${roomInfo.bankCode eq b.codeKey }">
													<option value="${b.codeKey }" selected="selected">${b.codeName }</option>
												</c:if>
												<c:if test="${roomInfo.bankCode ne b.codeKey }">
													<option value="${b.codeKey }">${b.codeName }</option>
												</c:if>
											</c:forEach>
										</select>
	                                    <input type="text" id="accountNo" name="accountNo" placeholder="'-'를 포함하여 입력해주세요" required="required" value="${roomInfo.accountNo }" pattern="^(\d{1,})(-(\d{1,})){1,}" style="width: 250px;">
	                                </div><!-- //i_box -->
	                            </div><!-- //l_bottom -->
	                        </div><!-- //p3_left -->
	                        <div class="p3_right">
	                            <div class="r_top">
	                                <h4>예약 확정 방식</h4>
	                                <div class="select_btn">
	                                    <button type="button" class="on"> <i class="fa-solid fa-check"></i>
	                                        <p>즉시 예약</p>
	                                    </button>
	                                    <button type="button"> <i class="fa-solid fa-check"></i>
	                                        <p>사진 요청</p>
	                                    </button>
	                                    <button type="button"> <i class="fa-solid fa-check"></i>
	                                        <p>여행 목적 요청</p>
	                                    </button>
	                                    <button type="button"> <i class="fa-solid fa-check"></i>
	                                        <p>체크인 시간 요청</p>
	                                    </button>
	                                    <button type="button"> <i class="fa-solid fa-check"></i>
	                                        <p>선택 이유 요청</p>
	                                    </button>
	                                </div><!-- //select_btn -->
	                            </div><!-- //r_top -->
	                            <div class="r_bottom">
	                                <div class="cute_2">
	                                    <img src="/style/img/cute2.png" alt="aoom마스코트">
	                                    <img src="/style/img/cute3.png" alt="aoom마스코트">
	                                </div><!-- //cute_2 -->
	                                <div class="cute_1">
	                                    <img src="/style/img/cute1.png" alt="aoom마스코트">
	                                </div><!-- //cute_1 -->
	
	                            </div><!-- //r_bottom -->
	
	                        </div><!-- //p3_right -->
	                    </div><!-- //page_r3 -->
	                </div><!-- page_rolling//page_r3 -->
	            </div><!-- //page_move -->
	        </div>
	        <div class="pagenation_box">
		        <button type="button" class="prev" onclick="window.location.href = '/host/roomManage/registRoom/detailInfo?roomId=${roomInfo.roomId}';">
	        		<span>이전 단계</span>
	        	</button>
				<button type="submit" class="next">
					<span>다음 단계</span>
				</button>
	        </div><!-- //pagenation_box -->
        </form>
    </div><!-- //inner -->
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/view/layout/footer.jsp"></jsp:include>
	
	<!-- 숙소 기본 요금 설정 시 10원단위로 절사 및 1000원단위로 콤마 표시 기능 -->
	<script type="text/javascript">
		$('#defaultPrice').blur(function() {
			// 입력한 금액 가져오기
			let originalPrice = $('#defaultPrice').val();
			console.log(originalPrice);
			
			// 1원단위 절사(내림)
			let truncationPrice = Math.floor(originalPrice/10) * 10;
			console.log(truncationPrice);
			
			$('#defaultPrice').val(truncationPrice);
		});
	</script>
</body>
</html>