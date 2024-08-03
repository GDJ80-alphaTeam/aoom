package com.alpha.aoom.message.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional
public class MessageService {

	@Autowired
	MessageMapper messageMapper;
	
	     //주고받은 메시지 내역 가져오기
		public List<Map<String, Object>> selectList(Map<String, Object> param) {
			
			// 로그인한 아이디에 관한 메시지 전체 가져오기
			List<Map<String, Object>> userInfo = messageMapper.selectList(param);
			return userInfo;
		}
		
		public List<Map<String, Object>> selectUserList(Map<String, Object> param) {
			
			// 특정 user에 대한 리스트 전체 가져오기
			List<Map<String, Object>> userInfo = messageMapper.selectUserList(param);
			return userInfo;
		}
		
		public int insert(Map<String, Object> param) {
			return messageMapper.insert(param);
		}

}
