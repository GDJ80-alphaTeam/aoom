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
import com.alpha.aoom.util.BaseController;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/host")
public class HostController extends BaseController{
	
	@Autowired
	RoomService roomService;

	// 호스트 모드 메인화면 호출
	@RequestMapping("/main")
	public String main(HttpSession session, ModelMap modelMap) {
		
		// 세션에서 user정보 가져오기
		Map<String, Object> userInfo = (HashMap<String, Object>)session.getAttribute("userInfo");
		log.info("userInfo={}", userInfo);
		
		modelMap.put("userInfo", userInfo);
		
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
		for (Map<String, Object> map : roomListByUser) {
			log.info("map={}", map);
		}
		
		// ModelMap에 담아 view로 넘겨주기
		modelMap.addAttribute("roomListByUser", roomListByUser);		
		
		return "/host/roomManage";
	}
	
	// 숙소 삭제 - 숙소 상태(roomstat_code)를 삭제(rst05)로 변경
	@ResponseBody
	@RequestMapping("/roomManage/ajaxDeleteRoom")
	public Map<String, Object> ajaxDeleteRoom(@RequestParam Map<String, Object> param) {
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		log.info("param={}", param);
		
		// 숙소의 상태 변경(rst05 - 삭제)
		int row = roomService.update(param);
		
		// 숙소 상태 변경(rst05 - 삭제) 성공 시 
		if(row == 1) {
			log.info(getSuccessResult(model).toString());
			return getSuccessResult(model);
		} else { // 숙소 상태 변경(rst05 - 삭제) 실패 시
			return getFailResult(model);
		}
	}
}
