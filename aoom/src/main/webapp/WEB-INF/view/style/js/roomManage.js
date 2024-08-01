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
$(document).ready(function () {
    //숙소관리 nav_active
    $('.inner_nav ul li').click(function () {
        $(this).addClass('active').siblings().removeClass('active')
    })

    //더보기 옵션 클릭
    $('.view_style .fa-ellipsis-vertical').click(function () {
        $(this).find('ul').toggleClass('on')
    })
    //썸네일 리스트 바꾸기 클릭 이벤트
    $('.r_manage .r_m_top .position_i i').click(function () {
        $(this).eq(0).toggleClass('view').siblings().addClass('view');
        $('.r_m_list').toggleClass('view').siblings().toggleClass('view');
    })
    //반려사유 클릭
    $('.view_style p.un_line').click(function () {
        $('.refuse_modal').addClass('active')
        $('.refuse_modal button').click(function () {
            $(this).parents('.refuse_modal').removeClass('active')
        })
    })
});