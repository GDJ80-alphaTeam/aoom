<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>

	<jsp:include page="/WEB-INF/view/layout/navbarSub.jsp"></jsp:include>
	<h1>예약상세보기</h1>
	<div style="width: 1200px;">
		<div>
			가격${bookingInfo.onedayPrice}
		</div>
		<div>
			주소${bookingInfo.address} 
		</div>
		<div>
			숙소이름${bookingInfo.roomName} 
		</div>
		<div>
			체크인날짜${bookingInfo.startDate} 
		</div>
		<div>
			체크아웃날짜${bookingInfo.endDate} 
		</div>
		대표사진:
		<img src="${bookingInfo.mainImage}">
		<div>
			
			예약번호:${bookingInfo.bookingId}
		</div>
	</div>
</body>
</html>