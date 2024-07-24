package com.alpha.aoom.member.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alpha.aoom.user.service.UserService;
import com.alpha.aoom.util.BaseController;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/member")
@Slf4j
public class MemberController extends BaseController{
	
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
	public Map<String, Object> signin(@RequestParam Map<String, Object> param, HttpSession session) {
		Map<String, Object> model = new HashMap<String, Object>(); // ajax 결과 담을 맵
		
		// 서비스에서 로그인정보와 로그인 결과 호출
		Map<String, Object> signinInfo = userService.signinUser(param);
		
		// 로그인 결과
		String result = (String) signinInfo.get("result");
		
		// 로그인 결과 분기문
		if(result.equals("success")) { // 로그인 성공
			// 세션에 담기
			session.setAttribute("userInfo", signinInfo.get("userInfo"));
			return getSuccessResult(model,"로그인에 성공하셨습니다. 당신의 숙소를 예약하세요!");
		} else { // 로그인실패
			return getFailResult(model,"로그인에 실패하였습니다. 다시 확인해주세요.");
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
	public Map<String, Object> signup(@RequestParam Map<String, Object> param) {
		Map<String, Object> model = new HashMap<String,Object>();
		
		// 회원가입
		int row = userService.signupUser(param);
		
		// 회원가입 성공 분기
		if (row == 1) {
			return getSuccessResult(model,"회원가입에 성공하였습니다. 로그인 후 이용해 주세요.");
		} else {
			return getFailResult(model,"회원가입에 실패하였습니다. 다시 시도해 주세요.");
		}
	}
}