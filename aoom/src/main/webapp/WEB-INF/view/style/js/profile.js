

var swiper = new Swiper(".slide_r", {
  slidesPerView: "auto",
  spaceBetween: 28,
  pagination: {
    el: ".swiper-pagination",
    clickable: true,
  },
  autoplay: {
    delay: 3000,
  },
  loop: true
});
/* var swiper = new Swiper(".mySwiper", {
  slidesPerView: "auto",
  spaceBetween: 30,
  freeMode: true,
  autoplay: {
    delay: 3000,
  }, loop: true, pagination: {
    el: ".swiper-pagination",
    clickable: true,
  },
}); */