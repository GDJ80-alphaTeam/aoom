document.addEventListener('DOMContentLoaded', function () {
    // 클릭시 nav 등장 ~ 퇴장
    document.querySelector('header .inner .user .profile i').addEventListener('click', function () {
        document.querySelector('header .inner ul.nav_menu').classList.toggle('on');
    });

    // 스크롤 top버튼
    document.querySelector('aside').addEventListener('click', function () {
        window.scrollTo({ top: 0, behavior: 'smooth' });
    });
})
$(document).ready(function() {
    let currentIndex = 0;
    const $pages = $('.review_page');
    const totalPages = $pages.length;

    function updatePagination() {
        // Update the transform property to move to the current page
        $('.review_page').css('transform', `translateX(${-currentIndex * 100}%)`);
        
        // Disable/enable buttons based on the current page index
        $('.prev_btn').prop('disabled', currentIndex === 0);
        $('.next_btn').prop('disabled', currentIndex === totalPages - 1);
        
        // Update active class for page buttons
        $('.page_btn').removeClass('active');
        $(`.page_btn[data-index=${currentIndex}]`).addClass('active');
    }

    // Click handler for next button
    $('.next_btn').click(function() {
        if (currentIndex < totalPages - 1) {
            currentIndex++;
            updatePagination();
        }
    });

    // Click handler for previous button
    $('.prev_btn').click(function() {
        if (currentIndex > 0) {
            currentIndex--;
            updatePagination();
        }
    });

    // Click handler for page buttons
    $('.page_btn').click(function() {
        currentIndex = $(this).data('index'); // Get the index from data-index
        updatePagination();
    });

    // Initialize pagination
    updatePagination();
});



document.addEventListener("DOMContentLoaded", function() {
	// 카카오지도	 
	let mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
	    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};  
	
	// 지도를 생성    
	let map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성
	let geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색		주소값 jstl로 받아왔음
	geocoder.addressSearch(address, function(result, status) {
		// 정상적으로 검색이 완료되면 
	    if (status === kakao.maps.services.Status.OK) {
	
	       let coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	       // 결과값으로 받은 위치를 마커로 표시
	       let marker = new kakao.maps.Marker({
	           map: map,
	           position: coords
	       });
	
	       // 인포윈도우로 장소에 대한 설명을 표시
	       let infowindow = new kakao.maps.InfoWindow({							
	           content: '<div style="width:150px;text-align:center;padding:6px 0;">숙소</div>'
	       });
	       infowindow.open(map, marker);
	
	       // 지도의 중심을 결과값으로 받은 위치로 이동
	       map.setCenter(coords);
		} 
	});   
});

	// 달력 api
	let isInitializing = false;
	const fp = flatpickr("#datepicker", {			
			mode: "range",
			dateFormat: "Y-m-d",		       		         
			minDate: 'today',        // 오늘 이전 날짜 선택 비활성화
			//maxDate: '2024-12-31',   // 특정 날짜까지 선택 가능
			//defaultDate: 'today',    // 초기 날짜 설정 (현재 날짜와 시간)		
			showMonths: 2,
			locale: "ko",			   
			disable: [],
			onOpen: function(selectedDates, dateStr, instance) {
				
				if (!isInitializing) {
                    isInitializing = true; // 설정 중임을 표시
				
                    
                 // 모든 날짜를 활성화하려면 enable을 빈 배열로 설정                                        
				$.ajax({
		            url: '/onedayPrice/ajaxValidDate',
		            method: 'post',
		            data: {"roomId":roomId},
		            dataType: 'json',
		            success: function(response) {
		            	console.log(response);
		            	instance.set('disable', []);
		            	
		                // 서버에서 받은 비활성화할 날짜 배열
		                let disableDate = response.data.map(item => item.oneday);
						
		                // Flatpickr 인스턴스 업데이트
		            	instance.set('enable', disableDate);
		            },
		            complete: function() {
	                    isInitializing = false; // 초기화 완료 표시
	                }   
		        });		
				
			}}
			,
			onChange: function(selectedDates, dateStr, instance) {
				console.log("Selected range: ", selectedDates);
				
				// 날짜형식 변경 yyyy/mm/dd
            	let formattedDates = moment(selectedDates[0]).format('YYYY/MM/DD');
            	let startDate = moment(selectedDates[0]).format('YYYY/MM/DD');
 	            let endDate = moment(selectedDates[1]).format('YYYY/MM/DD');
                console.log("Selected range (formatted): ", formattedDates);
				console.log( $("#usePeople").val());
				$.ajax({
		            url: '/onedayPrice/ajaxBookingDay',
		            method: 'post',
		            data: {"roomId" : roomId , "selectedDate" : formattedDates, "startDate" : startDate, "endDate" : endDate, "usePeople" : $("#usePeople").val()},
		            dataType: 'json',
		            success: function(response) {
	                    // 서버에서 받은 비활성화할 날짜 배열
		                let disableDates = response.data.map(item => item.oneday);		
		                // Flatpickr 인스턴스 업데이트
		            	instance.set('enable', disableDates);
		            	
		                // 요금 세부 정보 업데이트
	                    let priceDetail = "₩" + response.bookingPrice.avg +"원 x " + response.bookingPrice.cnt + "박";
	                   
	                    $('#priceDetail').html(priceDetail);
	                    $('#priceDetailTotal').html( "₩" + response.bookingPrice.sum);
	                   
	                    // 요금 합계 업데이트
	                    $('#totalPrice').text(response.bookingPrice.sum + ' 원');
		            }
		           
		        });		
			  },
			onClose: function(selectedDates, dateStr, instance) {
				
				let startDate = moment(selectedDates[0]).format('YYYY/MM/DD');
				let endDate = moment(selectedDates[1]).format('YYYY/MM/DD');
				let startDate2 = moment(selectedDates[0]).format('YYYY-MM-DD');
				let endDate2 = moment(selectedDates[1]).format('YYYY-MM-DD');
				console.log("startDate" , startDate);
				console.log("endDate" , endDate);
				// 하이푼으로 들어갈값
				$("#startDate").val(startDate);
				$("#endDate").val(endDate);
				
				$("#startDate2").val(startDate2);
				$("#endDate2").val(endDate2);
				console.log($("#startDate").val());
				console.log($("#endDate").val())
			}
		});
		
$('#bookingBtn').click(function(event) {
	        event.preventDefault(); // 폼의 기본 제출 동작을 막음
	
         	let startDateValue = $('#startDate').val();
	        let endDateValue = $('#endDate').val();
	        
	        let usePeople = $('#usePeople').val();
	        console.log(usePeople+"userPeople")
	        console.log(maxPeople);
	        // datepicker가 빈칸이나 null인지 확인
	        if (!startDateValue || !endDateValue || startDateValue == endDateValue) {
	            alert('날짜를 선택해주세요.');
	            return;
	        }
	
	        if (usePeople > maxPeople || usePeople == null){
	        	alert("인원수를 조정해주세요")
	        	return;
	        }
	        
	        // 폼 시리얼라이즈
	        let formData = $('#bookingForm').serialize();
			console.log(formData);
	        // GET 요청으로 폼 데이터 전송
	        let actionUrl = $('#bookingForm').attr('action');
	        window.location.href = actionUrl + '?' + formData;
	    });
	    
	// 페이징
	// currentPage는 변경가능해야함 , lastPage는 중간에 리뷰가 추가될수있음
	$(document).ready(function() {
    // 페이지 로드 시 초기 상태 설정
    updatePaginationButtons(currentPage, lastPage);
	});
	
	function updatePaginationButtons(currentPage, lastPage) {
	    // 이전 버튼 비활성화 처리
	    $('#previous').prop('disabled', currentPage === 1);
	    // 다음 버튼 비활성화 처리
	    $('#next').prop('disabled', currentPage === lastPage);
	}
							// id가 page로 시작하는 모든태그 
	$(document).on('click', '[id^="page"], #previous, #next', function() {
		let page = currentPage;
	  		console.log(page);	
		
		// 페이지 번호 클릭 this = 위에 on.click된 것들중 클릭이벤트가 일나면
	    if (this.id.startsWith('page')) {
	    	// page에 클릭한 페이지 값 입력 , String으로 오기때문에 변환해줘야함
	      	page = parseInt($(this).val());
	    	
	    	// 모든 번호페이지의 active상태 제거
	      	$(".page-link.active").removeClass("active");
	    	// 선택한 번호페이지의 active 추가
	      	$(this).addClass("active")
	      	
	      	// 숫자가 선택되었을때 다음버튼과 이전버튼의 disabled 비활성화
	      	$('#previous').prop('disabled', false);
       		$('#next').prop('disabled', false);
	      
	      	// 이전 and 다음 버튼 비활성화 page값에따라 처리
	      	if(page == 1){
	    		$('#previous').prop('disabled', true);
	      	}
	      	if(page == lastPage){
	    		$('#next').prop('disabled', true);
	      	}
	      
	    }
	
	    // 이전 버튼 클릭
	    if (this.id == 'previous' && currentPage > 1) {
	      
	    	// 이전 active상태 삭제
	      	$('#page'+page).removeClass("active");		      		    	
	    	page = currentPage - 1;
	    	// 다음 버튼 active 상태 활성  
	      	$('#page'+page).addClass("active");
	      
	      	$('#previous').prop('disabled', false);
       		$('#next').prop('disabled', false);
	      
	      	// 이전버튼 비활성화
	      	if(page == 1){
	    		$('#previous').prop('disabled', true);
	      	}
	    }
	
	    // 다음 버튼 클릭
	    if (this.id == 'next' && currentPage < lastPage) {
	    	
	   		$('#page'+page).removeClass("active");			    	
	      	page = currentPage + 1;
	      	$('#page'+page).addClass("active");
	      
	      	$('#previous').prop('disabled', false);
       		$('#next').prop('disabled', false);
	     	
	      	// 다음버튼 비활성화		        
	      	if(page == lastPage){
	    		$('#next').prop('disabled', true);
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
			url:"/review/ajaxReviewPaging",
			method:"post",
			data: {"currentPage": page , "roomId": roomId},
			success: function(response){
				console.log(response);
				if(response.code == '00'){
					$('[id^="reviewContent"]').empty();
					$('[id^="reviewImg"]').attr('src','');
					$('[id^="userImg"]').attr('src','');
					$('[id^="userId"]').attr('href','');
					$('[id^="userRating"]').empty();
					$('[id^="userName"]').empty();
					// onError일때 display가 none이된후 사라지지않음 그래서 다시 block처리후 src가없으면 다시 none으로 변경
					$('[id^="reviewImg"]').css('display','block');
					$('[id^="userImg"]').css('display','block');
					$('[id^=reviewCreationDate]').empty();
					$('[id^=userSubDate]').empty();
					// currentpage값 바꿔줌
					currentPage = page;
					// id의값은 1부터 시작 , list는 [0]부터 시작함 그래서 response -1
					for (let i = 1; i < response.data.review.length+1; i++) {
						$('#reviewContent'+i).append(response.data.review[i-1].reviewContent);
						$('#reviewImg'+i).attr('src',response.data.review[i-1].reviewImage); 
		                $('#userImg'+i).attr('src',response.data.review[i-1].userImage);
	      				$('#userName'+i).append(response.data.review[i-1].userName);
	      				$('#userId'+i).attr('href','/user/profile?userId='+response.data.review[i-1].userId);
	      				$('#reviewCreationDate'+i).append(response.data.review[i-1].creationDate+'일전');
	      				$('#userSubDate'+i).append('에어비앤비 가입기간:'+response.data.review[i-1].userSubDate+'일');
	      				let stars = '';
	      				for (let j = 1; j <= response.data.review[i-1].rating ; j ++){
							stars += '<i class="fa-solid fa-star" ></i>';
						}
						$('#userRating'+i).append(stars);
						
					}					
				} else if(response.code == '01'){
					alert('후기를불러오는데 실패하였습니다.')
				}
			}
		})
	}											
	
	
		$('#wishListBtn').click(function() {
			if(userId === ''){
				alert('로그인이 필요한 기능입니다');
			}
			$.ajax({
				url: '/ajaxWishList',
				method: 'get',
				data: {
					'userId' : userId,
					'roomId' : roomId
				},
				success: function(response) {
					if(response.result) {
						alert(response.message)
						window.location.href="/room/roomInfo?roomId="+roomId
					}
				}
			});
		});
