package com.alpha.aoom.user.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alpha.aoom.util.email.SendEmail;

@Service
public class UserAuthNoService {
	
	@Autowired
	private SendEmail sendemail;
	@Autowired
	private UserAuthNoMapper userAuthNoMapper;
	
	// 인증번호 DB 저장
	public void insertAuthNo(Map<String, Object> param) {

		int result = userAuthNoMapper.insertAuthNo(param);
		if(result != 1) {
			throw new RuntimeException();
		}
	}
	
	// 인증번호 조회
	public int checkAuthNo(Map<String, Object> param) {
		return userAuthNoMapper.selectAuthNo(param);
	}
	
	// 아이디 인증이력조회 
	public int authRecord(Map<String,Object> param) {		
		return userAuthNoMapper.authRecord(param);
	}
	
	// 인증번호 업데이트
	public int updateAuthNo(Map<String,Object> param) {
		int updataAuthNo = sendemail.sendEmail(param);
		param.put("authNo", updataAuthNo);
		return userAuthNoMapper.updateAuthNo(param);
	}
}