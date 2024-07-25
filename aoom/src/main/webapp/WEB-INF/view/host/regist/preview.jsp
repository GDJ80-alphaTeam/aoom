<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>숙소 미리보기</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>	
<body class="container">

	<h1>숙소 미리 보기</h1>
	
	<!-- 나가기 버튼 -->
	<div class="d-flex">
		<button id="BtnQuit" class="btn btn-danger ms-auto">나가기</button>
	</div>
	
	<div>
		<table class="table" style="vertical-align: middle; text-align: center;">
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
<%-- 						<fmt:formatDate value="${roomInfo.startDate }" pattern="yyyy/MM/dd"/> ~ --%>
<%-- 						<fmt:formatDate value="${roomInfo.endDate }" pattern="yyyy/MM/dd"/> --%>
					</td>
				</tr>
			</tbody>
		</table>
		
		<!-- 이전페이지 버튼, 최종 등록 -->
		<div class="d-flex">
			<button id="BtnBefore" onclick="window.location.href = '/host/roomManage/registRoom/paymentInfo?roomId=${roomInfo.roomId}';" class="btn btn-secondary ms-auto">이전</button>
			<button id="BtnFinalRegist" class="btn btn-primary">최종 등록</button>
		</div>
		
	</div>
	
	<!-- 나가기 버튼 클릭시 이벤트 -->
	<script type="text/javascript">
		$('#BtnQuit').click(function() {
			if (confirm("나가실 경우 해당 페이지의 내용은 저장 되지않습니다")) {
                window.location.href = "/host/roomManage";
            }
		});	
	</script>
	
	<!-- 최종 등록 버튼 클릭 시 이벤트 -->
	<script type="text/javascript">
		$('#BtnFinalRegist').click(function() {
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