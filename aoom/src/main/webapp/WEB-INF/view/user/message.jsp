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
    <title>메시지</title>
    <script src="https://kit.fontawesome.com/82b4a4fcad.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="/style/js/navbarSub.js" defer></script>

    <link rel="stylesheet" href="/style/css/common.css">
    <link rel="stylesheet" href="/style/css/navSub.css">
    <link rel="stylesheet" href="/style/css/message.css">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    
</head>
<body>
	
	<jsp:include page="/WEB-INF/view/layout/navbarSub.jsp"></jsp:include>
	
	<div class="inner">
		<input type="hidden" id="sendUserId">
		
		<div class="msg">
			<div class="msg-l">
				<c:forEach var="message" items="${selectList }">
					<div class="msg_summary" onclick="ajaxMessage(this,'${message.userId}');">
						<div class="sender_img">
							<img alt="" src="${message.userImage }">
						</div>
						
						<div class="sender_con">
							<div class="con_top">
								<h3>${message.userName}</h3>
								<h5>${message.createDate}</h5>						
							</div>
							<div class="con_bottom">
								<h3>${message.content}</h3>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			
			<div class="msg-r">
				<div class="messageList"></div>
				<div class="inputMessageDiv"></div>
			</div>
		</div>
	</div>
	
	<!-- 메시지 리스트 보여주기 -->
	<script type="text/javascript">
		function ajaxMessage(element, sendUserId){
			$("#sendUserId").val(sendUserId); //send쪽 userid 보관
			let receiverUserId = "${userInfo.userId}"; //로그인한 아이디
			
		    $(".msg_summary").removeClass("active");
		    $(element).addClass("active");
		    
			$.ajax({
                url: '/message/ajaxMessageUserList',
                method: 'post',
                data: {"sendUserId":sendUserId, "receiverUserId" : receiverUserId},
                dataType: 'json',
                success: function(response) {
                	
					if (response.code == '00') {
						let selectUserList = response.selectUserList;
						let html = "";
						let html2 = "";
			
						let lastDate = ""; // 마지막 날짜 저장
			
						for (let i = 0; i < selectUserList.length; i++) {
							let user = selectUserList[i];
							let sender = user.sendUserId;
							let receiver = user.receiverUserId;
							let content = user.content; // 메시지 내용 추가											
							let createYmd = user.createYmd;
							let createTime = user.createTime;
							
							// 날짜가 바뀌었을 때만 날짜를 표시
							if (lastDate !== createYmd) {
								lastDate = createYmd;
								html += "<div style='font-weight: bold; text-align: center; margin: 10px 0;'>"
										+ createYmd 
										+ "</div>";
							}

							if (sendUserId != sender) {
								html += " <div style='display:flex; align-items:flex-start; justify-content:flex-end; margin:10px;'>"
											+ "<div style='display:flex; align-items:center; width:100%;'>"
												+ "<span style='margin-right:10px;'>"
													+ createTime
												+ "</span>"
												+ "<div style='flex:1; min-width:200px; background-color:#FFB558; padding:10px; border-radius:10px; overflow-wrap:break-word;'>"
													+ content
												+ "</div>"
											+ "</div>"
										+ "</div>";
							} else {
								html += "<div style='display:flex; align-items:flex-start; justify-content:flex-start; margin:10px;'>"
											+ "<div style='display:flex; align-items:center; width:100%;'>"
												+ "<div style='flex:1; min-width:200px; background-color:#f0f0f0; padding:10px; border-radius:10px; overflow-wrap:break-word;'>"
													+ content
												+ "</div>"
												+ "<span style='margin-left:10px;'>"
													+ createTime
												+ "</span>"
											+ "</div>"
										+ "</div>";
							}
						}

						$(".messageList").html(html);

						html2 += '<input type="text" placeholder="메시지를 입력하세요" id="message" name="message" onkeyup="enterkey();">'
								+ '<button type="button" onclick="inputMessage();">전송</button>';
						$(".inputMessageDiv").html(html2);
						
						scrollToBottom();
					}
				},
				complete : function() {
					isInitializing = false; // 초기화 완료 표시
				}
			});
			
		}

		function enterkey() {
			if (window.event.keyCode == 13) { // 엔터키가 눌렸을 때
				inputMessage();
			}
		}

		function inputMessage() {
			let message = $("#message").val();
			let receiverId =$("#sendUserId").val();
			let sendId = '${userInfo.userId}';
			if(message == '') {
				alert("메시지를 입력해주세요");
				return false;
			}
			$.ajax({
				url : '/message/ajaxMessageInsert',
				method : 'post',
				data : {
					"message" : message,
					"receiverId" : receiverId,
					"sendId" : sendId
				},
				dataType : 'json',
				success : function(response) {
					if (response.code == '00') {
						console.log(sendId);
						ajaxMessage($('.msg_summary.active'), receiverId);
// 						window.location.href='/message/messageList';
					}
				},
				complete : function() {
					isInitializing = false; // 초기화 완료 표시
				}
			});
		}
		
		function scrollToBottom() {
		    const messageList = document.querySelector('.messageList');
		    messageList.scrollTop = messageList.scrollHeight;
		}
	</script>
</body>
</html>