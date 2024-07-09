package com.alpha.aoom.user.service;

import java.util.Map;


import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface UserMapper {
	// 회원가입
	int userInsert(Map<String, Object> paramMap);
	// 로그인
	Map<String, Object> userSelect(Map<String, Object> paramMap);
	// 아이디 중복체크
	Map<String, Object> userDuplicateCheck(Map<String, Object> paramMap);
}
