package com.alpha.aoom.main.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alpha.aoom.code.service.CodeService;
import com.alpha.aoom.room.service.RoomService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MainController {
	
	@Autowired
	RoomService roomService;
	
	@Autowired
	CodeService codeService;
	
	// 메인페이지 호출
	@RequestMapping("/main")
	public String main(ModelMap modelMap) {
		
		// 숙소 카테고리 조회
		List<Map<String, Object>> roomCategory = codeService.selectCode("roomcate");

		// 숙소 유형 조회(카테고리, 게스트하우스)
		List<Map<String, Object>> roomType = codeService.selectCode("roomtype");

		// 숙소 편의시설 목록 조회(카테고리, 게스트하우스)
		List<Map<String, Object>> amenities = codeService.selectCode("amenities");
		
		// 숙소 전체 목록 조회
		List<Map<String, Object>> roomAllList = roomService.retrieveList();
		
		// 조회수 TOP4 숙소 조회
		List<Map<String, Object>> viewsDesc = roomService.viewsDesc();
		
		// 별점 TOP4 숙소 조회
		List<Map<String, Object>> ratingDesc = roomService.ratingDesc();
		
		// 예약 TOP4 숙소 조회
		List<Map<String, Object>> bookingDesc = roomService.bookingDesc();
		
		// 위시리스트 TOP4 숙소 조회
		List<Map<String, Object>> wishListDesc = roomService.wishListDesc();
		
		// modelMap에 숙소 전체 목록 조회한 값 넣기
		modelMap.addAttribute("roomAllList", roomAllList);
		modelMap.addAttribute("viewsDesc", viewsDesc);
		modelMap.addAttribute("starDesc", ratingDesc);
		modelMap.addAttribute("bookingDesc", bookingDesc);
		modelMap.addAttribute("wishListDesc", wishListDesc);
		modelMap.addAttribute("roomCategory", roomCategory);
		modelMap.addAttribute("roomType", roomType);
		modelMap.addAttribute("amenities", amenities);
		
		return "main";
	}
}
