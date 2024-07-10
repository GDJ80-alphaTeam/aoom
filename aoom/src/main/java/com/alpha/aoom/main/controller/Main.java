package com.alpha.aoom.main.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alpha.aoom.room.service.RoomMapper;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class Main {
	
	@Autowired
	RoomMapper roomMapper;
	
	// 메인페이지 호출
	@RequestMapping("/main")
	public String main(HttpSession session, Model m) {
		
		// 숙소 전체 목록 조회
		List<Map<String, Object>> retrieveList = roomMapper.retrieveList();
		
		// model에 숙소 전체 목록 조회한 값 넣기
		m.addAttribute("roomAllList", retrieveList);		
		
		return "main";
	}
}
