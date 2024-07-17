package com.alpha.aoom.onedayPrice.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OnedayPriceMapper {
		
	List<Map<String, Object>> selectByDisabled(Map<String,Object> param); 
}
