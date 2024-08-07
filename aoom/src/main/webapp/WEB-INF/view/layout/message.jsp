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
</head>
<body>

	<div class="message_bg" id="messageModal"><!-- 메세지 모달 -->
	
	    <div class="message_modal">
	        <div class="message_modal_t">
	            <i class="fa-solid fa-xmark" id="messageModalCloseLittle"></i>
	            <p>대화시작하기</p>
	        </div><!--// log_in_t -->
	        
            <div style="text-align: center ; margin-top: 30px; margin-bottom: 30px;">
            	<c:if test="${roomInfo.userName != null}">
            		${roomInfo.userName}님에게 메세지보내기
            	</c:if>
            	<br>
				<input type="text" placeholder="메세지를입력해주세요" required="required" style="height:30px;background-color:#fff;"name="message">            	
            </div>
            <form action="/message/ajaxMessageInsert" method="post">
	            <div class="message_modal_b">
		           	<button type="submit">대화시작하기</button>
		            <button class="cancel_button" id="messageModalCloseBtn">취소하기</button>
	            </div>
		           	<input type="hidden" name="sendId" value="${sessionScope.userInfo.userId}">
		           	<input type="hidden" name="receiverId" value="${roomInfo.userName}">
		           	<input type="hidden" name="checkStart" value="1">
			</form>	           	            
	        <!-- 보낸이 , 받는이 , 메세지 , sysdate -->
	    </div><!-- //log_in -->
	</div><!-- //log_in_bg -->
	
</body>

<script>

	document.addEventListener('DOMContentLoaded', function () {
		
	    document.querySelector('#messageStart').addEventListener('click', function () {
	    	
	    	document.querySelector('#messageModal').style.display = 'flex';
	    });
	    
	    document.querySelector('#messageModalCloseLittle').addEventListener('click', function () {
	        document.querySelector('#messageModal').style.display = 'none';
	    });
	    document.querySelector('#messageModalCloseBtn').addEventListener('click', function () {
	        document.querySelector('#messageModal').style.display = 'none';
	    });
	    
	});
	document.querySelector('.log_in .log_in_t i').addEventListener('click', function () {
        document.querySelector('.log_in_bg').style.display = 'none';
    });
	
</script>
</html>