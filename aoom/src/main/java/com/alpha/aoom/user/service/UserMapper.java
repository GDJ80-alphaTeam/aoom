package com.alpha.aoom.user.service;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
	// 회원가입
	int insert(Map<String, Object> param);
	// 로그인
	Map<String, Object> select(Map<String, Object> param);
	// 아이디 중복체크
	Map<String, Object> selectByUserId(Map<String, Object> param);
	
	Map<String, Object> selectBySubPeriod(Map<String, Object> param);
	// 고객 정보 수정
	int update(Map<String, Object> param);
}
