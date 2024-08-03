package com.alpha.aoom.message.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MessageMapper {

	     // 로그인
		List<Map<String, Object>> selectList(Map<String, Object> param);
		
		 // 특정 user에 대한 메시지 전체 리스트 가져오기
		List<Map<String, Object>> selectUserList(Map<String, Object> param);
		
		// 메시지 입력
		int insert(Map<String, Object> param);
}
