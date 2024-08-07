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
    <title>프로필 수정</title>
 	<link rel="stylesheet" href="/style/css/common.css">
    <link rel="stylesheet" href="/style/css/userCommon.css">
    <link rel="stylesheet" href="/style/css/profileUpdate.css">
    <script src="https://kit.fontawesome.com/82b4a4fcad.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/style/js/profileUpdate.js" defer></script>
    <link rel="stylesheet" href="/style/css/navSub.css">
    <script src="/style/js/navbarSub.js" defer></script>
</head>

<body>
	<jsp:include page="/WEB-INF/view/layout/navbarSub.jsp"></jsp:include>
    <!-- ----------------------------------------------컨텐츠 시작----------------------------------- -->

    <div class="user_main inner">
        <div class="u_m_left">
            <div class="profile_t">
                <div class="pro_pic">
                    <img src="${userInfo.userImage}" alt="프로필 사진" id="outsideImg">
                    <div class="pic_icon" id="imgModalBtn">
                        <i class="fas fa-camera"></i>
                        <p>추가</p> 
                    </div><!-- //pic_icon -->
                </div><!-- //pro_pic -->
            </div><!-- //profile_t -->
        </div><!-- //u_m_left -->

        <div class="u_m_right">
            <h2>프로필 수정</h2>
            <p>프로필은 AOOM 전반에 걸쳐 다른 게스트와 호스트에게 나를 알리는 기본적인 정보입니다.</p>
            <ul class="u_list">
            	<c:forEach var="p" items="${profile}">
	            
		            <c:choose>
		            	<c:when test="${p.proitemCode == 'pfi01'}">
		            		<li id="${p.proitemCode}" data-value="${p.proitemCode}">
		            		<div class="l_left">
			            		<img src="/style/img/pu_3.png" alt="출생 연도">
		                        <p>${p.codeName}</p>
		                        <p class="sb"> : ${p.content}</p>
	                        </div>
	                        <i class="fas fa-chevron-right"></i>
	                    </li>   
		            	</c:when>
		            </c:choose>
		            
		            <c:choose>
		            	<c:when test="${p.proitemCode == 'pfi02'}">
		            		<li id="${p.proitemCode}" data-value="${p.proitemCode}">
			                    <div class="l_left" >
			                        <img src="/style/img/pu_4.png" alt="출신학교">
			                        <p>${p.codeName}</p>
			                        <p class="sb"> : ${p.content}</p>
			                    </div>
			                    <i class="fas fa-chevron-right"></i>
			                </li>
		            	</c:when>
		            	
		            	<c:when test="${p.proitemCode == 'pfi03'}">
		            		<li id="${p.proitemCode}" data-value="${p.proitemCode}">
			                    <div class="l_left" >
 			                        <img src="/style/img/pu_5.png" alt="직업"> 
 			                        <p>${p.codeName}</p> 
			                        <p class="sb"> : ${p.content}</p>
			                    </div>
			                    <i class="fas fa-chevron-right"></i>
			                </li>
			              
		            	</c:when>
		            	
		            	<c:when test="${p.proitemCode == 'pfi04'}">
		            		<li id="${p.proitemCode}" data-value="${p.proitemCode}">
			                	<div class="l_left" >
			                    	<img src="/style/img/pu_6.png" alt="거주지">
			                    	<p>${p.codeName}</p>
			                        <p class="sb"> : ${p.content}</p>
			                	</div><!-- //l_lrft -->
			                	<i class="fas fa-chevron-right"></i>
			            	</li>
		            	</c:when>
		            	
		            	<c:when test="${p.proitemCode == 'pfi05'}">
			                <li id="${p.proitemCode}" data-value="${p.proitemCode}">
			                    <div class="l_left" >
			                        <img src="/style/img/pu_7.png" alt="구사 언어">
			                        <p>${p.codeName}</p>
			                        <p class="sb"> : ${p.content}</p>
			                    </div>
			                    <i class="fas fa-chevron-right"></i>
			                </li>
		            	</c:when>
		            	
		            	<c:when test="${p.proitemCode == 'pfi06'}">
			                <li id="${p.proitemCode}" data-value="${p.proitemCode}">
			                    <div class="l_left" >
			                        <img src="/style/img/pu_8.png" alt="취미">
			                        <p>${p.codeName}</p>
			                        <p class="sb"> : ${p.content}</p>
			                    </div><!-- //l_lrft -->
		                    	<i class="fas fa-chevron-right"></i>
			                </li>
		            	</c:when>
		            	
		            	<c:when test="${p.proitemCode == 'pfi07'}">
			                <li id="${p.proitemCode}" data-value="${p.proitemCode}">
			                    <div class="l_left" >
			                        <img src="/style/img/pu_9.png" alt="MBTI">
			                        <p>${p.codeName}</p>
			                        <p class="sb"> : ${p.content}</p>
			                    </div><!-- //l_lrft -->
		                        <i class="fas fa-chevron-right"></i>
			                </li>
		            	</c:when>
		            	
		            	<c:when test="${p.proitemCode == 'pfi08'}">
			                <li id="${p.proitemCode}" data-value="${p.proitemCode}">
			                    <div class="l_left">
			                        <img src="/style/img/pu_10.png" alt="성별">
			                        <p>${p.codeName}</p>
			                        <p class="sb"> : ${p.content}</p>
			                    </div><!-- //l_lrft -->
			                    <i class="fas fa-chevron-right"></i>
			                </li>
		            	</c:when>
		            	
		            </c:choose>
            		
				</c:forEach>

            </ul><!-- //u_list -->
            
            <div class="aboutme">
                <h2>자기소개</h2>
                <c:choose>
                	<c:when test="${profile == null || profile.isEmpty()}">
                		<span class="gray">자유롭게 작성해보세요.</span>
						<ul class="a_me" id="pfi09" data-value="pfi09">
		                    <li> 
		                    	<i class="fas fa-plus"></i>
		                    </li>
		                </ul><!-- //a_me -->
                	</c:when>
                	
                	<c:otherwise>
                		<c:forEach var="p" items="${profile}">
			                <c:if test="${p.codeKey == 'pfi09'}">
			                 	<c:set var="pfi09Ck" value="true" />
			                    <c:if test="${p.content != null && p.content != ''}">
			                    	
									<ul class="a_me" id="pfi09" data-value="pfi09">
										<li> 
						                	${p.content}    
					                    </li>
					                </ul><!-- //a_me -->
			                    </c:if>
			                    
			                    <c:if test="${p.content == null || p.content == ''}">
			                        <span class="gray">자유롭게 작성해보세요.</span>
									<ul class="a_me" id="pfi09" data-value="pfi09">
					                    <li> 
					                    	<i class="fas fa-plus"></i>
					                    </li>
					                </ul><!-- //a_me -->
			                    </c:if>
			                </c:if>
			            </c:forEach> 
			            <c:if test="${!pfi09Ck}">
						    <span class="gray">자유롭게 작성해보세요.</span>
						    <ul class="a_me" id="pfi09" data-value="pfi09">
						        <li> 
						            <i class="fas fa-plus"></i>
						        </li>
						    </ul><!-- //a_me -->
						</c:if>
                	</c:otherwise>
                </c:choose>
				<form id="updateProfileContent">
					<div class="u_modal" id="updateModal">
					    <div class="m_bg">
					        <div class="m_top">
					            <i class="fas fa-times"></i>
					        </div>
					        
					        <div class="m_contents" id="updateContent">
					            <div class="title">
					            	<h2>로딩중입니다 잠시만기다려주세요.</h2>
					            </div>
					            <div class="con">
					            </div>
					        </div>
					        
					        <div class="m_bottom">
					            <button type="button" class="navy" id="profileUpdateBtn" >저장</button>
				      		</div>
					    </div>
					</div>
					<input type="hidden" name="codeKey" id="codeKey">
				</form>

				<form id="profileImgUpdate" enctype="multipart/form-data">
					<div class="u_modal" id="imgUpdateModal">
						<div class="m_bg">
							<div class="m_top">
								<i class="fas fa-times"></i>
							</div>

							<div class="m_contents" id="updateContent">
								<div class="title">
									<h2>프로필 사진 변경하기</h2>
								</div>
								<div style="display: flex;justify-content: flex-end;">
								<i class="fas fa-times" style="font-size: 16px;" id="profileImageRemove"></i>
								</div>
								<div class="con" style="align-items: center">
									<label for="ImageModalFile">
										
										<img src="${userInfo.userImage}" style="width: 100%; height: 300px; display: block;" id="modalImg">
	 									<input type="file" id="ImageModalFile" name="profileImage" accept="image/*" style="display: none;"> 
									</label>
					            </div>
									
							</div>

							<div class="m_bottom">
								<button type="button" class="navy" id="profileImgUpdateBtn">이미지 변경</button>
								<input type="hidden" name="userId" value="${userInfo.userId}">
	                    		<input type="hidden" name="deleteImage" value="${userInfo.userImage}">
							</div>
						</div>
					</div>
					<input type="hidden" name="codeKey" id="codeKey">
				</form>


			</div><!-- //aboutme -->
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

<script>
	let userId = "${userInfo.userId}";
	
</script>

</html>