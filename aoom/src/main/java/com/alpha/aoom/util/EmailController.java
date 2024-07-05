package com.alpha.aoom.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestParam;


@RestController
public class EmailController {
	
	@Autowired
	private EmailService emailService;
	
	@GetMapping("/send")
	public String getMethodName(@RequestParam String toEmail , String subject, String body) {
		emailService.sendSimpleEmail(toEmail, subject, body);
		return "Email sent successfully";
	}
	
}
