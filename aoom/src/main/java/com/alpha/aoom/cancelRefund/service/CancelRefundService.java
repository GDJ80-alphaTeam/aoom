package com.alpha.aoom.cancelRefund.service;

import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alpha.aoom.roomPayment.service.RoomPaymentMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class CancelRefundService {

	@Autowired
	CancelRefundMapper cancelRefundMapper;
	
	@Autowired
	RoomPaymentMapper roomPaymentMapper;
	
	// 예약취소	
	// param : bookingId , refuntPrice , cancelreaCode , cancelContent ,   
	public int insert(Map<String, Object> param) {
		
		// 해당예약의 결제정보
		return cancelRefundMapper.insert(param);
	}
}
