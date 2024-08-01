document.addEventListener('DOMContentLoaded', function () {
    // 클릭시 nav 등장 ~ 퇴장
    document.querySelector('header .inner .user .profile i').addEventListener('click', function () {
        document.querySelector('header .inner ul.nav_menu').classList.toggle('on');
    });

    // 로그인 창 열기 닫기
    document.querySelector('header .inner ul.nav_menu li:first-child').addEventListener('click', function () {
        document.querySelector('.log_in_bg').style.display = 'flex';
    });

    document.querySelector('.log_in .log_in_t i').addEventListener('click', function () {
        document.querySelector('.log_in_bg').style.display = 'none';
    });

    //회원가입 창 열기 닫기
    document.querySelector('header .inner ul.nav_menu li:nth-child(2)').addEventListener('click', function () {
        document.querySelector('.sign_in_bg').style.display = 'flex';
    })
    document.querySelector('.sign_in_bg .sign_in .sign_in_t i').addEventListener('click', function () {
        document.querySelector('.sign_in_bg').style.display = 'none';
    });



    // room 하트 찜 버튼
    const heartButtons = document.querySelectorAll('.room ul li .heart_btn');

    // 찜 버튼 클릭
    heartButtons.forEach(function (btn, index) {
        btn.addEventListener('click', function (event) {
            event.preventDefault(); // 기본 동작 막기
            const icon = this.querySelector('i');
            const isActive = icon.classList.toggle('active');
            icon.nextElementSibling.style.display = isActive ? 'none' : 'block';
            // 로컬 스토리지에 찜 상태 저장
            /*     localStorage.setItem(`heart_btn_${index}`, isActive); */
        });
    });
    // 로컬 스토리지에서 상태 로드
    /*    heartButtons.forEach(function (btn, index) {
         const icon = btn.querySelector('i');
         const isActive = localStorage.getItem(`heart_btn_${index}`) === 'true';
         if (isActive) {
             icon.classList.add('active');
             icon.nextElementSibling.style.display = 'none';
         }
     }); */


    // 카테고리 클릭시 해당 숙소 리스트로 바꾸기
    const categoryItems = document.querySelectorAll('.category li');
    let lastClickedIndex = 0;

    categoryItems.forEach(function (category, index) {
        category.addEventListener('click', function () {
            if (category.classList.contains('filter')) {
                // 필터 클릭시 열림
                document.querySelector('.filter_bg').style.display = 'flex';
                document.querySelector('.filter_bg .filter .filter_t i').addEventListener('click', (function () {
                    document.querySelector('.filter_bg').style.display = 'none';
                }));

                // 클릭된 버튼에 클래스 'active' 클래스 처리
                document.querySelectorAll('.filter_contents li:nth-child(2) .click_box button').forEach(function (button) {
                    button.addEventListener('click', function () {
                        // 클릭된 버튼에 'active' 클래스 추가
                        button.classList.add('active');

                        // 형제 요소들에서 'active' 클래스 제거
                        let siblings = Array.prototype.filter.call(button.parentNode.children, function (child) {
                            return child !== button;
                        });
                        siblings.forEach(function (sibling) {
                            sibling.classList.remove('active');
                        });
                    });
                });
                document.querySelectorAll('.filter_contents li:nth-child(3) button').forEach(function (button) {
                    button.addEventListener('click', function () {
                        // 클릭된 버튼에 'active' 클래스 추가
                        button.classList.add('active');

                        // 형제 요소들에서 'active' 클래스 제거
                        let siblings = Array.prototype.filter.call(button.parentNode.children, function (child) {
                            return child !== button;
                        });
                        siblings.forEach(function (sibling) {
                            sibling.classList.remove('active');
                        });
                    });
                });
            } else {
                // 일반 카테고리 클릭시 room리스트 띄우기
                lastClickedIndex = index;
                document.querySelectorAll('.room_container .room').forEach(function (room, i) {
                    if (i === index) {
                        room.classList.add('fade_in');
                    } else {
                        room.classList.remove('fade_in');
                    }
                }); 
            }


        });

    });


    //필터 커스텀 스크롤 & 마우스 휠 연결
    const filterContents = document.querySelector('.filter_contents');
    const customScrollbar = document.querySelector('.custom-scrollbar');
    const customScrollbarThumb = document.querySelector('.custom-scrollbar-thumb');

    const updateScrollbarThumbPosition = () => {
        const scrollPercentage = filterContents.scrollTop / (filterContents.scrollHeight - filterContents.clientHeight);
        const thumbPosition = scrollPercentage * (customScrollbar.clientHeight - customScrollbarThumb.clientHeight);
        customScrollbarThumb.style.top = `${thumbPosition}px`;
    };

    filterContents.addEventListener('scroll', updateScrollbarThumbPosition);

    customScrollbarThumb.addEventListener('mousedown', (event) => {
        const startY = event.clientY;
        const startTop = customScrollbarThumb.offsetTop;

        const onMouseMove = (event) => {
            const deltaY = event.clientY - startY;
            const newTop = startTop + deltaY;
            const scrollPercentage = newTop / (customScrollbar.clientHeight - customScrollbarThumb.clientHeight);
            filterContents.scrollTop = scrollPercentage * (filterContents.scrollHeight - filterContents.clientHeight);
        };

        const onMouseUp = () => {
            document.removeEventListener('mousemove', onMouseMove);
            document.removeEventListener('mouseup', onMouseUp);
        };

        document.addEventListener('mousemove', onMouseMove);
        document.addEventListener('mouseup', onMouseUp);
    });

    filterContents.addEventListener('wheel', (event) => {
        event.preventDefault();
        filterContents.scrollTop += event.deltaY;
        updateScrollbarThumbPosition();
    });

    updateScrollbarThumbPosition();


    // 스크롤 top버튼
    document.querySelector('aside').addEventListener('click', function () {
        window.scrollTo({ top: 0, behavior: 'smooth' });
    });
});

