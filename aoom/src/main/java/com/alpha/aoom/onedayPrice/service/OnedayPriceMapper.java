package com.alpha.aoom.onedayPrice.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OnedayPriceMapper {
	
	// onedayPrice의 statCode상태에 따른 검색
	List<Map<String, Object>> selectByStatCode(Map<String,Object> param); 
	
	// 숙소 등록시 운영일만큼 숙박 가격 추가
	int insert(Map<String, Object> param);
}
