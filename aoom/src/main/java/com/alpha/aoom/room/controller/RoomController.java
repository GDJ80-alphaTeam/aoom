package com.alpha.aoom.room.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/room")
@Controller
public class RoomController {

	// 숙소상세보기 위치
	@RequestMapping("/roomInfo")
	public String roomInfo() {
		return "/room/roomInfo";
	}
	
}
