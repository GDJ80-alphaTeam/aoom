document.addEventListener('DOMContentLoaded', function () {
    // 클릭시 nav 등장 ~ 퇴장
    document.querySelector('header .inner .user .profile i').addEventListener('click', function () {
        document.querySelector('header .inner ul.nav_menu').classList.toggle('on');
    });


})

$(document).ready(function () {

    // 증가 버튼 클릭 이벤트
	$('.plus_btn').click(function () {
	    let $input = $(this).siblings('.result').find('input'); // .result 내부의 input 요소 선택
	    let currentValue = parseInt($input.val(), 10); // 현재 값 가져오기
	    let maxValue = parseInt($input.attr('max'), 10); // max 값 가져오기
	    if (!isNaN(currentValue) && (!isNaN(maxValue) && currentValue < maxValue)) {
	        $input.val(currentValue + 1); // 값 증가
	    }
	});
	
	// 감소 버튼 클릭 이벤트
	$('.minus_btn').click(function () {
	    let $input = $(this).siblings('.result').find('input'); // .result 내부의 input 요소 선택
	    let currentValue = parseInt($input.val(), 10); // 현재 값 가져오기
	    if (!isNaN(currentValue) && currentValue > 0) {
	        $input.val(currentValue - 1); // 값 감소
	    }
	});

    $('.page_rolling .s_category .icon_box li').click(function () {
        let $this = $(this);
        let index = $this.index();
        let $img = $this.find('img');

        // 클릭된 li 요소에 'on' 클래스를 추가하고 다른 li 요소의 'on' 클래스를 제거
        $('.page_rolling .icon_box li').removeClass('on');
        $this.addClass('on');

        // 클릭된 li 요소의 라디오 버튼을 체크하고 나머지 라디오 버튼은 체크 해제
        let radioId = $this.find('input[type="radio"]').attr('id');
        $('input[name="roomcateCode"]').prop('checked', false); // 모든 라디오 버튼 체크 해제
        $('#' + radioId).prop('checked', true); // 클릭된 li의 라디오 버튼 체크

        // 모든 li 요소의 이미지 경로를 원래대로 복원
        $('.page_rolling .icon_box li img').each(function(i) {
            if ($(this).closest('li').hasClass('on')) {
                // 'on' 클래스가 있는 li의 이미지는 변경
                $(this).attr('src', '/style/img/rct' + ((i + 1) < 10 ? '0' : '') + (i + 1) + 'on.png');
                console.log($(this).attr('src'));
            } else {
                // 'on' 클래스가 없는 li의 이미지는 원래대로
                $(this).attr('src', '/style/img/rct' + ((i + 1) < 10 ? '0' : '') + (i + 1) + '.png');
            }
        });
    });

    // 버튼 클릭 시 라디오 버튼 체크 및 스타일 업데이트
    $('.select_btn button').click(function() {
        // 모든 라디오 버튼의 체크 해제
        $('input[name="roomtypeCode"]').prop('checked', false);

        // 버튼의 data-radio-id 속성에서 ID를 가져와서 해당 라디오 버튼을 체크
        let radioInput = $(this).next('input[name="roomtypeCode"]');
        console.log(radioInput);
    	radioInput.prop('checked', true);

        // 스타일 업데이트: 모든 버튼에서 'on' 클래스 제거
        $('.select_btn button').removeClass('on');

        // 현재 클릭된 버튼에 'on' 클래스 추가
        $(this).addClass('on');
    });
    
    // 편의시설 li 클릭 시 이벤트 처리
    $('.page_rolling .p_bottom .icon_box li').click(function () {
        let $this = $(this);
        let $checkbox = $this.find('input[type="checkbox"]');
        let $img = $this.find('img');

        // 클릭된 li 요소에 'on' 클래스 토글
        $this.toggleClass('on');

        // 체크박스 상태 토글
        $checkbox.prop('checked', !$checkbox.prop('checked'));

        // 체크박스 상태 변경 시 amenityList 업데이트
        amenityList = []; // 변경 시점에 배열을 초기화

        $('input[name="checkAmenities"]').each(function() {
            let amenityCode = $(this).val();
            if ($(this).is(":checked")) {
                amenityList.push(amenityCode);
            }
        });

        $('#amenities').val(amenityList);
        console.log($('#amenities').val());

        // 모든 li 요소의 이미지 경로를 원래대로 복원
        $('.page_rolling .icon_box li img').each(function(i) {
            var $li = $(this).closest('li');
            if ($li.hasClass('on')) {
                // 'on' 클래스가 있는 li의 이미지는 변경
                $(this).attr('src', '/style/img/ame' + ((i + 1) < 10 ? '0' : '') + (i + 1) + 'on.png');
            } else {
                // 'on' 클래스가 없는 li의 이미지는 원래대로
                $(this).attr('src', '/style/img/ame' + ((i + 1) < 10 ? '0' : '') + (i + 1) + '.png');
            }
        });
    });

});