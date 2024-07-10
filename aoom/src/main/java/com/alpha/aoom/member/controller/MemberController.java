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
	@ResponseBody
	public String signin(@RequestParam Map<String, Object> param, HttpSession session) {
		
		System.out.println("로그인 정보 : " + param);
		
		Map<String, Object> signinInfo = memberService.signinUser(param);
		String result = (String) signinInfo.get("result");
		
		if(result.equals("success")) { // 로그인 성공
			// 세션에 담기
			session.setAttribute("userInfo", signinInfo.get("userInfo"));
			return "success";
		} else { // 로그인실패
			return "fail";
		}
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
	public String signup(@RequestParam Map<String, Object> param) {

		// 회원가입
		int row = memberService.signupUser(param);
		
		// 회원가입 성공 분기
		if (row == 1) {
			return "success";
		} else {
			return "fail";
		}
	}
	
}