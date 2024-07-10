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
	
    // 인증번호 전송
	public void sendEmail(String to, String title, String body) {
		
		System.out.println("받는사람 : " + to);
		System.out.println("제목 : " + title);
		System.out.println("내용 : " + body);
		
		// 보낼 메일 양식 만들기
		MimeMessage message = mailSender.createMimeMessage();
		
        try {
            // 받는사람
            message.setRecipients(MimeMessage.RecipientType.TO, to);
            // 제목
            message.setSubject(title);
            // 내용
            message.setText(body,"UTF-8", "html");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        
        // 메일 보내기
		mailSender.send(message);
	}
}