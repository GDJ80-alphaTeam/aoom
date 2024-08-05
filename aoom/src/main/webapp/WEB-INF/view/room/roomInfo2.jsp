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
    <title>AOOM 숙소상세</title>
    <script src="https://kit.fontawesome.com/82b4a4fcad.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<!-- nav -->
	
    <!-- style -->
    <link rel="stylesheet" href="/style/css/common.css">
    <link rel="stylesheet" href="/style/css/roominfo.css">
    <link rel="stylesheet" href="/style/css/navSub.css">
    <!-- 카카오지도 -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f0842831d9c350ed32adefb11b6cd5f6&libraries=services"></script>
    <!-- flat 피커 -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ko.js"></script>
	<link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_orange.css">
	<!-- 모멘트js -->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script src="/style/js/navbarSub.js" defer></script>
	
	
	
</head>

<body>
    
	<jsp:include page="/WEB-INF/view/layout/navbarSub.jsp"></jsp:include>
    <div class="a_main_visual inner "><!-- 컨텐츠 시작 -->

        <!-- ★숙소소개 시작★------------------------------------------------------------------------->
        <div class="a_introduction">

            <div class="a_i_top"><!--  숙소이름과 이미지 -->

                <div class="a_tit_box">
                    <b class="title">${roomInfo.roomName}</b>
                    <div class="save" id="wishListBtn">
                    
                    	<c:if test="${userWishRoom[0] != null }">
							<i class="fa-solid fa-heart"></i>
                        	<p>저장</p>
						</c:if>
						<c:if test="${userWishRoom[0] == null }">
							<i class="fa-regular fa-heart" aria-hidden="true" style="display: block;"></i>
                        	<p>저장</p>
						</c:if>
                        
                    </div><!-- //save -->
                </div><!-- //a_tit_box -->

                <div class="a_img_box">
                    <div class="a_img_box_left">
                        <div class="main_img" style="height: 100%">
                            <img src="${roomInfo.mainImage}" alt="임시이미지입니다" style="height: 100%">
                        </div><!-- //main_img 큰 이미지 자리 -->
                        
                    </div><!-- //a_img_box_left -->
                    <div class="a_img_box_right">
					    <c:forEach var="image" items="${roomImages}" varStatus="status">
					        <c:if test="${status.index % 2 == 0}">
					            <div class="i_box">
					        </c:if>
					
					        <div class="sub_img">
					            <img src="${image.image}" alt="임시이미지입니다" style="height:100%">
					        </div>
					        <!-- //main_img 작은이미지 자리 -->
					
					        <c:if test="${status.index % 2 == 1 || status.last}">
					            </div><!-- //i_box -->
					        </c:if>
					    </c:forEach>
					</div><!-- //a_img_box_right -->
                    <button class="img_all">
                        <i class="fa-solid fa-grip"></i>
                        <p>사진 모두 보기</p>
                    </button><!-- //img_all 모두보기 버튼 -->
                </div><!-- //a_img_box -->

            </div><!-- //a_i_top -->

            <div class="a_i_bottom"><!-- 숙소설명/편의시설/ 간의예약 -->

                <div class="a_i_bottom_left">
                    <div class="b_left_top p_b"><!-- 숙소설명 -->
                        <b class="margin">${roomInfo.address}</b>
                        <span>최대인원${roomInfo.maxPeople}명 · 침실${roomInfo.totalBed}개 · 욕실${roomInfo.totalBath }개 </span>
                        <div class="txt_box">
                            <span>${roomInfo.roomContent}</span>
                        </div><!-- //txt_box -->
                    </div><!-- //b_left_top -->
                    <div class="b_left_bottom p_b"><!-- 편의시설 -->
                        <b class="margin">숙소 편의시설</b>
                        	<c:forEach var="a" items="${roomAmenities}" varStatus="status">
                        		<c:if test="${status.index % 3 == 0 }">
                        			<div class="option_box">	
                        		</c:if>
                        		
                        		<c:if test="${a.codeKey == 'ame01'}">	
                        			<div class="option">
		                                <div class="icon_b"></div>
		                                <img src="/style/img/icon_1.png" >
		                                <p>${a.codeName}</p>
	                            	</div><!-- //option -->
                        		</c:if>
                        		
                        		<c:if test="${a.codeKey == 'ame02'}">	
                        			<div class="option">
		                                <div class="icon_b"></div>
		                                <img src="/style/img/icon_4.png" >
		                                <p>${a.codeName}</p> <!-- 엘베 -->
	                            	</div><!-- //option -->
                        		</c:if>
                        		
                        		<c:if test="${a.codeKey == 'ame03'}">	
                        			<div class="option">
		                                <div class="icon_b"></div>
		                                <img src="/style/img/icon_3.png" >
		                                <p>${a.codeName}</p>
	                            	</div><!-- //option -->
                        		</c:if>
                        		
                        		<c:if test="${a.codeKey == 'ame04'}">	
                        			<div class="option">
		                                <div class="icon_b"></div>
		                                <img src="/style/img/icon_7.png" >
		                                <p>${a.codeName}</p>
	                            	</div><!-- //option -->
                        		</c:if>
                        		
                        		<c:if test="${a.codeKey == 'ame05'}">	
                        			<div class="option">
		                                <div class="icon_b"></div>
		                                <img src="/style/img/icon_2.png" >
		                                <p>${a.codeName}</p>
	                            	</div><!-- //option -->
                        		</c:if>
                        		
                        		<c:if test="${a.codeKey == 'ame06'}">	
                        			<div class="option">
		                                <div class="icon_b"></div>
		                                <img src="/style/img/icon_5.png" >
		                                <p>${a.codeName}</p>
	                            	</div><!-- //option -->
                        		</c:if>
                        		
                        		<c:if test="${a.codeKey == 'ame07'}">	
                        			<div class="option">
		                                <div class="icon_b"></div>
		                                <img src="/style/img/icon_6.png" >
		                                <p>${a.codeName}</p>
	                            	</div><!-- //option -->
                        		</c:if>
                        		
                        		<c:if test="${a.codeKey == 'ame08'}">	
                        			<div class="option">
		                                <div class="icon_b"></div>
		                                <img src="/style/img/icon_8.png" >
		                                <p>${a.codeName}</p>
	                            	</div><!-- //option -->
                        		</c:if>
                        		
                        		<c:if test="${status.index % 3 == 2 || status.last}">
							        </div><!-- //option_box -->
							    </c:if>
                        	</c:forEach>
                    </div><!-- //b_left_bottom -->
                </div><!-- //a_i_bottom_left -->
					<form action="${pageContext.request.contextPath}/booking/book" method="get" id="bookingForm">
		                <div class="a_i_bottom_right">
		                    <div class="s_reservation">
		                        <span class="price">
		                            <b>예약 </b><span></span>
		                        </span><!-- //price -->
							
		                        <div class="r_box">
		                            <div class="r_box_top" id="datepicker">
			                                <button class="chk_i" type="button">
			                                    <div class="title_chk_i"><i>체크인</i></div>
			                                    <div class="date_box">
			                                    	<input type="hidden" id="startDate" name="startDate">
			                                        <input type="date" id="startDate2" readonly="readonly">
			                                    </div>
			                                </button><!-- //chk_i -->
			                                <button class="chk_o" type="button">
			                                    <div class="title_chk_o"><i>체크아웃</i></div>
			                                    <div class="date_box">
			                                        <input type="date" id="endDate2" readonly="readonly">
		                                        	<input type="hidden" id="endDate" name="endDate">
			                                    </div>
			                                </button><!-- //chk_o -->
		                            </div><!-- r_box_top -->
		                            <button class="r_personnel" type="button">
		                                <div class="title_chk_o"><i>인원</i></div>
		                                <div class="date_box">
		                                    <input type="number" min ="1" max="${roomInfo.maxPeople}" id="usePeople" name="usePeople" value="1"  >
		                                </div>
		                            </button><!-- //r_personnel -->
		                        </div><!-- //r_box -->
		
		                        <div class="price_guide">
		                            <p>예약 확정 전에는 요금이 청구되지 않습니다.</p>
		                            <div class="p_g_bottom">
		                                <span id="priceDetail">₩가격 x 1</span>
		                                <span id="priceDetailTotal">₩가격</span>
		                            </div><!-- //p_g_bottom -->
		                        </div><!-- //price_guide -->
		
		                        <div class="r_total">
		                            <span>총 합계</span>
		                            <span id="totalPrice">₩가격</span>
		                        </div><!-- /r_total -->
		                        <button class="r_pink" type="button" id="bookingBtn">
		                            <span>예약하기</span>
		                        </button><!-- //r_pink -->
		                    </div><!-- //s_reservation -->
		                    <p class="r_declaration">숙소 신고하기</p>
		                </div><!-- //a_i_bottom_right 간이예약창 전체영역-->
		                <input type="hidden"  value="${roomInfo.roomId}" name="roomId">
					</form>
            </div><!-- //a_i_bottom -->

        </div><!-- ////a_introduction  -->
        <!-- 숙소소개 끝-------------------------------------------------------------------------->


        <!-- ★호스트소개★--------------------------------------------------------------------------------------------->
        <div class="host_i p_b">
            <b class="margin">
                호스트 소개
            </b><!-- //margin -->
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
                        <button class="h_talk">
                            <span>대화 하기</span>
                        </button><!-- //h_talk -->
                    </div><!-- //talk_btn -->
                </div><!-- //h_right -->
            </div><!--/ /h_flex -->

        </div><!-- //host_i -->
        <!--  호스트소개 끝------------------------------------------------------------------------------------>



        <!-- ★숙소위치★----------------------------------------------------------------------------------------------->
        
        <div class="l_location p_b">
            <b class="margin">
                숙소 위치 
            </b>
            
                <div id="map" style="width:100%; height:400px;"></div>
                <!-- 지도 자리 입니다람쥐 -->
            
        </div><!--  //l_location -->
        <!-- 숙소위치 끝---------------------------------------------------------------------------------->



        <!-- ★후기★---------------------------------------------------------------------------------------------------->
        <div class="review_box">
            <div class="review_title">
                <b class="fw_bold"><i class="fa-solid fa-star"></i>${reviewCntAvg.avg} · <span>후기</span> ${reviewCntAvg.cnt} <span>개</span></b>
            
            </div><!-- //review_title -->
            
            <div class="page_box ">
                <div class="single-item-rtl rolling_box">
                    <div class="review_page">
                    	<c:forEach var="r" items="${reviewList.review}" varStatus="status">
                            <div class="user_box">
                                <div class="u_profile">
                                	<a href="/user/profile?userId=${r.userId}" id="userId${status.count}">
                                    	<div class="user_i">
                                        	<img id="userImg${status.count}" src="${r.userImage}" onerror="this.style.display='none'" style="height: 100%">
                                    	</div><!-- //user_i -->
									</a>											                                    	
                                    <div class="u_name_date">
                                        <span class="u_name" id="userName${status.count}">
                                            ${r.userName}
                                        </span><!-- //u_name -->
                                        <p class="u_date" id="userSubDate${status.count}">
                                            에어비앤비 가입기간:${r.userSubDate}일
                                        </p><!-- //u_date -->
                                    </div><!-- //u_name_date -->
                                </div><!-- //u_profile -->
                                <div class="u_r_txt_box">
                                    <div class="star_date">
                                        <div class="star" id="userRating${status.count}">
                                            <c:forEach var="i" begin="1" end="${r.rating}">
                                    			<i class="fa-solid fa-star" ></i>
                                			</c:forEach>
                                        </div><!-- //star -->
                                        <p id="reviewCreationDate${status.count}">${r.creationDate}일 전</p>
                                    </div><!-- //star_date -->
                                    <p class="txt" id="reviewContent${status.count}">${r.reviewContent}</p>
                                    <div class="u_picture">
                                        <div class="u_picture_box">
                                        	<img id="reviewImg${status.count}"  src="${r.reviewImage}" style="width:100%;height:100%;"onerror="this.style.display='none'">
                                        </div>
                                        <!-- 후기사진 들어갈자리 -->
                                    </div><!-- //u_picture -->
                                </div><!-- //u_r_txt_box -->
                            </div><!-- //user_box -->
                       </c:forEach>
                    </div><!-- //review_page -->
                </div><!-- //review_page -->
            </div><!-- //page_box  페이지 들어갈 자리-->
            
            <!-- 페이징 자리 -->
            <!-- 페이징 총숫자에맞춰서 1~10 ,11~20이런식으로 만들어야됨  -->
        <div class="pagination">    
			<c:choose>
				<c:when test="${reviewCntAvg.lastPage == 0 }">
					
				</c:when>
				<c:otherwise>
				      <!-- paging 이전버튼 -->
				        <c:choose>			        
				          <c:when test="${reviewList.currentPage == 1}">
				            <button class="prev_btn" disabled id="previous" type="button">
				           		 <i class="fa-solid fa-chevron-left"></i>
				            </button>
				          </c:when>
				          
				          <c:otherwise>
				            <button class="prev_btn" id="previous" type="button">
				           		 <i class="fa-solid fa-chevron-left"></i>
				            </button>
				          </c:otherwise>
				          
				        </c:choose>
					
						<!-- paging 숫자버튼 -->
				      <c:forEach var="i" begin="1" end="${reviewCntAvg.lastPage}">
				          <c:choose>
				          
				            <c:when test="${reviewList.currentPage == i}">
		                   		<button class="page-link active" type="button" id="page${i}" value="${i}" data-index="0">${i}</button>
				            </c:when>
				         
				            <c:otherwise>
				              <button class="page-link" type="button" id="page${i}" value="${i}" data-index="0">${i}</button>
				            </c:otherwise>
				            
				          </c:choose>
				      </c:forEach>
						<!-- paging 다음버튼 -->
				        <c:choose>
				          <c:when test="${reviewList.currentPage == reviewCntAvg.lastPage}">
				            <button class="next_btn" type="button" id="next"><i class="fa-solid fa-chevron-right" aria-hidden="true"></i></button>
				          </c:when>
				          
				          <c:otherwise>
				            <button class="next_btn" type="button" id="next"><i class="fa-solid fa-chevron-right" aria-hidden="true"></i></button>
				          </c:otherwise>
				          
				        </c:choose>
				</c:otherwise>
			</c:choose>
            
            
                
                	
                
       	</div>
            
        </div><!-- //review_box -->
        <!--   후기 끝 ---------------------------------------------------------------------------------->
    </div><!-- //main_visual -->
    <br>
    <jsp:include page="/WEB-INF/view/layout/footer.jsp"></jsp:include>
    
    <aside>
        <i class="fa-solid fa-chevron-up"></i>
        <span>TOP</span>
    </aside>

</body>

<script type="text/javascript">
	let address = "${roomInfo.address}";
	let roomId = "${roomInfo.roomId}";
	let maxPeople = "${roomInfo.maxPeople}";
	let currentPage = parseInt("${reviewList.currentPage}");
	let lastPage = parseInt("${reviewCntAvg.lastPage}");
	let userId = '${sessionScope.userInfo.userId}';
</script>


<script src="/style/js/roominfo.js" defer></script>

</html>