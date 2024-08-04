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
    <title>숙소검색결과</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <link rel="stylesheet" href="/style/css/common.css">
    <link rel="stylesheet" href="/style/css/main.css">
    <script src="https://kit.fontawesome.com/82b4a4fcad.js"></script>
    <script src="/style/js/main.js" defer></script>
</head>
<body>
    <!-- AOOM 네비게이션 바 -->
    <jsp:include page="/WEB-INF/view/layout/navbarMain.jsp"></jsp:include>
    
    <div class="room_container inner">
        <div class="room fade_in">
        
        <!-- 검색 결과가 없는 경우 표시 -->
        <c:choose>
            <c:when test="${empty searchResult}">
                <p style="text-align: center; font-size: 18px; margin-top: 20px;">😭 조건을 만족하는 숙소가 없습니다 😭</p>
            </c:when>
            <c:otherwise>
                <!-- 숙소 출력 반복 -->
                <!-- 조회수 TOP 4 -->
                <c:forEach var="searchResult" items="${searchResult}" varStatus="status">
                    <c:if test="${status.count % 4 == 1}">
                        <ul>
                    </c:if>
                        <li>
                            <a href="${pageContext.request.contextPath}/room/roomInfo?roomId=${searchResult.roomId}">
                                <div class="img_box">
                                    <img src="${searchResult.mainImage}" alt="숙소사진">
                                    <div class="heart_btn">
                                        <button type="button" name="wishListBtn_${searchResult.roomId}" style="position: absolute; top: 0; right: 0; border: 0; background-color: transparent;">
                                            <c:set var="isWishRoom" value="false"></c:set>
                                            <c:forEach var="uwr" items="${userWishRoom }">
                                                <c:if test="${uwr.roomId == searchResult.roomId }">
                                                    <c:set var="isWishRoom" value="true"></c:set>
                                                </c:if>
                                            </c:forEach>
                                            <c:if test="${isWishRoom}">
                                                &#129505;
                                            </c:if>
                                            <c:if test="${!isWishRoom}">
                                                &#129293;
                                            </c:if>
                                        </button>                                   
                                    </div>
                                </div>
                                <div class="txt_box">
                                    <div class="t_box_top">
                                        <div class="r_name">
                                            ${searchResult.roomName}
                                        </div>
                                        <div class="r_star">
                                            <img src="${pageContext.request.contextPath}/img/roomlist_16.png" alt="별점">
                                            <span>${searchResult.avg}</span>
                                        </div>
                                    </div>
                                    <div class="r_option">
                                        ${searchResult.address}
                                    </div>
                                    <div class="r_price">
                                        ${searchResult.defaultPrice} 원
                                    </div>
                                </div>
                            </a>
                        </li>
                    <c:if test="${status.count % 4 == 0 || status.last}">
                        <!-- 마지막 줄이 4개가 아닌 경우 빈 li 태그 추가 -->
                        <c:if test="${status.last}">
                            <c:choose>
                                <c:when test="${status.count % 4 == 1}">
                                    <li class="placeholder"></li>
                                    <li class="placeholder"></li>
                                    <li class="placeholder"></li>
                                </c:when>
                                <c:when test="${status.count % 4 == 2}">
                                    <li class="placeholder"></li>
                                    <li class="placeholder"></li>
                                </c:when>
                                <c:when test="${status.count % 4 == 3}">
                                    <li class="placeholder"></li>
                                </c:when>
                            </c:choose>
                        </c:if>
                        </ul>
                    </c:if>
                </c:forEach>
            </c:otherwise>
        </c:choose>
        </div>
    </div>
    
	<!-- 푸터  -->
    <jsp:include page="/WEB-INF/view/layout/footer.jsp"></jsp:include>
	
	<!-- 위로가기 -->
    <aside>
        <i class="fa-solid fa-chevron-up"></i>
        <span>TOP</span>
    </aside>
    
    <script type="text/javascript">
    
	    // Moment.js를 사용하여 오늘 날짜 문자열 생성
	    let today = moment().format("YYYY/MM/DD");
	
	    // 달력 API
	    $(function() {
	        $('#daterange').daterangepicker({
	            minDate: today, // 오늘날짜 이전 선택불가
	            showDropdowns: true, // 연도와 월을 선택할 수 있는 드롭다운 생성
	            autoApply: false, // 적용버튼 누르기 전 까지 적용 안되게
	            autoUpdateInput: false, // 날짜 범위도 적용 누르기 전까지 적용 안 되게
	            locale: {
	                "format": "YYYY/MM/DD", // 연월일 포맷설정
	                "separator": " ~ ", // 캘린더 우측아래 범위 표현
	                "applyLabel": "적용", // 적용버튼 스트링값
	                "cancelLabel": "비우기", // 취소버튼 스트링값
	                "customRangeLabel": "Custom", // 커스텀방식
	                "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"], // 요일표시방식
	                "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"] // 월 표시방식
	            }
	        });
	        
	        // 캘린더 '적용' 눌렀을 때 이벤트처리
	        $('#daterange').on('apply.daterangepicker', function(ev, picker) {
	            let startDate = picker.startDate; // 첫번째 선택날짜 선언
	            let endDate = picker.endDate; // 두번째 선택날짜 선언
	            // 선택날 두 날이 같을 시 조건문
	            if (startDate.isSame(endDate, 'day')) { // 같을 때
	                alert("체크인과 체크아웃 날짜가 같을 수 없습니다.");
	                $('#daterange').val(''); // 비우기
	                $('#startDate').val('');
	                $('#endDate').val('');
	            } else { // 그렇지 않은 모든경우에 : 선택한 첫날과 마지막날을 hidden안에 담는다
	                $(this).val(startDate.format('MM/DD/YYYY') + ' - ' + endDate.format('MM/DD/YYYY'));
	                $('#startDate').val(startDate.format('YYYY/MM/DD'));
	                $('#endDate').val(endDate.format('YYYY/MM/DD'));
	            }
	        })
	        
	        // 캘린터 '비우기' 눌렀을 때 이벤트처리
	        $('#daterange').on('cancel.daterangepicker', function(ev, picker) {
	        	$('#daterange').val('');
	        	$('#startDate').val('');
	        	$('#endDate').val('');
	        });
	    });
	    // URL 파라미터 읽기
	    function getUrlParams() {
	        const params = {};
	        window.location.search.substring(1).split("&").forEach(pair => {
	            const [key, value] = pair.split("=");
	            if (key) { // check if key is not an empty string
	                params[decodeURIComponent(key)] = decodeURIComponent(value);
	            }
	        });
	        return params;
	    }
	
	    // 페이지 로드 시 폼 요소 채우기
	    $(document).ready(function() {
	        const params = getUrlParams();
	        if (params.address) $('#address').val(params.address);
	        if (params.startDate) $('#startDate').val(params.startDate);
	        if (params.endDate) $('#endDate').val(params.endDate);
	        if (params.usePeople) $('#usePeople').val(params.usePeople);
	        if (params.lowPrice) $('#lowPrice').val(params.lowPrice);
	        if (params.highPrice) $('#highPrice').val(params.highPrice);
	        if (params.roomtypeCode) $('#roomtypeCode').val('all');
	        
	        // 숙소타입 전체보기
	        if (params.roomtypeCode == 'all') {
	        	$('#roomtypeCode').val('all');
	        	$('#allHouse').removeClass('active');
	        	$('#guestHouse').removeClass('active');
	        	$('#normalHouse').removeClass('active');
	        	$('#allHouse').addClass('active');
	        }
	        if (params.roomtypeCode == 'guestHouse') {
	        	$('#roomtypeCode').val('guestHouse');
	        	$('#allHouse').removeClass('active');
	        	$('#guestHouse').removeClass('active');
	        	$('#normalHouse').removeClass('active');
	        	$('#guestHouse').addClass('active');
	        }
	        if (params.roomtypeCode == 'normalHouse') {
	        	$('#roomtypeCode').val('normalHouse');
	        	$('#allHouse').removeClass('active');
	        	$('#guestHouse').removeClass('active');
	        	$('#normalHouse').removeClass('active');
	        	$('#normalHouse').addClass('active');
	        }
	        
	        // 침실
	        if (params.totalSpace == 0) {
	        	$('#totalSpace').val('0');
	        	$('[id^=totalSpace]').removeClass('active');
	        	$('#totalSpace0').addClass('active');
	        }
	        if (params.totalSpace == 1) {
	        	$('#totalSpace').val('1');
	        	$('[id^=totalSpace]').removeClass('active');
	        	$('#totalSpace1').addClass('active');
	        }
	        if (params.totalSpace == 2) {
	        	$('#totalSpace').val('2');
	        	$('[id^=totalSpace]').removeClass('active');
	        	$('#totalSpace2').addClass('active');
	        }
	        if (params.totalSpace == 3) {
	        	$('#totalSpace').val('3');
	        	$('[id^=totalSpace]').removeClass('active');
	        	$('#totalSpace3').addClass('active');
	        }
	        if (params.totalSpace == 4) {
	        	$('#totalSpace').val('4');
	        	$('[id^=totalSpace]').removeClass('active');
	        	$('#totalSpace4').addClass('active');
	        }
	        if (params.totalSpace == 5) {
	        	$('#totalSpace').val('5');
	        	$('[id^=totalSpace]').removeClass('active');
	        	$('#totalSpace5').addClass('active');
	        }
	        // 침대
	        if (params.totalBed == 0) {
	        	$('#totalBed').val('0');
	        	$('[id^=totalBed]').removeClass('active');
	        	$('#totalBed0').addClass('active');
	        }
	        if (params.totalBed == 1) {
	        	$('#totalBed').val('1');
	        	$('[id^=totalBed]').removeClass('active');
	        	$('#totalBed1').addClass('active');
	        }
	        if (params.totalBed == 2) {
	        	$('#totalBed').val('2');
	        	$('[id^=totalBed]').removeClass('active');
	        	$('#totalBed2').addClass('active');
	        }
	        if (params.totalBed == 3) {
	        	$('#totalBed').val('3');
	        	$('[id^=totalBed]').removeClass('active');
	        	$('#totalBed3').addClass('active');
	        }
	        if (params.totalBed == 4) {
	        	$('#totalBed').val('4');
	        	$('[id^=totalBed]').removeClass('active');
	        	$('#totalBed4').addClass('active');
	        }
	        if (params.totalBed == 5) {
	        	$('#totalBed').val('5');
	        	$('[id^=totalBed]').removeClass('active');
	        	$('#totalBed5').addClass('active');
	        }
	        // 화장실
	        if (params.totalBath == 0) {
	        	$('#totalBath').val('0');
	        	$('[id^=totalBath]').removeClass('active');
	        	$('#totalBath0').addClass('active');
	        }
	        if (params.totalBath == 1) {
	        	$('#totalBath').val('1');
	        	$('[id^=totalBath]').removeClass('active');
	        	$('#totalBath1').addClass('active');
	        }
	        if (params.totalBath == 2) {
	        	$('#totalBath').val('2');
	        	$('[id^=totalBath]').removeClass('active');
	        	$('#totalBath2').addClass('active');
	        }
	        if (params.totalBath == 3) {
	        	$('#totalBath').val('3');
	        	$('[id^=totalBath]').removeClass('active');
	        	$('#totalBath3').addClass('active');
	        }
	        if (params.totalBath == 4) {
	        	$('#totalBath').val('4');
	        	$('[id^=totalBath]').removeClass('active');
	        	$('#totalBath4').addClass('active');
	        }
	        if (params.totalBath == 5) {
	        	$('#totalBath').val('5');
	        	$('[id^=totalBath]').removeClass('active');
	        	$('#totalBath5').addClass('active');
	        }
	        
	        // 편의시설
	        if (params.amenities) {
	            params.amenities.split(",").forEach(value => {
	                $('input[name="amenities"][value="' + value + '"]').prop("checked", true);
	            });
	        }
	
	        // startDate와 endDate 값을 daterange input에 설정
	        if (params.startDate && params.endDate) {
	            $('#daterange').val(params.startDate + ' - ' + params.endDate);
	        }
	
	    });
	
	    // URL 파라미터 업데이트
	    function updateUrlParams(newParams) {
	        const params = getUrlParams();
	        Object.assign(params, newParams);
			
	        // undefined 없에주는 코드
	        const queryString = Object.keys(params).filter(key => params[key] !== undefined && params[key] !== "").map(key => {
	            return encodeURIComponent(key) + "=" + encodeURIComponent(params[key]);
	        }).join("&");
	
	        return window.location.pathname + "?" + queryString;
	    }
	
	    // 카테고리 제거 함수
	    function removeCategory() {
	        const params = getUrlParams();
	        delete params.category;
	
	        const queryString = Object.keys(params).filter(key => params[key] !== undefined && params[key] !== "").map(key => {
	            return encodeURIComponent(key) + "=" + encodeURIComponent(params[key]);
	        }).join("&");
	
	        window.location.href = window.location.pathname + "?" + queryString;
	    }
	
	    // 카테고리 클릭 시 이벤트(a태그 기본 동작 막기)
		$('#rct01').click(function(){
			event.preventDefault();
		    let newParams = {
		    		category: 'rct01'
		    };
		    window.location.href = updateUrlParams(newParams);
		});
		
		$('#rct02').click(function(){
			event.preventDefault();
		    let newParams = {
		    		category: 'rct02'
		    };
		    window.location.href = updateUrlParams(newParams);
		});
		
		$('#rct03').click(function(){
			event.preventDefault();
		    let newParams = {
		    		category: 'rct03'
		    };
		    window.location.href = updateUrlParams(newParams);
		});
		
		$('#rct04').click(function(){
			event.preventDefault();
		    let newParams = {
		    		category: 'rct04'
		    };
		    window.location.href = updateUrlParams(newParams);
		});
		
		$('#rct05').click(function(){
			event.preventDefault();
		    let newParams = {
		    		category: 'rct05'
		    };
		    window.location.href = updateUrlParams(newParams);
		});
		
		$('#rct06').click(function(){
			event.preventDefault();
		    let newParams = {
		    		category: 'rct06'
		    };
		    window.location.href = updateUrlParams(newParams);
		});
		
		$('#rct07').click(function(){
			event.preventDefault();
		    let newParams = {
		    		category: 'rct07'
		    };
		    window.location.href = updateUrlParams(newParams);
		});
		
		$('#rct08').click(function(){
			event.preventDefault();
		    let newParams = {
		    		category: 'rct08'
		    };
		    window.location.href = updateUrlParams(newParams);
		});
		
		$('#rct09').click(function(){
			event.preventDefault();
		    let newParams = {
		    		category: 'rct09'
		    };
		    window.location.href = updateUrlParams(newParams);
		});
		
		$('#rct10').click(function(){
			event.preventDefault();
		    let newParams = {
		    		category: 'rct10'
		    };
		    window.location.href = updateUrlParams(newParams);
		});
		
		$('#rct11').click(function(){
			event.preventDefault();
		    let newParams = {
		    		category: 'rct11'
		    };
		    window.location.href = updateUrlParams(newParams);
		});
		
		$('#rct12').click(function(){
			event.preventDefault();
		    let newParams = {
		    		category: 'rct12'
		    };
		    window.location.href = updateUrlParams(newParams);
		});
	    
	    // 버튼 클릭 이벤트 통합
	    $('[id^="btn"]').click(function() {
	        if (this.id === 'btnSearch') {
	            let newParams = {
	                address: $('#address').val(),
	                startDate: $('#startDate').val(),
	                endDate: $('#endDate').val(),
	                usePeople: $('#usePeople').val()
	            };
	            window.location.href = updateUrlParams(newParams);
	        } else if (this.id === 'btnFilter') {
	            let lowPrice = parseInt($('#lowPrice').val());
	            let highPrice = parseInt($('#highPrice').val());
	
	            // 유효성 검사
	            if (highPrice < lowPrice) {
	                alert("최고 가격은 최저 가격보다 작을 수 없습니다.");
	                return; // 유효성 검사를 통과하지 못하면 URL 생성 중단
	            }
	
	            let newParams = {
	                lowPrice: lowPrice,
	                highPrice: highPrice,
	                roomtypeCode: $('#roomtypeCode').val(),
	                totalSpace: $('#totalSpace').val(),
	                totalBed: $('#totalBed').val(),
	                totalBath: $('#totalBath').val(),
	                amenities: $('input[name="amenities"]:checked').map(function() {
	                    return $(this).val();
	                }).get().join(",")
	            };
	
	            window.location.href = updateUrlParams(newParams);
	        } else if (this.id === 'btnAllCategories') {
	            removeCategory();
	        } else if (this.id.startsWith('btn') && this.id !== 'btnAllCategories') {
	            let newParams = { category: $(this).data('category') };
	            window.location.href = updateUrlParams(newParams);
	        }
	    });
		
	    // 룸타입 눌렀을 때
 	    $('#allHouse').click(function() {
	    	$('#roomtypeCode').val('all');
	    })
 	    
	    $('#guestHouse').click(function() {
	    	$('#roomtypeCode').val('guestHouse');
	    })
	    
	    $('#normalHouse').click(function() {
	    	$('#roomtypeCode').val('normalHouse');
	    })
	    
	    // 침실 버튼 클릭 시
	    $('#totalSpace0').click(function(){
	    	$('#totalSpace').val('0');
	    })
	    $('#totalSpace1').click(function(){
	    	$('#totalSpace').val('1');
	    })
	    $('#totalSpace2').click(function(){
	    	$('#totalSpace').val('2');
	    })
	    $('#totalSpace3').click(function(){
	    	$('#totalSpace').val('3');
	    })
	    $('#totalSpace4').click(function(){
	    	$('#totalSpace').val('4');
	    })
	    $('#totalSpace5').click(function(){
	    	$('#totalSpace').val('5');
	    })
	    
	    // 침대 버튼 클릭 시
   	    $('#totalBed0').click(function(){
	    	$('#totalBed').val('0');
	    })
   	    $('#totalBed1').click(function(){
	    	$('#totalBed').val('1');
	    })
   	    $('#totalBed2').click(function(){
	    	$('#totalBed').val('2');
	    })
   	    $('#totalBed3').click(function(){
	    	$('#totalBed').val('3');
	    })
   	    $('#totalBed4').click(function(){
	    	$('#totalBed').val('4');
	    })
   	    $('#totalBed5').click(function(){
	    	$('#totalBed').val('5');
	    })
	    
	    // 화장실 버튼 클릭 시
   	    $('#totalBath0').click(function(){
	    	$('#totalBath').val('0');
	    })
   	    $('#totalBath1').click(function(){
	    	$('#totalBath').val('1');
	    })
   	    $('#totalBath2').click(function(){
	    	$('#totalBath').val('2');
	    })
   	    $('#totalBath3').click(function(){
	    	$('#totalBath').val('3');
	    })
   	    $('#totalBath4').click(function(){
	    	$('#totalBath').val('4');
	    })
   	    $('#totalBath5').click(function(){
	    	$('#totalBath').val('5');
	    })
	    
	    // 초기화 버튼 이벤트
	    $('#clearFilter').click(function() {
	        $('#filterForm')[0].reset();
	    });
	</script>
	
	<!-- 위시리스트에 숙소 추가, 삭제 -->
	<script type="text/javascript">
		let userId = '${sessionScope.userInfo.userId}';
		$('button[name^="wishListBtn_"]').click(function() {
			if(userId === ''){
				alert('로그인이 필요한 기능입니다');
			}
			const wishListBtnRoomId = $(this).attr('name');
			const roomId = wishListBtnRoomId.split('_')[1];
	
			$.ajax({
				url : '/ajaxWishList',
				method : 'get',
				data : {
					'userId' : userId,
					'roomId' : roomId
				},
				success : function(response) {
					console.log(response);
					if (response.result) {
						alert(response.message);
						window.location.href = "/room/roomList";
					}
				}
			});
		});
	</script>
</body>
</html>