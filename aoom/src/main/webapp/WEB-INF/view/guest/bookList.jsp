<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예약목록</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>

<jsp:include page="/WEB-INF/view/layout/navbarSub.jsp"></jsp:include>
	
	<div style="margin: 0 auto; width: 1500px">
		<h1>예약목록 페이지</h1>
	
		<table class="table">
			<thead>
				<tr>
					<th>예약번호</th>
					<th>숙소이름</th>
					<th>예약 일자</th>
					<th>호스트</th>
					<th>대표사진</th>
					<th>예약상태</th>
					<th>결제상태</th>
					<th>비고(환불상태)</th>
				</tr>
			</thead>	
			<tbody>
			<c:forEach var="b" items="${bookingList}">
				<tr>
					<td>
						<a href="/guest/bookInfo?bookingId=${b.bookingId}">
							${b.bookingId}
						</a>
					</td>
					<td>
						<a href="/room/roomInfo?roomId=${b.roomId}">
						${b.roomName}
						</a>
					</td>
					<td>${b.checkIn} ~ ${b.checkOut}</td>
					<td>${b.hostId}</td>
					
					<td>
						<a href="/guest/bookInfo?bookingId=${b.bookingId}">
							<img src="${b.mainImage}" style="height: 50px;">
						</a>
					</td>
					<td> ${b.bookstatName}</td>
					<td>${b.paystatName}</td>
					<td>
						<c:choose>
							<c:when test="${b.bookstatCode eq 'bst01' ||b.bookstatCode eq 'bst02'}">
						
								<button onclick="window.location.href='/booking/bookingCancel?bookingId=${b.bookingId}'">
									예약취소하기
								</button>
						
							</c:when>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		
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
	        	    <button class="page-link" type="button" onclick="window.location.href='/guest/bookList?currentPage=${currentPage - 1}'">이전</button>
		          </c:otherwise>
		          
		        </c:choose>
		      </li>
			
				<!-- paging 숫자버튼 -->
		      <c:forEach var="i" begin="1" end="${pagingInfo.lastPage}">
		        <li class="page-item">
		          <c:choose>
		          
		            <c:when test="${currentPage == i}">
		              <button class="page-link active" type="button" onclick="window.location.href='/guest/bookList?currentPage=${i}'">${i}</button>
		            </c:when>
		            
		            <c:otherwise>
		              <button class="page-link " type="button" onclick="window.location.href='/guest/bookList?currentPage=${i}'">${i}</button>
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
		            <button class="page-link" type="button" onclick="window.location.href='/guest/bookList?currentPage=${currentPage + 1}'">다음</button>
		          </c:otherwise>		          
		        </c:choose>
		      </li>
		    </ul>
		  </nav>
		</c:otherwise>
	</c:choose>
	
	</div>
</body>
</html>