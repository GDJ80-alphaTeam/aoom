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
	
	@PostMapping("/send")
	public String getMethodName(@RequestParam Map<String, Object> paramMap) {
		System.out.println("userId : " + paramMap.get("userId"));
		emailService.sendEmail(paramMap);
		return "Email sent successfully";
	}
	
	@PostMapping("/authCheck")
	public Map<String, Object> authCheck(@RequestParam Map<String, Object> paramMap) {
		Map<String, Object> response = new HashMap<>();
		int authNo = emailService.checkAuthNo(paramMap);
		response.put("success", authNo);
		return response;
	}
	
}
