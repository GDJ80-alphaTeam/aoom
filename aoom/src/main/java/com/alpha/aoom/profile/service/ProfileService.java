package com.alpha.aoom.profile.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProfileService {

	@Autowired
	ProfileMapper profileMapper;
	
	// 해당유저의 프로필정보 검색
	public List<Map<String, Object>> selectListByuserId(Map<String, Object> param){
		
		return profileMapper.selectListByuserId(param);
	}
	
	
}
