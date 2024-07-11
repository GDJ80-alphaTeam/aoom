package com.alpha.aoom.main.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alpha.aoom.room.service.RoomMapper;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class MainController {
	
	@Autowired
	RoomMapper roomMapper;
	
	// 메인페이지 호출
	@RequestMapping("/main")
	public String main(HttpSession session, ModelMap modelMap) {
		
		// 숙소 전체 목록 조회
		List<Map<String, Object>> retrieveList = roomMapper.retrieveList();
		
		// 조회수 TOP4 숙소 조회
		List<Map<String, Object>> viewsDesc = roomMapper.viewsDesc();
		
		// 별점 TOP4 숙소 조회
		List<Map<String, Object>> ratingDesc = roomMapper.ratingDesc();
		
		// 예약 TOP4 숙소 조회
		
		// 위시리스트 TOP4 숙소 조회
		
		// model에 숙소 전체 목록 조회한 값 넣기
		modelMap.addAttribute("roomAllList", retrieveList);
		modelMap.addAttribute("viewsDesc", viewsDesc);
		modelMap.addAttribute("starDesc", ratingDesc);
		
		return "main";
	}
}
