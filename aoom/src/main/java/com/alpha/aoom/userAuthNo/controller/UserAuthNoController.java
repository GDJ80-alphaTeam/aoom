package com.alpha.aoom.userAuthNo.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alpha.aoom.user.service.UserService;
import com.alpha.aoom.userAuthNo.service.UserAuthNoService;
import com.alpha.aoom.util.email.SendEmail;

@Controller
@RequestMapping("/userAuthNo")
public class UserAuthNoController {
	
	@Autowired
	private UserAuthNoService userAuthNoService;
	
	// 인증번호 보내기
	// paramMap : userId  
	@RequestMapping("/send")
	@ResponseBody
	public String send(@RequestParam Map<String, Object> param) {
		System.out.println("인증번호 받을 이메일 : " + param.get("userId"));
	   
		return userAuthNoService.sendAuthNo(param);
	}
	
	// 인증번호 확인
	// paramMap : userId , authNo
	@ResponseBody
	@RequestMapping("/authCheck")
	public String authCheck(@RequestParam Map<String, Object> param) {
		
		// 인증번호 일치여부 확인
		int result = userAuthNoService.checkAuthNo(param);
		
		// 인증번호 일치 분기문
		if(result == 1) { // 인증번호 일치
			return "success";
		}else { // 인증번호 불일치
			return "fail";
		}
	}
	
}
