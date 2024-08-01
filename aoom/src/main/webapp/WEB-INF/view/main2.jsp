<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="AOOM 웹 사이트 입니다">
    <meta name="keywords" content="AOOM, 웹디자인, 포트폴리오, 디자이너, 웹 포트폴리오">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AOOM 메인 페이지</title>
    <script src="https://kit.fontawesome.com/82b4a4fcad.js"></script>
    <link rel="stylesheet" href="/style/css/main.css">
    <link rel="stylesheet" href="/style/css/common.css">
    <script src="/style/js/main.js" defer></script>
</head>

<body>

    <div class="log_in_bg"><!-- 로그인 모달 -->
        <div class="log_in">
            <div class="log_in_t">
                <i class="fa-solid fa-xmark"></i>
                <p>로그인</p>
            </div><!--// log_in_t -->

            <ul class="log_in_b">
                <li>
                    <input type="text" value="이메일을 입력해주세요">
                    <input type="text" value="비밀번호를 입력해주세요">
                    <div class="option_btn">
                        <p>이메일 찾기</p>
                        <p>비밀번호 변경</p>
                    </div><!-- option_btn -->
                </li>
                <li class="login_btn">
                    <button type="submit">로그인</button>
                    <button>회원가입</button>
                </li><!-- //login_btn -->
            </ul> <!-- //log_in_b -->
        </div>
    </div><!-- //log_in -->
    </div><!-- //log_in_bg -->


    <div class="sign_in_bg"><!-- 회원가입 모달 -->
        <div class="sign_in">
            <div class="sign_in_t">
                <i class="fa-solid fa-xmark"></i>
                <p>회원가입</p>
            </div><!--// sign_in -->
            <div class="sign_in_b">
                <div class="email">
                    <p>이메일</p>
                    <div class="box">
                        <input type="text" value="이메일을 입력해주세요">
                        <button>인증</button>
                    </div><!-- //box -->

                </div><!-- //email -->
                <div class="certification">
                    <p>인증번호</p>
                    <div class="box">
                        <input type="text" value="인증번호를 입력해주세요">
                        <button>확인</button>
                    </div><!-- //box -->
                </div><!-- //certification -->
                <div>
                    <p>비밀번호</p>
                    <input type="text" value="비밀번호를 입력(문자, 숫자, 특수문자 포함 8~20자)">
                </div>
                <div>
                    <p>비밀번호 확인</p>
                    <input type="text" value="비밀번호 재입력">
                </div>
                <div>
                    <p>생년월일</p>
                    <input type="text" value="생년월일을 입력해주세요">
                </div>
                <div>
                    <p>이름</p>
                    <input type="text" value="생년월일을 입력해주세요">
                </div>
                <div>
                    <p>전화번호</p>
                    <input type="text" value="휴대폰 번호 입력( - 제외 11자리 입력 )">
                </div>
            </div><!-- //sign_in_b -->
            <button class="pink">회원가입</button>
        </div><!-- //sign_in -->
    </div><!-- //sign_in_bg -->

    <div class="filter_bg"><!-- 필터창 -->
        <div class="filter">
            <div class="filter_t">
                <i class="fa-solid fa-xmark"></i>
                <p>필터</p>
            </div><!--// filter_t -->
            <ul class="filter_contents">
                <li>
                    <h2>가격</h2>
                    <p>1박 요금( 수수료 및 세금 포함)</p>
                    <div class="price_box">
                        <input type="text" placeholder="최소 가격">
                        <input type="text" placeholder="최대 가격">
                    </div><!-- //price_box -->
                </li>
                <li>
                    <h2>숙소 유형</h2>
                    <p>방, 집 전체 등 원하는 숙소 유형을 검색해보세요.</p>
                    <div class="click_box">
                        <button class="active">전체 보기</button>
                        <button>게스트 하우스</button>
                        <button>일반 숙소</button>
                    </div><!-- //click_box -->
                </li>
                <li>
                    <h2>침실 · 침대 · 화장실 </h2>
                    <div class="bedroom">
                        <p>침실</p>
                        <button class="not active">상관없음</button>
                        <button>1</button>
                        <button>2</button>
                        <button>3</button>
                        <button>4</button>
                        <button>5+</button>
                    </div><!-- //bedroom -->
                    <div class="bed">
                        <p>침대</p>
                        <button class="not active">상관없음</button>
                        <button>1</button>
                        <button>2</button>
                        <button>3</button>
                        <button>4</button>
                        <button>5+</button>
                    </div><!-- //bed -->
                    <div class="restroom">
                        <p>화장실</p>
                        <button class="not active">상관없음</button>
                        <button>1</button>
                        <button>2</button>
                        <button>3</button>
                        <button>4</button>
                        <button>5+</button>
                    </div><!-- //restroom -->
                </li>
                <li>
                    <h2>편의시설</h2>
                    <ul>
                        <li class="chk"> <input type="checkbox"> <label for="check_btn"><span>와이파이</span></label></li>
                        <li class="chk"> <input type="checkbox"> <label for="check_btn"><span>주차장</span></label></li>
                        <li class="chk"> <input type="checkbox"> <label for="check_btn"><span>에어컨</span></label></li>
                        <li class="chk"> <input type="checkbox"> <label for="check_btn"><span>주방</span></label></li>
                        <li class="chk"> <input type="checkbox"> <label for="check_btn"><span>엘리베이터</span></label></li>
                        <li class="chk"> <input type="checkbox"> <label for="check_btn"><span>드라이기</span></label></li>
                        <li class="chk"> <input type="checkbox"> <label for="check_btn"><span>냉장고</span></label></li>
                        <li class="chk"> <input type="checkbox"> <label for="check_btn"><span>ott</span></label></li>
                    </ul>
                    <div class="chk">

                    </div><!-- //chk -->
                    <div class="chk">

                    </div><!-- //chk -->
                    <div class="chk">

                    </div><!-- //chk -->
                    <div class="chk">

                    </div><!-- //chk -->
                    <div class="chk">

                    </div><!-- //chk -->
                    <div class="chk">

                    </div><!-- //chk -->
                    <div class="chk">

                    </div><!-- //chk -->
                    <div class="chk">

                    </div><!-- //chk -->
                </li>
            </ul><!-- //filter_contents -->
            <div class="filter_b">
                <button>전체해제</button>
                <button>필터적용</button>
            </div>
            <div class="custom-scrollbar">
                <div class="custom-scrollbar-thumb"></div>
            </div>
        </div><!-- //filter -->
    </div><!-- filter -->

    <div class="fixed">
        <header>
            <div class="inner">

                <ul class="nav_menu">
                    <li>
                        <p>로그인</p>
                    </li>
                    <li>
                        <p>회원가입</p>
                    </li>
                    <li>
                        <p>자주묻는 질문</p>
                    </li>
                </ul><!-- //nav_menu -->

                <a href="#" class="logo">
                    <img src="/resources/img/nav_1.png" alt="AOOM로고">
                </a><!-- //logo -->

                <ul class="search">
                    <li class="destination">
                        <span>여행지</span>
                        <input type="text" value="내용을 입력해주세요.">
                    </li><!-- //destination -->
                    <li class="check_in">
                        <span>체크인</span>
                        <input type="date" value="날짜 추가">
                    </li><!-- //check_in -->
                    <li class="check_out">
                        <span>체크아웃</span>
                        <input type="date" value="날짜 추가">
                    </li><!-- //check_out -->
                    <li class="traveler">
                        <span>여행자</span>
                        <input type="text" value="내용을 입력해주세요.">
                    </li><!-- //traveler -->
                    <li class="s_btn">
                        <img src="/resources/img/nav_2.png" alt="검색 아이콘">
                    </li><!-- search_btn -->
                </ul><!-- //search -->

                <div class="user">
                    <div class="host_mode">
                        <a href="">
                            호스트 모드
                        </a>
                    </div><!-- //host_mode -->
                    <div class="profile">
                        <img src="/resources/img/nav_3.png" alt="유저 프로필">
                        <p>로그인</p>
                        <i class="fa-solid fa-bars"></i>
                    </div><!-- //profile -->
                </div><!--//user -->

            </div><!-- //inner -->
        </header><!--//header-->

        <div class="category">
            <ul class="inner">
                <li class="fade_in">
                    <img src="/resources/img/roomlist_1.png" alt="골프장">
                    <span>골프장</span>
                </li>
                <li>
                    <img src="/resources/img/roomlist_2.png" alt="국립공원">
                    <span>국립공원</span>
                </li>
                <li>
                    <img src="/resources/img/roomlist_3.png" alt="농장">
                    <span>농장</span>
                </li>
                <li>
                    <img src="/resources/img/roomlist_4.png" alt="최고의 전망">
                    <span>최고의 전망</span>
                </li>
                <li>
                    <img src="/resources/img/roomlist_5.png" alt="캠핑장">
                    <span>캠핑장</span>
                </li>
                <li>
                    <img src="/resources/img/roomlist_6.png" alt="컨테이너 하우스">
                    <span>컨테이너 하우스</span>
                </li>
                <li>
                    <img src="/resources/img/roomlist_7.png" alt="호수 근처">
                    <span>호수 근처</span>
                </li>
                <li>
                    <img src="/resources/img/roomlist_8.png" alt="풀빌라">
                    <span>풀빌라</span>
                </li>
                <li>
                    <img src="/resources/img/roomlist_9.png" alt="향토적인">
                    <span>향토적인</span>
                </li>
                <li>
                    <img src="/resources/img/roomlist_10.png" alt="오션뷰">
                    <span>오션뷰</span>
                </li>
                <li>
                    <img src="/resources/img/roomlist_11.png" alt="한옥">
                    <span>한옥</span>
                </li>
                <li>
                    <img src="/resources/img/roomlist_12.png" alt="전문가급 주방">
                    <span>전문가급 주방</span>
                </li>
                <li class="filter">
                    <button type="button">
                        <img src="/resources/img/roomlist_13.png" alt="필터">
                        <span>필터</span>
                    </button>
                </li>
            </ul>
        </div><!-- //category -->
    </div>

    <div class="room_container inner">
        <div class="room fade_in">
            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
        </div><!-- //room -->
        <div class="room">

            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
        </div><!-- //room -->
        <div class="room">

            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
        </div><!-- //room -->
        <div class="room">

            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
        </div><!-- //room -->
        <div class="room">

            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
        </div><!-- //room -->
        <div class="room">

            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
        </div><!-- //room -->
        <div class="room">

            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
        </div><!-- //room -->
        <div class="room">

            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
        </div><!-- //room -->
        <div class="room">

            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
        </div><!-- //room -->
        <div class="room">

            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
        </div><!-- //room -->
        <div class="room">

            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
        </div><!-- //room -->
        <div class="room">

            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
            <ul>

                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
                <li>
                    <a href="#">
                        <div class="img_box">
                            <img src="/resources/img/roomlist_17.png" alt="숙소사진">
                            <div class="heart_btn">
                                <i class="fa-solid fa-heart"></i>
                                <i class="fa-regular fa-heart"></i>


                            </div>

                        </div><!-- //img_box -->
                        <div class="txt_box">
                            <div class="t_box_top">
                                <div class="r_name">
                                    숙소이름
                                </div><!-- //r_name -->
                                <div class="r_star">
                                    <img src="/resources/img/roomlist_16.png" alt="별점">
                                    <span>5.45</span>
                                </div><!-- //t_star -->
                            </div><!-- //t_box_top -->

                            <div class="r_option">
                                요약내용
                            </div><!-- //r_option -->
                            <div class="r_date">
                                날짜
                            </div><!-- //r_date -->
                            <div class="r_price">
                                가격
                            </div><!-- //r_price -->
                        </div><!-- //txt_box -->
                    </a>
                </li>
            </ul>
        </div><!-- //room -->
    </div><!-- //room_container -->


    <footer class="inner clear">
        <div class="f_top">
            <div class="ft_left">
                <p>© 2024 Airbnb, Inc. · 개인정보 처리방침 · 이용약관 · 사이트맵 · 환불 정책 · 회사 세부정보</p>
            </div>
            <div class="ft_right">
                <p>자주 묻는 질문</p>
            </div>
        </div><!-- //f_top -->
        <div class="f_bottom">
            <span>
                웹사이트제공자:GDJ80alphaTeam,privateunlimitedcompany,8HanoverQuayDublin2,D02DP23Ireland|팀장:이용훈|VAT번호:IE12345678L사업자등록번호:IE123456|연락처:newlife5991@naver.com,
                웹사이트,010-7635-9302|호스팅서비스제공업체:아마존웹서비스|AOOM은 <br>
                통신판매중개자로AOOM플랫폼을통하여게스트와호스트사이에이루어지는통신판매의당사자가아닙니다.AOOM플랫폼을통하여 예약된 숙소, 호스트 서비스에 관한 의무와 책임은 해당 서비스를 제공하는
                호스트에게 있습니다.
            </span>
        </div><!-- //f_bottom -->
    </footer>

    <aside>
        <i class="fa-solid fa-chevron-up"></i>
        <span>TOP</span>
    </aside>

</body>

</html>