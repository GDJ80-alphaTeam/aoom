<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>메시지</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<body class="container">
	
	<jsp:include page="/WEB-INF/view/layout/navbarSub.jsp"></jsp:include>
	<input type="hidden" id="sendUserId">
	<!--<br>
	<h2>${sessionScope.userInfo.userId}님의 위시리스트</h2>
	<br>-->
	
	<!--<c:forEach var="message" items="${selectList }">
					<h3>${message.userName}<h3>
					<h3>${message.content}<h3>
					<h3>${message.createDate}<h3>
				</c:forEach>-->
	
	<div class="row row-cols-1 row-cols-md-4 g-4">
		
		<c:forEach var="message" items="${selectList }">
					<div style="width:90%; cursor: pointer;" onclick="ajaxMessage('${message.userId}');">
					<h3>${message.userName}<h3>
					<h3>${message.content}<h3>
					<h3>${message.createDate}<h3>
					</div>
				
		</c:forEach>
	</div>
	
	<div class="row row-cols-1 row-cols-md-4 g-4">
			<div class="messageList">				
			</div>
			
									
	</div>
	<div class="inputMessageDiv"></div>
	<!-- 메시지 리스트 보여주기 -->
	<script type="text/javascript">
		function ajaxMessage(sendUserId){
			$("#sendUserId").val(sendUserId); //send쪽 userid 보관
			var receiverUserId = "${userInfo.userId}"; //로그인한 아이디
			$.ajax({
                url: '/message/ajaxMessageUserList',
                method: 'post',
                data: {"sendUserId":sendUserId, "receiverUserId" : receiverUserId},
                dataType: 'json',
                success: function(response) {
					if (response.code == '00') {
					    var selectUserList = response.selectUserList;
					    var html = "";
						var html2 = "";

					    var lastDate = ""; // 마지막 날짜 저장

					    for (var i = 0; i < selectUserList.length; i++) {
					        var user = selectUserList[i];
					        var sender = user.sendUserId;
					        var receiver = user.receiverUserId;
					        var content = user.content; // 메시지 내용 추가											
							var createYmd = user.createYmd;
							var createTime = user.createTime;
							
							// 날짜가 바뀌었을 때만 날짜를 표시
						        if (lastDate !== createYmd) {
						            lastDate = createYmd;
						            html += "<div style='font-weight: bold; text-align: center; margin: 10px 0;'>" + createYmd + "</div>";
						        }
									
					       if(sendUserId == sender){
							 html += "<div style='display:flex; align-items:flex-start; justify-content:flex-end; margin:10px;'><div style='display:flex; align-items:center; width:100%;'><span style='margin-right:10px;'>" + createTime + "</span><div style='flex:1; min-width:200px; background-color:#e1ffc7; padding:10px; border-radius:10px; overflow-wrap:break-word;'>" + content + "</div></div></div>";
						   }else{
							html += "<div style='display:flex; align-items:flex-start; justify-content:flex-start; margin:10px;'><div style='display:flex; align-items:center; width:100%;'><div style='flex:1; min-width:200px; background-color:#f0f0f0; padding:10px; border-radius:10px; overflow-wrap:break-word;'>" + content + "</div><span style='margin-left:10px;'>" + createTime + "</span></div></div>";
						   } 
					    }

					    $(".messageList").html(html);
						
						html2 += '<input type="text" placeholder="메시지를 입력하세요" id="message" name="message" onkeyup="enterkey();"> &nbsp; <input type="button" value="전송" onclick="inputMessage();">';
						$(".inputMessageDiv").html(html2);
					}
                },
                complete: function() {
                    isInitializing = false; // 초기화 완료 표시
                }   
            });
		
		}
		
		function enterkey(){
			if (window.event.keyCode == 13) { // 엔터키가 눌렸을 때
				inputMessage();
			    }
			
		}
		
		function inputMessage(){
			var message = $("#message").val();
			var receiverId = "${userInfo.userId}";
		    var sendId = $("#sendUserId").val();
			$.ajax({
			                url: '/message/ajaxMessageInsert',
			                method: 'post',
			                data: {"message":message, "receiverId":receiverId, "sendId":sendId},
			                dataType: 'json',
			                success: function(response) {
								if (response.code == '00') {
									ajaxMessage(sendId);								 
								}
			                },
			                complete: function() {
			                    isInitializing = false; // 초기화 완료 표시
			                }   
			            });
		}
	</script>
</body>
</html>