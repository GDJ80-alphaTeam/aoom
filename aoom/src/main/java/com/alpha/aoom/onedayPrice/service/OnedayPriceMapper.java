package com.alpha.aoom.onedayPrice.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OnedayPriceMapper {
		
	List<Map<String, Object>> selectByDisabled(Map<String,Object> param); 
	
	// 숙소 등록시 운영일만큼 숙박 가격 추가
	int insert(Map<String, Object> param);
}
