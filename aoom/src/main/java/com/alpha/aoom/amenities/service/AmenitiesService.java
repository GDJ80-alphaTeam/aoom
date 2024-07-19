package com.alpha.aoom.amenities.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AmenitiesService {

	@Autowired
	AmenitiesMapper amenitiesMapper;

	// 숙소 편의시설 조회
	// param: room_id
	public List<Map<String, Object>> selectByDetail(Map<String,Object> param){
		return amenitiesMapper.selectByDetail(param);
	}
		
	// 숙소 등록 시 설정한 편의시설 DB에 추가
	public void insert(Map<String, Object> param) {
		
		// INSERT(amenities)
		for (String amenity : (List<String>) param.get("amenities")) {
			
			// amenity가 없을 경우 종료
			if(amenity == null || amenity.equals("")) {
				break ;
			}
			
			log.info("for문 통과");
			// 숙소 이미지와 마찬가지로 amenities도 반복 INSERT를 위한 map 선언
			Map<String, Object> paramAmenity = new HashMap<>();
			
			// INSERT에 필요한 컬럼들 map에 추가
			paramAmenity.put("roomId", param.get("roomId"));
			paramAmenity.put("amenitiesCode", amenity);
			
			amenitiesMapper.insert(paramAmenity);
		}
	}
	
	// 해당 숙소의 편의시설 삭제
	public int delete(Map<String, Object> param) {
		return amenitiesMapper.delete(param);
	}
}
