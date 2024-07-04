package com.alpha.aoom.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alpha.aoom.user.dto.User;
import com.alpha.aoom.user.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class UserController {
	
	@Autowired
	UserService userService;

	@GetMapping
	@ResponseBody
	public void addUser() {
		User user = new User();
		user.setUserId("test@google.com");
		user.setUserPw("1234");
		user.setUserBirth("1999-07-15");
		user.setUserName("오승엽");
		user.setUserPhone("010-9876-5432");
		
		userService.addUser(user);
		System.out.println("디버깅 : " + user);
	}
	
	// 마리아 db 연결 test
	@GetMapping("/ya")
	@ResponseBody
	public void addyaname() {
		User yauser = new User();
		yauser.setUserId("손지원");
		
		userService.addyaname(yauser);
		System.out.println("디버깅 : " + yauser);
	}
	
}
