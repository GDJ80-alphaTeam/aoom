package com.alpha.aoom.member.service;

import java.util.Map;


import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
	// 회원가입
	int userInsert(Map<String, Object> param);
	// 로그인
	Map<String, Object> userSelect(Map<String, Object> param);
	// 아이디 중복체크
	Map<String, Object> userDuplicateCheck(Map<String, Object> param);
}
