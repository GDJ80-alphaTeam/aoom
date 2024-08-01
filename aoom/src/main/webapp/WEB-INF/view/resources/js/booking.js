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
        $('.plus_btn').click(function() {
            var $result = $('.result');
            var currentValue = parseInt($result.text(), 10);//숫자로 변환
            $result.text(currentValue + 1);
        });

        $('.minus_btn').click(function() {
            var $result = $('.result');
            var currentValue = parseInt($result.text(), 10);
            if (currentValue > 0) {
                $result.text(currentValue - 1);
            }
        });
    });
