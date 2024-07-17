package com.alpha.aoom.amenities.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AmenitiesService {

	@Autowired
	AmenitiesMapper amenitiesMapper;
	
		// 숙소 편의시설 조회
		// param: room_id
		public List<Map<String, Object>> selectByDetail(Map<String,Object> param){
			return amenitiesMapper.selectByDetail(param);
		}
}
