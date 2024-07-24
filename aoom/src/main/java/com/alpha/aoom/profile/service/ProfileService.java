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
	
	public List<Map<String, Object>> select(Map<String, Object> param){
		
		return profileMapper.selectByuserId(param);
	}
}
