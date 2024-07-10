package com.alpha.aoom.user.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.alpha.aoom.member.service.MemberService;
import com.alpha.aoom.user.service.UserAuthNoService;
import com.alpha.aoom.util.email.SendEmail;

@Controller
public class UserAuthNoController {
	
	@Autowired
	private UserAuthNoService userAuthNoService;
	@Autowired
	private SendEmail sendEmail;
	@Autowired
	private MemberService memberService;
	
	// 인증번호 보내기
	// paramMap : userId  
	@RequestMapping("/send")
	@ResponseBody
	public String send(@RequestParam Map<String, Object> param) {
		System.out.println("인증번호 받을 이메일 : " + param.get("userId"));
		
		// 이메일 중복체크
		String idCheck = memberService.userDuplicateCheck(param);
		
		// 이메일 중복체크 분기문
		if(idCheck.equals("success")) { // 중복되지 않음
			// 인증내역 분기문
			if(userAuthNoService.authRecord(param) == 1) { // 인증이력 있음
				int authNo = sendEmail.sendEmail(param); // 이메일 보내기
				param.put("authNo",authNo);
				userAuthNoService.updateAuthNo(param); // 기존에 있던 인증번호 update
			} else { // 인증이력 없음
				int authNo = sendEmail.sendEmail(param); // 이메일 보내기
				param.put("authNo",authNo);
				userAuthNoService.insertAuthNo(param); // 인증번호 insert
			}
			return "success"; // success 반환
		}else { // 중복됨
			return "fail"; // fail 반환
		}	
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
