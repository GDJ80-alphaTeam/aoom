package com.alpha.aoom.code.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class CodeService {

	@Autowired
	CodeMapper codeMapper;
	
	// group_key를 조건으로 code테이블의 컬럼 조회
	public List<Map<String, Object>> retriveCode(String groupKey) {
		return codeMapper.selectByGroupKey(groupKey);
	}
}
