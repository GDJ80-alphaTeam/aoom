package com.alpha.aoom.member.service;

import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class MemberService {
	
	@Autowired
	MemberMapper memberMapper;

	// 로그인
	public Map<String, Object> signinUser(Map<String, Object> param) {
		Map<String, Object> userInfo = memberMapper.userSelect(param);
		
		if(userInfo.isEmpty()) {
			throw new RuntimeException();
		}
		
		return userInfo;
	}
	
	// 회원가입
	public int signupUser(Map<String , Object> param) {
		int row = memberMapper.userInsert(param);
		
		return row;
	}
	
	// 아이디 중복 체크
	public String userDuplicateCheck(Map<String , Object> param) {
		Map<String, Object> idcheck = memberMapper.userDuplicateCheck(param);
		if(idcheck == null) {
			return "fail";
		}
		return "success";
	}
}
