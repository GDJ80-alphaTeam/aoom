package com.alpha.aoom.bookingOnedayPrice.service;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BookingOnedayPriceMapper {
	
	// booking_oneday_price_map 추가
	int insert(Map<String, Object> param);
	
	// booking_oneday_price_map 삭제
	int delete(Map<String, Object> param);
}
