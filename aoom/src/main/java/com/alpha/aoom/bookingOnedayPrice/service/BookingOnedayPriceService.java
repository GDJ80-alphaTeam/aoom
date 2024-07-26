package com.alpha.aoom.bookingOnedayPrice.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alpha.aoom.onedayPrice.service.OnedayPriceMapper;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BookingOnedayPriceService {

	@Autowired
	BookingOnedayPriceMapper bookingOnedayPriceMapper;
	
	@Autowired
	OnedayPriceMapper onedayPriceMapper;
	
	// 예약취소시 , bookingOneDayPricemapper 삭제
	public int delete(Map<String, Object> param) {
		
		return bookingOnedayPriceMapper.delete(param);
	}
	
}
