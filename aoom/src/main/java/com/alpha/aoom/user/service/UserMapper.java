package com.alpha.aoom.user.service;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.alpha.aoom.user.dto.User;

@Mapper
public interface UserMapper {
	// 회원가입
	int userInsert(Map<String, Object> paramMap);
	// 로그인
	Map<String, Object> userSelect(Map<String, Object> paramMap);
	
}
