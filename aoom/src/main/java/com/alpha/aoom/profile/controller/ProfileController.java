package com.alpha.aoom.profile.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class ProfileController {

	
	@RequestMapping("/user/profile")
	public String Userprofile(@RequestParam Map<String, Object> param) {
		
		return "/user/profile";
	}
	
}
