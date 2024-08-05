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
import com.alpha.aoom.util.BaseController;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/host/revenue")
public class RevenueController extends BaseController {

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
		
		
		return "/host/revenue2";
	}
	
	// 호스트 수입 불러오는 ajax
	@RequestMapping("/ajaxSelectRevenue")
	@ResponseBody
	public Map<String, Object> ajaxSelectRevenue(@RequestParam Map<String, Object> param) {
		log.info("호스트 수입 ajax param={}", param.toString());
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		// 전체 or 각 숙소의 월별 수입 가져오기
		List<Map<String, Object>> revenueList = roomPaymentService.selectByHostRevenue(param);
		model.put("revenue", revenueList);
		
		if(!revenueList.isEmpty() ) {
			return getSuccessResult(model);
		} else {
			return getFailResult(model);
		}
	}
	
	// 호스트 월별 수입 상세보기
	@RequestMapping("/ajaxSelectRevenueByMonth")
	@ResponseBody
	public Map<String, Object> ajaxSelectRevenueByMonth(@RequestParam Map<String, Object> param) {
		log.info("호스트 수입 상세보기 ajax param={}", param.toString());
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		// 전체 or 각 숙소의 월별 수입 상세정보 가져오기
		List<Map<String, Object>> revenueOne = roomPaymentService.selectByPaymentMonth(param);
		log.info("호스트 수입 상세보기 revenueOne={}", revenueOne.toString());
		model.put("revenueOne", revenueOne);
		
		if(!revenueOne.isEmpty() ) {
			return getSuccessResult(model);
		} else {
			return getFailResult(model);
		}
	}
}
