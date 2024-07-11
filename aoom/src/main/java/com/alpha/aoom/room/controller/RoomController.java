package com.alpha.aoom.room.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alpha.aoom.room.service.RoomService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/room")
@Controller
public class RoomController {

	@Autowired
	RoomService roomservice;
	
	// 숙소상세보기 위치
	// parameter: userId(get)
	@RequestMapping("/roomInfo")
	public String roomInfo(@RequestParam Map<String, Object> param , ModelMap modelMap) {
		
		List<HashMap<String,Object>> roomInfo = roomservice.retriveRoomInfo(param);
		log.info("숙소상세보기 불러온값" + roomInfo);
		modelMap.addAttribute("roomInfo",roomInfo);
		return "/room/roomInfo";
	}
	
}
