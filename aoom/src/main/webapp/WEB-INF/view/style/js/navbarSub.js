document.addEventListener('DOMContentLoaded', function () {
    // 클릭시 nav 등장 ~ 퇴장
    document.querySelector('header .inner .user .profile i').addEventListener('click', function () {
        document.querySelector('header .inner ul.nav_menu').classList.toggle('on');
    });

    // 로그인 창 열기 닫기
    document.querySelector('#navMenu1 li:first-child').addEventListener('click', function () {
        document.querySelector('.log_in_bg').style.display = 'flex';
    });

    document.querySelector('.log_in .log_in_t i').addEventListener('click', function () {
        document.querySelector('.log_in_bg').style.display = 'none';
    });

    //회원가입 창 열기 닫기
    document.querySelector('#navMenu2 li:nth-child(2)').addEventListener('click', function () {
        document.querySelector('.sign_in_bg').style.display = 'flex';
    });
    
    document.querySelector('.sign_in_bg .sign_in .sign_in_t i').addEventListener('click', function () {
        document.querySelector('.sign_in_bg').style.display = 'none';
    });
    
    // 스크롤 top버튼
    document.querySelector('aside').addEventListener('click', function () {
        window.scrollTo({ top: 0, behavior: 'smooth' });
    });
});