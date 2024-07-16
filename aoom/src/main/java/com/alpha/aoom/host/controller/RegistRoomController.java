package com.alpha.aoom.host.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	// 숙소 등록 - 숙소 초기화 및 숙소 등록 1단계 페이지로 이동
	@RequestMapping(value = "/roomManage/setupRoom", method = RequestMethod.POST)
	public String setupRoom(HttpSession session) {
		
		// 세션에서 user정보 가져오기
		Map<String, Object> userInfo = (HashMap<String, Object>)session.getAttribute("userInfo");
		
		// 세션에서 가져온 user정보에서 userId 가져오기
		String userId = (String)userInfo.get("userId");
		
		// 숙소 등록 - 숙소 초기화 
		// setupRoomInfo : roomId, userId
		Map<String, Object> setupRoomInfo = roomService.setupRoom(userId);
		if(setupRoomInfo.get("roomId") == null) {
			return "redirect:/host/roomManage";
		}
		
		return "redirect:/host/roomManage/registRoom/firstInfo?roomId=" + setupRoomInfo.get("roomId");
	}
	
	// 숙소 등록 - 숙소 등록 1단계 페이지 호출
	@RequestMapping("/roomManage/registRoom/firstInfo")
	public String firstInfoView(@RequestParam String roomId, ModelMap modelMap) {
		
		log.info("roomId={}", roomId);
		
		// modelMap에 roomId 추가
		modelMap.put("roomId", roomId);
		
		// 숙소 category 목록
		List<Map<String, Object>> roomcate = codeService.selectCode("roomcate");
		log.info("roomcate={}", roomcate);
		
		// roomtype 목록
		List<Map<String, Object>> roomtype = codeService.selectCode("roomtype");
		log.info("roomtype={}", roomtype);
		
		// modelMap에 숙소 category, roomtype 목록 추가
		modelMap.put("roomcate", roomcate);
		modelMap.put("roomtype", roomtype);
		
		return "/host/regist/firstInfo";
	}
	
	// 숙소 등록 - 숙소 등록 1단계 정보 DB 입력 및 숙소 등록 2단계 페이지 이동
	@RequestMapping("/roomManage/registRoom/registFirstInfo")
	public String registRoomFirstInfo(@RequestParam Map<String, Object> param, ModelMap modelMap) {
		
		log.info("roomId={}", param.get("roomId"));
		
		// modelMap에 roomId 추가
		modelMap.put("roomId", param.get("roomId"));
		log.info("param={}", param);
		
		// 1단계 정보 없데이트
		roomService.addFirstInfo(param);
		
		return "redirect:/host/roomManage/registRoom/secondInfo?roomId=" + param.get("roomId");
	}
	
	// 숙소 등록 - 숙소 등록 2단계 페이지 호출
	@RequestMapping("/roomManage/registRoom/secondInfo")
	public String secondInfoView(@RequestParam String roomId, ModelMap modelMap) {
		
		log.info("roomId={}", roomId);
		
		// modelMap에 roomId 추가
		modelMap.put("roomId", roomId);
		
		// amenities 목록
		List<Map<String, Object>> amenities = codeService.selectCode("amenities");
		log.info("amenities={}", amenities);
		
		// modelMap에 amenities 목록 추가
		modelMap.put("amenities", amenities);
		
		return "/host/regist/secondInfo";
	}
	
	// 편의시설 - checkbox 다중 값 선택시 배열로 넘어오기 때문에 @RequsetParam 따로 설정
	// 숙소 등록 - 숙소 등록 2단계 정보 DB 입력 및 숙소 등록 3단계 페이지 이동
	@RequestMapping("/roomManage/registRoom/registSecondInfo")
	public String registRoomSecondInfo(@RequestParam Map<String, Object> param, 
									   @RequestParam("amenities") List<String> amenities, 
									   ModelMap modelMap) {
		log.info("param={}", param);
		log.info("amenities={}", amenities);
		
		// param에 amenities값(리스트) 추가
		param.put("amenities", amenities);
		log.info("param={}", param);
		
		// modelMap에 roomId 추가
		modelMap.put("roomId", param.get("roomId"));
		
		return "redirect:/host/roomManage/registRoom/thirdInfo?roomId=" + param.get("roomId");
	}
	
	// 숙소 등록 - 숙소 등록 3단계 페이지 호출
	@RequestMapping("/roomManage/registRoom/thirdInfo")
	public String thirdInfoView(@RequestParam String roomId, ModelMap modelMap) {
		
		log.info("roomId={}", roomId);
		
		return "/host/regist/thirdInfo";
	}
}
