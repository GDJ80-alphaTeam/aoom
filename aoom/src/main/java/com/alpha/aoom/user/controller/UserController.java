package com.alpha.aoom.user.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@RequestMapping("/user")
@Controller
public class UserController {
	
	@RequestMapping("/myPage")
	public String userPage(@RequestParam Map<String, Object> param) {
		
		return "/user/myPage";
	}
}
