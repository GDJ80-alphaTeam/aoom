package com.alpha.aoom.code.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CodeMapper {
	
	// group_key를 조건으로 code테이블의 컬럼 조회
	List<Map<String, Object>> selectByGroupKey(String groupKey);
	
	// codeKey를 조건으로 단일행 칼럼 조회
	Map<String, Object> selectByCodeKey(Map<String, Object> param);
}
