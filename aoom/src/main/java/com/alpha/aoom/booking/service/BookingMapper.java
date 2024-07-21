package com.alpha.aoom.booking.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BookingMapper {
	
	List<Map<String, Object>> selectByUserId(Map<String, Object> param);
	
}
