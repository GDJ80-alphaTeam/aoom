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