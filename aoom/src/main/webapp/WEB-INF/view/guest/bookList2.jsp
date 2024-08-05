<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="AOOM 웹 사이트 입니다">
    <meta name="keywords" content="AOOM, 웹디자인, 포트폴리오, 디자이너, 웹 포트폴리오">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>숙소 관리</title>
    <script src="https://kit.fontawesome.com/82b4a4fcad.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/roomManage.js" defer></script>

    <link rel="stylesheet" href="/style/css/common.css">
    <link rel="stylesheet" href="/style/css/bookList.css">
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
                        <p>숙소관리</p>
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
                    <div class="profile">
                        <img src="img/n_2.png" alt="유저 프로필">
                        <p>이름</p>
                        <i class="fa-solid fa-bars"></i>
                    </div><!-- //profile -->
                </div><!--//user -->

            </div><!-- //inner -->
        </header><!--//header-->
    </div><!-- //fixed -->
    <!-- ---------------컨텐츠 시작------------------------>

    <div class="inner">
        <div class="inner_nav">
            
        </div><!-- //inner_nav 숙소관리 네비 -->
        <div class="r_manage">

            <div class="r_m_top">
                <h4>예약 목록</h4>
                <div class="t_right">
                    <select>
                        <option>전체 보기</option>
                        <option>운영중 보기</option>
                        <option>비활성화만 보기</option>
                    </select>
                    <i class="fa-solid fa-magnifying-glass"></i>
                    <div class="position_i">
                        <i class="fa-solid fa-table-cells-large view"></i>
                        <i class="fa-solid fa-table-list  "></i>
                    </div><!-- //position_i -->
                    <i class="fa-solid fa-plus"></i>
                </div><!-- //t_right -->
            </div><!-- //r_m_top 썸네일, 리스트 형식 공통  사용-->
            <div class="view_style">
                <div class="r_m_list view">
                    <ul class="list_style">
                        <li class="list_top">
                            <div class="one">숙소</div>
                            <div class="two">예약번호</div>
                            <div class="three">기간</div>
                            <div class="fourth">예약상태</div>
                            <div class="last">비고(환불상태)</div>
                            <div></div>
                        </li><!-- //list_style -->
                        <c:forEach var="b" items="${bookingList}">
	                        <li class="list_con">
	                        
	                            <div class="one">
	                                <div class="img_box">
	                                    <a href="/guest/bookInfo?bookingId=${b.bookingId}">
											<img src="${b.mainImage}">
										</a>
	                                </div><!-- //img_box -->
	                                <a href="/room/roomInfo?roomId=${b.roomId}">
										${b.roomName}
									</a>
	                            </div>
	                            
	                            <div class="two">
	                                <a href="/guest/bookInfo?bookingId=${b.bookingId}">
										${b.bookingId} 
									</a>
	                            </div>
	                            
	                            <div class="three">
	                                ${b.checkIn} ~ ${b.checkOut}
	                            </div>
	                            
	                            <div class="fourth">
	                            	${b.bookstatName} 
	                            	<div class="color_lamp" style="
						                <c:choose>
						                    <c:when test='${b.bookstatCode == "bst01"}'>background: #FF0000;</c:when>
						                    <c:when test='${b.bookstatCode == "bst02"}'>background: #5968ed;</c:when>
						                    <c:when test='${b.bookstatCode == "bst03"}'>background: #00ed33;</c:when>
						                    <c:when test='${b.bookstatCode == "bst04"}'>background: #00ed33;</c:when>
						                    <c:when test='${b.bookstatCode == "bst05"}'>background: #FFB558;</c:when>
						                </c:choose>
						            "></div>
									
	                            </div>
	                            <div class="last">
	                                <c:choose>
										<c:when test="${b.bookstatCode eq 'bst01' ||b.bookstatCode eq 'bst02'}">
											<button onclick="window.location.href='/booking/bookingCancel?bookingId=${b.bookingId}'">
												예약취소하기
											</button>
										</c:when>
										<c:when test="${b.bookstatCode eq 'bst05'}">
												환불처리됨
										</c:when>
									</c:choose>
	                            </div>
	                        </li><!-- //list_con -->
                        </c:forEach>
                        
                    </ul><!-- //thumbnail_style -->
                    <!-- !! 썸네일 컨텐츠 줄 추가시 ul자체를 복사하고 li로 갯수를 조정 해주세요!!
                            사유 : li를 복사해서 ul에 flex-wrep을 적용하면 간격이 안맞습니당!! -->
                </div><!-- //r_m_thumbnail 썸네일 형식-->
                <c:choose>
					<c:when test="${pagingInfo.lastPage == 0 }">
			
					</c:when>
					<c:otherwise>
						<div class="pagination">
							<!-- paging 이전버튼 --> 
							<c:choose>
								<c:when test="${currentPage == 1}">
									<button class="prev_btn" type="button" disabled="disabled">
										<i class="fa-solid fa-chevron-left"></i>
									</button>
								</c:when>
			
								<c:otherwise>
									<button class="prev_btn" type="button" onclick="window.location.href='/guest/bookList?currentPage=${currentPage - 1}'">
										<i class="fa-solid fa-chevron-left"></i>
									</button>
								</c:otherwise>
							</c:choose>
			
							<!-- paging 숫자버튼 -->
							<c:forEach var="i" begin="1" end="${pagingInfo.lastPage}">
									<c:choose>
										<c:when test="${currentPage == i}">
											<button class="page_btn active" data-index="${i}" type="button" onclick="window.location.href='/guest/bookList?currentPage=${i}'">
												${i}
											</button>
										</c:when>
										<c:otherwise>
											<button class="page_btn" data-index="${i}" type="button" onclick="window.location.href='/guest/bookList?currentPage=${i}'">
												${i}
											</button>
										</c:otherwise>
									</c:choose>
							</c:forEach>
			
							<!-- paging 다음버튼 -->
							<c:choose>
								<c:when test="${currentPage == pagingInfo.lastPage}">
									<button class="next_btn" type="button" disabled="disabled">
										<i class="fa-solid fa-chevron-right"></i>
									</button>
								</c:when>
								<c:otherwise>
									<button class="next_btn" type="button" onclick="window.location.href='/guest/bookList?currentPage=${currentPage + 1}'">
										<i class="fa-solid fa-chevron-right"></i>
									</button>
								</c:otherwise>
							</c:choose>
						</div>
					</c:otherwise>
				</c:choose>
            </div><!-- //view_style -->

        </div><!-- //r_ manage -->
        
    </div><!-- //inner -->



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

</html>