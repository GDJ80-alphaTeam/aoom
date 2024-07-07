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
	
	@PostMapping("/signinAction")
	public String signinAction(@RequestParam("userId") String userId, @RequestParam("userPw") String userPw, HttpSession session) {
		
		Map<String, Object> userInput = new HashMap<>();
		userInput.put("userId", userId);
		userInput.put("userPw", userPw);
		
		Map<String, Object> userInfo = userService.signinUser(userInput);
		
		// 세션에 담기
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
	
	@PostMapping("signupAction")
	public String signupAction(@RequestParam Map<String, Object> allParams) {
		
		Map<String, Object> newUser = allParams;
		userService.signupUser(newUser);

		return "redirect:/signin";
		
	}
	    
}