package com.alpha.aoom.booking.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;

@Service
public class BookingService {

	@Autowired
	BookingMapper bookingMapper;
		
	// 사용자의 예약목록 출력
	public List<Map<String, Object>> selectByUserId(Map<String, Object> param){
		
		return bookingMapper.selectByUserId(param);
		
	}
	
}
