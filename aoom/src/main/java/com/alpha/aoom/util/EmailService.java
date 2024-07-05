package com.alpha.aoom.util;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Component
public class EmailService {
   
   @Autowired
   private JavaMailSender mailSender;
   
   public void sendSimpleEmail(String toEmail , String subject, String body) {
      SimpleMailMessage message = new SimpleMailMessage();
        // 보낼사람
        message.setTo(toEmail);
        // 제목
        message.setSubject(subject);
        // 내용
        message.setText(body);
        
        mailSender.send(message);
   }
}