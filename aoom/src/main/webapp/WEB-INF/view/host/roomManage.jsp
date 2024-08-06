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
    <title>숙소 관리</title>
    <script src="https://kit.fontawesome.com/82b4a4fcad.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/style/js/roomManage.js" defer></script>
	<script src="/style/js/navbarSub.js" defer></script>
    <link rel="stylesheet" href="/style/css/common.css">
    <link rel="stylesheet" href="/style/css/roomManage.css">
    <link rel="stylesheet" href="/style/css/navSub.css">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/view/layout/navbarSub.jsp"></jsp:include>
    <!-- ---------------컨텐츠 시작------------------------>

    <div class="inner">
        <div class="inner_nav">
            <ul>
                <li><a href="/host/main">메인</a></li>
                <li><a href="/host/calendar">달력</a></li>
                <li class="active"><a href="/host/roomManage">숙소 관리</a></li>
                <li><a href="/host/bookList">예약 목록</a></li>
                <li><a href="/host/revenue">수입</a></li>
            </ul>
        </div><!-- //inner_nav 숙소관리 네비 -->
        <div class="r_manage">

            <div class="r_m_top">
                <h4>숙소 관리</h4>
                <div class="t_right">
                    <select id="selectRoomstatCode">
                        <option value="">===전체 보기===</option>
                    	<c:forEach var="roomstat" items="${roomstatCodeList }">
                    		<c:if test="${roomstat.codeKey != 'rst05'}">
                    			<c:if test="${roomstat.codeKey == rstCode}">
		                    		<option value="${roomstat.codeKey }" selected="selected">${roomstat.codeName }만 보기</option>
                    			</c:if>
                    			<c:if test="${roomstat.codeKey != rstCode}">
		                    		<option value="${roomstat.codeKey }">${roomstat.codeName }만 보기</option>
                    			</c:if>
                    		</c:if>
                    	</c:forEach>
                    </select>
                    <i class="fa-solid fa-magnifying-glass"></i>
                    <div class="position_i">
						<c:if test="${viewType == 'list'}">
							<i id="thumbnailViewIcon" class="fa-solid fa-table-cells-large view"></i>
							<i id="listViewIcon" class="fa-solid fa-table-list "></i>
						</c:if>
						<c:if test="${viewType == 'thumbnail'}">
							<i id="thumbnailViewIcon" class="fa-solid fa-table-cells-large "></i>
							<i id="listViewIcon" class="fa-solid fa-table-list view"></i>
						</c:if>
					</div><!-- //position_i -->
                   	<form action="/host/roomManage/setupRoom" method="post" style="height: 100%;">
						<button type="submit" style="height: 100%;">
							<i class="fa-solid fa-plus"></i>
						</button>
					</form>
                </div><!-- //t_right -->
            </div><!-- //r_m_top 썸네일, 리스트 형식 공통  사용-->
            <div class="view_style">
            	<c:if test="${viewType == 'list'}">
	            	<div class="r_m_list view">
	                    <ul class="list_style">
	                        <li class="list_top">
	                            <div class="one">숙소</div>
	                            <div class="two">위치</div>
	                            <div class="three">상태</div>
	                            <div class="fourth">비고</div>
	                            <div class="last"></div>
	                        </li><!-- //list_style -->
	                        <c:forEach var="room" items="${roomListByUser }">
		                        <li class="list_con">
		                            <div class="one">
		                                <div class="img_box">
		                                    <!-- 이미지 자리 -->
		                                    <c:if test="${room.mainImage != null && room.mainImage ne ''}">
												<img alt="" src="${room.mainImage }">
											</c:if>
											<c:if test="${room.mainImage == null || room.mainImage eq ''}">
												<img alt="" src="/image/etc/reviewDefault.png">
											</c:if>
		                                </div><!-- //img_box -->
		                                <!-- 숙소이름 -->
		                                <p>
		                                	<c:if test="${room.roomstatCode eq 'rst03' }">
												<a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${room.roomId }">${room.roomName }</a>
											</c:if>
											<c:if test="${room.roomstatCode ne 'rst03' }">
												${room.roomName }
											</c:if>
		                                </p>
		                            </div>
		                            <div class="two">
		                            	<!-- 숙소위치 -->
		                                <p class="gray_c">
		                                	${room.address.replace('^', ' ')}
		                                </p>
		                            </div>
		                            <div class="three">
		                                 <div class="color_lamp" style="
							                <c:choose>
							                    <c:when test='${room.roomstatCode == "rst01"}'>background: #5968ed;</c:when>
							                    <c:when test='${room.roomstatCode == "rst02"}'>background: #FF0000;</c:when>
							                    <c:when test='${room.roomstatCode == "rst03"}'>background: #00ed33;</c:when>
							                    <c:when test='${room.roomstatCode == "rst04"}'>background: #8F8F8F;</c:when>
							                    <c:when test='${room.roomstatCode == "rst06"}'>background: #FFB558;</c:when>
							                </c:choose>
							            "></div>
		                                <!-- 숙소상태 -->
		                                <p class="gray_c">
											${room.codeName }
		                                </p>
		                            </div>
		                            <!-- 비고(반려사유) -->
		                            <div class="fourth">
		
		                            </div>
		                            <div class="last">
		                                <i class="fa-solid fa-ellipsis-vertical">
		                                    <ul class="option_box">
		                                        <li>
		                                            <p>
		                                            	<button type="button" onclick="location.replace('/host/roomManage/registRoom/basicInfo?roomId=${room.roomId}');">수정</button>
	                                            	</p>
		                                        </li>
		                                        <li>
		                                            <p>
		                                            	<button type="button" data-bs-toggle="modal" data-bs-target="#roomDeleteModal" name="btnDeleteRoom" data-room-id="${room.roomId }">삭제</button>
		                                            </p>
		                                        </li>
		                                    </ul>
		                                </i>
		                            </div>
		                        </li><!-- //list_con -->
	                        </c:forEach>
	                    </ul><!-- //list_style -->
	                </div><!-- //r_m_list 리스트 형식-->
            	</c:if>

				 <c:if test="${viewType == 'thumbnail'}">
	                <div class="r_m_thumbnail view">
	                	<c:forEach var="room" items="${roomListByUser }" varStatus="status">
						    <c:if test="${status.index % 3 == 0}">
						        <ul class="thumbnail_style">
						    </c:if>
						    <li>
						        <div class="img_re">
						            <div class="img_re_top">
						                <div class="t_left">
						                    <div class="color_lamp" style="
								                <c:choose>
								                    <c:when test='${room.roomstatCode == "rst01"}'>background: #5968ed;</c:when>
								                    <c:when test='${room.roomstatCode == "rst02"}'>background: #FF0000;</c:when>
								                    <c:when test='${room.roomstatCode == "rst03"}'>background: #00ed33;</c:when>
								                    <c:when test='${room.roomstatCode == "rst04"}'>background: #8F8F8F;</c:when>
								                    <c:when test='${room.roomstatCode == "rst06"}'>background: #FFB558;</c:when>
								                </c:choose>
								            "></div>
						                    <p>${room.codeName }</p>
						                </div><!-- //t_left -->
						                <i class="fa-solid fa-ellipsis-vertical">
						                    <ul class="option_box">
		                                        <li>
		                                            <p>
		                                            	<button type="button" onclick="location.replace('/host/roomManage/registRoom/basicInfo?roomId=${room.roomId}');">수정</button>
	                                            	</p>
		                                        </li>
		                                        <li>
		                                            <p>
		                                            	<button type="button" data-bs-toggle="modal" data-bs-target="#roomDeleteModal" name="btnDeleteRoom" data-room-id="${room.roomId }">삭제</button>
		                                            </p>
		                                        </li>
		                                    </ul>
						                </i>
						            </div><!-- //img_re_top -->
						            <c:if test="${room.mainImage != null && room.mainImage ne ''}">
										<img alt="" src="${room.mainImage }">
									</c:if>
									<c:if test="${room.mainImage == null || room.mainImage eq ''}">
										<img alt="" src="/image/etc/reviewDefault.png">
									</c:if>
						            <!-- 이미지 들어갈 자리! -->
						        </div><!-- //img_re -->
						        <div class="thum_txt">
						            <p>
						            	<c:if test="${room.roomstatCode eq 'rst03' }">
											<a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${room.roomId }">${room.roomName }</a>
										</c:if>
										<c:if test="${room.roomstatCode ne 'rst03' }">
											${room.roomName }
										</c:if>
						            </p>
						            <p class="gray_c">${room.address.replace('^', ' ')}</p>
						        </div> <!-- //thum_txt -->
						    </li>
						    <c:if test="${status.index % 3 == 2 || status.last}">
						        </ul><!-- //thumbnail_style -->
						    </c:if>
						</c:forEach>
	                    <!-- !! 썸네일 컨텐츠 줄 추가시 ul자체를 복사하고 li로 갯수를 조정 해주세요!!
	                            사유 : li를 복사해서 ul에 flex-wrep을 적용하면 간격이 안맞습니당!! -->
	                </div><!-- //r_m_thumbnail 썸네일 형식-->
                </c:if>
                <!-- 페이징 총숫자에맞춰서 1~10 ,11~20이런식으로 만들어야됨  -->
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
									<button class="prev_btn" type="button" onclick="window.location.href='/host/roomManage?currentPage=${currentPage - 1}&viewType=${viewType }&rstCode=${rstCode }'">
										<i class="fa-solid fa-chevron-left"></i>
									</button>
								</c:otherwise>
							</c:choose>
			
							<!-- paging 숫자버튼 -->
							<c:forEach var="i" begin="1" end="${pagingInfo.lastPage}">
									<c:choose>
										<c:when test="${currentPage == i}">
											<button class="page_btn active" data-index="${i}" type="button" onclick="window.location.href='/host/roomManage?currentPage=${i}&viewType=${viewType }&rstCode=${rstCode }'">
												${i}
											</button>
										</c:when>
										<c:otherwise>
											<button class="page_btn" data-index="${i}" type="button" onclick="window.location.href='/host/roomManage?currentPage=${i}&viewType=${viewType }&rstCode=${rstCode }'">
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
									<button class="next_btn" type="button" onclick="window.location.href='/host/roomManage?currentPage=${currentPage + 1}&viewType=${viewType }&rstCode=${rstCode }'">
										<i class="fa-solid fa-chevron-right"></i>
									</button>
								</c:otherwise>
							</c:choose>
						</div>
					</c:otherwise>
				</c:choose>
            </div><!-- //view_style -->
        </div><!-- //r_ manage -->
        
        <div class="refuse_modal">
			<i class="fa-solid fa-triangle-exclamation"></i>
			<h5>반려사유</h5>
			<p>
				사진 비율이 이상합니다. 실물 비율로 <br> 업로드 해주세요.
			</p>
			<button>
				<p>닫기</p>
			</button>
		</div>
		<!-- // refuse_modal-->
		
    </div><!-- //inner -->

	<!-- ---------------컨텐츠 끝------------------------>
    <!-- footer -->
	<jsp:include page="/WEB-INF/view/layout/footer.jsp"></jsp:include>

	<!-- 숙소 삭제 모달 -->
	<div class="room_delete_bg" style="display: none;">
	    <div class="room_delete">
	        <div class="room_delete_t">
	            <i class="fa-solid fa-xmark" id="closeModal"></i>
	            <p>숙소 삭제 확인</p>
	        </div>
	        <ul class="room_delete_b">
	            <li>
	                <form id="checkDeleteRoomForm">
                        <div>
                            <h6><b>아이디</b></h6>
                            <input type="text" id="deleteRoomUserId" name="userId" value="${sessionScope.userInfo.userId}" readonly="readonly">
                            <h6><b>비밀번호</b></h6>
                            <input type="password" id="deleteRoomUserPw" name="userPw">
                        </div>
	                    <div class="c_b_btn">
	                        <button class="c_btn" type="button" id="cancelDeleteRoomBtn">취소</button>
	                        <button class="d_btn"  type="button" id="deleteRoomBtn">삭제</button>
	                    </div>
	                </form>
	            </li>
	        </ul>
	    </div>
	</div>

	<!-- 숙소 삭제 버튼(roomstatCode를 삭제로 변경하는 것, DELETE 아님) -->
	<script type="text/javascript">
	
	 	$('button[name="btnDeleteRoom"]').click(function() {
	        let roomId = $(this).data('room-id');
	        console.log(roomId);
	        
	        $('.room_delete_bg').show();

	        $('#deleteRoomBtn').click(function() {
	            $.ajax({
	                url: '/host/roomManage/ajaxDeleteRoom',
	                method: 'post',
	                data: {
	                    'roomId': roomId,
	                    'roomstatCode': 'rst05',
	                    'userId': $('#deleteRoomUserId').val(),
	                    'userPw': $('#deleteRoomUserPw').val()
	                },
	                success: function(response) {
	                    if (response.result) {
	                        alert(response.message);
	                        window.location.href = "/host/roomManage";
	                    } else {
	                        alert(response.message);
	                    }
	                }
	            });
	        });
	    });

	    $('#cancelDeleteRoomBtn, #closeModal').click(function() {
	        $('.room_delete_bg').hide();
	    });
	</script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			console.log('${rstCode}');
		    $('#listViewIcon, #thumbnailViewIcon').click(function() {
		        let viewIcon = $(this).attr('id');
		        let changeView = (viewIcon === 'listViewIcon') ? 'list' : 'thumbnail';
		        
		        let currentPage = '${currentPage}'; 
		        let rstCode = $('#selectRoomstatCode').val();
		        
		        window.location.href = '/host/roomManage?currentPage=' + currentPage + '&viewType=' + changeView + '&rstCode=' + rstCode;
		    });
		    
		    $('#selectRoomstatCode').change(function() {
		        let rstCode = $('#selectRoomstatCode').val();
		        let viewType = '${viewType}'
		        window.location.href = '/host/roomManage?viewType=' + viewType + '&rstCode=' + rstCode;
		    });
		});

	</script>

</body>
</html>