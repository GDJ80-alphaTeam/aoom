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
	
	// paramMap : userId  
	@RequestMapping("/send")
	@ResponseBody
	public String send(@RequestParam Map<String, Object> param) {
		System.out.println("인증번호 받을 이메일 : " + param.get("userId"));
		
		String idCheck = memberService.userDuplicateCheck(param);
		if(idCheck.equals("success")) {
			return "success";
		}else {
			// 인증내역이 있으면 1 없으면 0
			if(userAuthNoService.authRecord(param) == 1) {
				
				int authNo = sendEmail.sendEmail(param);
				param.put("authNo",authNo);
				// 기존에 있던 인증번호 update
				userAuthNoService.updateAuthNo(param); 
			} else {	
				int authNo = sendEmail.sendEmail(param);
				param.put("authNo",authNo);
				userAuthNoService.insertAuthNo(param);
			}
			return "fail";
		}	
	}
	
	// paramMap : userId , authNo
	@ResponseBody
	@RequestMapping("/authCheck")
	public Map<String, Object> authCheck(@RequestParam Map<String, Object> param) {
		
		Map<String, Object> response = new HashMap<>();
		
		int authNo = userAuthNoService.checkAuthNo(param);
		
		response.put("success", authNo);
		
		return response;
	}
	
}
