package com.alpha.aoom.util.email;

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
	public String getMethodName(@RequestParam("userId") String userId) {
		System.out.println("userId : " + userId);
		emailService.sendEmail(userId);
		return "Email sent successfully";
	}
	
	@PostMapping("/authCheck")
	public String authCheck() {
		// 작업중
		return "";
	}
	
}
