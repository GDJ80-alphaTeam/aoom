package com.alpha.aoom.host.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alpha.aoom.room.service.RoomMapper;
import com.alpha.aoom.room.service.RoomService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/host")
public class HostController {
	
	@Autowired
	RoomService roomService;

	// 호스트 모드 메인화면 호출
	@RequestMapping("/main")
	public String main() {
		return "/host/main";
	}
	
	// 호스트 모드 숙소 관리 화면 호출
	@RequestMapping("/roomManage")
	public String roomManage(HttpSession session, ModelMap modelMap) {
		
		// 세션에서 user정보 가져오기
		Map<String, Object> userInfo = (HashMap<String, Object>)session.getAttribute("userInfo");
		
		// 세션에서 가져온 user정보에서 userId 가져오기
		String userId = userInfo.get("userId").toString();
		
		// userId로 호스팅중인 숙소 목록 가져오기
		List<Map<String, Object>> roomListByUser = (List<Map<String, Object>>) roomService.selectByUserId(userId);
		
		// ModelMap에 담아 view로 넘겨주기
		modelMap.addAttribute("roomListByUser", roomListByUser);		
		
		return "/host/roomManage";
	}
}
