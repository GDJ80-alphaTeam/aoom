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
	
	// 해당유저의 프로필 정보 유무 체크
	public Map<String,Object> selectByproitemCode(Map<String, Object> param) {
		
		return profileMapper.selectByproitemCode(param);
	}
	// 유저 프로필 정보 업데이트
	public int updateByProitemCode(Map<String, Object> param) {
		
		return profileMapper.updateByProitemCode(param);
	}
	// 유저의 프로필 정보 인서트
	public int insertProfile(Map<String, Object> param) {
		
		return profileMapper.insertProfile(param); 
	}
}
