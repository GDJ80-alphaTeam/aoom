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
    <script src="/style/js/roominfo.js" defer></script>

    <link rel="stylesheet" href="/style/css/common.css">
    <link rel="stylesheet" href="/style/css/roominfo.css">
</head>

<body>
    <div class="fixed">
        <header>

            <div class="inner">

                <ul class="nav_menu">
                    <li>
                        <p>계정</p>
                    </li>
                    <li>
                        <p>메세지</p>
                    </li>
                    <li>
                        <p>알림</p>
                    </li>
                    <li>
                        <p>숙소예약목록</p>
                    </li>
                    <li>
                        <p>관심목록</p>
                    </li>
                    <li>
                        <p>자주묻는질문</p>
                    </li>
                    <li>
                        <p>로그아웃</p>
                    </li>
                </ul><!-- //nav_menu -->
                <a href="#" class="logo">
                    <img src="img/n_1.png" alt="AOOM로고">
                </a><!-- //logo -->

                <div class="user">
                    <div class="host_mode">
                        <a href="">
                            호스트 모드
                        </a>
                    </div><!-- //host_mode -->
                    <div class="profile">
                        <img src="img/n_2.png" alt="유저 프로필">
                        <p>이름</p>
                        <i class="fa-solid fa-bars"></i>
                    </div><!-- //profile -->
                </div><!--//user -->

            </div><!-- //inner -->
        </header><!--//header-->
    </div><!-- //fixed -->

    <div class="a_main_visual inner "><!-- 컨텐츠 시작 -->

        <!-- ★숙소소개 시작★------------------------------------------------------------------------->
        <div class="a_introduction">

            <div class="a_i_top"><!--  숙소이름과 이미지 -->

                <div class="a_tit_box">
                    <b class="title">${roomInfo.roomName}</b>
                    <div class="save">
                        <i class="fa-solid fa-heart"></i>
                        <p>저장</p>
                    </div><!-- //save -->
                </div><!-- //a_tit_box -->

                <div class="a_img_box">
                    <div class="a_img_box_left">
                        <div class="main_img">
                            <img src="${roomInfo.mainImage}" alt="임시이미지입니다">
                        </div><!-- //main_img 큰 이미지 자리 -->
                        
                    </div><!-- //a_img_box_left -->
                    <div class="a_img_box_right">
					    <c:forEach var="image" items="${roomImages}" varStatus="status">
					        <c:if test="${status.index % 2 == 0}">
					            <div class="i_box">
					        </c:if>
					
					        <div class="sub_img">
					            <img src="${image.image}" alt="임시이미지입니다">
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
		                                <img src="/style/img/icon_2.png" >
		                                <p>${a.codeName}</p>
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
		                                <img src="/style/img/icon_4.png" >
		                                <p>${a.codeName}</p>
	                            	</div><!-- //option -->
                        		</c:if>
                        		
                        		<c:if test="${a.codeKey == 'ame05'}">	
                        			<div class="option">
		                                <div class="icon_b"></div>
		                                <img src="/style/img/icon_5.png" >
		                                <p>${a.codeName}</p>
	                            	</div><!-- //option -->
                        		</c:if>
                        		
                        		<c:if test="${a.codeKey == 'ame06'}">	
                        			<div class="option">
		                                <div class="icon_b"></div>
		                                <img src="/style/img/icon_6.png" >
		                                <p>${a.codeName}</p>
	                            	</div><!-- //option -->
                        		</c:if>
                        		
                        		<c:if test="${a.codeKey == 'ame07'}">	
                        			<div class="option">
		                                <div class="icon_b"></div>
		                                <img src="/style/img/icon_7.png" >
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
                        		
                        		
                        		
                        		
                        		<c:if test="${status.index % 4 == 1 || status.last}">
					            	</div><!-- //i_box -->
					        	</c:if>
                        	</c:forEach>
 	                       <!-- <div class="option_box">
	                            <div class="option">
	                                <div class="icon_b"></div>
	                                <img src="img/icon_1.png" alt="와이파이">
	                                <p>와이파이</p>
	                            </div>//option
	                            
	                            <div class="option">
	                                <div class="icon_b"></div>
	                                <img src="img/icon_2.png" alt="엘리베이터">
	                                <p>엘리베이터</p>
	                            </div>//option
	                            <div class="option">
	                                <div class="icon_b"></div>
	                                <img src="img/icon_3.png" alt="에어컨">
	                                <p>에어컨</p>
	                            </div>//option
    	                    </div>//option_box
	                        <div class="option_box">
	                            <div class="icon_b"></div>
	                            <div class="option">
	                                <img src="img/icon_4.png" alt="주차장">
	                                <p>주차장</p>
	                            </div>//option
	                            <div class="option">
	                                <div class="icon_b"></div>
	                                <img src="img/icon_5.png" alt="드라이기">
	                                <p>드라이기</p>
	                            </div>//option
	                            <div class="option">
	                                <div class="icon_b"></div>
	                                <img src="img/icon_6.png" alt="냉장고">
	                                <p>냉장고</p>
	                            </div>//option
	                        </div>//option_box
	                        <div class="option_box">
	                            <div class="option">
	                                <div class="icon_b"></div>
	                                <img src="img/icon_7.png" alt="주방">
	                                <p>주방</p>
	                            </div>//option
	                            <div class="option">
	                                <div class="icon_b"></div>
	                                <img src="img/icon_8.png" alt="ott">
	                                <p>ott</p>
	                            </div>//option
                     	   </div>//option_box -->

                    </div><!-- //b_left_bottom -->
                </div><!-- //a_i_bottom_left -->

                <div class="a_i_bottom_right">
                    <div class="s_reservation">
                        <span class="price">
                            <b>₩가격 </b><span>/박</span>
                        </span><!-- //price -->

                        <div class="r_box">
                            <div class="r_box_top">
                                <button class="chk_i">
                                    <div class="title_chk_i"><i>체크인</i></div>
                                    <div class="date_box">
                                        <input type="date">
                                    </div>
                                </button><!-- //chk_i -->
                                <button class="chk_o">
                                    <div class="title_chk_o"><i>체크아웃</i></div>
                                    <div class="date_box">
                                        <input type="date">
                                    </div>
                                </button><!-- //chk_o -->
                            </div><!-- r_box_top -->
                            <button class="r_personnel">
                                <div class="title_chk_o"><i>인원</i></div>
                                <div class="date_box">
                                    <input type="text" value="인원 수를 입력해주세요">
                                </div>
                            </button><!-- //r_personnel -->
                        </div><!-- //r_box -->

                        <div class="price_guide">
                            <p>예약 확정 전에는 요금이 청구되지 않습니다.</p>
                            <div class="p_g_bottom">
                                <span>₩가격 x 3</span>
                                <span>₩가격</span>
                            </div><!-- //p_g_bottom -->
                        </div><!-- //price_guide -->

                        <div class="r_total">
                            <span>총 합계</span>
                            <span>₩가격</span>
                        </div><!-- /r_total -->
                        <button class="r_pink">
                            <span>예약하기</span>
                        </button><!-- //r_pink -->
                    </div><!-- //s_reservation -->
                    <p class="r_declaration">숙소 신고하기</p>
                </div><!-- //a_i_bottom_right 간이예약창 전체영역-->

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
                            <img src="img/pic.png" alt="임시사진" class="u_pic">
                            <img src="img/icon_9.png" alt="인증마크" class="position_a">
                            <!-- 호스트 프로필사진 자리 -->
                        </div><!--  //img_box-->
                        <b class="host_name">이름</b>
                        <p><i class="fa-solid fa-user"></i>호스트</p>
                    </div><!-- //profile -->

                    <div class="h_information">
                        <div class="h_review flex_info">
                            <i>후기</i>
                            <b>147<p>개</p></b>
                        </div><!-- //h_review -->
                        <div class="h_grade flex_info">
                            <i>평점</i>
                            <b>4.83<p><i class="fa-solid fa-star"></i></p></b>
                        </div><!-- //h_grade 평점 -->
                        <div class="h_career flex_info">
                            <i>호스팅 경력</i>
                            <b>5<p>년</p></b>
                        </div><!-- //h_career호스팅 경력 -->
                    </div><!-- //h_information -->
                </div><!-- //h_left -->
                <div class="h_right">
                    <span>해발 500m에 고지의 시원하고, 공기좋고,물맛좋은 용문산 어비계곡 상류에 위치하고 있고, 마을규모는
                        40여가구 90 여명의 주민이 버스도 운행하지 않고 마트도 없는 한적한 곳에서 조용히 지낼수 있습니다.</span>
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
            <div class="map">
                <img src="img/location.png" alt="임시사진">
                <!-- 지도 자리 입니다람쥐 -->
            </div><!-- //map -->
        </div><!--  //l_location -->
        <!-- 숙소위치 끝---------------------------------------------------------------------------------->



        <!-- ★후기★---------------------------------------------------------------------------------------------------->
        <div class="review_box">
            <div class="review_title">
                <b class="fw_bold"><i class="fa-solid fa-star"></i>3.14 · <span>후기</span> 59 <span>개</span></b>
                <form>
                    <select>
                        <option value="1">최신순</option>
                        <option value="2">높은 평점순</option>
                        <option value="3">낮은 평점순</option>
                    </select>
                </form>
            </div><!-- //review_title -->
            <div class="page_box ">
                <div class="single-item-rtl rolling_box">
                    <div class="review_page">
                      
                            <div class="user_box">
                                <div class="u_profile">
                                    <div class="user_i">
                                        <img src="img/user.png" alt="임시">
                                    </div><!-- //user_i -->
                                    <div class="u_name_date">
                                        <span class="u_name">
                                            이름
                                        </span><!-- //u_name -->
                                        <p class="u_date">
                                            에어비앤비 가입기간
                                        </p><!-- //u_date -->
                                    </div><!-- //u_name_date -->
                                </div><!-- //u_profile -->
                                <div class="u_r_txt_box">
                                    <div class="star_date">
                                        <div class="star">
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                        </div><!-- //star -->
                                        <p>3주 전</p>
                                    </div><!-- //star_date -->
                                    <p class="txt">회사 워크샵으로 다녀왔습니다. 정말 산속이라 풍경도 좋고 시원했습니다. 여러모로
                                        즐겁게 보내다 올 수 있는 멋진 숙소였습니다. 가능하다면 위치 때문에 차를 가져오는
                                        것이 좋습니다.
                                    </p>
                                    <div class="u_picture">
                                        <div class="u_picture_box"></div>
                                        <div class="u_picture_box"></div>
                                        <div class="u_picture_box"></div>
                                        <div class="u_picture_box"></div>
    
                                        <!-- 후기사진 들어갈자리 -->
                                    </div><!-- //u_picture -->
                                </div><!-- //u_r_txt_box -->
                            </div><!-- //user_box -->
                            <div class="user_box">
                                <div class="u_profile">
                                    <div class="user_i">
                                        <img src="img/user.png" alt="임시">
                                    </div><!-- //user_i -->
                                    <div class="u_name_date">
                                        <span class="u_name">
                                            이름
                                        </span><!-- //u_name -->
                                        <p class="u_date">
                                            에어비앤비 가입기간
                                        </p><!-- //u_date -->
                                    </div><!-- //u_name_date -->
                                </div><!-- //u_profile -->
                                <div class="u_r_txt_box">
                                    <div class="star_date">
                                        <div class="star">
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                        </div><!-- //star -->
                                        <p>3주 전</p>
                                    </div><!-- //star_date -->
                                    <p class="txt">회사 워크샵으로 다녀왔습니다. 정말 산속이라 풍경도 좋고 시원했습니다. 여러모로
                                        즐겁게 보내다 올 수 있는 멋진 숙소였습니다. 가능하다면 위치 때문에 차를 가져오는
                                        것이 좋습니다.
                                    </p>
                                    <div class="u_picture">
                                        <div class="u_picture_box"></div>
                                        <div class="u_picture_box"></div>
                                        <div class="u_picture_box"></div>
                                        <div class="u_picture_box"></div>
    
                                        <!-- 후기사진 들어갈자리 -->
                                    </div><!-- //u_picture -->
                                </div><!-- //u_r_txt_box -->
                            </div><!-- //user_box -->
                            <div class="user_box">
                                <div class="u_profile">
                                    <div class="user_i">
                                        <img src="img/user.png" alt="임시">
                                    </div><!-- //user_i -->
                                    <div class="u_name_date">
                                        <span class="u_name">
                                            이름
                                        </span><!-- //u_name -->
                                        <p class="u_date">
                                            에어비앤비 가입기간
                                        </p><!-- //u_date -->
                                    </div><!-- //u_name_date -->
                                </div><!-- //u_profile -->
                                <div class="u_r_txt_box">
                                    <div class="star_date">
                                        <div class="star">
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                        </div><!-- //star -->
                                        <p>3주 전</p>
                                    </div><!-- //star_date -->
                                    <p class="txt">회사 워크샵으로 다녀왔습니다. 정말 산속이라 풍경도 좋고 시원했습니다. 여러모로
                                        즐겁게 보내다 올 수 있는 멋진 숙소였습니다. 가능하다면 위치 때문에 차를 가져오는
                                        것이 좋습니다.
                                    </p>
                                    <div class="u_picture">
                                        <div class="u_picture_box"></div>
                                        <div class="u_picture_box"></div>
    
                                        <!-- 후기사진 들어갈자리 -->
                                    </div><!-- //u_picture -->
                                </div><!-- //u_r_txt_box -->
                            </div><!-- //user_box -->
                            <div class="user_box">
                                <div class="u_profile">
                                    <div class="user_i">
                                        <img src="img/user.png" alt="임시">
                                    </div><!-- //user_i -->
                                    <div class="u_name_date">
                                        <span class="u_name">
                                            이름
                                        </span><!-- //u_name -->
                                        <p class="u_date">
                                            에어비앤비 가입기간
                                        </p><!-- //u_date -->
                                    </div><!-- //u_name_date -->
                                </div><!-- //u_profile -->
                                <div class="u_r_txt_box">
                                    <div class="star_date">
                                        <div class="star">
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                        </div><!-- //star -->
                                        <p>3주 전</p>
                                    </div><!-- //star_date -->
                                    <p class="txt">회사 워크샵으로 다녀왔습니다. 정말 산속이라 풍경도 좋고 시원했습니다. 여러모로
                                        즐겁게 보내다 올 수 있는 멋진 숙소였습니다. 가능하다면 위치 때문에 차를 가져오는
                                        것이 좋습니다.
                                    </p>
                                    <div class="u_picture">
                                        <div class="u_picture_box"></div>
                                        <div class="u_picture_box"></div>
    
                                        <!-- 후기사진 들어갈자리 -->
                                    </div><!-- //u_picture -->
                                </div><!-- //u_r_txt_box -->
                            </div><!-- //user_box -->
                            <div class="user_box">
                                <div class="u_profile">
                                    <div class="user_i">
                                        <img src="img/user.png" alt="임시">
                                    </div><!-- //user_i -->
                                    <div class="u_name_date">
                                        <span class="u_name">
                                            이름
                                        </span><!-- //u_name -->
                                        <p class="u_date">
                                            에어비앤비 가입기간
                                        </p><!-- //u_date -->
                                    </div><!-- //u_name_date -->
                                </div><!-- //u_profile -->
                                <div class="u_r_txt_box">
                                    <div class="star_date">
                                        <div class="star">
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                        </div><!-- //star -->
                                        <p>3주 전</p>
                                    </div><!-- //star_date -->
                                    <p class="txt">회사 워크샵으로 다녀왔습니다. 정말 산속이라 풍경도 좋고 시원했습니다. 여러모로
                                        즐겁게 보내다 올 수 있는 멋진 숙소였습니다. 가능하다면 위치 때문에 차를 가져오는
                                        것이 좋습니다.
                                    </p>
                                    <div class="u_picture">
                                        <div class="u_picture_box"></div>
                                        <div class="u_picture_box"></div>
    
                                        <!-- 후기사진 들어갈자리 -->
                                    </div><!-- //u_picture -->
                                </div><!-- //u_r_txt_box -->
                            </div><!-- //user_box -->
                            <div class="user_box">
                                <div class="u_profile">
                                    <div class="user_i">
                                        <img src="img/user.png" alt="임시">
                                    </div><!-- //user_i -->
                                    <div class="u_name_date">
                                        <span class="u_name">
                                            이름
                                        </span><!-- //u_name -->
                                        <p class="u_date">
                                            에어비앤비 가입기간
                                        </p><!-- //u_date -->
                                    </div><!-- //u_name_date -->
                                </div><!-- //u_profile -->
                                <div class="u_r_txt_box">
                                    <div class="star_date">
                                        <div class="star">
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                            <i class="fa-solid fa-star"></i>
                                        </div><!-- //star -->
                                        <p>3주 전</p>
                                    </div><!-- //star_date -->
                                    <p class="txt">회사 워크샵으로 다녀왔습니다. 정말 산속이라 풍경도 좋고 시원했습니다. 여러모로
                                        즐겁게 보내다 올 수 있는 멋진 숙소였습니다. 가능하다면 위치 때문에 차를 가져오는
                                        것이 좋습니다.
                                    </p>
                                    <div class="u_picture">
                                        <div class="u_picture_box"></div>
    
                                        <!-- 후기사진 들어갈자리 -->
                                    </div><!-- //u_picture -->
                                </div><!-- //u_r_txt_box -->
                            </div><!-- //user_box -->
                     
                        
                    </div><!-- //review_page -->
                    <div class="review_page">
                        <div class="user_box">
                            <div class="u_profile">
                                <div class="user_i">
                                    <img src="img/user.png" alt="임시">
                                </div><!-- //user_i -->
                                <div class="u_name_date">
                                    <span class="u_name">
                                        이름
                                    </span><!-- //u_name -->
                                    <p class="u_date">
                                        에어비앤비 가입기간
                                    </p><!-- //u_date -->
                                </div><!-- //u_name_date -->
                            </div><!-- //u_profile -->
                            <div class="u_r_txt_box">
                                <div class="star_date">
                                    <div class="star">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                    </div><!-- //star -->
                                    <p>3주 전</p>
                                </div><!-- //star_date -->
                                <p class="txt">회사 워크샵으로 다녀왔습니다. 정말 산속이라 풍경도 좋고 시원했습니다. 여러모로
                                    즐겁게 보내다 올 수 있는 멋진 숙소였습니다. 가능하다면 위치 때문에 차를 가져오는
                                    것이 좋습니다.
                                </p>
                                <div class="u_picture">
                                    <div class="u_picture_box"></div>
                                    <div class="u_picture_box"></div>

                                    <!-- 후기사진 들어갈자리 -->
                                </div><!-- //u_picture -->
                            </div><!-- //u_r_txt_box -->
                        </div><!-- //user_box -->
                        <div class="user_box">
                            <div class="u_profile">
                                <div class="user_i">
                                    <img src="img/user.png" alt="임시">
                                </div><!-- //user_i -->
                                <div class="u_name_date">
                                    <span class="u_name">
                                        이름
                                    </span><!-- //u_name -->
                                    <p class="u_date">
                                        에어비앤비 가입기간
                                    </p><!-- //u_date -->
                                </div><!-- //u_name_date -->
                            </div><!-- //u_profile -->
                            <div class="u_r_txt_box">
                                <div class="star_date">
                                    <div class="star">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                    </div><!-- //star -->
                                    <p>3주 전</p>
                                </div><!-- //star_date -->
                                <p class="txt">회사 워크샵으로 다녀왔습니다. 정말 산속이라 풍경도 좋고 시원했습니다. 여러모로
                                    즐겁게 보내다 올 수 있는 멋진 숙소였습니다. 가능하다면 위치 때문에 차를 가져오는
                                    것이 좋습니다.
                                </p>
                                <div class="u_picture">
                                    <div class="u_picture_box"></div>
                                    <div class="u_picture_box"></div>
                                    <div class="u_picture_box"></div>
                                    <div class="u_picture_box"></div>

                                    <!-- 후기사진 들어갈자리 -->
                                </div><!-- //u_picture -->
                            </div><!-- //u_r_txt_box -->
                        </div><!-- //user_box -->
                        <div class="user_box">
                            <div class="u_profile">
                                <div class="user_i">
                                    <img src="img/user.png" alt="임시">
                                </div><!-- //user_i -->
                                <div class="u_name_date">
                                    <span class="u_name">
                                        이름
                                    </span><!-- //u_name -->
                                    <p class="u_date">
                                        에어비앤비 가입기간
                                    </p><!-- //u_date -->
                                </div><!-- //u_name_date -->
                            </div><!-- //u_profile -->
                            <div class="u_r_txt_box">
                                <div class="star_date">
                                    <div class="star">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                    </div><!-- //star -->
                                    <p>3주 전</p>
                                </div><!-- //star_date -->
                                <p class="txt">회사 워크샵으로 다녀왔습니다. 정말 산속이라 풍경도 좋고 시원했습니다. 여러모로
                                    즐겁게 보내다 올 수 있는 멋진 숙소였습니다. 가능하다면 위치 때문에 차를 가져오는
                                    것이 좋습니다.
                                </p>
                                <div class="u_picture">
                                    <div class="u_picture_box"></div>
                                    <div class="u_picture_box"></div>

                                    <!-- 후기사진 들어갈자리 -->
                                </div><!-- //u_picture -->
                            </div><!-- //u_r_txt_box -->
                        </div><!-- //user_box -->
                        <div class="user_box">
                            <div class="u_profile">
                                <div class="user_i">
                                    <img src="img/user.png" alt="임시">
                                </div><!-- //user_i -->
                                <div class="u_name_date">
                                    <span class="u_name">
                                        이름
                                    </span><!-- //u_name -->
                                    <p class="u_date">
                                        에어비앤비 가입기간
                                    </p><!-- //u_date -->
                                </div><!-- //u_name_date -->
                            </div><!-- //u_profile -->
                            <div class="u_r_txt_box">
                                <div class="star_date">
                                    <div class="star">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                    </div><!-- //star -->
                                    <p>3주 전</p>
                                </div><!-- //star_date -->
                                <p class="txt">회사 워크샵으로 다녀왔습니다. 정말 산속이라 풍경도 좋고 시원했습니다. 여러모로
                                    즐겁게 보내다 올 수 있는 멋진 숙소였습니다. 가능하다면 위치 때문에 차를 가져오는
                                    것이 좋습니다.
                                </p>
                                <div class="u_picture">
                                    <div class="u_picture_box"></div>
                                    <div class="u_picture_box"></div>

                                    <!-- 후기사진 들어갈자리 -->
                                </div><!-- //u_picture -->
                            </div><!-- //u_r_txt_box -->
                        </div><!-- //user_box -->
                        <div class="user_box">
                            <div class="u_profile">
                                <div class="user_i">
                                    <img src="img/user.png" alt="임시">
                                </div><!-- //user_i -->
                                <div class="u_name_date">
                                    <span class="u_name">
                                        이름
                                    </span><!-- //u_name -->
                                    <p class="u_date">
                                        에어비앤비 가입기간
                                    </p><!-- //u_date -->
                                </div><!-- //u_name_date -->
                            </div><!-- //u_profile -->
                            <div class="u_r_txt_box">
                                <div class="star_date">
                                    <div class="star">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                    </div><!-- //star -->
                                    <p>3주 전</p>
                                </div><!-- //star_date -->
                                <p class="txt">회사 워크샵으로 다녀왔습니다. 정말 산속이라 풍경도 좋고 시원했습니다. 여러모로
                                    즐겁게 보내다 올 수 있는 멋진 숙소였습니다. 가능하다면 위치 때문에 차를 가져오는
                                    것이 좋습니다.
                                </p>
                                <div class="u_picture">
                                    <div class="u_picture_box"></div>
                                    <div class="u_picture_box"></div>

                                    <!-- 후기사진 들어갈자리 -->
                                </div><!-- //u_picture -->
                            </div><!-- //u_r_txt_box -->
                        </div><!-- //user_box -->
                        <div class="user_box">
                            <div class="u_profile">
                                <div class="user_i">
                                    <img src="img/user.png" alt="임시">
                                </div><!-- //user_i -->
                                <div class="u_name_date">
                                    <span class="u_name">
                                        이름
                                    </span><!-- //u_name -->
                                    <p class="u_date">
                                        에어비앤비 가입기간
                                    </p><!-- //u_date -->
                                </div><!-- //u_name_date -->
                            </div><!-- //u_profile -->
                            <div class="u_r_txt_box">
                                <div class="star_date">
                                    <div class="star">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                    </div><!-- //star -->
                                    <p>3주 전</p>
                                </div><!-- //star_date -->
                                <p class="txt">회사 워크샵으로 다녀왔습니다. 정말 산속이라 풍경도 좋고 시원했습니다. 여러모로
                                    즐겁게 보내다 올 수 있는 멋진 숙소였습니다. 가능하다면 위치 때문에 차를 가져오는
                                    것이 좋습니다.
                                </p>
                                <div class="u_picture">
                                    <div class="u_picture_box"></div>
                                    <div class="u_picture_box"></div>

                                    <!-- 후기사진 들어갈자리 -->
                                </div><!-- //u_picture -->
                            </div><!-- //u_r_txt_box -->
                        </div><!-- //user_box -->
                    </div><!-- //review_page -->
                    <div class="review_page">
                        <div class="user_box">
                            <div class="u_profile">
                                <div class="user_i">
                                    <img src="img/user.png" alt="임시">
                                </div><!-- //user_i -->
                                <div class="u_name_date">
                                    <span class="u_name">
                                        이름
                                    </span><!-- //u_name -->
                                    <p class="u_date">
                                        에어비앤비 가입기간
                                    </p><!-- //u_date -->
                                </div><!-- //u_name_date -->
                            </div><!-- //u_profile -->
                            <div class="u_r_txt_box">
                                <div class="star_date">
                                    <div class="star">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                    </div><!-- //star -->
                                    <p>3주 전</p>
                                </div><!-- //star_date -->
                                <p class="txt">회사 워크샵으로 다녀왔습니다. 정말 산속이라 풍경도 좋고 시원했습니다. 여러모로
                                    즐겁게 보내다 올 수 있는 멋진 숙소였습니다. 가능하다면 위치 때문에 차를 가져오는
                                    것이 좋습니다.
                                </p>
                                <div class="u_picture">
                                    <div class="u_picture_box"></div>
                                    <div class="u_picture_box"></div>

                                    <!-- 후기사진 들어갈자리 -->
                                </div><!-- //u_picture -->
                            </div><!-- //u_r_txt_box -->
                        </div><!-- //user_box -->
                        <div class="user_box">
                            <div class="u_profile">
                                <div class="user_i">
                                    <img src="img/user.png" alt="임시">
                                </div><!-- //user_i -->
                                <div class="u_name_date">
                                    <span class="u_name">
                                        이름
                                    </span><!-- //u_name -->
                                    <p class="u_date">
                                        에어비앤비 가입기간
                                    </p><!-- //u_date -->
                                </div><!-- //u_name_date -->
                            </div><!-- //u_profile -->
                            <div class="u_r_txt_box">
                                <div class="star_date">
                                    <div class="star">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                    </div><!-- //star -->
                                    <p>3주 전</p>
                                </div><!-- //star_date -->
                                <p class="txt">회사 워크샵으로 다녀왔습니다. 정말 산속이라 풍경도 좋고 시원했습니다. 여러모로
                                    즐겁게 보내다 올 수 있는 멋진 숙소였습니다. 가능하다면 위치 때문에 차를 가져오는
                                    것이 좋습니다.
                                </p>
                                <div class="u_picture">
                                    <div class="u_picture_box"></div>
                                    <div class="u_picture_box"></div>
                                    <div class="u_picture_box"></div>
                                    <div class="u_picture_box"></div>

                                    <!-- 후기사진 들어갈자리 -->
                                </div><!-- //u_picture -->
                            </div><!-- //u_r_txt_box -->
                        </div><!-- //user_box -->
                        <div class="user_box">
                            <div class="u_profile">
                                <div class="user_i">
                                    <img src="img/user.png" alt="임시">
                                </div><!-- //user_i -->
                                <div class="u_name_date">
                                    <span class="u_name">
                                        이름
                                    </span><!-- //u_name -->
                                    <p class="u_date">
                                        에어비앤비 가입기간
                                    </p><!-- //u_date -->
                                </div><!-- //u_name_date -->
                            </div><!-- //u_profile -->
                            <div class="u_r_txt_box">
                                <div class="star_date">
                                    <div class="star">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                    </div><!-- //star -->
                                    <p>3주 전</p>
                                </div><!-- //star_date -->
                                <p class="txt">회사 워크샵으로 다녀왔습니다. 정말 산속이라 풍경도 좋고 시원했습니다. 여러모로
                                    즐겁게 보내다 올 수 있는 멋진 숙소였습니다. 가능하다면 위치 때문에 차를 가져오는
                                    것이 좋습니다.
                                </p>
                                <div class="u_picture">
                                    <div class="u_picture_box"></div>
                                    <div class="u_picture_box"></div>

                                    <!-- 후기사진 들어갈자리 -->
                                </div><!-- //u_picture -->
                            </div><!-- //u_r_txt_box -->
                        </div><!-- //user_box -->
                        <div class="user_box">
                            <div class="u_profile">
                                <div class="user_i">
                                    <img src="img/user.png" alt="임시">
                                </div><!-- //user_i -->
                                <div class="u_name_date">
                                    <span class="u_name">
                                        이름
                                    </span><!-- //u_name -->
                                    <p class="u_date">
                                        에어비앤비 가입기간
                                    </p><!-- //u_date -->
                                </div><!-- //u_name_date -->
                            </div><!-- //u_profile -->
                            <div class="u_r_txt_box">
                                <div class="star_date">
                                    <div class="star">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                    </div><!-- //star -->
                                    <p>3주 전</p>
                                </div><!-- //star_date -->
                                <p class="txt">회사 워크샵으로 다녀왔습니다. 정말 산속이라 풍경도 좋고 시원했습니다. 여러모로
                                    즐겁게 보내다 올 수 있는 멋진 숙소였습니다. 가능하다면 위치 때문에 차를 가져오는
                                    것이 좋습니다.
                                </p>
                                <div class="u_picture">
                                    <div class="u_picture_box"></div>
                                    <div class="u_picture_box"></div>

                                    <!-- 후기사진 들어갈자리 -->
                                </div><!-- //u_picture -->
                            </div><!-- //u_r_txt_box -->
                        </div><!-- //user_box -->
                        <div class="user_box">
                            <div class="u_profile">
                                <div class="user_i">
                                    <img src="img/user.png" alt="임시">
                                </div><!-- //user_i -->
                                <div class="u_name_date">
                                    <span class="u_name">
                                        이름
                                    </span><!-- //u_name -->
                                    <p class="u_date">
                                        에어비앤비 가입기간
                                    </p><!-- //u_date -->
                                </div><!-- //u_name_date -->
                            </div><!-- //u_profile -->
                            <div class="u_r_txt_box">
                                <div class="star_date">
                                    <div class="star">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                    </div><!-- //star -->
                                    <p>3주 전</p>
                                </div><!-- //star_date -->
                                <p class="txt">회사 워크샵으로 다녀왔습니다. 정말 산속이라 풍경도 좋고 시원했습니다. 여러모로
                                    즐겁게 보내다 올 수 있는 멋진 숙소였습니다. 가능하다면 위치 때문에 차를 가져오는
                                    것이 좋습니다.
                                </p>
                                <div class="u_picture">
                                    <div class="u_picture_box"></div>
                                    <div class="u_picture_box"></div>

                                    <!-- 후기사진 들어갈자리 -->
                                </div><!-- //u_picture -->
                            </div><!-- //u_r_txt_box -->
                        </div><!-- //user_box -->
                        <div class="user_box">
                            <div class="u_profile">
                                <div class="user_i">
                                    <img src="img/user.png" alt="임시">
                                </div><!-- //user_i -->
                                <div class="u_name_date">
                                    <span class="u_name">
                                        이름
                                    </span><!-- //u_name -->
                                    <p class="u_date">
                                        에어비앤비 가입기간
                                    </p><!-- //u_date -->
                                </div><!-- //u_name_date -->
                            </div><!-- //u_profile -->
                            <div class="u_r_txt_box">
                                <div class="star_date">
                                    <div class="star">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                    </div><!-- //star -->
                                    <p>3주 전</p>
                                </div><!-- //star_date -->
                                <p class="txt">회사 워크샵으로 다녀왔습니다. 정말 산속이라 풍경도 좋고 시원했습니다. 여러모로
                                    즐겁게 보내다 올 수 있는 멋진 숙소였습니다. 가능하다면 위치 때문에 차를 가져오는
                                    것이 좋습니다.
                                </p>
                                <div class="u_picture">
                                    <div class="u_picture_box"></div>
                                    <div class="u_picture_box"></div>

                                    <!-- 후기사진 들어갈자리 -->
                                </div><!-- //u_picture -->
                            </div><!-- //u_r_txt_box -->
                        </div><!-- //user_box -->
                    </div><!-- //review_page -->
                </div><!-- //review_page -->
            </div><!-- //page_box  페이지 들어갈 자리-->
            <div class="pagination">
                <button class="prev_btn" disabled><i class="fa-solid fa-chevron-left"></i></button>
                <button class="page_btn" data-index="0">1</button>
                <button class="page_btn" data-index="1">2</button>
                <button class="page_btn" data-index="2">3</button>
                <button class="next_btn"><i class="fa-solid fa-chevron-right"></i></button>
            </div>
        </div><!-- //review_box -->
        <!--   후기 끝 ---------------------------------------------------------------------------------->
    </div><!-- //main_visual -->
    ]


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

    <aside>
        <i class="fa-solid fa-chevron-up"></i>
        <span>TOP</span>
    </aside>

</body>

</html>