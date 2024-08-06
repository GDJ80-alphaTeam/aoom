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
    <link rel="stylesheet" href="/style/css/preview.css">
    <link rel="stylesheet" href="/style/css/navSub.css">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
</head>	
<body>
	<jsp:include page="/WEB-INF/view/layout/navbarSub.jsp"></jsp:include>
	<!-- ----------------------------------------------컨텐츠 시작----------------------------------- -->
    <div class="preview inner">
        <h2>숙소 미리 보기</h2>
        <h5>훌륭합니다! <b>숙소 등록 전 세부 정보</b>가 <br>
            올바른지 확인하세요.</h5>
        <span class="gray">
            게스트에게 표시되는 숙소 정보는 다음과 같습니다.
        </span><!-- //gray -->
        <div class="pre_con">
            <div class="p_con_left">
                <div class="pic_box">
                    <img alt="" src="${roomInfo.mainImage }">
                </div><!-- //pic_box -->
                <div class="title">
                    <p>${roomInfo.roomName }</p> 
                    <i class="fas fa-star">신규</i>
                </div><!-- //title -->
                <p class="gray">${roomInfo.address }</p>
            </div><!-- //p_con_left -->
            <div class="p_con_right">
                <h2>세부 정보</h2>
                <ul>
                    <li>
                        <div class="left">
                            <img src="/style/img/pre1.png" alt="${roomInfo.roomName }">
                            <p>숙소 이름 : ${roomInfo.roomName }</p>
                        </div><!-- //left -->
                    </li>
                    <li>
                        <div class="left">
                            <img src="/style/img/pre2.png" alt="${roomInfo.address }">
                            <p>주소 : ${roomInfo.address }</p>
                        </div><!-- //left -->
                    </li>
                    <li>
                        <div class="left">
                            <div class="icon_box">
                                <img src="/style/img/pre3.png" alt="기본 가격">
                            </div>
                            <p>기본 가격 : ${roomInfo.defaultPrice }원</p>
                        </div><!-- //left -->
                    </li>
                    <li>
                        <div class="left">
                            <img src="/style/img/pre4.png" alt="운영일">
                            <p>운영일 : ${roomInfo.startDate } ~ ${roomInfo.endDate }</p>
                        </div><!-- //left -->
                    </li>
                </ul>
            </div><!-- //p_con_right -->
        </div><!-- // pre_con-->
        <div class="pre_btn">
            <div class="btn_right">
                <button type="button" class="prev" onclick="window.location.href='/host/roomManage/registRoom/paymentInfo?roomId=${roomInfo.roomId}';">
	        		<span>이전 단계</span>
	        	</button>
                <button type="button" id="btnFinalRegist" class="next">
					<span>최종 등록</span>
				</button>
            </div><!-- //btn_right -->
        </div><!-- /pre_btn -->
    </div><!-- //preview -->
    <!-- ----------------------------------------------컨텐츠 끝----------------------------------- -->
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/view/layout/footer.jsp"></jsp:include>
	
	<!-- 최종 등록 버튼 클릭 시 이벤트 -->
	<script type="text/javascript">
		$('#btnFinalRegist').click(function() {
			$.ajax({
				url: '/host/roomManage/registRoom/ajaxFinalRegist',
				method: 'post',
				data: {'roomId' : '${roomInfo.roomId}', 'roomstatCode' : 'rst01'},
				success: function(response) {
					if(response.code == 00){
						alert("숙소가 등록되었습니다. 승인을 기다려 주세요!");
		                window.location.href = "/host/roomManage";
					} else if(response.code == 01){
						alert("숙소 등록에 실패하였습니다. 다시 등록해주세요");
					}
				}
			});
		});
	</script>
</body>
</html>