package com.alpha.aoom.util.email;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmailMapper {

	// 인증번호 DB 저장
	int insertAuthNo(Map<String, Object> authMap);
	// 인증번호 조회
	int selectAuthNo(String userId);
}
