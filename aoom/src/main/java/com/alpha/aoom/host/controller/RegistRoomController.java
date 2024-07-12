package com.alpha.aoom.host.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alpha.aoom.code.service.CodeService;
import com.alpha.aoom.room.service.RoomService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/host")
public class RegistRoomController {

	@Autowired
	RoomService roomService;
	@Autowired
	CodeService codeService;
	
	// 숙소 등록 - 숙소 등록 1단계 전 숙소 초기화
	// param : userId
	@RequestMapping("/ajaxRegistRoom")
	@ResponseBody
	public Map<String, Object> registRoom(@RequestParam Map<String, Object> param) {
		log.info("param={}", param);
		
		// 숙소 등록 
		// result : roomId, userId, result
		Map<String, Object> result = roomService.registRoom(param);
		return result;
	}
	
	// 숙소 등록 클릭해서 테이블에 숙소 생성 된 후 숙소등록 1단계 페이지 호출
	// param : roomId
	@RequestMapping("/registRoom/{roomId}/basicInfo")
	public String registRoomBasicInfo(@PathVariable("roomId") String roomId, HttpSession session, ModelMap modelMap) {
		
		// amenities 목록
		List<Map<String, Object>> roomcate = codeService.retriveCode("roomcate");
		log.info("roomcate={}", roomcate);
		// roomtype 목록
		List<Map<String, Object>> roomtype = codeService.retriveCode("roomtype");
		log.info("roomtype={}", roomtype);
		
		// modelMap에 amenities, roomtype 목록 추가
		modelMap.put("roomcate", roomcate);
		modelMap.put("roomtype", roomtype);
		return "/host/regist/basicInfo";
	}
}
