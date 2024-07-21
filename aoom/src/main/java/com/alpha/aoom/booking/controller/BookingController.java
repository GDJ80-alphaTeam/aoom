package com.alpha.aoom.booking.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alpha.aoom.onedayPrice.service.OnedayPriceService;
import com.alpha.aoom.review.service.ReviewService;
import com.alpha.aoom.room.service.RoomService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/booking")
@Controller
public class BookingController {

	@Autowired
	RoomService roomService;
	
	@Autowired
	OnedayPriceService onedayPriceService;
	
	@Autowired
	ReviewService reviewService;
	
	@RequestMapping("book")
	public String booking(@RequestParam Map<String, Object> param, ModelMap modelMap) {
		log.info("param : " + param);
		
		// 체크인, 체크아웃, 숙박인원 값
		String roomId = (String)param.get("roomId");
		String startDate = (String)param.get("startDate");
		String endDate = (String)param.get("endDate");
		String usePeople = (String)param.get("usePeople");
		String bookingDate = startDate+" ~ "+endDate;
		
		// 카테고리 이름 조회
		Map<String, Object> roomInfo = roomService.selectByCategoryName(param);
		// 숙소의 평점과 후기의 갯수 조회
		Map<String, Object> ratingReview = reviewService.selectByRatingAvgReviewCnt(param);
		// 숙박일정에 따른 숙박가격 조회
		Map<String, Object> bookingPrice = onedayPriceService.selectByBookingDate(param);
		// 숙박일정에 따른 숙박가격 세부조회(일자별 가격)
		List<Map<String, Object>> bookingPriceDetail = onedayPriceService.selectByBookingDateDetail(param);
		
		// modelMap에 데이터 추가
		modelMap.addAttribute("roomId", roomId);
		modelMap.addAttribute("startDate", startDate);
		modelMap.addAttribute("endDate", endDate);
		modelMap.addAttribute("usePeople", usePeople);
		modelMap.addAttribute("bookingDate", bookingDate);
		modelMap.addAttribute("roomInfo", roomInfo);
		modelMap.addAttribute("ratingReview", ratingReview);
		modelMap.addAttribute("bookingPrice", bookingPrice);
		modelMap.addAttribute("bookingPriceDetail", bookingPriceDetail);
		
		return "/booking/book";
	}
}