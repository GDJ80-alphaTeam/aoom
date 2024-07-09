package com.alpha.aoom.user.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alpha.aoom.util.email.SendEmail;

@Service
public class EmailService {
	
	@Autowired
	private SendEmail sendemail;
	@Autowired
	private EmailMapper emailMapper;
	
	// 인증번호 DB 저장
	public void insertAuthNo(Map<String, Object> paramMap) {

		int result = emailMapper.insertAuthNo(paramMap);
		if(result != 1) {
			throw new RuntimeException();
		}
	}
	
	// 인증번호 조회
	public int checkAuthNo(Map<String, Object> paramMap) {
		return emailMapper.selectAuthNo(paramMap);
	}
	
	// 아이디 인증이력조회 
	public int authRecord(Map<String,Object> paramMap) {		
		return emailMapper.authRecord(paramMap);
	}
	
	// 인증번호 업데이트
	public int updateAuthNo(Map<String,Object> paramMap) {
		int updataAuthNo = sendemail.sendEmail(paramMap);
		paramMap.put("authNo", updataAuthNo);
		return emailMapper.updateAuthNo(paramMap);
	}
}