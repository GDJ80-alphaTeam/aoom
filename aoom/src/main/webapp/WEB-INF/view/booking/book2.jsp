<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="AOOM 웹 사이트 입니다">
    <meta name="keywords" content="AOOM, 웹디자인, 포트폴리오, 디자이너, 웹 포트폴리오">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>숙소 예약하기</title>
    <script src="https://kit.fontawesome.com/82b4a4fcad.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
        
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ko.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_orange.css">
    
    
	
    <link rel="stylesheet" href="/style/css/common.css">
    <link rel="stylesheet" href="/style/css/booking.css">
    <link rel="stylesheet" href="/style/css/navSub.css">
    <script src="/style/js/navbarSub.js" defer></script>
	
</head>

<body>
   
	<jsp:include page="/WEB-INF/view/layout/navbarSub.jsp"></jsp:include>

    <!-- ---------------컨텐츠 시작------------------------>

	<form id="booking">
    <div class="contents inner">
        <div class="title_i_txt">
            <i class="fa-solid fa-chevron-left"></i>
            <h2>예약하기</h2>
        </div><!-- //title_i_txt -->
        <div class="con_left_right">
            <div class="con_left">
                <div class="date_box">
                    <h3>날짜</h3>
                    <div class="calendar_box">
                        <div class="calendar calendar1 chk_i">
                            <div class="calendar_input">
                                <div class="left_box" id="datePicker">
                                    <label for="selected-date">체크인</label>
                                    <input type="text" class="selected-date" readonly id="startDate" name="startDate">
                                </div>
                                <i class="fa-regular fa-calendar"></i>
                            </div>


                        </div><!-- //calendar chk_i -->
                        <div class="calendar calendar1 chk_i">
                            <div class="calendar_input">
                                <div class="left_box" id="datePicker">
                                    <label for="selected-date" >체크아웃</label>
                                    <input type="text" class="selected-date" readonly id="endDate" name="endDate">
				    				<input type="hidden" id="roomId" name="roomId">
                                </div>
                                <i class="fa-regular fa-calendar"></i>
                            </div>


                        </div><!-- //calendar chk_i -->

                    </div><!-- //calendar_box -->
                </div><!-- //date_box -->
                <div class="people_num">
                    <h3>인원 수</h3>
                    <div class="num_box">
                        <button class="minus_btn">
                            <i class="fa-solid fa-minus"></i>
                        </button><!-- //minus_btn -->
                        <p class="result" id="usePeople"></p>
                        <input type="hidden" id="usePeopleValue" name="usePeople">
                        <button class="plus_btn">
                            <i class="fa-solid fa-plus"></i>
                        </button><!-- //plus_btn -->
                    </div><!-- //num_box -->
                </div><!-- //people_num -->

                <div class="payment" style="display: ruby">
                    <h3>결제 수단</h3>
                    <select id="paymentMethod">
                        <option value="card" selected>카드</option>
                        <option value="bankTransfer">무통장입금</option>
                    </select>
                    <select id="cardsa" name="card" style="display: block">
				    	<c:forEach var="card" items="${card}">
				    		<option value="${card.codeKey}">${card.codeName}</option>
				    	</c:forEach>
				    </select>
				    <input type="text" id="cardInfo" name="cardNo" placeholder="카드번호 입력('-'를 포함하여 입력해주세요.)" pattern="\d{4}-\d{4}-\d{4}-\d{4}" required>
				    
				    <!-- 무통장 입금 선택시 나올 부분 -->
				    <select id="bank" class="hidden" name="bank" style="display: none">
				    	<c:forEach var="bank" items="${bank}">
				    		<option value="${bank.codeKey}">${bank.codeName}</option>
				    	</c:forEach>
				    </select>
					<input type="text" style="display:none" id="bankInfo" name="refundAccount"  placeholder="환불 계좌 입력('-'를 포함하여 입력해주세요.)" pattern="^(\d{1,})(-(\d{1,})){1,}">                    
				</div><!-- //payment -->
				
                
                <div class="essential">
                    <h3>필수 입력 정보</h3>
                    <div class="input_box">
                        <div class="img_box">
                            <!-- 이미지 자리 -->
                            <button class="position_txt">
                                사진 첨부
                            </button><!-- //position_txt -->
                        </div><!-- //img_box -->
                        <div class="i_txt_box">
                            <textarea disabled="disabled">ex&#41;여행 목적, 동반 일행, 이 숙소를 선택한 이유</textarea>
                        </div><!-- //i_txt_box -->
                    </div><!-- //input_box -->
                </div><!-- //essential -->


            </div><!-- //con_left -->

            <div class="con_right"> <!-- 오른쪽 예약창 -->
                <div class="reservation_box">
                    <div class="r_box_top">
                        <div class="d_img">
                        	<img src="${roomInfo.mainImage}" alt="...">
                            <!--  이미지 자리~,, -->
                        </div><!-- //d_img -->
                        <div class="d_txt">
                            <span>${roomInfo.roomName}</span>
                            <p>${roomInfo.category}</p>
                            <div class="star_p">
                                <i class="fa-solid fa-star"></i>
                                <p>${ratingReview.avg} &#40;후기 ${ratingReview.cnt}개&#41;</p>
                            </div><!-- //star_p -->
                        </div><!-- //d_txt -->
                    </div><!-- //r_box_top -->
                    <div class="r_box_middle">
                        <div class="cata">
                            <h4>카테고리</h4>
                            <div class="c_price">
                                <span class="un_line" id="detailPrice">₩${bookingPrice.avg}x${bookingPrice.cnt}박</span>
                                <span>₩${bookingPrice.sum}</span>
                            </div><!-- //c_price -->
                        </div><!-- //c_price -->
                    </div><!-- //r_box_middle -->
                    <div class="r_box_bottom">
                        <div class="total_p">
                            <span>총 합계 KRW&#41;</span>
                            <span>₩${bookingPrice.sum}</span>
                            <input type="hidden" id="paymentPrice" name="paymentPrice" value="${bookingPrice.sum }">
                        </div><!-- //total_p -->
                    </div><!-- //r_box_bottom -->
                    <div class="chk_ok">
                        <input type="checkbox" required="required">
                        <label></label>결제정보 제공에 동의합니다
                    </div><!-- //chk_ok -->
                    <button id="bookingBtn">예약하기</button>
                </div><!-- //reservation_box -->
            </div><!-- //con_right -->
        </div><!-- //con_left_right -->

    </div><!-- //contents -->
	</form>
    <!-- ---------------컨텐츠 끝------------------------>
    <footer class="inner clear">
        <div class="f_top">
            <div class="ft_left">
                <p>© 2024 Airbnb, Inc. · 개인정보 처리방침 · 이용약관 · 사이트맵 · 환불 정책 · 회사 세부정보</p>
            </div>
            <div class="ft_right">
                <p>자주 묻는 질문</p>
            </div>
        </div><!-- //f_top -->
        <div class="f_bottom">
            <span>
                웹사이트제공자:GDJ80alphaTeam,privateunlimitedcompany,8HanoverQuayDublin2,D02DP23Ireland|팀장:이용훈|VAT번호:IE12345678L사업자등록번호:IE123456|연락처:newlife5991@naver.com,
                웹사이트,010-7635-9302|호스팅서비스제공업체: <br>아마존웹서비스|알파비앤비는
                통신판매중개자로알파비앤비플랫폼을통하여게스트와호스트사이에이루어지는통신판매의당사자가아닙니다.알파비앤비플랫폼을통하여 예약된 숙소, 호스트 서비스에 관한 의무와 책임은 해당 서비스를
                제공하는
                호스트에게 있습니다.
            </span>
        </div><!-- //f_bottom -->
    </footer>

   
</body>
<script>
	let maxPeople = "${maxPeople}";
	let roomId = "${roomId}";
	const bookingDate = "${bookingDate}";
</script>

<script src="/style/js/booking.js" ></script>
</html>