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
    <title>프로필</title>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://kit.fontawesome.com/82b4a4fcad.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css">
    <script src="js/common.js"></script>
    <script src="js/profile.js" defer></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="/style/css/common.css">
    <link rel="stylesheet" href="/style/css/userCommon.css">
    <link rel="stylesheet" href="/style/css/profile.css">
    <link rel="stylesheet" href="/style/css/navSub.css">
    <script src="/style/js/navbarSub.js" defer></script>
</head>

<body>
    <jsp:include page="/WEB-INF/view/layout/navbarSub.jsp"></jsp:include>
    <!-- ----------------------------------------------컨텐츠 시작----------------------------------- -->

    <div class="user_main inner">
        <div class="u_m_left">
            <div class="h_left">
                <div class="profile">
                    <div class="img_box">
                        <img src="${userInfo.userImage}" alt="임시사진" class="u_pic">
                        <img src="/style/img/icon_9 copy.png" alt="인증마크" class="position_a">
                        <!-- 호스트 프로필사진 자리 -->
                        
                    </div><!--  //img_box-->
                    <b class="host_name">${userInfo.userName}</b>
                    <!-- <p><i class="fa-solid fa-user"></i>호스트</p> -->
                </div><!-- //profile -->

                <div class="h_information">
                    <div class="h_review flex_info">
                        <i>후기</i>
                        <b>${hostReviewInfo.cnt}<p>개</p></b>
                    </div><!-- //h_review -->
                    <div class="h_grade flex_info">
                        <i>평점</i>
                        <b>${hostReviewInfo.avg}<p><i class="fa-solid fa-star"></i></p></b>
                    </div><!-- //h_grade 평점 -->
                    <div class="h_career flex_info">
                        <i>호스팅 경력</i>
                        <c:choose>
							    <c:when test="${subPeriod.year == 0}">
							        <c:choose>
							            <c:when test="${subPeriod.month != 0}">
							                <b>${subPeriod.month}<p>월</p></b>
							            </c:when>
							            <c:otherwise>
							                <b>신규</b>
							            </c:otherwise>
							        </c:choose>
							    </c:when>
							    <c:when test="${subPeriod.year != 0}">
							        <b>${subPeriod.year}<p>년</p></b>
							        <c:choose>
							            <c:when test="${subPeriod.leftMonth != 0}">
							                <b>${subPeriod.leftMonth}<p>월</p></b>
							            </c:when>
							        </c:choose>
							    </c:when>
							</c:choose>
                    </div><!-- //h_career호스팅 경력 -->
                </div><!-- //h_information -->
            </div><!-- //h_left -->
            <c:if test="${sessionScope.userInfo.userId == userInfo.userId}">
		  		<button onclick="window.location.href='/user/profileUpdate?userId=${userInfo.userId}'">
		  			프로필 수정하기
	  			</button>
		  	</c:if>
        </div><!-- //u_m_left -->

        <div class="u_m_right">
            <h2>쿵야양파 님 소개</h2>
            <ul class="u_list">
            
	            <c:forEach var="p" items="${profile}">
	            
		            <c:choose>
		            	<c:when test="${p.proitemCode == 'pfi01'}">
		            	<li>
		            		<div class="l_left">
			            		<img src="/style/img/pu_3.png" alt="출생 연도">
		                        <p>${p.codeName}</p>
		                        <p class="sb"> : ${p.content}</p>
	                        </div>
	                    </li>   
		            	</c:when>
		            </c:choose>
		            
		            <c:choose>
		            	<c:when test="${p.proitemCode == 'pfi02'}">
		            		<li>
			                    <div class="l_left">
			                        <img src="/style/img/pu_4.png" alt="출신학교">
			                        <p>${p.codeName}</p>
			                        <p class="sb"> : ${p.content}</p>
			                    </div>
			                </li>
		            	</c:when>
		            	
		            	<c:when test="${p.proitemCode == 'pfi03'}">
		            		<li>
			                    <div class="l_left">
			                        <img src="/style/img/pu_5.png" alt="직업">
			                        <p>${p.codeName}</p>
			                        <p class="sb"> : ${p.content}</p>
			                    </div>
			                </li>
			              
		            	</c:when>
		            	
		            	<c:when test="${p.proitemCode == 'pfi04'}">
		            		<li>
			                	<div class="l_left">
			                    	<img src="/style/img/pu_6.png" alt="거주지">
			                    	<p>${p.codeName}</p>
			                        <p class="sb"> : ${p.content}</p>
			                	</div><!-- //l_lrft -->
			            	</li>
		            	</c:when>
		            	
		            	<c:when test="${p.proitemCode == 'pfi05'}">
			                <li>
			                    <div class="l_left">
			                        <img src="/style/img/pu_7.png" alt="구사 언어">
			                        <p>${p.codeName}</p>
			                        <p class="sb"> : ${p.content}</p>
			                    </div>
			                </li>
		            	</c:when>
		            	
		            	<c:when test="${p.proitemCode == 'pfi06'}">
			                <li>
			                    <div class="l_left">
			                        <img src="/style/img/pu_8.png" alt="취미">
			                        <p>${p.codeName}</p>
			                        <p class="sb"> : ${p.content}</p>
			                    </div><!-- //l_lrft -->
			                </li>
		            	</c:when>
		            	
		            	<c:when test="${p.proitemCode == 'pfi07'}">
			                <li>
			                    <div class="l_left">
			                        <img src="/style/img/pu_9.png" alt="MBTI">
			                        <p>${p.codeName}</p>
			                        <p class="sb"> : ${p.content}</p>
			                    </div><!-- //l_lrft -->
			                </li>
		            	</c:when>
		            	
		            	<c:when test="${p.proitemCode == 'pfi08'}">
			                <li>
			                    <div class="l_left">
			                        <img src="/style/img/pu_10.png" alt="성별">
			                        <p>${p.codeName}</p>
			                        <p class="sb"> : ${p.content}</p>
			                    </div><!-- //l_lrft -->
			                </li>
		            	</c:when>
		            	
		            </c:choose>
            		
				</c:forEach>
                
            </ul><!-- //u_list -->
            <div class="aboutme">
                <h2>자기소개</h2>
                <c:choose>
			    	<c:when test="${profileContent == null || profileContent == ''}">
			    		<b>소개글을 작성해주세요!</b>
			    	</c:when>
			    	<c:otherwise>
			    		<b>${profileContent}</b>
			    	</c:otherwise>
			    </c:choose>
            </div><!-- //aboutme -->

            <div class="review">
                <h2>쿵야양파 님에 대한 후기</h2>
                <div class="slide_r swiper">
                    <ul class="swiper-wrapper">
                        <li class="swiper-slide">
                            <p>안녕하세요 양파농장에서 잘 쉬다갑니다 <br>
                                제 최종학력은 피자스쿨 입니다.
                            </p>
                            <div class="u_pro">
                                <div class="u_pic">
                                    <!-- 이미지 자리!~ -->
                                </div><!-- //u_pic -->
                                <div class="u_date">
                                    <span>이름</span>
                                    <p>날짜</p>
                                </div><!-- //u_date -->
                            </div>
                        </li>
                        <li class="swiper-slide">
                            <p>안녕하세요 양파농장에서 잘 쉬다갑니다 <br>
                                제 최종학력은 피자스쿨 입니다.
                            </p>
                            <div class="u_pro">
                                <div class="u_pic">
                                    <!-- 이미지 자리!~ -->
                                </div><!-- //u_pic -->
                                <div class="u_date">
                                    <span>이름</span>
                                    <p>날짜</p>
                                </div><!-- //u_date -->
                            </div>
                        </li>
                        <li class="swiper-slide" >
                            <p>안녕하세요 양파농장에서 잘 쉬다갑니다 <br>
                                제 최종학력은 피자스쿨 입니다.
                            </p>
                            <div class="u_pro">
                                <div class="u_pic">
                                    <!-- 이미지 자리!~ -->
                                </div><!-- //u_pic -->
                                <div class="u_date">
                                    <span>이름</span>
                                    <p>날짜</p>
                                </div><!-- //u_date -->
                            </div>
                        </li>
                        <li class="swiper-slide">
                            <p>안녕하세요 양파농장에서 잘 쉬다갑니다 <br>
                                제 최종학력은 피자스쿨 입니다.
                            </p>
                            <div class="u_pro">
                                <div class="u_pic">
                                    <!-- 이미지 자리!~ -->
                                </div><!-- //u_pic -->
                                <div class="u_date">
                                    <span>이름</span>
                                    <p>날짜</p>
                                </div><!-- //u_date -->
                            </div>
                        </li>
                        <li  class="swiper-slide">
                            <p>안녕하세요 양파농장에서 잘 쉬다갑니다 <br>
                                제 최종학력은 피자스쿨 입니다.
                            </p>
                            <div class="u_pro">
                                <div class="u_pic">
                                    <!-- 이미지 자리!~ -->
                                </div><!-- //u_pic -->
                                <div class="u_date">
                                    <span>이름</span>
                                    <p>날짜</p>
                                </div><!-- //u_date -->
                            </div>
                        </li>
                    </ul>
                    <div class="swiper-pagination"></div>
                </div><!-- //slide_r -->
            </div><!-- //review -->
        </div><!-- //u_m_right -->
    </div><!-- //user_maibn -->


    <!-- ----------------------------------------------컨텐츠 끝----------------------------------- -->


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

</html>