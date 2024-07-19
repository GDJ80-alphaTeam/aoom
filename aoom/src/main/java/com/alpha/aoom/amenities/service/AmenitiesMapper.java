package com.alpha.aoom.amenities.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AmenitiesMapper {

	// 숙소 등록 2단계 - 편의시설 추가
	int insert(Map<String, Object> param);
	
	// 해당숙소의 어메니티 목록 조회
	List<Map<String, Object>> selectByDetail(Map<String,Object> param);
	
	// 해당 숙소의 편의시설 삭제
	int delete(Map<String, Object> param);
}
