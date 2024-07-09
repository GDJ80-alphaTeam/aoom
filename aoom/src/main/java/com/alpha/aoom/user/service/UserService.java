package com.alpha.aoom.user.service;

import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class UserService {
	
	@Autowired
	UserMapper userMapper;

	// 로그인
	public Map<String, Object> signinUser(Map<String, Object> paramMap) {
		Map<String, Object> userInfo = userMapper.userSelect(paramMap);
		
		if(userInfo.isEmpty()) {
			throw new RuntimeException();
		}
		
		return userInfo;
	}
	
	// 회원가입
	public int signupUser(Map<String , Object> paramMap) {
		int row = userMapper.userInsert(paramMap);
		
		return row;
	}
	
	// 아이디 중복 체크
	public String userDuplicateCheck(Map<String , Object> paramMap) {
		Map<String, Object> idcheck = userMapper.userDuplicateCheck(paramMap);
		if(idcheck == null) {
			return "fail";
		}
		return "success";
	}
}
