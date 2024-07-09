package com.alpha.aoom.util.email;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestParam;


@RestController
public class EmailController {
	
	@Autowired
	private EmailService emailService;
	
	// paramMap : userId  
	@PostMapping("/send")
	public void getMethodName(@RequestParam Map<String, Object> paramMap) {
		System.out.println("userId : " + paramMap.get("userId"));
		// 인증내역이 있으면 1 없으면 0
		if(emailService.authRecord(paramMap) == 1) {
			// 기존에 있던 인증번호 update
			emailService.updateAuthNo(paramMap); 
		} else {	
			emailService.sendEmail(paramMap);
		}			
	}
	
	// paramMap : userId , authNo
	@PostMapping("/authCheck")
	public Map<String, Object> authCheck(@RequestParam Map<String, Object> paramMap) {
		Map<String, Object> response = new HashMap<>();
		System.out.println("test");
		int authNo = emailService.checkAuthNo(paramMap);
		System.out.println("test"+authNo);
		response.put("success", authNo);
		return response;
	}
	
}
