let updateTarget = null;
let profileContent = null;
		
$(document).ready(function () {
	
    $('[id^="pfi"]').click(function(){
		console.log("ok");
		$('#updateModal').addClass('on')
		updateTarget = $(this).data('value');
		console.log(updateTarget);
		contentCall();
			
		});
		
    $('.user_main .u_m_right .u_modal .m_bg .m_top i.fa-times').on('click',(function (event) {
        event.stopPropagation(); // 클릭 이벤트가 상위 요소로 전파되는 것을 막음
        $(this).closest('.u_modal').removeClass('on');
    }))
    
    // 프로필 세부내용 서브밋 버튼 눌렀을때
	$('#profileUpdateBtn').click(function(){
		console.log("실행test");
		//ajax
		updateContent();
		$('#updateModal').removeClass('on');
	});

});


// 모달버튼 누를씨 데이터 호출후 업데이트 
function contentCall(){
	$.ajax({
		url:"/user/ajaxProfileInfo",
		method:"post",
		data: {"codeKey": updateTarget , "userId": userId},
		success: function(response){
			// data를 지정하지않으면 undefined가 출력됨
			let dataContent = "";			
			if(response.data.content != null){
				dataContent = response.data.content
			}
			
			let profileContent = `
				<div class="m_contents" id="updateContent">
				    <div class="title">
				        
				        <div class="title">
				            <h2>${response.data.codeName}</h2>
				            <span class="gray">${response.data.codeDesc}</span>
				        </div>
				        <div class="con">
				            ${inputTypeSelect(response.data.codeKey, dataContent)}
				        </div>
				    </div>
				</div>`;
				
			// 프로필 내용을 수정하기 위해 버튼 클릭시 , 클릭한 버튼에 맞는 데이터를 가져온후 modal 창을 업데이트,
			if(response.code == '00'){
				
				$('#updateContent').empty();
				$('#updateContent').append(profileContent);
				$('#codeKey').val(response.data.codeKey);
				
			} else if(response.code == '01') {
				
				$('#updateContent').empty();
				$('#updateContent').append(profileContent);
				$('#codeKey').val(response.data.codeKey);
			}
		}
	
	});
} 		

function inputTypeSelect(codeKey, dataContent) {
    if (codeKey === 'pfi09') {
        return `<textarea name="content">${dataContent}</textarea>`;
    } else {
        return `<input type="text" name="content" value="${dataContent}">`;
    }
}

function updateImage(proitemCode) {
    return imageMap[proitemCode] || '/style/img/default.png'; 
}		

const imageMap = {
	'pfi01': '/style/img/pu_3.png',
    'pfi02': '/style/img/pu_4.png',
    'pfi03': '/style/img/pu_5.png',
    'pfi04': '/style/img/pu_6.png',
    'pfi05': '/style/img/pu_7.png',
    'pfi06': '/style/img/pu_8.png',
    'pfi07': '/style/img/pu_9.png',
    'pfi08': '/style/img/pu_10.png',
    // 다른 proitemCode에 대한 매핑 추가
};
		
// 모달버튼 에서 폼 제출시		
		function updateContent(){
			$.ajax({
				url:"/user/ajaxProfileUpdate",
				method:"post",
				data: $("#updateProfileContent").serialize() + "&userId=" + encodeURIComponent(userId),
				success: function(response){
					console.log(response);
					
					if(response.code == '00'){
					alert('성공적으로 변경되었습니다.')
					// 업데이트된 프로필요소의 버튼을 찾아서 바뀐값으로 업데이트해줘야함
					$('[id^="pfi"]').each(function() {
			             // 현재 요소의 값 
			             let value = this.id;
			             let imgSrc = updateImage(response.data.code.codeKey);
			             // 값확인 + 소개글이 아닐경우실행
			             if (value == response.data.code.codeKey && value != "pfi09") {
							let text = 	    `<div class="l_left" >
						                        <img src="${imgSrc}" alt="">
						                        <p>${response.data.code.codeName}</p>
						                        <p class="sb"> : ${response.data.profile.content}</p>
						                    </div>
						                    <i class="fas fa-chevron-right"></i>`;
						                    
						                    
							 $('#'+`${response.data.code.codeKey}`).empty();
			                 // 내용 채워넣기
			                 $('#'+`${response.data.code.codeKey}`).append(text);
			            	 
			             } 
			             
			             if (value == response.data.code.codeKey && value == "pfi09"){
			            	 $('#introductionContent').text(response.data.profile.content);		
			            	 
			             }
			             
			         });
						
					}else{
						alert('수정에 실패했습니다ㅣ.');
					}
					

				}
			});
		}; 			
		
				