package com.alpha.aoom.user.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alpha.aoom.user.dto.User;

import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
public class UserService {
	
	@Autowired
	UserMapper userMapper;
	
	public void addUser(User user) {
		int row = userMapper.userInsert(user);
		
		if(row != 1) {
			throw new RuntimeException();
		}
	}
	
	// 로그인
	public Map<String, Object> signinUser(Map<String, Object> userInput) {
		Map<String, Object> userInfo = userMapper.userSelect(userInput);
		
		if(userInfo.isEmpty()) {
			throw new RuntimeException();
		}
		
		return userInfo;
	}
}
