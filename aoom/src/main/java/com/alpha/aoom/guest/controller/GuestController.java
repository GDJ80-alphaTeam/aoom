package com.alpha.aoom.guest.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String guestBookList (HttpSession session , ModelMap modelMap) {
		
		// 세션에서 user정보 가져오기
		Map<String, Object> userInfo = (HashMap<String, Object>) session.getAttribute("userInfo");
			
		//log.info(bookingService.selectByUserId(userInfo)+"test");
		
		modelMap.addAttribute("bookingList", bookingService.selectByUserId(userInfo));
		modelMap.addAttribute("bookingDate", bookingService.selectByBookingMap(userInfo));
		
		return "/guest/bookList";
	}
	
}
