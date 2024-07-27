<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
	
	<jsp:include page="/WEB-INF/view/layout/navbarSub.jsp"></jsp:include>
		
	<div style="width: 1200px;margin: 0 auto; ">
		<h1>프로필</h1>	
		<div style="display: flex;">
			<div style="width: 30%;  ">
				<div class="card" style="width: 18rem;">
					
				  	<img src="${userInfo.userImage}" class="card-img-top" alt="...">
				  
				  <div class="card-body">
				  	<h5 class="card-title">${userInfo.userName}</h5>
				  	<div>
						<c:choose>
							<c:when test="${hostReviewInfo.cnt == 0}">
								아직 받은 후기가 없습니다
							</c:when>
							<c:otherwise>
								후기개수 : ${hostReviewInfo.cnt}
								<br>
								별점 : ${hostReviewInfo.avg}
							</c:otherwise>
						</c:choose>
						<br>
						
						<c:choose>
						    <c:when test="${subPeriod.year == 0}">
						        <c:choose>
						            <c:when test="${subPeriod.month != 0}">
						                가입기간:${subPeriod.month}월
						            </c:when>
						            <c:otherwise>
						                신규 고객입니다!
						            </c:otherwise>
						        </c:choose>
						    </c:when>
						    <c:when test="${subPeriod.year != 0}">
						        가입기간:${subPeriod.year}년
						        <c:choose>
						            <c:when test="${subPeriod.leftMonth != 0}">
						                ${subPeriod.leftMonth}월
						            </c:when>
						        </c:choose>
						    </c:when>
						</c:choose>
					</div>
				
				  </div>
			</div>
			</div>
			
			<div style="width: 70%; display: flex;flex-wrap: wrap;">
			<c:forEach var="p" items="${profile}">
				<div style="width: 50%;  ">
					${p.codeName} : ${p.content} 
				</div>
			</c:forEach>
			</div>
		</div>	
		
		<div style="display: flex ; width: 100%;">
			<div style="width:30%; dispaly:flex">
						<h3>소개말</h3>
					    <c:choose>
					    	<c:when test="${profileContent.content == null || profileContent.content == ''}">
					    		소개글을 작성해주세요!
					    	</c:when>
					    	<c:otherwise>
					    		<p>${profileContent.content}</p>
					    	</c:otherwise>
					    </c:choose>
			</div>
		
			<div style="width:70%; display:flex">
				
				<div style="flex-wrap: wrap; margin-bottom:100px; display: flex;">
					<c:forEach var="r" items="${reviewList.review}" varStatus="status">
						<div style="width: 45%; margin-right: 30px;margin-bottom: 30px;display: flex;">
							<div style="height: 150px ;width: 20%;">										
								<img id="reviewImg${status.count}"  src="${r.reviewImage}" style="width:100%;height:50%;"onerror="this.style.display='none'">
								<img id="userImg${status.count}"  src="${r.userImage}" style="width:100%;height:50%;"onerror="this.style.display='none'">
							</div>						
							<div style="width: 80%" id="reviewContent${status.count}">
								${r.reviewContent}
							</div>
						</div>
					</c:forEach>			
				</div>		
				<!-- 페이징 총숫자에맞춰서 1~10 ,11~20이런식으로 만들어야됨  -->
				<c:choose>
					<c:when test="${reviewPagingInfo.lastPage == 0 }">
						
					</c:when>
					<c:otherwise>
					  <nav>
					    <ul class="pagination">
					      <li class="page-item">
					      <!-- paging 이전버튼 -->
					        <c:choose>			        
					          <c:when test="${reviewList.currentPage == 1}">
					            <button class="page-link disabled" type="button" id="previous">이전</button>
					          </c:when>
					          
					          <c:otherwise>
					            <button class="page-link" type="button" id="previous">이전</button>
					          </c:otherwise>
					          
					        </c:choose>
					      </li>
						
							<!-- paging 숫자버튼 -->
					      <c:forEach var="i" begin="1" end="${reviewPagingInfo.lastPage}">
					        <li class="page-item">
					          <c:choose>
					          
					            <c:when test="${reviewList.currentPage == i}">
					              <button class="page-link active" type="button" id="page${i}" value="${i}">${i}</button>
					            </c:when>
					            
					            <c:otherwise>
					              <button class="page-link " type="button" id="page${i}" value="${i}">${i}</button>
					            </c:otherwise>
					            
					          </c:choose>
					        </li>
					      </c:forEach>
					
							<!-- paging 다음버튼 -->
					      <li class="page-item">
					        <c:choose>
					        
					          <c:when test="${reviewList.currentPage == reviewPagingInfo.lastPage}">
					            <button class="page-link" type="button" id="next" disabled ="disabled">다음</button>
					          </c:when>
					          
					          <c:otherwise>
					            <button class="page-link" type="button" id="next">다음</button>
					          </c:otherwise>
					          
					        </c:choose>
					      </li>
					    </ul>
					  </nav>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	
	  
			   
				  
</body>

	<script type="text/javascript">
		<!-- 페이징 -->
	 	// currentPage는 변경가능해야함 , lastPage는 중간에 리뷰가 추가될수있음
	  	let currentPage = parseInt("${reviewList.currentPage}");
	 	console.log(currentPage);
	  	let lastPage = parseInt("${reviewPagingInfo.lastPage}");
	  	const roomId = "${roomInfo.roomId}";
	  	
								// id가 page로 시작하는 모든태그 
		$(document).on('click', '[id^="page"], #previous, #next', function() {
			let page = currentPage;
		  		
			
			// 페이지 번호 클릭 this = 위에 on.click된 것들중 클릭이벤트가 일나면
		    if (this.id.startsWith('page')) {
		    	// page에 클릭한 페이지 값 입력 , String으로 오기때문에 변환해줘야함
		      	page = parseInt($(this).val());
		    	
		    	// 모든 번호페이지의 active상태 제거
		      	$(".page-link.active").removeClass("active");
		    	// 선택한 번호페이지의 active 추가
		      	$(this).addClass("active")
		      	
		      	// 숫자가 선택되었을때 다음버튼과 이전버튼의 disabled 비활성화
		      	$('#previous').removeClass("disabled");
		      	$('#next').removeClass("disabled");
		      
		      	// 이전 and 다음 버튼 비활성화 page값에따라 처리
		      	if(page == 1){
		    		$('#previous').addClass("disabled");
		      	}
		      	if(page == lastPage){
		    		$('#next').addClass("disabled");
		      	}
		      
		    }
	
		    // 이전 버튼 클릭
		    if (this.id == 'previous' && currentPage > 1) {
		      
		    	// 이전 active상태 삭제
		      	$('#page'+page).removeClass("active");		      		    	
		    	page = currentPage - 1;
		    	// 다음 버튼 active 상태 활성  
		      	$('#page'+page).addClass("active");
		      
		      	
		      	$('#previous').removeClass("disabled");
		      	$('#next').removeClass("disabled");
		      
		      	// 이전버튼 비활성화
		      	if(page == 1){
		    		  $('#previous').addClass("disabled");
		      	}
		    }
	
		    // 다음 버튼 클릭
		    if (this.id == 'next' && currentPage < lastPage) {
		    	
		   		$('#page'+page).removeClass("active");			    	
		      	page = currentPage + 1;
		      	$('#page'+page).addClass("active");
		      
		      	
		      	$('#previous').removeClass("disabled");
		      	$('#next').removeClass("disabled");
		     	
		      	// 다음버튼 비활성화		        
		      	if(page == lastPage){
		    		  $('#next').addClass("disabled");
		      	}
		   }
				// page의 값에 변동이 생기면 ajax호출 
		    if (page !== currentPage) {
		    	reloadReivew(page);
		    }	
			
		})
		
		// ajax 호출 : 
		function reloadReivew(page){
			
			$.ajax({
				url:"/review/ajaxProfileReviewPaging",
				method:"post",
				data: {"currentPage": page , "userId":"${userInfo.userId}"},
				success: function(response){
					if(response.code == 00){
						$('[id^="reviewContent"]').empty();
						$('[id^="reviewImg"]').attr('src','');
						$('[id^="userImg"]').attr('src','');
						// onError일때 display가 none이된후 사라지지않음 그래서 다시 block처리후 src가없으면 다시 none으로 변경
						$('[id^="reviewImg"]').css('display','block');
						$('[id^="userImg"]').css('display','block');
						// currentpage값 바꿔줌
						currentPage = page;
											
						// id의값은 1부터 시작 , list는 [0]부터 시작함 그래서 response -1
						for (let i = 1; i < response.data.review.length+1; i++) {
							$('#reviewContent'+i).append(response.data.review[i-1].reviewContent);
							$('#reviewImg'+i).attr('src',response.data.review[i-1].reviewImage); // reviewImgUrl이 response에 포함되어 있다고 가정함
			                $('#userImg'+i).attr('src',response.data.review[i-1].userImage); // userImgUrl이 response에 포함되어 있다고 가정함
			                
						}					
					} else if(response.code == 01){
						alert('후기를불러오는데 실패하였습니다.')
					}
				}
			})
		}
	</script>
</html>