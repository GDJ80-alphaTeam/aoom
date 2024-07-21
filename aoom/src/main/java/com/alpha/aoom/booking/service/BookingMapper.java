package com.alpha.aoom.booking.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BookingMapper {
	
	// 유저의 예약정보 + 숙소정보 리스트 
	List<Map<String, Object>> selectByUserId(Map<String, Object> param);
	
	// 유저가 예약한 숙소의 숙박기간 
	Map<String, Object> selectByBookingMap(Map<String, Object> param);
	
}
