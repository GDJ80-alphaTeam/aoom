package com.alpha.aoom.room.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alpha.aoom.review.service.ReviewMapper;
import com.alpha.aoom.room.service.RoomService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/room")
@Controller
public class RoomController {

	@Autowired
	RoomService roomService;
	@Autowired
	ReviewMapper reviewMapper;
	
	// 숙소상세보기 뷰페이지 호출
	// parameter: userId(get)
	@RequestMapping("/roomInfo")
	public String roomInfo(@RequestParam Map<String, Object> param , ModelMap modelMap) {
		
		
		List<HashMap<String,Object>> roomInfo = roomService.retriveRoomInfo(param);
		
		//log.info("숙소상세보기 호출값" + roomInfo);
		modelMap.addAttribute("roomInfo",roomInfo);
		
		int beginRow = 0;
		int rowPerPage = 6;		
		param.put("beginRow", beginRow);
		param.put("rowPerPage", rowPerPage);
		List<Map<String,Object>> reviewList = reviewMapper.list(param);
		log.info("리뷰목록 호출값"+reviewList);		
		modelMap.addAttribute("reviewList",reviewList);
		return "/room/roomInfo";
	}

	
}
