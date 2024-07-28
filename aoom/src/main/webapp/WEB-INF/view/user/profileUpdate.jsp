<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/layout/navbarSub.jsp"></jsp:include>
	
	<div style="width: 1200px; margin: 0 auto;">
		<div style="width: 100%;">
			<h1>프로필업데이트</h1>
			<div style="display: flex; flex-wrap: flex">
			
				<div style="width: 30%">
					<div style="display: inline-block;">
						<div style="display: inline-block; position: relative;">
						<button type="button" class="btn-close" id="reviewImageRemove" style="position: absolute; top: 0; right: 0;"></button>
						<label for="reviewImage">
							<img src="${userInfo.userImage}" style="width: 300px; height: 300px; display: block;" id="reviewImageFile"> 
							<input type="file" id="reviewImage" name="reviewImage" accept="image/*" style="display: none;">
						</label> 
						</div>
					</div>
				</div>
				
				<div style="width: 70% ; display: flex; flex-wrap: wrap" >
					
				
					<c:forEach var="ps" items="${profileList}" varStatus="status">
						<div style="width: 50%;">
							<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" id="updateBtn${status.index}" value="${ps.codeKey}">
								${ps.codeName}: 
									<c:forEach var="p" items="${profile}">
										<c:if test="${p.content != null && p.codeKey == ps.codeKey}">
											${p.content}
										</c:if>
									</c:forEach>
							</button> 
						</div>
					</c:forEach>
				</div>
			
			</div>
		</div>	
	</div>
	
	<!-- Modal -->
	<form id="updateProfileContent">
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header" id="updateTitle">
		      
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      
		      <div class="modal-body" id="updateContent">
		        내용 test
		      </div>
		      
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-primary" id="profileUpdateBtn">변경</button>
		      </div>
		      
		    </div>
		  </div>
		</div>
	</form>
		
</body>

	<script>
	
		//미리 보기 기능 - 메인이미지
		$('#reviewImage').on('change', function() {
			const imageSrc = URL.createObjectURL(this.files[0]);
			$('#reviewImageFile').attr('src', imageSrc);
		});
		
		// 이미지 제거
		$('#reviewImage').click(function() {
			$('#reviewImage').val("");
			$('#reviewImageFile').attr('src', "/image/etc/imageUploadIcon.png");
		});
		
		 
		let updateTarget = null;
		let profileContent = null;
		
		
		// 모달버튼 클릭시 ajax호출후 내용변경
		$('[id^="updateBtn"]').click(function(){
			
			updateTarget = $(this).val();
			console.log(updateTarget);
			contentCall();
		})
		
		// 서브밋 버튼 눌렀을때
		$('#profileUpdateBtn').click(function(){
				
			console.log("test");
			updateContent();
			
		})
		
		// 모달버튼 누를씨 데이터 호출후 업데이트 
		function contentCall(){
			$.ajax({
				url:"/user/ajaxProfileInfo",
				method:"post",
				data: {"codeKey": updateTarget , "userId":"${userInfo.userId}"},
				success: function(response){
					
					if(response.code == '00'){
						
						let profileContent = response.data.codeDesc+'<br>'+'<input type="text" value="'+response.data.content+'">';
						$('#updateContent').empty();
						$('#updateContent').append(profileContent);
						
						$('#updateTitle').empty();
						let updateTitle = response.data.codeName+'<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>' 
						$('#updateTitle').append(updateTitle);
					} else if(response.code == '01') {
						console.log(response);
						$('#updateContent').empty();
						let profileContent = response.data.codeDesc+'<br>'+'<input type="text">';
						$('#updateContent').append(profileContent);

						$('#updateTitle').empty();
						let updateTitle = response.data.codeName+'<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>'
						$('#updateTitle').append(updateTitle);
						
					}
				}
			
			});
		// 모달버튼 에서 폼 제출시		
		function updateContent(){
			$.ajax({
				url:"/user/ajaxProfileUpdate",
				method:"post",
				data: {"userId":"${userInfo.userId}" , "updateContents" : $("#updateProfileContent").serialize()},
				success: function(response){
					
				}
			})
		} 			
			
		}
	</script>
</html>