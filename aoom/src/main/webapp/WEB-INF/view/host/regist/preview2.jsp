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
	                <div class="page_rolling page_r3" style="height: 416px;">
	                    <table style="vertical-align: middle; text-align: center; width: 100%;">
							<thead>
								<tr>
									<td>메인 이미지</td>
									<td>숙소 이름</td>
									<td>주소</td>
									<td>기본가</td>
									<td>운영일</td>
								</tr>
							</thead>
							
							<tbody>
								<tr>
									<td>
										<img alt="" src="${roomInfo.mainImage }" style="width: 300px; height: 300px;">
									</td>
									<td>${roomInfo.roomName }</td>
									<td>${roomInfo.address }</td>
									<td>${roomInfo.defaultPrice }원</td>
									<td>
										${roomInfo.startDate } ~ ${roomInfo.endDate }
									</td>
								</tr>
							</tbody>
						</table>
	                </div><!-- page_rolling//page_r3 -->
	            </div><!-- //page_move -->
	        </div>
	        <div class="pagenation_box">
		        <button type="button" class="prev" onclick="window.location.href='/host/roomManage/registRoom/paymentInfo?roomId=${roomInfo.roomId}';">
	        		<span>이전 단계</span>
	        	</button>
				<button type="button" id="btnFinalRegist" class="next">
					<span>최종 등록</span>
				</button>
	        </div><!-- //pagenation_box -->
        </form>
    </div><!-- //inner -->
	
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