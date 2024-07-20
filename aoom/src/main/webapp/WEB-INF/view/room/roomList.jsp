<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>숙소검색결과</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
</head>
<body class="container">
    <!-- AOOM 네비게이션 바 -->
    <jsp:include page="/WEB-INF/view/layout/navbarSub.jsp"></jsp:include>

    <!-- 그리드 -->
    <div class="container text-center">
        <div class="row">
            <div class="col"></div>
            <div class="col-10">

                <!-- 검색 -->
                <form id="search">
                    <input type="text" name="address" id="address" placeholder="여행지">
                    <input type="text" id="daterange" name="daterange" placeholder="체크인 / 체크아웃" autocomplete="off">
                    <input type="hidden" id="startDate" name="startDate">
                    <input type="hidden" id="endDate" name="endDate">
                    <input type="number" name="usePeople" id="usePeople" min="1" placeholder="여행자">
                    <button type="button" id="btnSearch">검색</button>
                </form>
                <br>

                <!-- 카테고리 전체 버튼 -->
                <button type="button" id="btnAllCategories" class="btn btn-danger btn-sm" onclick="removeCategory()">전체</button>

                <!-- 카테고리 -->
                <c:forEach var="roomCategory" items="${roomCategory}" varStatus="status">
                    <button type="button" id="btn${roomCategory.codeKey}" data-category="${roomCategory.codeKey}" class="btn btn-danger btn-sm category-btn">${roomCategory.codeName}</button>
                </c:forEach>
                
                <!-- 필터 -->
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    필터
                </button>

                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-scrollable">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">필터 </h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <form id="filterForm">
                                <div class="modal-body">

                                    <h3>가격</h3>
                                    <input type="number" min="30000" value="30000" name="lowPrice" placeholder="최저"> ~ <input type="number" min="30000" value="200000" name="highPrice" placeholder="최고">

                                    <h3>숙소 유형</h3>
                                    <label for="roomTypeAll">전체</label>
                                    <input type="radio" id="roomTypeAll" name="roomtypeCode" value="all" checked>
                                    <c:forEach var="roomType" items="${roomType}">
                                        <label for="${roomType.codeKey}">${roomType.codeName}</label>
                                        <input type="radio" id="${roomType.codeKey}" name="roomtypeCode" value="${roomType.codeKey}">
                                    </c:forEach>

                                    <h3>침실과 침대 화장실</h3>
                                    <label for="totalSpace">침실</label>
                                    <input type="radio" id="totalSpace1" name="totalSpace" value="1" checked>1
                                    <input type="radio" id="totalSpace2" name="totalSpace" value="2">2
                                    <input type="radio" id="totalSpace3" name="totalSpace" value="3">3
                                    <input type="radio" id="totalSpace4" name="totalSpace" value="4">4
                                    <input type="radio" id="totalSpace5" name="totalSpace" value="5">5+
                                    <br>
                                    <label for="totalBed">침대</label>
                                    <input type="radio" id="totalBed1" name="totalBed" value="1" checked>1
                                    <input type="radio" id="totalBed2" name="totalBed" value="2">2
                                    <input type="radio" id="totalBed3" name="totalBed" value="3">3
                                    <input type="radio" id="totalBed4" name="totalBed" value="4">4
                                    <input type="radio" id="totalBed5" name="totalBed" value="5">5+
                                    <br>
                                    <label for="totalBath">화장실</label>
                                    <input type="radio" id="totalBath1" name="totalBath" value="1" checked>1
                                    <input type="radio" id="totalBath2" name="totalBath" value="2">2
                                    <input type="radio" id="totalBath3" name="totalBath" value="3">3
                                    <input type="radio" id="totalBath4" name="totalBath" value="4">
                                    <input type="radio" id="totalBath5" name="totalBath" value="5">5+

                                    <h3>편의 시설</h3>
                                    <!-- 기본값 0(hidden), 선택시 1값이 submit되게. -->
                                    <c:forEach var="amenitie" items="${amenities}">
                                        <input type="checkbox" id="${amenitie.codeKey}" name="amenities" value="${amenitie.codeKey}">${amenitie.codeName}
                                        <br>
                                    </c:forEach>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" id="clearFilter" class="btn btn-secondary">초기화</button>
                                    <button type="button" id="btnFilter" class="btn btn-danger">필터링</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col"></div>
        </div>
    </div>
    <br>

    <h3 class="text-center">결과 출력</h3>

    <table class="table table-danger">
        <thead>
            <tr>
                <th>숙소아이디</th>
                <th>메인사진</th>
                <th>주소</th>
                <th>숙소이름</th>
                <th>기본가격</th>
                <th>평점</th>
            </tr>
        </thead>
        <tbody id="result">
		    <!-- 검색 결과 -->
		    <c:forEach var="searchResult" items="${searchResult}">
				<tr>
					<td>${searchResult.roomId}</td>
					<td>${searchResult.mainImage}</td>
					<td>${searchResult.address}</td>
					<td>${searchResult.roomName}</td>
					<td>${searchResult.defaultPrice}</td>
					<td>작업중</td>
				</tr>
		    </c:forEach>
        </tbody>
    </table>
 
    

    <script>
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
            if (params.lowPrice) $('input[name="lowPrice"]').val(params.lowPrice);
            if (params.highPrice) $('input[name="highPrice"]').val(params.highPrice);
            if (params.roomtypeCode) $('input[name="roomtypeCode"][value="' + params.roomtypeCode + '"]').prop("checked", true);
            if (params.totalSpace) $('input[name="totalSpace"][value="' + params.totalSpace + '"]').prop("checked", true);
            if (params.totalBed) $('input[name="totalBed"][value="' + params.totalBed + '"]').prop("checked", true);
            if (params.totalBath) $('input[name="totalBath"][value="' + params.totalBath + '"]').prop("checked", true);
            if (params.amenities) {
                params.amenities.split(",").forEach(value => {
                    $('input[name="amenities"][value="' + value + '"]').prop("checked", true);
                });
            }

            // startDate와 endDate 값을 daterange input에 설정
            if (params.startDate && params.endDate) {
                $('#daterange').val(params.startDate + ' - ' + params.endDate);
            }

            // 카테고리 버튼 스타일 설정
            if (params.category) {
                $('#btnAllCategories').removeClass('btn-warning').addClass('btn-danger');
                $('[data-category]').each(function() {
                    if ($(this).data('category') === params.category) {
                        $(this).removeClass('btn-danger').addClass('btn-warning');
                    } else {
                        $(this).removeClass('btn-warning').addClass('btn-danger');
                    }
                });
            } else {
                $('#btnAllCategories').removeClass('btn-danger').addClass('btn-warning');
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
                let lowPrice = parseInt($('input[name="lowPrice"]').val());
                let highPrice = parseInt($('input[name="highPrice"]').val());

                // 유효성 검사
                if (highPrice < lowPrice) {
                    alert("최고 가격은 최저 가격보다 작을 수 없습니다.");
                    return; // 유효성 검사를 통과하지 못하면 URL 생성 중단
                }

                let newParams = {
                    lowPrice: lowPrice,
                    highPrice: highPrice,
                    roomtypeCode: $('input[name="roomtypeCode"]:checked').val(),
                    totalSpace: $('input[name="totalSpace"]:checked').val(),
                    totalBed: $('input[name="totalBed"]:checked').val(),
                    totalBath: $('input[name="totalBath"]:checked').val(),
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

        // 초기화 버튼 이벤트
        $('#clearFilter').click(function() {
            $('#filterForm')[0].reset();
        });
    </script>
</body>
</html>
