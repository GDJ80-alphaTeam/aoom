package com.alpha.aoom.host.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/host")
public class RegistRoomController {

	// 숙소 등록 클릭시 room 테이블에 숙소 생성
	@RequestMapping("/roomRegist")
	@ResponseBody
	// 맵으로바꾸기
	public Map<String, Object> roomRegist(@RequestParam Map<String, Object> param) {
		log.info("param={}", param);
		return param;
	}
}
