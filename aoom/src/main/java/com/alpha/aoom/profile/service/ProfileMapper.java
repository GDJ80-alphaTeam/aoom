package com.alpha.aoom.profile.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProfileMapper {

	// 해당하는 유저의 프로필정보 
	List<Map<String, Object>> selectByuserId(Map<String, Object> param);
		
	int insert();
}
