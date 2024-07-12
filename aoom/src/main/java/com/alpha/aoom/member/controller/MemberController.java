package com.alpha.aoom.member.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alpha.aoom.user.service.UserService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/member")
@Slf4j
public class MemberController{
	
	@Autowired
	UserService userService;

	// 로그인 뷰페이지 호출
	@RequestMapping("/signin")
	public String signinView() {
		return "/member/signin";
	}
	
	// 로그인기능 호출
	// paramMap : userId , userPw
	@RequestMapping("/ajaxSignin")
	@ResponseBody
	public String signin(@RequestParam Map<String, Object> param, HttpSession session) {
		
		System.out.println("로그인 정보 : " + param);
		
		// 서비스에서 로그인정보와 로그인 결과 호출
		Map<String, Object> signinInfo = userService.signinUser(param);
		
		// 로그인 결과
		String result = (String) signinInfo.get("result");
		
		// 로그인 결과 분기문
		if(result.equals("success")) { // 로그인 성공
			// 세션에 담기
			session.setAttribute("userInfo", signinInfo.get("userInfo"));
			return "success";
		} else { // 로그인실패
			return "fail";
		}
	}
	
	// 로그아웃 기능 호출
	@RequestMapping("/ajaxSignout")
	@ResponseBody
	public String logout(HttpSession session) {
		
		// 세션 비우기
		session.invalidate();
		log.info("로그아웃성공");
		
		return "success"; // 로그아웃 ajax에 전달
	}
	
	// 회원가입 뷰페이지 호출
	@RequestMapping("/signup")
	public String signupView() {
		return "/member/signup";
	}
	
	// 회원가입 기능 호출
	// paramMap : userId , userPw , userBirth , userName , userPhone
	@RequestMapping("/ajaxSignup")
	@ResponseBody
	public String signup(@RequestParam Map<String, Object> param) {

		// 회원가입
		int row = userService.signupUser(param);
		
		// 회원가입 성공 분기
		if (row == 1) {
			return "success";
		} else {
			return "fail";
		}
	}
	
}