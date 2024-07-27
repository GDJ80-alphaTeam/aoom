package com.alpha.aoom.host.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alpha.aoom.room.service.RoomService;
import com.alpha.aoom.roomPayment.service.RoomPaymentService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/host/revenue")
public class RevenueController {

	@Autowired
	RoomService roomService;
	
	@Autowired
	RoomPaymentService roomPaymentService;
	
	// 호스트모드 수입 페이지 호출
	@RequestMapping
	public String revenue(@RequestParam Map<String, Object> param, HttpSession session, ModelMap modelMap) {
		log.info("호스트 수입 페이지 param={}", param.toString());
		
		// 세션에서 user정보 가져오기
		Map<String, Object> userInfo = (HashMap<String, Object>)session.getAttribute("userInfo");
		
		// 활성화 중인 숙소만 가져오도록 설정
		modelMap.addAttribute("roomList", roomService.selectByUserId(userInfo));
		modelMap.addAttribute("selectedRoomId", param.get("roomId"));
		
		
		return "/host/revenue";
	}
	
	// 호스트 수입 불러오는 ajax
	@RequestMapping("/ajaxSelectRevenue")
	@ResponseBody
	public List<Map<String, Object>> ajaxSelectRevenue(@RequestParam Map<String, Object> param) {
		log.info("호스트 수입 ajax param={}", param.toString());
		// 전체 or 숙소별 수입 가져오기
		
		return (List<Map<String, Object>>) roomPaymentService.selectByHostRevenue(param);
	}
}
