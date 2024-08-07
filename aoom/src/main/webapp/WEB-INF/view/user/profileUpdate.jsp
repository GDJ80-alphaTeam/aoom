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
<link rel="stylesheet" href="/style/css/navSub.css">
<link rel="stylesheet" href="/style/css/common.css">
<script src="/style/js/navbarSub.js" defer></script>
</head>
<body class="container">
	<jsp:include page="/WEB-INF/view/layout/navbarSub.jsp"></jsp:include>
	
	<div style="width: 1200px; margin: 0 auto;">
		<div style="width: 100%;">
			<h1>프로필업데이트</h1>
			<div style="display: flex; flex-wrap: flex">
			
				<div style="width: 30%">
					<div style="display: inline-block;" id="imgLabel">
						<div style="display: inline-block; position: relative;">
						
							<label for="reviewImage">
								<img src="${userInfo.userImage}" style="width: 300px; height: 300px; display: block;" id="reviewImageFile"> 
								
							</label>
						 
						</div>
					</div>
				</div>
				
				<div style="width: 70% ; display: flex; flex-wrap: wrap" >
					
					<!-- 내용이 있으면 표시해줘야해서 중첩됨 -->
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
			<h3>${introduceContent.codeName}</h3>
				
				<div id="introductionContent">
					<c:choose>
				        <c:when test="${profile == null || profile.isEmpty()}">
				            
				                소개글을 작성해보세요!
				        </c:when>
				        <c:otherwise>
				            <c:forEach var="p" items="${profile}">
				                <c:if test="${p.codeKey == 'pfi09'}">
				                
				                    <c:if test="${p.content != null && p.content != ''}">
				                        ${p.content}
				                    </c:if>
				                    
				                    <c:if test="${p.content == null || p.content == ''}">
				                        소개글을 작성해보세요!
				                    </c:if>
				                </c:if>
				            </c:forEach>
				        </c:otherwise>
				    </c:choose>
				</div>
				
					<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" id="updateBtn" value="${introduceContent.codeKey}">
					
						입력하기
					</button>
					
					
			
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
		        로딩중입니다 잠시만기다려주세요.
		      </div>
		      
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-primary" id="profileUpdateBtn">변경</button>
		        <input type="hidden" id="codeKey" name="codeKey">
		      </div>
		      
		    </div>
		  </div>
		</div>
	</form>
		<!-- 새로운 모달 -->
	<form id="profileImgUpdate" enctype="multipart/form-data">
	    <div class="modal fade" id="imgUpdateModal" tabindex="-1" aria-labelledby="imgUpdateModal" aria-hidden="true">
	        <div class="modal-dialog">
	            <div class="modal-content">
	                <div class="modal-header" id="imgUpdateModalContent">
	                    프로필 이미지 수정
	                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                </div>
	
	                <div class="modal-body" id="imgUpdateModalContent">
	                	<div>미리보기</div>
	                	<div style="display: inline-block; position: relative;">
		                	<label for="reviewImageModal">
		                		<button type="button" class="btn-close" id="profileImageRemove" style="position: absolute; top: 0; right: 0;"></button>
			                	<img src="${userInfo.userImage}" style="width: 300px; height: 300px; display: block;" id="reviewImageFileModal">
			                    <input type="file" id="reviewImageModal" name="profileImage" accept="image/*" style="display: none;">
		                    </label>
	                    </div>
	                </div>
	
	                <div class="modal-footer">
	                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	                    <button type="button" class="btn btn-primary" id="profileImgUpdateBtn">프로필 이미지 변경</button>
	                    <input type="hidden" name="userId" value="${userInfo.userId}">
	                    <input type="hidden" name="deleteImage" value="${userInfo.userImage}">
	                </div>
	
	            </div>
	        </div>
	    </div>
	</form>
	
</body>

	<script>
	
		//미리 보기 기능 - 메인이미지
		$('#reviewImageModal').on('change', function() {
			const imageSrc = URL.createObjectURL(this.files[0]);
			$('#reviewImageFileModal').attr('src', imageSrc);
			
		});
		
		// 바깥 프로필 사진 클릭했을때
		$('#imgLabel').on('click', function(event) {
            $('#imgUpdateModal').modal('show'); // 모달 호출
        });
		
		// 이미지 제거
		$('#profileImageRemove').click(function() {
			$('#reviewImageModal').val("");
			$('#reviewImageFileModal').attr('src', "/image/etc/userDefault.png");
		}); 
		
		let updateTarget = null;
		let profileContent = null;
		
		
		// 모달버튼 클릭시 ajax호출후 내용변경
		$('[id^="updateBtn"]').click(function(){
			
			updateTarget = $(this).val();
			console.log(updateTarget);
			//ajax
			contentCall();
		});
		
		// 프로필 세부내용 서브밋 버튼 눌렀을때
		$('#profileUpdateBtn').click(function(){
			//ajax
			updateContent();
		});
		
		// 프로필 이미지변경 버튼 눌렀을떄
		$('#profileImgUpdateBtn').click(function(){
			//ajax
			profileImgUpdate();
		});
		
		// 프로필 이미지 업데이트
		function profileImgUpdate(){
			
			let formData = new FormData($('#profileImgUpdate')[0]);
			$.ajax({
		        url: "/user/ajaxUserImageUpdate", // 파일 업로드를 처리할 서버 엔드포인트
		        method: "POST",
		        data: formData,
		        contentType: false, // 기본 콘텐츠 타입을 자동으로 설정합니다.
		        processData: false, // 데이터가 URL 인코딩되지 않도록 설정합니다.
		        success: function(response){
		            console.log("프로필 이미지 업데이트 성공:", response);
		            // 추가적인 성공 처리 로직을 여기에 추가할 수 있습니다.
		            $('#imgUpdateModal').modal('hide');
		            alert("변경사항은 재접속후 적용됩니다.");
		            $('#reviewImageFileModal').attr('src', response.data);
		            $('#reviewImageFile').attr('src', response.data);
		            
		        }
		      
		    });
		}
		
		
		// 모달버튼 누를씨 데이터 호출후 업데이트 
		function contentCall(){
			$.ajax({
				url:"/user/ajaxProfileInfo",
				method:"post",
				data: {"codeKey": updateTarget , "userId":"${userInfo.userId}"},
				success: function(response){
					// data를 지정하지않으면 undefined가 출력됨
					let dataContent = "";			
					if(response.data.content != null){
						dataContent = response.data.content
					}
					
					// 프로필 내용을 수정하기 위해 버튼 클릭시 , 클릭한 버튼에 맞는 데이터를 가져온후 modal 창을 업데이트,
					if(response.code == '00'){
							
						let profileContent = response.data.codeDesc+'<br>'+'<textarea rows="10" cols="50" name="content">'+dataContent+'</textarea>';
						if(response.data.codeKey != 'pfi09'){
							profileContent = response.data.codeDesc+'<br>'+'<input type="text" name="content" value="'+dataContent+'">';		
						}
						
						$('#updateContent').empty();
						$('#updateContent').append(profileContent);
						
						$('#updateTitle').empty();
						let updateTitle = response.data.codeName+'<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>'; 
						$('#updateTitle').append(updateTitle);
						
						$('#codeKey').val(response.data.codeKey);
					} else if(response.code == '01') {
						
						let profileContent = response.data.codeDesc+'<br>'+'<textarea rows="10" cols="50" name="content">'+dataContent+'</textarea>'
						if(response.data.codeKey != 'pfi09'){
							profileContent = response.data.codeDesc+'<br>'+'<input type="text" name="content" value="'+dataContent+'">';		
						}
						$('#updateContent').empty();
						$('#updateContent').append(profileContent);

						$('#updateTitle').empty();
						let updateTitle = response.data.codeName+'<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>';
						$('#updateTitle').append(updateTitle);
						
						$('#codeKey').val(response.data.codeKey);
					}
				}
			
			});
		}
		
		// 모달버튼 에서 폼 제출시		
		function updateContent(){
			$.ajax({
				url:"/user/ajaxProfileUpdate",
				method:"post",
				data: $("#updateProfileContent").serialize() + "&userId=" + encodeURIComponent("${userInfo.userId}"),
				success: function(response){
					alert('성공적으로 변경되었습니다.')
					console.log(response);
					$('#exampleModal').modal('hide');
					
					// 업데이트된 프로필요소의 버튼을 찾아서 바뀐값으로 업데이트해줘야함
					$('[id^="updateBtn"]').each(function() {
			             // 현재 요소의 값 
			             let value = this.value;
			             console.log(response.data.code.codeKey);
			             console.log(typeof response.data.code.codeKey);
			             // 값확인 + 소개글이 아닐경우실행
			             if (value == response.data.code.codeKey && value != "pfi09") {
			                 // 내용 채워넣기
			            	 $(this).text(response.data.code.codeName+":"+response.data.profile.content);
			             } 
			             
			             if (value == response.data.code.codeKey && value == "pfi09"){
			            	 $('#introductionContent').text(response.data.profile.content);		
			            	 
			             }
			             
			         });
				}
			});
		}; 			
		
		
		
		// 모달창에서 엔터키를 누르면 오류가 발생, 엔터키 입력하면 제출버튼 클릭되게변경
		$('#exampleModal').on('keydown', 'input, textarea', function(event) {
	        if (event.key === "Enter") {
	            event.preventDefault();
	            $('#profileUpdateBtn').click(); // 엔터키 입력 시 버튼 클릭
	        }
	    });
		
	</script>
</html>