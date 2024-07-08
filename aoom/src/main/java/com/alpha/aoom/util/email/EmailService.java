package com.alpha.aoom.util.email;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Component
@Transactional
public class EmailService {
   
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private EmailMapper emailMapper;

	private int number;

    // 인증번호 생성
    public void createNumber() {
        this.number = (int)(Math.random() * (90000)) + 100000;// (int) Math.random() * (최댓값-최소값+1) + 최소값
    }
    
    // 인증번호 전송
	public void sendEmail(String toEmail) {
		createNumber();
		insertAuthNo(toEmail, number);
		MimeMessage message = mailSender.createMimeMessage();

        try {
            // 받는사람
            message.setRecipients(MimeMessage.RecipientType.TO, toEmail);
            // 제목
            message.setSubject("이메일 인증");
            // 내용
            String body = "";
            body += "<h3>" + "요청하신 인증 번호입니다." + "</h3>";
            body += "<h1>" + number + "</h1>";
            message.setText(body,"UTF-8", "html");
        } catch (MessagingException e) {
            e.printStackTrace();
        }

		mailSender.send(message);
	}
	
	// 인증번호 DB 저장
	public void insertAuthNo(String toEmail, int number) {
		Map<String, Object> authMap = new HashMap<>();
		authMap.put("userId", toEmail);
		authMap.put("authNo", number);
		int result = emailMapper.insertAuthNo(authMap);
		if(result != 1) {
			throw new RuntimeException();
		}
	}
	
	// 인증번호 조회
	public int getAuthNo(String userId) {
		return emailMapper.selectAuthNo(userId);
	}
}