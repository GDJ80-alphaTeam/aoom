package com.alpha.aoom.member.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alpha.aoom.member.service.MemberService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/member")
@Slf4j
public class MemberController{
	
	@Autowired
	MemberService memberService;

	@RequestMapping("/signinView")
	public String signinView() {
		return "/member/signinView";
	}
	
	// paramMap : userId , userPw
	@RequestMapping("/signin")
	public String signin(@RequestParam Map<String, Object> paramMap, HttpSession session) {
		
		Map<String, Object> userInfo = memberService.signinUser(paramMap);
		System.out.println(userInfo.toString());
		// 세션에 담기
		//
		session.setAttribute("userInfo", userInfo);
		
		return "redirect:/main";
	}
	
	@RequestMapping("/signout")
	@ResponseBody
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "success";
	}
	
	@RequestMapping("/signupView")
	public String signupView() {
		return "/member/signupView";
	}
	
	// paramMap : userId , userPw , userBirth , userName , userPhone
	@RequestMapping("/signup")
	@ResponseBody
	public String signup(@RequestParam Map<String, Object> paramMap) {
		System.out.println(paramMap);
		// 회원가입
		int row = memberService.signupUser(paramMap);
		
		// 회원가입 성공 분기
		if (row == 1) {
			return "success";
		} else {
			return "fail";
		}
	}
	
}