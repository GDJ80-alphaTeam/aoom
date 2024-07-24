<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>숙소관리</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body class="container">

	<jsp:include page="/WEB-INF/view/layout/navbarSub.jsp"></jsp:include>
	
	<!-- 호스트 모드 메뉴 -->
	<br>
	<div>
		<a href="/host/main">메인</a>
		<a href="/host/calendar">달력</a>
		<a href="/host/roomManage">숙소 관리</a>
		<a href="#">예약 목록</a>
	</div>
	<br>
	
	<h2>숙소 관리</h2>
	<form action="/host/roomManage/setupRoom" method="post">
		<button type="submit">숙소등록</button>
	</form>
	
	<table class="table">
		<thead>
			<tr>
				<th>숙소 아이디</th>
				<th>숙소</th>
				<th>위치</th>
				<th>상태</th>
				<th>비고</th>
			</tr>
		</thead>	
		<tbody>
			<c:forEach var="room" items="${roomListByUser }">
				<tr>
					<td>
						${room.roomId }
					</td>
					<td>
						<c:if test="${room.mainImage != null && room.mainImage ne ''}">
							<img alt="" src="${room.mainImage }" style="width: 150px; height: 120px;">
						</c:if>
						<c:if test="${room.mainImage == null || room.mainImage eq ''}">
							<img alt="" src="/image/etc/reviewDefault.png" style="width: 150px; height: 120px;">
						</c:if>
					</td>
					<td>${room.address.replace('^', ' ')}</td>
					<c:if test="${room.codeName == '반려'}">
						<td><a href="#">${room.codeName }</a></td>
					</c:if>
					<c:if test="${room.codeName != '반려'}">
						<td>${room.codeName }</td>
					</c:if>
					<td>
						<button type="button" onclick="location.replace('/host/roomManage/registRoom/basicInfo?roomId=${room.roomId}');">수정</button>
						<button type="button" name="BtnDeleteRoom" data-room-id="${room.roomId }">삭제</button>
						<button type="button" name="BtnDisableRoom">비활성화</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<!-- 페이징 총숫자에맞춰서 1~10 ,11~20이런식으로 만들어야됨  -->
	<c:choose>
		<c:when test="${pagingInfo.lastPage == 0 }">
			
		</c:when>
		<c:otherwise>
		  <nav>
		    <ul class="pagination">
		      <li class="page-item">
		      <!-- paging 이전버튼 -->
		        <c:choose>			        
		          <c:when test="${currentPage == 1}">
		            <button class="page-link disabled" type="button">이전</button>
		          </c:when>
		          
		          <c:otherwise>
		            <button class="page-link" type="button" onclick="window.location.href='/host/roomManage?currentPage=${currentPage - 1}'">이전</button>
		          </c:otherwise>
		          
		        </c:choose>
		      </li>
			
				<!-- paging 숫자버튼 -->
		      <c:forEach var="i" begin="1" end="${pagingInfo.lastPage}">
		        <li class="page-item">
		          <c:choose>
		          
		            <c:when test="${currentPage == i}">
		              <button class="page-link active" type="button" onclick="window.location.href='/host/roomManage?currentPage=${i}'">${i}</button>
		            </c:when>
		            
		            <c:otherwise>
		              <button class="page-link " type="button" onclick="window.location.href='/host/roomManage?currentPage=${i}'">${i}</button>
		            </c:otherwise>
		            
		          </c:choose>
		        </li>
		      </c:forEach>
		
				<!-- paging 다음버튼 -->
		      <li class="page-item">
		        <c:choose>
		        
		          <c:when test="${currentPage == pagingInfo.lastPage}">
		            <button class="page-link" type="button" disabled ="disabled">다음</button>
		          </c:when>
		          
		          <c:otherwise>
		            <button class="page-link" type="button" onclick="window.location.href='/host/roomManage?currentPage=${currentPage + 1}'">다음</button>
		          </c:otherwise>
		          
		        </c:choose>
		      </li>
		    </ul>
		  </nav>
		</c:otherwise>
	</c:choose>
	
	<!-- 숙소 삭제 버튼(roomstatCode를 삭제로 변경하는 것, DELETE 아님) -->
	<script type="text/javascript">
	
		$('button[name="BtnDeleteRoom"]').click(function() {
			$.ajax({
				url: '/host/roomManage/ajaxDeleteRoom',
				method: 'post',
				data: {'roomId' : $(this).data('room-id'), 'roomstatCode' : 'rst05'},
				success: function(response) {
					if(response.code == 00){
						alert("숙소가 삭제되었습니다.");
		                window.location.href = "/host/roomManage";
					} else if(response.code == 01){
						alert("숙소가 삭제되지않았습니다. 다시 시도해주세요.");
					}
				}
			});
		});
		
	</script>
</body>
</html>