package com.alpha.aoom.util.email;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Component
@Transactional
public class SendEmail {
	
	@Autowired
	private JavaMailSender mailSender;
	
	private int authNo;	

    // 인증번호 생성
    public void createNumber() {
        this.authNo = (int)(Math.random() * (90000)) + 100000;// (int) Math.random() * (최댓값-최소값+1) + 최소값
    }
    
    // 인증번호 전송
	public int sendEmail(Map<String, Object> param) {
		createNumber();
		param.put("authNo", authNo);
		System.out.println(param);
		MimeMessage message = mailSender.createMimeMessage();
        try {
            // 받는사람
            message.setRecipients(MimeMessage.RecipientType.TO, (String) param.get("userId"));
            // 제목
            message.setSubject("이메일 인증");
            // 내용
            String body = "";
            body += "<h3>" + "요청하신 인증 번호입니다." + "</h3>";
            body += "<h1>" + authNo + "</h1>";
            message.setText(body,"UTF-8", "html");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        
		mailSender.send(message);
		return authNo;
	}
}