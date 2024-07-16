package com.alpha.aoom.amenities.service;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AmenitiesMapper {

	// 숙소 등록 2단계 - 편의시설 추가
	int insert(Map<String, Object> param);
}
