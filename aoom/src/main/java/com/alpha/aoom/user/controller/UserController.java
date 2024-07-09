package com.alpha.aoom.user.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alpha.aoom.user.service.UserService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class UserController{
	
	@Autowired
	UserService userService;

	@GetMapping("/signin")
	public String signin() {
		return "signin";
	}
	
	// paramMap : userId , userPw
	@PostMapping("/signinAction")
	public String signinAction(@RequestParam Map<String, Object> paramMap, HttpSession session) {
		
		Map<String, Object> userInfo = userService.signinUser(paramMap);
		System.out.println(userInfo.toString());
		// 세션에 담기
		//
		session.setAttribute("userInfo", userInfo);
		
		return "redirect:/main";
	}
	
	
	@GetMapping("/main")
	@ResponseBody
	public Map<String, Object> main(HttpSession session) {
		return (Map<String, Object>) session.getAttribute("userInfo");
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main";
	}
	
	@GetMapping("/signup")
	public String signup() {
		return "signup";
	}
	
//	@PostMapping("signupAction")
//	public String signupAction(@RequestParam("userId") String userId,
//							   @RequestParam("userPw") String userPw,
//							   @RequestParam("userBirth") String userBirth,
//							   @RequestParam("userName") String userName,
//							   @RequestParam("userPhone") String userPhone ) {
//		
//		Map<String, Object> newUser = new HashMap<>();
//		
//		
//		return "redirect:/signin";
//		
//	}
	
	// paramMap : userId , userPw , userBirth , userName , userPhone
	@PostMapping("/signupAction")
	public String signupAction(@RequestParam Map<String, Object> paramMap) {
		System.out.println(paramMap);
		userService.signupUser(paramMap);
		
		return "redirect:/signin";
		
	}
	    
}