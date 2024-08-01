document.addEventListener('DOMContentLoaded', function () {
    // 클릭시 nav 등장 ~ 퇴장
    document.querySelector('header .inner .user .profile i').addEventListener('click', function () {
        document.querySelector('header .inner ul.nav_menu').classList.toggle('on');
    });


})

$(document).ready(function () {

    //숫자 박스
    $('.plus_btn').click(function () {
        var $result = $(this).siblings('.result');
        var currentValue = parseInt($result.text(), 10);//숫자로 변환
        $result.text(currentValue + 1);
    });

    $('.minus_btn').click(function () {
        var $result = $(this).siblings('.result');
        var currentValue = parseInt($result.text(), 10);
        if (currentValue > 0) {
            $result.text(currentValue - 1);
        }
    });

    //
    // 원래 이미지 경로를 저장할 객체
    // 원래 이미지 경로를 저장할 객체
    var originalSrc = [];

    // 문서 로딩 후 원래 이미지 경로를 저장
    $('.page_rolling .icon_box li img').each(function(index) {
        originalSrc[index] = $(this).attr('src');
    });

    $('.page_rolling .icon_box li').click(function () {
        var $this = $(this);
        var index = $this.index();
        var $img = $this.find('img');

        // 클릭된 li 요소에 'on' 클래스 토글
        $this.toggleClass('on');

        // 모든 li 요소의 이미지 경로를 원래대로 복원
        $('.page_rolling .icon_box li img').each(function(i) {
            if ($(this).closest('li').hasClass('on')) {
                // 'on' 클래스가 있는 li의 이미지는 변경
                $(this).attr('src', 'img/step1_' + (i + 1) + 'on.png');
            } else {
                // 'on' 클래스가 없는 li의 이미지는 원래대로
                $(this).attr('src', originalSrc[i]);
            }
        });
    });
    $('.page_rolling .select_btn button').click(function(){
        $(this).toggleClass('on')
    })


    var currentIndex = 0; // 현재 페이지 인덱스
    var $pageMove = $('.page_move');
    var $pageItems = $('.page_rolling li');
    var $progressImages = $('.pro img');
    var totalPages = $pageItems.length;

    function updatePage() {
        // 페이지 슬라이드 이동
        var translateValue = -currentIndex * 100;
        $pageMove.find('.page_rolling').css('transform', 'translateX(' + translateValue + '%)');

        // 모든 li 요소의 active 클래스 제거
        $pageItems.removeClass('active');
        // 현재 페이지에 active 클래스 추가
        $pageItems.eq(currentIndex).addClass('active');
        
        // 모든 프로그레스 바 이미지의 active 클래스 제거
        $progressImages.removeClass('active');
        // 현재 인덱스의 프로그레스 바 이미지에 active 클래스 추가
        $progressImages.eq(currentIndex).addClass('active');
    }

    // 초기 페이지 설정
    updatePage();

    // 이전 버튼 클릭 이벤트
    $('.prev').click(function() {
        if (currentIndex > 0) {
            currentIndex--;
            updatePage();
        }
    });

    // 다음 버튼 클릭 이벤트
    $('.next').click(function() {
        if (currentIndex < totalPages - 1) {
            currentIndex++;
            updatePage();
        }
    });

});   

