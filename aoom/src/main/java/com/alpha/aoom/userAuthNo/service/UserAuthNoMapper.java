package com.alpha.aoom.userAuthNo.service;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserAuthNoMapper {

	// 인증번호 DB 저장
	int insert(Map<String, Object> param);
	// 인증번호 일치여부 확인
	int select(Map<String, Object> param);
	// 인증이력 조회
	int selectByAuthNoCheck(Map<String, Object> param);
	// 인증번호 업데이트
	int update(Map<String, Object> param);
}
