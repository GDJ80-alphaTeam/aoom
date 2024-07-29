package com.alpha.aoom.profile.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProfileMapper {

	// 해당하는 유저의 프로필정보 
	List<Map<String, Object>> selectListByuserId(Map<String, Object> param);
	
	// 해당유저의 프로필정보 체크
	Map<String, Object> selectByproitemCode(Map<String, Object> param);
	
	// 해당유저의 프로필 업데이트
	int updateByProitemCode(Map<String, Object> param);
	
	// 해당유저의 프로필 인서트 
	int insertProfile(Map<String, Object> param);
}
