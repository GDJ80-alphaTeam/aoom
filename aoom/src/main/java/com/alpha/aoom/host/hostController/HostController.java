package com.alpha.aoom.host.hostController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/host")
public class HostController {

	// 호스트 모드 메인화면 호출
	@RequestMapping("/main")
	public String main() {
		return "/host/main";
	}
	
	// 호스트 모드 숙소 관리 화면 호출
	@RequestMapping("/roomManage")
	public String roomManagement() {
		return "/host/roomManage";
	}
}
