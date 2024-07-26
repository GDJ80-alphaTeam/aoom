package com.alpha.aoom.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alpha.aoom.code.service.CodeService;
import com.alpha.aoom.room.service.RoomService;
import com.alpha.aoom.wishList.service.WishListService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MainController {
	
	@Autowired
	RoomService roomService;
	
	@Autowired
	CodeService codeService;
	
	@Autowired
	WishListService wishListService;
	
	// 메인페이지 호출
	@RequestMapping("/main")
	public String main(ModelMap modelMap, HttpSession session) {
		
		// 숙소 카테고리 조회
		List<Map<String, Object>> roomCategory = codeService.selectByGroupKey("roomcate");

		// 숙소 유형 조회(일반숙소, 게스트하우스)
		List<Map<String, Object>> roomType = codeService.selectByGroupKey("roomtype");

		// 숙소 편의시설 목록 조회(와이파이, 주차장 등)
		List<Map<String, Object>> amenities = codeService.selectByGroupKey("amenities");
		
		// 숙소 전체 목록 조회
		List<Map<String, Object>> roomAllList = roomService.select();
		
		// 조회수 TOP4 숙소 조회
		List<Map<String, Object>> viewsDesc = roomService.selectByViews();
		
		// 별점 TOP4 숙소 조회
		List<Map<String, Object>> ratingDesc = roomService.selectByRating();
		
		// 예약 TOP4 숙소 조회
		List<Map<String, Object>> bookingDesc = roomService.selectByBooking();
		
		// 위시리스트 TOP4 숙소 조회
		List<Map<String, Object>> wishListDesc = roomService.selectByWishList();
		
		// modelMap에 숙소 전체 목록 조회한 값 넣기
		modelMap.addAttribute("roomCategory", roomCategory);
		modelMap.addAttribute("roomType", roomType);
		modelMap.addAttribute("amenities", amenities);
		modelMap.addAttribute("roomAllList", roomAllList);
		modelMap.addAttribute("viewsDesc", viewsDesc);
		modelMap.addAttribute("ratingDesc", ratingDesc);
		modelMap.addAttribute("bookingDesc", bookingDesc);
		modelMap.addAttribute("wishListDesc", wishListDesc);
		
		// user의 세션이 있다면 위시리스트 목록을 modelMap으로 보내기
		if(session.getAttribute("userInfo") != null) {
			Map<String, Object> wishListParam = new HashMap<String, Object>();
			wishListParam.put("userId", ((Map<String, Object>) session.getAttribute("userInfo")).get("userId"));
//			log.info("user의 위시리스트={}", wishListService.select(wishListParam).toString());
			modelMap.addAttribute("userWishRoom", wishListService.select(wishListParam));
		}
		
		return "main";
	}
}
