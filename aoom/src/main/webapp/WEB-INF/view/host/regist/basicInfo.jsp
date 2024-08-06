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
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/layout/navbarSub.jsp"></jsp:include>
    
    <!----------------------------------- 컨텐츠 시작! --------------------------------------------------->
	
    <div class="registration inner">
	    <form action="/host/roomManage/registRoom/registBasicInfo" method="post">
	        <div class="title">
	            <h2>숙소등록</h2>
	        </div>
	        <div class="pro">
	            <img src="/style/img/pro1.png" alt="프로그래스바" class="active">
	        </div><!-- //pro -->
	        
	        <div class="page_ac">
	            <div class="page_move">
	                <div class="page_rolling page_r1">
	                    <div class="p_left">
	                    	<!-- roomId -->
							<input type="hidden" name="roomId" value="${roomId }">
	                        <div class="s_category">
	                        	<h4>카테고리 선택</h4>
	                        	<!-- 숙소 카테고리 선택 -->
	                            <ul class="icon_box">
								    <c:forEach var="cate" items="${roomcate}">
							            <label for="${cate.codeKey}"></label>
							            <c:if test="${cate.codeKey eq roomInfo.roomcateCode}">
							            	<li class="on">
								                <i class="fa-solid fa-check"></i>
								                <div class="img_b">
								                    <img src="/style/img/${cate.codeKey}on.png" alt="${cate.codeName}">
								                </div>
								                <h5>${cate.codeName}</h5>
								                <input type="radio" id="${cate.codeKey}" name="roomcateCode" value="${cate.codeKey}" checked="checked" required="required">
							            	</li>
							            </c:if>
							            <c:if test="${cate.codeKey ne roomInfo.roomcateCode}">
							            	<li>
								                <i class="fa-solid fa-check"></i>
								                <div class="img_b">
								                    <img src="/style/img/${cate.codeKey}.png" alt="${cate.codeName}">
								                </div>
								                <h5>${cate.codeName}</h5>
								                <input type="radio" id="${cate.codeKey}" name="roomcateCode" value="${cate.codeKey}" required="required">
							            	</li>
							            </c:if>
								    </c:forEach>
								</ul><!-- //icon_box -->
	                        </div><!-- //s_category -->
	                        
	                        <div class="s_lodging">
                                <h4>숙소유형 선택</h4>
                                <div class="select_btn">
                                    <c:forEach var="type" items="${roomtype }">
                                    	<label for="${type.codeKey}"></label>
                                        <c:if test="${type.codeKey eq roomInfo.roomtypeCode}">
                                            <button type="button" class="on"> <i class="fa-solid fa-check"></i>
                                                <p>${type.codeName }</p>
                                            </button>
                                            <input type="radio" id="${type.codeKey}" name="roomtypeCode" value="${type.codeKey }" checked="checked" required="required">
                                        </c:if>
                                        <c:if test="${type.codeKey ne roomInfo.roomtypeCode}">
                                            <button type="button"> <i class="fa-solid fa-check"></i>
                                                <p>${type.codeName }</p>
                                            </button>
                                            <input type="radio" id="${type.codeKey}" name="roomtypeCode" value="${type.codeKey }" required="required">
                                        </c:if>
                                    </c:forEach>
                                </div><!-- //select_btn -->
                            </div><!-- //s_lodging -->
	                        
	                        <!-- 숙소 위치 설정 -->
	                        <div class="s_location">
	                            <h4>숙소 위치</h4>
								<div class="i_box">
									<c:if test="${roomInfo.roomstatCode == 'rst03' }">
										<div class="i_box_top">
											<input type="text" id="frontAddress" placeholder="주소" style="width: 300px;" readonly="readonly" required="required">
											<button class="pink" type="button" disabled="disabled"><span>주소검색</span></button><br>
										</div>
										<div class="i_box_bottom">
											<input type="text" id="detailAddress" placeholder="상세주소" readonly="readonly">
											<input type="hidden" name="address" id="address" required="required">
										</div>
									</c:if>
									<c:if test="${roomInfo.roomstatCode != 'rst03' }">
										<div class="i_box_top">
											<input type="text" id="frontAddress" placeholder="주소" style="width: 300px;" readonly="readonly" required="required">
											<button class="pink" type="button" onclick="searchAddress()"><span>주소검색</span></button><br>
										</div>
										<div class="i_box_bottom">
											<input type="text" id="detailAddress" placeholder="상세주소">
											<input type="hidden" name="address" id="address" required="required">
										</div>
									</c:if>
	                            </div><!-- //i_box -->
	                        </div><!-- //s_location -->
	                        
	                    </div><!-- //p_left -->
	                    
	                    <div class="p_right">
	                        <div class="maximum_p">
	                            <h4>최대 인원</h4>
	                            <div class="num_box">
	                                <button type="button" class="minus_btn">
	                                    <i class="fa-solid fa-minus"></i>
	                                </button><!-- //minus_btn -->
	                                <p class="result">
	                                	<c:if test="${roomInfo.maxPeople != null && roomInfo.maxPeople ne ''}">
											<input type="number" name="maxPeople" min="1" max="99" value="${roomInfo.maxPeople }" required="required">
										</c:if>
										<c:if test="${roomInfo.maxPeople == null || roomInfo.maxPeople eq ''}">
											<input type="number" name="maxPeople" min="1" max="99" value="0" required="required">
										</c:if>
	                                </p>
	                                <button type="button" class="plus_btn">
	                                    <i class="fa-solid fa-plus"></i>
	                                </button><!-- //plus_btn -->
	                            </div><!-- //num_box -->
	
	                        </div><!-- //maximum_p -->
	                        <div class="l_operat">
	                            <h4>숙소 운영일</h4>
	                            <div class="d_i">
	                                <!-- 숙소 운영일 설정 -->
									<c:if test="${roomInfo.startDate != null && roomInfo.startDate ne ''}">
										<input type="text" id="roomOperationDate" placeholder="날짜를 선택해주세요" value="${roomInfo.startDate } ~ ${roomInfo.endDate }" style="width: 300px;" required="required" autocomplete="off">			
									</c:if>
									<c:if test="${roomInfo.startDate == null || roomInfo.startDate eq ''}">
										<input type="text" id="roomOperationDate" placeholder="날짜를 선택해주세요" style="width: 300px;" required="required" autocomplete="off">
									</c:if>
						
									<input type="hidden" id="startDate" value="${roomInfo.startDate }" name="startDate">
									<input type="hidden" id="endDate" value="${roomInfo.endDate }" name="endDate">
	                            </div><!-- //d_i -->
	                        </div><!-- ///l_operat -->
	
	                        <div class="count">
	                            <h4>방 수 · 침대 수 · 욕실</h4>
	                            <div class="op_box">
	                            
	                                <div class="c_room">
	                                    <h5>방</h5>
	                                    <div class="num_box">
	                                        <button type="button" class="minus_btn">
	                                            <i class="fa-solid fa-minus"></i>
	                                        </button><!-- //minus_btn -->
	                                        <p class="result">
												<c:if test="${roomInfo.totalSpace != null && roomInfo.totalSpace ne ''}">
													<input type="number" name="totalSpace" min="1" max="999" value="${roomInfo.totalSpace }" required="required">			
												</c:if>
												<c:if test="${roomInfo.totalSpace == null || roomInfo.totalSpace eq ''}">
													<input type="number" name="totalSpace" min="1" max="999" value="0" required="required">
												</c:if>
	                                        </p>
	                                        <button type="button" class="plus_btn">
	                                            <i class="fa-solid fa-plus"></i>
	                                        </button><!-- //plus_btn -->
	                                    </div><!-- //num_box -->
	                                </div><!-- //c_room -->
	                                
	                                <div class="c_bed">
	                                    <h5>침대</h5>
	                                    <div class="num_box">
	                                        <button type="button" class="minus_btn">
	                                            <i class="fa-solid fa-minus"></i>
	                                        </button><!-- //minus_btn -->
	                                        <p class="result">
	                                        	<c:if test="${roomInfo.totalBed != null && roomInfo.totalBed ne ''}">
													<input type="number" name="totalBed" min="0" max="999" value="${roomInfo.totalBed }" required="required">			
												</c:if>
												<c:if test="${roomInfo.totalBed == null || roomInfo.totalBed eq ''}">
													<input type="number" name="totalBed" min="0" max="999" value="0" required="required">
												</c:if>
	                                        </p>
	                                        <button type="button" class="plus_btn">
	                                            <i class="fa-solid fa-plus"></i>
	                                        </button><!-- //plus_btn -->
	                                    </div><!-- //num_box -->
	                                </div><!-- //c_bed -->
	                                
	                                <div class="c_bathroom">
	                                    <h5>욕실</h5>
	                                    <div class="num_box">
	                                        <button type="button" class="minus_btn">
	                                            <i class="fa-solid fa-minus"></i>
	                                        </button><!-- //minus_btn -->
	                                        <p class="result">
	                                        	<c:if test="${roomInfo.totalBath != null && roomInfo.totalBath ne ''}">
													<input type="number" name="totalBath" min="0" max="999" value="${roomInfo.totalBath }" required="required">			
												</c:if>
												<c:if test="${roomInfo.totalBath == null || roomInfo.totalBath eq ''}">
													<input type="number" name="totalBath" min="0" max="999" value="0" required="required">
												</c:if>
	                                        </p>
	                                        <button type="button" class="plus_btn">
	                                            <i class="fa-solid fa-plus"></i>
	                                        </button><!-- //plus_btn -->
	                                    </div><!-- //num_box -->
	                                </div><!-- //c_bathroom -->
	                            </div><!-- //op_box -->
	                        </div><!-- //count   -->
	                    </div><!-- //p_right -->
	                </div><!-- page_rolling//page_r1-------------------------------------------- -->
	            </div><!-- //page_move -->
	        </div>
	        <div class="pagenation_box">
	            <button class="next" type="submit" id="btnNext"><span>다음 단계</span></button>
	        </div><!-- //pagenation_box -->
        </form>
    </div><!-- //inner -->
	
	<!-- 카카오 주소 찾기 API -->
	<script>
	    function searchAddress() {
	        new daum.Postcode({
	            onComplete: function(data) {
	                // 팝업에서 검색결과를 클릭했을때 실행할 코드
					
	                // 주소 변수
	                var addr = '';
					
	                // 사용자가 선택한 주소 타입에 따라 해당 주소 값 가져오기
	                if (data.userSelectedType === 'R') { // 도로명 주소를 선택(R)
	                    addr = data.roadAddress;
	                } else { // 지번 주소를 선택(J)
	                    addr = data.jibunAddress;
	                }
					
	                // 선택한 주소를 frontAddress에 값으로 주기
	                $('#frontAddress').val(addr);
	                $('#address').val($('#frontAddress').val() + '^' + $('#detailAddress').val())
	                // 커서 상세주소 필드로 이동
	                $('#detailAddress').focus();
	            }
	        }).open();
	    }
	</script>
	
	<!-- 주소 찾기한 주소와 상세 주소 더하기 -->
	<script type="text/javascript">
		$('#detailAddress').blur(function() {
			$('#address').val($('#frontAddress').val() + '^' + $('#detailAddress').val());
			console.log($('#address').val());
		});
	</script>
	
	<!-- DB에서 가져온 주소 나누기 -->
	<script type="text/javascript">
		$(document).ready(function() {
		    console.log("${roomInfo.originalAddress}");
		    let roomInfo = "${roomInfo.originalAddress}";
		    let array = roomInfo.split("^");
		    let address1 = array[0];
		    let address2 = array[1];
		    
		    console.log(address1);
		    console.log(address2);
		    
			// input 요소에 값 설정
			$('#frontAddress').val(address1);
			$('#detailAddress').val(address2);
			$('#address').val(roomInfo);
			
		    console.log($('#frontAddress').val());
		    console.log($('#detailAddress').val());
		    console.log($('#address').val());
			
		});
	</script>
	
	<!-- 숙소 운영 시작일 날짜 제한 및 Date Range Picker 설정-->
	<script type="text/javascript">
		let today = moment().format("YYYY-MM-DD");

		// Date Range Picker 설정
		$('#roomOperationDate').daterangepicker({
			minDate:today,
		    showDropdowns: true,
		    autoApply: false,
			autoUpdateInput: false,
			locale : {
				"format" : "YYYY-MM-DD",
				"separator" : " ~ ",
				"applyLabel" : "적용",
				"cancelLabel" : "취소",
				"fromLabel" : "From",
				"toLabel" : "To",
				"customRangeLabel" : "Custom",
				"daysOfWeek" : [ "일", "월", "화", "수", "목", "금", "토" ],
				"monthNames" : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ]
			},
		},
		
		// 날짜 선택 시 input에 값 전달
		function(start, end, label) {
			console.log("시작일 : " + start.format('YYYY-MM-DD'));
			console.log("종료일 : " + end.format('YYYY-MM-DD'));
			$('#startDate').val(start.format('YYYY-MM-DD'));
			$('#endDate').val(end.format('YYYY-MM-DD'));
		});
		
		$('#roomOperationDate').on('apply.daterangepicker', function(ev, picker) {
			$(this).val(picker.startDate.format('YYYY-MM-DD') + ' ~ ' + picker.endDate.format('YYYY-MM-DD'));
		});

		$('#roomOperationDate').on('cancel.daterangepicker', function(ev, picker) { 
			$(this).val('');
		});
	</script>
	
	<!-- form 제출 전 주소값 유효성 검사 -->
	<script type="text/javascript">
		$('#btnNext').click(function() {
			console.log('submit 버튼 클릭');
			
			if (!$('input[name="roomcateCode"]:checked').val()) {
                alert('카테고리를 선택해 주세요.');
                return ;
            }
            if (!$('input[name="roomtypeCode"]:checked').val()) {
            	console.log($('input[name="roomtypeCode"]:checked').val());
                alert('숙소 유형을 선택해 주세요.');
                return ;
            }
            
			if ($('#frontAddress').val() == null || $('#frontAddress').val() == '') {
				alert('기본 주소를 입력해주세요');
				$('#frontAddress').focus();
				return ;
			}
			if ($('#detailAddress').val() == null || $('#detailAddress').val() == '') {
				alert('상세 주소를 입력해주세요');
				$('#detailAddress').focus();
				return ;
			}
			
		});
	</script>
</body>
</html>