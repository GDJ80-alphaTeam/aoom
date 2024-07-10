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
import com.alpha.aoom.user.service.EmailService;
import com.alpha.aoom.util.email.SendEmail;




@Controller
public class EmailController {
	
	@Autowired
	private EmailService emailService;
	@Autowired
	private SendEmail sendEmail;
	@Autowired
	private MemberService userService;
	
	// paramMap : userId  
	@RequestMapping("/send")
	@ResponseBody
	public String send(@RequestParam Map<String, Object> param) {
		System.out.println("인증번호 받을 이메일 : " + param.get("userId"));
		
		String idCheck = userService.userDuplicateCheck(param);
		if(idCheck.equals("success")) {
			return "success";
		}else {
			// 인증내역이 있으면 1 없으면 0
			if(emailService.authRecord(param) == 1) {
				
				int authNo = sendEmail.sendEmail(param);
				param.put("authNo",authNo);
				// 기존에 있던 인증번호 update
				emailService.updateAuthNo(param); 
			} else {	
				int authNo = sendEmail.sendEmail(param);
				param.put("authNo",authNo);
				emailService.insertAuthNo(param);
			}
			return "fail";
		}	
	}
	
	// paramMap : userId , authNo
	@ResponseBody
	@RequestMapping("/authCheck")
	public Map<String, Object> authCheck(@RequestParam Map<String, Object> param) {
		Map<String, Object> response = new HashMap<>();
		System.out.println("test");
		int authNo = emailService.checkAuthNo(param);
		System.out.println("test"+authNo);
		response.put("success", authNo);
		return response;
	}
	
}
