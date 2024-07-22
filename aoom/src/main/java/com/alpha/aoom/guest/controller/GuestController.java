package com.alpha.aoom.guest.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alpha.aoom.booking.service.BookingService;
import com.alpha.aoom.code.service.CodeService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/guest")
@Controller
public class GuestController {
	
	@Autowired
	BookingService bookingService;
	
	CodeService codeService;
	
	// 사용자가 예약한 목록 출력
	@RequestMapping("/bookList")
	public String guestBookList (@RequestParam Map<String, Object> param , HttpSession session , ModelMap modelMap ) {
		
		// 세션에서 user정보 가져오기
		Map<String, Object> userInfo = (HashMap<String, Object>) session.getAttribute("userInfo");
		
		// 세션에서 가져온 user정보에서 userId 가져오기
		String userId = userInfo.get("userId").toString();
		param.put("userId", userId);
		
		// currentPage가 param에 가지고있으면 param값 , 없으면 1
		int currentPage = (String)param.get("currentPage") != null ? Integer.parseInt((String)param.get("currentPage")) : 1 ; 
		param.put("currentPage", currentPage);
		
		modelMap.addAttribute("bookingList", bookingService.selectByUserId(param));
		modelMap.addAttribute("pagingInfo",bookingService.selectByTotalCnt(param));
		modelMap.addAttribute("currentPage", currentPage);
		
		return "/guest/bookList";
	}
	
	@RequestMapping("/bookInfo")
	public String requestMethodName(@RequestParam Map<String, Object> param , HttpSession session , ModelMap modelMap) {
		
		Map<String, Object> userInfo = (HashMap<String, Object>) session.getAttribute("userInfo");
		
		int currentPage = 1;
		
		// 세션에서 가져온 user정보에서 userId 가져오기
		String userId = userInfo.get("userId").toString();
		param.put("userId", userId);
		param.put("currentPage" , currentPage);
		
		log.info("data"+bookingService.selectByUserId(param));
		// list로받아온값 map으로 보냄 
		modelMap.put("bookingInfo", bookingService.selectByUserId(param).get(0));
			
		return "/guest/bookInfo";
	}
	
}
