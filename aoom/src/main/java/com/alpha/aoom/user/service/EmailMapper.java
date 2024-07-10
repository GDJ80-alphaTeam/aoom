package com.alpha.aoom.user.service;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmailMapper {

	// 인증번호 DB 저장
	int insertAuthNo(Map<String, Object> param);
	// 인증번호 조회
	int selectAuthNo(Map<String, Object> param);
	// 인증이력 조회
	int authRecord(Map<String, Object> param);
	// 인증번호 업데이트
	int updateAuthNo(Map<String, Object> param);
}
