package com.alpha.aoom.roomPayment.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class RoomPaymentService {
	
	@Autowired 
	RoomPaymentMapper roomPaymentMapper;
	
	// 해당예약의 결제정보 검색
	public Map<String, Object> selectByBookingId(Map<String, Object> param){
			
		return roomPaymentMapper.selectByBookingId(param);
	}
}
